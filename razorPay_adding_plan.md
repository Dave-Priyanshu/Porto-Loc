Thank you for sharing the `PaymentStatusController.php` file, which handles the superadmin’s side of the payment process in BuildMyFolio. This controller manages the review, approval/rejection, and deletion of payment requests, aligning with the manual process you described earlier. Now that we have all the relevant details, let’s proceed with integrating Razorpay into your real project, replacing the QR code and screenshot-based payment system with Razorpay’s automated payment flow. I’ll ensure the integration fits your existing structure, including the trial period, subscription plans, and superadmin review process (if you choose to retain it).

---

### Plan for Razorpay Integration
1. **Replace QR Code/Screenshot with Razorpay Checkout:**
   - Modify the payment form to use Razorpay’s in-page checkout instead of QR code scanning and screenshot uploads.
   - Automate payment verification using Razorpay’s API.

2. **Update Database Tables:**
   - Modify the `payment_requests` table to store Razorpay payment details (e.g., `razorpay_payment_id`, `razorpay_order_id`) instead of `screenshot_path`.
   - Keep the `subscriptions` and `users` tables as they are, as their structure already supports the new flow.

3. **Automate Subscription Activation:**
   - Automatically verify payments and activate subscriptions upon successful payment, bypassing the manual screenshot review.
   - Optionally retain a superadmin review step for compliance or fraud checks (e.g., flag payments for review before activation).

4. **Update Superadmin Functionality:**
   - Adjust the `PaymentStatusController` to handle Razorpay payment details instead of screenshots.
   - Allow superadmin to review and approve/reject payments if manual review is retained.

5. **Preserve Trial Logic:**
   - Ensure the 14-day trial period logic remains intact, with users upgrading to a paid plan (Starter, monthly or yearly) after payment.

---

### Step 1: Modify the Database Schema
We need to update the `payment_requests` table to store Razorpay payment details instead of a screenshot path. Since `screenshot_path` is currently used to store the uploaded screenshot, we’ll replace it with fields for Razorpay’s payment data.

#### Migration to Update `payment_requests` Table
Run the following command to create a new migration:

```bash
php artisan make:migration update_payment_requests_table_for_razorpay
```

Update the generated migration file (`database/migrations/YYYY_MM_DD_update_payment_requests_table_for_razorpay.php`):

```php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('payment_requests', function (Blueprint $table) {
            // Drop the screenshot_path column
            $table->dropColumn('screenshot_path');
            
            // Add Razorpay-related columns
            $table->string('razorpay_payment_id')->nullable()->after('payment_amount');
            $table->string('razorpay_order_id')->nullable()->after('razorpay_payment_id');
            $table->string('razorpay_signature')->nullable()->after('razorpay_order_id');
        });
    }

    public function down(): void
    {
        Schema::table('payment_requests', function (Blueprint $table) {
            // Revert changes in case of rollback
            $table->string('screenshot_path')->after('payment_amount');
            $table->dropColumn(['razorpay_payment_id', 'razorpay_order_id', 'razorpay_signature']);
        });
    }
};
```

Run the migration:

```bash
php artisan migrate
```

This updates the `payment_requests` table to store `razorpay_payment_id`, `razorpay_order_id`, and `razorpay_signature` instead of `screenshot_path`.

---

### Step 2: Install Razorpay Package
You’ve already tested Razorpay in your test project, so let’s install it in your main project (`/var/www/html/laravel/portfolio_final`).

1. **Install the Razorpay PHP Package:**

```bash
composer require razorpay/razorpay
```

2. **Add API Keys to `.env`:**
   - Use the test API keys you generated from the Razorpay Dashboard (as you did in your test project):

```env
RAZORPAY_KEY=rzp_test_XXXXXXXXXX
RAZORPAY_SECRET=XXXXXXXXXXXXXXXXX
```

---

### Step 3: Update the Payment Controller
We’ll modify the `PaymentController` to handle Razorpay payments instead of QR code screenshots. The `submitPayment` method will be replaced with methods to initiate and verify Razorpay payments, while preserving the subscription and payment request creation logic.

Update `app/Http/Controllers/PaymentController.php`:

