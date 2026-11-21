// Service Worker: Trans-SaaS Perú PWA
const CACHE_NAME = 'trans-saas-peru-v2.0';

self.addEventListener('install', (event) => {
  self.skipWaiting();
});

self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(keys.map((key) => caches.delete(key)));
    })
  );
  self.clients.claim();
});

self.addEventListener('fetch', (event) => {
  // Network first for all local navigation and HTML
  if (event.request.mode === 'navigate' || event.request.destination === 'document') {
    event.respondWith(
      fetch(event.request).catch(() => caches.match(event.request))
    );
    return;
  }

  // Pass through without blocking
  event.respondWith(
    fetch(event.request).catch(() => caches.match(event.request))
  );
});
