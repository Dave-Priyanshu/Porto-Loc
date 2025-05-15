Registering a view composer for your SEO metadata adds virtually zero measurable overhead—here’s why and how to include it alongside the “Install an SEO Helper Package” step in your setup guide.

---

## ⚡️ Performance Impact of View Composers

* **When They Run:** A view composer fires only when the associated view is rendered. If you hook it to your main layout (e.g. `layouts/app`), it runs once per page load—just like any controller logic.
* **Minimal Logic:** If your composer only pulls data from the current route/model (which is already loaded) and calls the SEOTools setters, that’s a handful of in-memory calls. On modern PHP/OpCache setups, this is negligible.
* **Caching Opportunity:** You can cache heavy parts (like database-backed defaults) in Laravel’s cache and invalidate only when you update your site-wide metadata settings. That further reduces any overhead.
* **Real-World Benchmarks:** In a typical Laravel app, adding a simple composer adds less than 1 ms to response time. Page-level caching or HTTP caching will mask even that.

**Bottom line:** View composers keep your controllers clean (DRY) without noticeably slowing down your site—especially once you enable Laravel’s route/view caching in production.

---

## Updated SEO Setup Guide

```bash
# 1. Install an SEO Helper Package
composer require artesaos/seotools
```

1. **Install an SEO Helper Package**
   Pull in **artesaos/seotools** for unified meta, Open Graph, Twitter, and JSON-LD support.

2. **Publish & Configure**

   ```bash
   php artisan vendor:publish --provider="Artesaos\SEOTools\Providers\SEOToolsServiceProvider"
   ```

   Add the service provider and aliases in `config/app.php` as shown in the package docs.

3. **Inject Default Meta in Your Layout**
   In `resources/views/layouts/app.blade.php`:

   ```blade
   <head>
       {!! SEOMeta::generate() !!}
       {!! OpenGraph::generate() !!}
       {!! Twitter::generate() !!}
       {!! JsonLd::generate() !!}
   </head>
   ```

4. **Register a View Composer for DRY Metadata**
   Create or update `App\Providers\ViewServiceProvider.php`:

   ```php
   namespace App\Providers;

   use Illuminate\Support\Facades\View;
   use Illuminate\Support\ServiceProvider;
   use SEOMeta, OpenGraph, Twitter, JsonLd;

   class ViewServiceProvider extends ServiceProvider
   {
       public function boot()
       {
           View::composer('layouts.app', function ($view) {
               // Example: infer from route name or bound model
               if (request()->routeIs('projects.show') && $project = $view->getData()['project'] ?? null) {
                   SEOMeta::setTitle($project->title)
                          ->setDescription(Str::limit($project->description, 160))
                          ->setCanonical(route('projects.show', $project));

                   OpenGraph::setTitle($project->title)
                            ->setDescription($project->description)
                            ->setUrl(route('projects.show', $project))
                            ->addImage($project->thumbnail_url);

                   Twitter::setTitle($project->title)->setSite('@YourHandle');

                   JsonLd::setType('Article')
                          ->setTitle($project->title)
                          ->setDescription($project->description)
                          ->addImage($project->thumbnail_url);
               } else {
                   // Fallback defaults
                   SEOMeta::setTitle(config('app.name'))
                          ->setDescription('Your go-to portfolio builder.');
                   OpenGraph::setTitle(config('app.name'));
               }
           });
       }

       public function register() {}
   }
   ```

   Finally, add `App\Providers\ViewServiceProvider::class` to your `config/app.php` providers array.

5. **Continue with Sitemaps, Robots.txt, etc.**
   Follow the remaining steps (sitemap generation, robots.txt, slugs, structured data, image alt text, performance caching, and monitoring) as previously outlined.

---

With this in place, your metadata layer is both DRY and lightning-fast—giving you SEO benefits without sacrificing performance.
