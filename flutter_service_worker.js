'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c4efc3e6d5478cba2415e3db47bce4b6",
"version.json": "aeec136c733c3689915985de5cae956f",
"index.html": "87a9d7796b8aef7a14f8a5c5cc8a5a13",
"/": "87a9d7796b8aef7a14f8a5c5cc8a5a13",
"main.dart.js": "0baa6253c33e2014a658d7648d76fe84",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-maskable-512.png": "d41d8cd98f00b204e9800998ecf8427e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "e3df73c27c888899d1f248d10cbed902",
".git/config": "39119b353a53e53cb5e2f807e614f85a",
".git/objects/0d/198922d2fb12b30abcb507bd040a1a61d28777": "0e13f8047af05ea4a7a90948102985bf",
".git/objects/66/7936679de21df6b9be5adb50161e9dc6821a78": "126a6dc13369d8b6a740dbc61d8fa8c6",
".git/objects/57/7946daf6467a3f0a883583abfb8f1e57c86b54": "846aff8094feabe0db132052fd10f62a",
".git/objects/3b/05c0e9f35372e5148dcd442a83cacb00098ae7": "e457bf564ec063b5e28b28f7db1ffd3a",
".git/objects/3b/12b292cf8121a89b8c9a347618b5429973aa16": "8097a24b712024d70290eec9f07974a1",
".git/objects/6a/eb7e7452022a21f912706fad8405e83b8ce83b": "b100c784034a26a74d0f6abe2ed660d6",
".git/objects/35/96d08a5b8c249a9ff1eb36682aee2a23e61bac": "e931dda039902c600d4ba7d954ff090f",
".git/objects/3c/64589caa473fc12066c09207fbab1f45d9aa78": "2e663d4b0d3c2b103ad60ab65aa9dba7",
".git/objects/5a/7cd4c6fd99a87ff6ad1ff59df9531c121e0759": "0a7a3e917a0843b35297c1593d0afaee",
".git/objects/5f/bf1f5ee49ba64ffa8e24e19c0231e22add1631": "f19d414bb2afb15ab9eb762fd11311d6",
".git/objects/02/3ef7e42c8ec8aa248d3a37fe3c4fbfef079501": "3f4dd32e37f4692ea6d997a2ff296a70",
".git/objects/a4/c8116679fd0613de44019cdb8cc0e889aa7008": "6da09387332a815633e5e71216420959",
".git/objects/a4/4656258e50852220aa4399d3391cd99ec7ef63": "3047f7263decbe5fca67e9007eb54b8e",
".git/objects/a3/b8877e377c878f842ba176c2e7a2c5d5ff88a2": "3888ebfd1a45f141f0e611150b174dff",
".git/objects/d9/3952e90f26e65356f31c60fc394efb26313167": "1401847c6f090e48e83740a00be1c303",
".git/objects/ac/4208e7cae13ebf501d7242ceb1b31a5d8f87d4": "ec934ca1961b06bf63405c2e770fe8f3",
".git/objects/a5/de584f4d25ef8aace1c5a0c190c3b31639895b": "9fbbb0db1824af504c56e5d959e1cdff",
".git/objects/ae/68d09b83de833cff7acd32af0713e1097a7bc0": "2042cfc8ddb183c27a88ccdd409e83cf",
".git/objects/ab/63a82a2a6c84649a6a1f948a769530bd4b1a83": "aaa8fed8fecee31fdd60792f613d3319",
".git/objects/f4/7f825da08bb98383c0100edfb46d603a7d9d7c": "f02e4695cf141f7dfa5b08220f7be617",
".git/objects/f4/e144a3c834d2c11fd7329b81cd8488e1f32c88": "a730110cc5151a9819bf0051a0749655",
".git/objects/f3/709a83aedf1f03d6e04459831b12355a9b9ef1": "538d2edfa707ca92ed0b867d6c3903d1",
".git/objects/c7/302333273e83ba195a956026485054ee080714": "97681912436adbab71a05a9ebe69aabd",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/ca/5c71ec87e3c1a71661c1b95440fd386c642fb5": "e1212e5495e76e288d9a54dd51440e96",
".git/objects/e4/d09e212cad91f5ff43362239432b1d7fefb23a": "f9a09d3eb987d17ec46e739620ae39e1",
".git/objects/18/bd6d3229419996bffb689a3104a92aa425b039": "f97635f7b4af7aabe72acbd02d26c185",
".git/objects/74/328a128d4b7138ebad849feb462a04f0cb2e87": "5e64861e4badf2e42a44c84a8fdd2f24",
".git/objects/1a/91c1e0be973aade38ea6705735873ae2916028": "8572f17623c5c01bd152f339f0d9c414",
".git/objects/8f/c8be62f202c40e7d3e2e16242fb065cfc4e1a7": "6fda1b80da67a8d96186cf8ab8b24087",
".git/objects/8a/51a9b155d31c44b148d7e287fc2872e0cafd42": "9f785032380d7569e69b3d17172f64e8",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/21/ba6ee18c1c903e261bac05dc885eb3c8e19e79": "11fd576198836982b9f3aa1318a63523",
".git/objects/81/e29b3900c4a8ffd44dc174b438ee147fe11f0d": "52a79951c8e7bed4ec3158bade3e117a",
".git/objects/86/be1c02de5faa1e48929cdb60d5bd40e0f53b30": "f75cf7923c02cc28f20d7de9c87c745e",
".git/objects/72/75ee1e20a03b75d1558b399167fa8a031e42dd": "f51c395aa2837eda13c288992c5a7e2c",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/6b/aac054565afaf6239fd5d06b05845d7269ffdc": "da3c1951f9465a3ed9051042392bd676",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/91/4a40ccb508c126fa995820d01ea15c69bb95f7": "8963a99a625c47f6cd41ba314ebd2488",
".git/objects/3a/a615da84fe1c0dc251a83d3abe5312e7bb5e76": "cd792e3d8558de2253f2738ff423f90d",
".git/objects/98/001f8429113eeb6b474640d286fcdac3e6d09a": "b0cef4b6ce642b182032b96bf952b19e",
".git/objects/3f/801e482392a7dd349374888ca00b78d6bf61c1": "f849abfa9ae75f4f3c64382126eab65d",
".git/objects/5e/bf37944a56f2b5e479e3858392c6e9030da2da": "d874f5ce1eb6512c7b77ebd17b676f00",
".git/objects/6c/209a5585582024a5aba12f60dfa5968194a435": "cc5b23118e033c4611ff56d2d8f97b17",
".git/objects/99/0e4ecc79d0b6c618f6fe695f34a5084e5b78c4": "55788a5663b54c31ad1c6b0661a2b496",
".git/objects/63/80efa7352bfcd95341568bbc482e7ca5071735": "6010d5c49a79b46723d52c85b0012404",
".git/objects/bf/7d702dc381697b4649183af45c4ace2c97d02d": "8889c3c815c70f0fcdc763d8c5bf5c5b",
".git/objects/d3/ccb2aab728fc3fe2d2e7a8825a1335da318182": "74af59297b957d42ce041cbfcc569672",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/d5/5997975a903456e0b832509667435cef10217b": "f81c537e112da65c34550f01f655affa",
".git/objects/b7/da216c89009ceb5fa7f1b4ccb9e5ea584fa5b6": "87b0c4cbc0d8b799df3a50cce3dd305e",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/db/a94a80e028aa24f673760de85deb38fec73933": "2444bb7bd6fb84ba6a31a8d342b30540",
".git/objects/a8/8c9340e408fca6e68e2d6cd8363dccc2bd8642": "11e9d76ebfeb0c92c8dff256819c0796",
".git/objects/ef/b875788e4094f6091d9caa43e35c77640aaf21": "27e32738aea45acd66b98d36fc9fc9e0",
".git/objects/c3/044233911e94192b98e048fa2aea58e4d3ecf6": "b38077d36b098a0ab16f2089ec0237f6",
".git/objects/e1/aea36f372bde8e5b6c8645de82eea2dc0052d7": "ec02a9b1c24e3dab6288a435bde8f6f6",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/c2/13884904be19e03edfefb62d0c760ad1c08674": "bc6202b09d5d33e6618076c2ae2222a8",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/e7/26ece67ddf93fe543e77a32e2767786511833a": "2342a664cc6d82fd6fdbc1e127d3f820",
".git/objects/f8/5d3eb83429909279566bcfa3ae1aa8e9fb6681": "26595274f533dfe9e8484262ae037862",
".git/objects/70/306b85644d23d8ba99c5e8b3e280d1edd662e3": "24172b23c461bfcd96ad8145633fca27",
".git/objects/70/5ac65eb6299d2a9ffd727cea075d03311cd50b": "6faa757e45e54ba326e4c0b068aa370a",
".git/objects/23/637bc3573701e2ad80a6f8be31b82926b4715f": "5f84f5c437bb2791fdc8411523eae8ff",
".git/objects/85/bcd4812082af7146dbf7eac7bc980adc26656d": "dbad6943715311b79d29a81ef8281db6",
".git/objects/1d/468b85698a60041b450286f31b3264b3bbd6f7": "5c8c497111befde32ac151f14cf92f85",
".git/objects/40/1184f2840fcfb39ffde5f2f82fe5957c37d6fa": "1ea653b99fd29cd15fcc068857a1dbb2",
".git/objects/22/6cfe7eb57cde3c3f50f03c615281216cf090ed": "11b79d0afa89bafeadd020815b82a281",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a003808686cd459763215b9071ddcf31",
".git/logs/refs/heads/gh-pages": "9591a583bb432c549ed5a42c8af10394",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/gh-pages": "f5df446edd6734e4eac791b63ac86bdc",
".git/index": "7d63fba148770bc2e9861c6a8e8eb903",
".git/COMMIT_EDITMSG": "f898703eb3051e7c676a66ffa7efdcf0",
"assets/AssetManifest.json": "3bcb743359426ed6512eb542f3c6d432",
"assets/NOTICES": "7be3af8770f5dedb5dd74de93ace9b13",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/AssetManifest.bin.json": "f478a3f4eda091d0e9b698f16b46a401",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2102133d32ee99df6528804f81ff081c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "893779adf361c651acdf8f8af5d76f94",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/lib/assets/profile/profile_photo.JPG": "aa6d36a9112ccba7b2545bcade123501",
"assets/lib/assets/downloads/Maksym_Bondarenko_CV.pdf": "fff326d68334a9bef470f09f0c2c2d1b",
"assets/AssetManifest.bin": "fb35ef63b2d56ed9c9f1c75f566eeffc",
"assets/fonts/MaterialIcons-Regular.otf": "148d1775473882c460622cc0731a5248",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