```php
<?php

namespace App\Http\Controllers;

use App\Models\PaymentRequest;
use App\Models\Subscription;
use App\Models\Plan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;
use Razorpay\Api\Api;
use Illuminate\Support\Facades\Log;

class PaymentController extends Controller
{
    protected $api;

    public function __construct()
    {
        $this->api = new Api(env('RAZORPAY_KEY'), env('RAZORPAY_SECRET'));
    }

    /**
     * Show the payment form for a given plan tier & billing cycle.
     */
    public function showPaymentForm(Request $request)
    {
        if (!Auth::check()) {
            return redirect()->route('register')->with('error', 'Please register or log in to purchase a membership.');
        }

        $tier = $request->query('tier', 'starter');
        $billing = $request->query('billing', 'monthly');

        $plan = Plan::where('name', ucfirst($tier))
                    ->where('billing_cycle', $billing)
                    ->first();

        if (!$plan) {
            abort(404, "Plan not found.");
        }

        $price = $plan->price;

        return view('payments.form', compact('tier', 'billing', 'price'));
    }

    /**
     * Initiate Razorpay payment.
     */
    public function initiatePayment(Request $request)
    {
        $request->validate([
            'selected_tier' => 'required|exists:plans,name',
            'billing' => 'required|in:monthly,yearly',
        ]);

        $billing = $request->input('billing', 'monthly');
        $user = Auth::user();

        // Find the plan
        $plan = Plan::where('name', $request->selected_tier)
                    ->where('billing_cycle', $request->billing)
                    ->firstOrFail();

        // Amount in paise (e.g., ₹49 = 4900 paise)
        $amount = $plan->price * 100;

        // Create a Razorpay order
        $order = $this->api->order->create([
            'amount' => $amount,
            'currency' => 'INR',
            'receipt' => 'receipt_' . time(),
        ]);

        // Create a pending subscription
        $subscription = Subscription::create([
            'user_id' => $user->id,
            'plan_id' => $plan->id,
            'start_date' => Carbon::today(),
            'status' => 'pending',
        ]);

        // Create a payment request
        $paymentRequest = PaymentRequest::create([
            'user_id' => $user->id,
            'email' => $user->email,
            'name' => $plan->name,
            'subscription_id' => $subscription->id,
            'payment_amount' => $plan->price,
            'razorpay_order_id' => $order['id'],
            'status' => 'pending',
            'selected_tier' => $request->selected_tier,
            'billing' => $billing,
        ]);

        return view('payments.checkout', [
            'order' => $order,
            'amount' => $amount,
            'key' => env('RAZORPAY_KEY'),
            'paymentRequest' => $paymentRequest,
        ]);
    }

    /**
     * Verify Razorpay payment and activate subscription.
     */
    public function verifyPayment(Request $request)
    {
        $attributes = [
            'razorpay_order_id' => $request->razorpay_order_id,
            'razorpay_payment_id' => $request->razorpay_payment_id,
            'razorpay_signature' => $request->razorpay_signature,
        ];

        try {
            $this->api->utility->verifyPaymentSignature($attributes);

            $paymentRequest = PaymentRequest::where('razorpay_order_id', $request->razorpay_order_id)->firstOrFail();
            $subscription = $paymentRequest->subscription;
            $user = $subscription->user;

            // Update payment request with Razorpay details
            $paymentRequest->update([
                'razorpay_payment_id' => $request->razorpay_payment_id,
                'razorpay_signature' => $request->razorpay_signature,
                'status' => 'verified', // Automatically verified
            ]);

            // Activate subscription
            $durationDays = $paymentRequest->billing === 'yearly' ? 365 : 30;
            $endDate = Carbon::today()->addDays($durationDays)->endOfDay();

            $subscription->update([
                'status' => 'active',
                'end_date' => $endDate,
            ]);

            // Update user plan details
            $trialValue = ($user->trial_expires_at && now()->lt($user->trial_expires_at))
                        ? $user->trial_expires_at
                        : null;

            $user->update([
                'trial_expires_at' => $trialValue,
                'plan_id' => $subscription->plan_id,
                'plan_expires_at' => $endDate,
            ]);

            // Send confirmation email
            Mail::to($user->email)->send(new \App\Mail\MembershipActivatedMail($user, $endDate));

            return redirect()->route('payment.success')->with('success', 'Payment successful! Your membership is now active.');
        } catch (\Exception $e) {
            Log::error('Razorpay Payment Verification Failed: ' . $e->getMessage());
            return redirect()->route('payment.form', [
                'tier' => $request->selected_tier,
                'billing' => $request->billing
            ])->with('error', 'Payment failed: ' . $e->getMessage());
        }
    }

    /**
     * Show payment success page.
     */
    public function paymentSuccess()
    {
        return view('payments.success');
    }

    /**
     * Superadmin endpoint: approve & activate a payment request (if manual review is retained).
     */
    public function approvePaymentRequest($id)
    {
        $payment = PaymentRequest::findOrFail($id);
        $subscription = $payment->subscription;
        $plan = $subscription->plan;
        $user = $subscription->user;
        $length = $plan->billing_cycle === 'yearly' ? 365 : 30;

        $endDate = Carbon::today()->addDays($length)->endOfDay();

        // Update subscription
        $subscription->update([
            'status' => 'active',
            'end_date' => $endDate,
        ]);
        \Log::info("User {$user->email} subscription has been activated. Subscription ends on {$endDate}.");

        // Preserve trial_expires_at if the trial is still active
        $trialValue = ($user->trial_expires_at && now()->lt($user->trial_expires_at))
                    ? $user->trial_expires_at
                    : null;

        $user->update([
            'trial_expires_at' => $trialValue,
            'plan_id' => $plan->id,
            'plan_expires_at' => $endDate,
        ]);

        $payment->update(['status' => 'verified']);

        Mail::to($user->email)
            ->send(new \App\Mail\MembershipActivatedMail($user, $endDate));

        return redirect()->back()->with('success', 'Payment approved.');
    }

    /**
     * Superadmin endpoint: reject a payment request.
     */
    public function rejectPaymentRequest($id)
    {
        $payment = PaymentRequest::findOrFail($id);
        $subscription = $payment->subscription;
        $user = $subscription->user;

        $subscription->update(['status' => 'cancelled']);
        $payment->update(['status' => 'rejected']);

        if ($user->trial_expires_at && now()->lt($user->trial_expires_at)) {
            $trialPlan = Plan::where('name', 'Basic')
                            ->where('billing_cycle', 'trial')
                            ->first();

            if ($trialPlan) {
                $user->update([
                    'plan_id' => $trialPlan->id,
                    'plan_expires_at' => $user->trial_expires_at,
                ]);
                \Log::info("User {$user->email} reverted to trial. Trial active until {$user->trial_expires_at}.");
            } else {
                $user->update([
                    'plan_id' => null,
                    'plan_expires_at' => null,
                ]);
                \Log::error("Trial plan 'Basic' not found for user {$user->email}. Cleared membership details.");
            }
        } else {
            $user->update([
                'plan_id' => null,
                'plan_expires_at' => null,
            ]);
            \Log::info("User {$user->email}'s trial period has expired. Cleared membership details.");
        }

        return redirect()->back()->with('success', 'Payment rejected.');
    }

    /**
     * Update the status of a payment request (e.g., reject).
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,verified,rejected',
        ]);

        $payment = PaymentRequest::findOrFail($id);
        $payment->update(['status' => $request->status]);

        if ($request->status === 'rejected') {
            $subscription = $payment->subscription;
            $subscription->update(['status' => 'cancelled']);
        }

        return redirect()->back()->with('success', 'Payment status updated successfully.');
    }
}
```

#### Key Changes in `PaymentController`:
- Removed the `submitPayment` method, which handled screenshot uploads, and replaced it with `initiatePayment` and `verifyPayment` for Razorpay.
- `initiatePayment` creates a Razorpay order, a pending subscription, and a payment request, then redirects to a checkout page.
- `verifyPayment` verifies the Razorpay payment signature, updates the payment request, activates the subscription, updates the user’s plan, and sends a confirmation email.
- The `approvePaymentRequest` and `rejectPaymentRequest` methods are retained in case you want to add a manual review step (e.g., set `status` to `pending` initially and let superadmin approve).
- In this implementation, I’ve automated the approval process (`status` is set to `verified` immediately after payment verification). If you want manual review, you can modify `verifyPayment` to keep `status` as `pending` and let superadmin approve via `approvePaymentRequest`.

---

### Step 4: Update the Views
We need to update the payment form to initiate a Razorpay payment and add a checkout view for the Razorpay modal. We’ll also create a success page.

1. **Update Payment Form (`resources/views/payments/form.blade.php`):**
   - Remove the QR code and screenshot upload sections, replacing them with a button to initiate Razorpay payment.

```html
<x-guest-layout>
    <div class="w-full mx-auto">
        <h1 class="text-2xl md:text-3xl font-extrabold text-sky-800 mb-4 text-center tracking-tight drop-shadow-md">
            Complete Your Payment for {{ ucfirst($tier) }} Plan
        </h1>
        <p class="mb-4 text-center font-semibold">Price: ₹{{ $price }} ({{ $billing }})</p>
        
        <!-- Guidelines / Disclaimer Section -->
        <div class="p-6 bg-yellow-50 rounded-lg shadow-lg border border-gray-300 mb-6">
            <h2 class="text-2xl font-bold text-yellow-700 mb-4">Important Guidelines</h2>
            <ul class="list-disc list-inside text-gray-800 space-y-2">
                <li>You will be redirected to Razorpay to complete your payment.</li>
                <li>Your membership will activate immediately upon successful payment.</li>
                <li>Ensure you use the same email address for payment as your registered email.</li>
            </ul>
        </div>

        <!-- Payment Form -->
        <form action="{{ route('payment.initiate') }}" method="POST" class="bg-white p-6 rounded-lg shadow-lg border border-gray-300">
            @csrf

            <!-- Name Field -->
            <div class="mb-4">
                <label for="name" class="block text-gray-700 font-semibold mb-1">Name:</label>
                <input type="text" name="name" value="{{ Auth::user()->name }}" class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" readonly>
            </div>

            <!-- Email Field -->
            <div class="mb-4">
                <label for="email" class="block text-gray-700 font-semibold mb-1">Email:</label>
                <input type="email" name="email" value="{{ Auth::user()->email }}" class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" readonly>
            </div>

            <!-- Hidden fields to pass membership data -->
            <input type="hidden" name="selected_tier" value="{{ $tier }}">
            <input type="hidden" name="billing" value="{{ $billing }}">

            <!-- Form Buttons -->
            <div class="flex flex-col sm:flex-row gap-4">
                <a href="{{ route('landingPage') }}" class="w-full text-center bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600 transition-all">
                    Back
                </a>
                <button type="submit" class="w-full bg-sky-600 text-white px-4 py-2 rounded hover:bg-sky-800 transition-all">
                    Pay with Razorpay
                </button>
            </div>
        </form>
    </div>
    <x-toast/>
</x-guest-layout>
```

2. **Create Checkout View (`resources/views/payments/checkout.blade.php`):**
   - This view loads Razorpay’s checkout script and initiates the payment.

```html
<x-guest-layout>
    <div class="w-full mx-auto">
        <h1 class="text-2xl md:text-3xl font-extrabold text-sky-800 mb-4 text-center tracking-tight drop-shadow-md">
            Complete Your Payment
        </h1>
        <p class="mb-4 text-center font-semibold">Price: ₹{{ $amount / 100 }} ({{ $paymentRequest->billing }})</p>

        <form name="razorpayform" action="{{ route('payment.verify') }}" method="POST">
            @csrf
            <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
            <input type="hidden" name="razorpay_order_id" id="razorpay_order_id" value="{{ $order['id'] }}">
            <input type="hidden" name="razorpay_signature" id="razorpay_signature">
            <input type="hidden" name="selected_tier" value="{{ $paymentRequest->selected_tier }}">
            <input type="hidden" name="billing" value="{{ $paymentRequest->billing }}">
        </form>
        <div class="text-center">
            <button id="rzp-button1" class="bg-sky-600 text-white px-4 py-2 rounded hover:bg-sky-800 transition-all">
                Pay Now
            </button>
        </div>

        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
        <script>
            var options = {
                "key": "{{ $key }}",
                "amount": {{ $amount }},
                "currency": "INR",
                "name": "BuildMyFolio",
                "description": "Payment for {{ $paymentRequest->name }} Plan",
                "order_id": "{{ $order['id'] }}",
                "handler": function (response) {
                    document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                    document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                    document.getElementById('razorpay_signature').value = response.razorpay_signature;
                    document.forms['razorpayform'].submit();
                },
                "prefill": {
                    "name": "{{ Auth::user()->name }}",
                    "email": "{{ Auth::user()->email }}",
                    "contact": "9000090000" // You can make this dynamic if you store user phone numbers
                },
                "theme": {
                    "color": "#00ff84"
                }
            };
            var rzp1 = new Razorpay(options);
            document.getElementById('rzp-button1').onclick = function(e) {
                rzp1.open();
                e.preventDefault();
            }
        </script>
    </div>
</x-guest-layout>
```

3. **Create Success View (`resources/views/payments/success.blade.php`):**

```html
<x-guest-layout>
    <div class="w-full mx-auto text-center">
        <h1 class="text-2xl md:text-3xl font-extrabold text-sky-800 mb-4 tracking-tight drop-shadow-md">
            Payment Successful!
        </h1>
        <p class="mb-4 font-semibold">Thank you for your payment. Your membership is now active.</p>
        <a href="{{ route('landingPage') }}" class="bg-sky-600 text-white px-4 py-2 rounded hover:bg-sky-800 transition-all">
            Return to Home
        </a>
    </div>
</x-guest-layout>
```

---

### Step 5: Update Routes
Update `routes/web.php` to include the new Razorpay routes:

```php
use App\Http\Controllers\PaymentController;

Route::get('/payment', [PaymentController::class, 'showPaymentForm'])->name('payment.form');
Route::post('/payment/initiate', [PaymentController::class, 'initiatePayment'])->name('payment.initiate');
Route::post('/payment/verify', [PaymentController::class, 'verifyPayment'])->name('payment.verify');
Route::get('/payment/success', [PaymentController::class, 'paymentSuccess'])->name('payment.success');

// Superadmin routes (if manual review is retained)
Route::middleware(['auth', 'superadmin'])->group(function () {
    Route::post('/payment/approve/{id}', [PaymentController::class, 'approvePaymentRequest'])->name('payment.approve');
    Route::post('/payment/reject/{id}', [PaymentController::class, 'rejectPaymentRequest'])->name('payment.reject');
    Route::post('/payment/update/{id}', [PaymentController::class, 'update'])->name('payment.update');
});
```

---

### Step 6: Update Superadmin Payment Status Controller
The `PaymentStatusController` currently handles manual approval/rejection of payment requests. Since Razorpay automates payment verification, the superadmin’s role can be optional. However, I’ll modify the controller to display Razorpay payment details instead of screenshots, and you can decide whether to retain manual review.

Update `app/Http/Controllers/SuperAdmin/PaymentStatusController.php`:

```php
<?php

namespace App\Http\Controllers\SuperAdmin;

use App\Http\Controllers\Controller;
use App\Mail\MembershipActivatedMail;
use App\Models\PaymentRequest;
use App\Models\Plan;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;

class PaymentStatusController extends Controller
{
    public function index()
    {
        $paymentRequests = PaymentRequest::with('user')->orderBy('created_at', 'desc')->get();
        return view('superadmin.payments.index', compact('paymentRequests'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:pending,verified,rejected',
        ]);

        $paymentRequest = PaymentRequest::findOrFail($id);
        $paymentRequest->update(['status' => $request->status]);

        $user = User::findOrFail($paymentRequest->user_id);

        if ($request->status === 'verified') {
            $durationDays = $paymentRequest->billing === 'yearly' ? 365 : 30;
            $endDate = Carbon::today()->addDays($durationDays)->endOfDay();

            $selectedPlan = Plan::where('name', $paymentRequest->selected_tier)
                                ->where('billing_cycle', $paymentRequest->billing)
                                ->first();

            if (!$selectedPlan) {
                Log::error("Selected plan not found for tier: " . $paymentRequest->selected_tier);
                return redirect()->back()->with('error', 'Selected plan not found.');
            }

            $trialValue = ($user->trial_expires_at && now()->lt($user->trial_expires_at))
                        ? $user->trial_expires_at
                        : null;

            $user->update([
                'trial_expires_at' => $trialValue,
                'plan_id' => $selectedPlan->id,
                'plan_expires_at' => $endDate,
            ]);

            $subscription = $paymentRequest->subscription;
            $subscription->update([
                'status' => 'active',
                'end_date' => $endDate,
            ]);

            try {
                Mail::to($user->email)
                    ->send(new MembershipActivatedMail($user, $endDate));
            } catch (\Exception $e) {
                Log::error("Failed to send membership activation email to: " . $user->email . ". Error: " . $e->getMessage());
            }
        } elseif ($request->status === 'rejected') {
            $subscription = $paymentRequest->subscription;
            $subscription->update(['status' => 'cancelled']);

            if ($user->trial_expires_at && now()->lt($user->trial_expires_at)) {
                $trialPlan = Plan::where('name', 'Basic')
                                ->where('billing_cycle', 'trial')
                                ->first();

                if ($trialPlan) {
                    $user->update([
                        'plan_id' => $trialPlan->id,
                        'plan_expires_at' => $user->trial_expires_at,
                    ]);
                    Log::info("User {$user->email} reverted to trial. Trial active until {$user->trial_expires_at}.");
                } else {
                    $user->update([
                        'plan_id' => null,
                        'plan_expires_at' => null,
                    ]);
                    Log::error("Trial plan 'Basic' not found for user {$user->email}. Cleared membership details.");
                }
            } else {
                $user->update([
                    'plan_id' => null,
                    'plan_expires_at' => null,
                ]);
                Log::info("User {$user->email}'s trial period has expired. Cleared membership details.");
            }
        }

        return redirect()->back()->with('success', 'Payment status updated successfully.');
    }

    public function destroy($id)
    {
        $payment = PaymentRequest::findOrFail($id);
        $subscription = $payment->subscription;

        // If the subscription is active, cancel it before deleting
        if ($subscription->status === 'active') {
            $subscription->update(['status' => 'cancelled']);
        }

        $payment->delete();

        Log::info("Payment Request Deleted", [
            'payment_id' => $payment->id,
            'user_id' => $payment->user_id,
        ]);

        return redirect()->back()->with('success', 'Payment record deleted successfully.');
    }
}
```

#### Key Changes in `PaymentStatusController`:
- The logic for approving/rejecting remains the same, but it now works with Razorpay payment data.
- Added a check in the `destroy` method to cancel active subscriptions before deleting a payment request.
- If you choose to automate approvals, this controller will only be used for reviewing payment details or handling edge cases (e.g., refunds, disputes).

---

### Step 7: Update Superadmin Payment Index View
The superadmin view (`superadmin.payments.index`) currently displays payment requests with screenshot paths. We’ll update it to show Razorpay payment details instead.

Update `resources/views/superadmin/payments/index.blade.php` (you’ll need to adjust this based on your actual view, but here’s an example):

```html
<x-app-layout>
    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <h1 class="text-2xl font-bold mb-4">Payment Requests</h1>

            @if (session('success'))
                <div class="alert alert-success mb-4">
                    {{ session('success') }}
                </div>
            @endif

            <table class="min-w-full bg-white border border-gray-300">
                <thead>
                    <tr>
                        <th class="px-4 py-2 border">User</th>
                        <th class="px-4 py-2 border">Email</th>
                        <th class="px-4 py-2 border">Plan</th>
                        <th class="px-4 py-2 border">Amount</th>
                        <th class="px-4 py-2 border">Billing</th>
                        <th class="px-4 py-2 border">Razorpay Payment ID</th>
                        <th class="px-4 py-2 border">Status</th>
                        <th class="px-4 py-2 border">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($paymentRequests as $payment)
                        <tr>
                            <td class="px-4 py-2 border">{{ $payment->user->name }}</td>
                            <td class="px-4 py-2 border">{{ $payment->email }}</td>
                            <td class="px-4 py-2 border">{{ $payment->name }}</td>
                            <td class="px-4 py-2 border">₹{{ $payment->payment_amount }}</td>
                            <td class="px-4 py-2 border">{{ $payment->billing }}</td>
                            <td class="px-4 py-2 border">{{ $payment->razorpay_payment_id ?? 'N/A' }}</td>
                            <td class="px-4 py-2 border">{{ $payment->status }}</td>
                            <td class="px-4 py-2 border">
                                @if ($payment->status === 'pending')
                                    <form action="{{ route('payment.status.update', $payment->id) }}" method="POST" class="inline">
                                        @csrf
                                        @method('PATCH')
                                        <input type="hidden" name="status" value="verified">
                                        <button type="submit" class="text-green-600 hover:underline">Approve</button>
                                    </form>
                                    |
                                    <form action="{{ route('payment.status.update', $payment->id) }}" method="POST" class="inline">
                                        @csrf
                                        @method('PATCH')
                                        <input type="hidden" name="status" value="rejected">
                                        <button type="submit" class="text-red-600 hover:underline">Reject</button>
                                    </form>
                                @endif
                                |
                                <form action="{{ route('payment.status.destroy', $payment->id) }}" method="POST" class="inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="text-red-600 hover:underline" onclick="return confirm('Are you sure you want to delete this payment request?')">Delete</button>
                                </form>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</x-app-layout>
```

#### Notes on the Superadmin View:
- Replaced the screenshot column with a `razorpay_payment_id` column to display the payment ID.
- The approve/reject actions are only shown for `pending` payments (if you choose to retain manual review).
- If you fully automate approvals, the `status` will already be `verified`, and superadmin can only delete records or review payment details.

---

### Step 8: Test the Integration
1. **Run Your Application:**

```bash
php artisan serve
```

2. **Register a User:**
   - Register a new user to get the 14-day trial (Basic plan).
   - Verify the `users` table has the correct `trial_expires_at` and `plan_id` (5 for Basic).

3. **Initiate a Payment:**
   - Log in as the user, navigate to the payment form (`/payment?tier=starter&billing=monthly`), and click "Pay with Razorpay".
   - Use Razorpay test card details (e.g., `4111 1111 1111 1111`, expiry 12/25, CVV 123, OTP 123456) to complete the payment.

4. **Verify the Payment:**
   - After payment, you should be redirected to the success page.
   - Check the `payment_requests` table for the Razorpay payment details (`razorpay_payment_id`, etc.).
   - Check the `subscriptions` table—`status` should be `active`, and `end_date` should be set (e.g., 2025-06-21 for a monthly plan).
   - Check the `users` table—`plan_id` should be 1 (monthly Starter), and `plan_expires_at` should match the subscription’s `end_date`.

5. **Superadmin Review (Optional):**
   - If you retained manual review, log in as superadmin, go to the payments index page, and approve/reject pending payments.
   - Verify the same table updates as in the automated flow.

---

### Optional: Retain Manual Review
If you want to retain manual review (e.g., for compliance or fraud checks), modify the `verifyPayment` method in `PaymentController` to keep the payment request `status` as `pending`:

```php
$paymentRequest->update([
    'razorpay_payment_id' => $request->razorpay_payment_id,
    'razorpay_signature' => $request->razorpay_signature,
    'status' => 'pending', // Keep as pending for superadmin review
]);
```

- The superadmin can then approve/reject the payment using the `PaymentStatusController`, triggering the same subscription activation logic.

---

### Summary of Changes
- **Database:** Updated `payment_requests` to store Razorpay payment details instead of screenshots.
- **Payment Flow:** Replaced QR code/screenshot with Razorpay in-page checkout, automating payment verification and subscription activation.
- **Superadmin:** Adjusted to display Razorpay payment IDs; manual review is optional.
- **Trial Logic:** Preserved the 14-day trial period logic, with seamless upgrade to paid plans.
- **Tables Updated:** Same as before (`users`, `subscriptions`, `payment_requests`), but the process is now automated unless manual review is retained.

This integration should streamline BuildMyFolio’s payment process while maintaining your existing structure. Let me know if you need further adjustments or additional features (e.g., webhooks, recurring payments)!