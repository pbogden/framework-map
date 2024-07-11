# 11-Maps

* raster vs vector
* tile providers (Stamen -> StadiaMaps)
* D3 vs Leaflet vs MapBox vs MapLibre

---

## Projects

* Next 2 weeks!
* Random drawing
* More guidance coming

---

## D3 & Plot

* [Framework shapefile](https://observablehq.com/framework/lib/shapefile)
  * one of many built-in Framework libraries
  * converts shapefiles to GeoJSON (and streams)
  * you can then use the data with D3, Observable Plot, Leaflet, etc.
* [DC School Budgets](https://observablehq.com/@pbogden/dc-school-budgets/2) -- my notebook
  * super lightweight, really old
  * used a variety working map-tile providers -- some are now busted
  * [Stamen](https://stamen.com/) had some really nice [map tiles](maps.stamen.com)

---

## Stamen --> StadiaMaps

* [Stamen.com](https://stamen.com)
* [maps.stamen.com](https://maps.stamen.com)
* [Stadia partnership](https://maps.stamen.com/stadia-partnership/)
  * Hosting for Stamen map tiles
  * [Pricing](https://stadiamaps.com/pricing/)
  * Free with hard limits
  * 200k credits/month (non-commercial)
  * $20/month otherwise for starter

---

## Leaflet

* [Leaflet](https://leafletjs.com/) (really old, but good) -- leaflet.com
* [Hello, Leaflet](https://observablehq.com/@observablehq/hello-leaflet) mbostock notebook
  * Note the Leaflet CSS complexity
  * Typical of slippy map libraries
* [Leaflet in Framework](https://observablehq.com/framework/lib/leaflet) -- observablehq.com

---

## Security

* [integrity attribute](https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity) -- mdn
  * SRI = SubResource Integrity
  * for resource verification (e.g., from a CDN)
  * browsers must verify a cryptographic hash
  * [SRI Hash Generator](https://www.srihash.org/) -- srihash.org
* [crossorigin attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/crossorigin) -- mdn
  * [Same-origin policy](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy) -- mdn
  * [Cross-origin network access](https://developer.mozilla.org/en-US/docs/Web/Security/Same-origin_policy#cross-origin_network_access) -- mdn
  * [CORS (definition)](https://developer.mozilla.org/en-US/docs/Glossary/CORS) -- mdn
  * blocks access to cross-origin requests
  * [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) -- mdn

---

## Leaflet + data

* [Using GeoJSON with Leaflet](https://leafletjs.com/examples/geojson/) -- leafletjs.com
  * View source on the page
  * it's an iframe embed of "example.html"
* [example.html](https://leafletjs.com/examples/geojson/example.html)
* [Hello, Leaflet quakes!](https://observablehq.com/@pbogden/hello-leaflet-quakes) -- my notebook

---

## Framework libraries 

* [Observable Framework](http://observablehq.com/framework)
* Shapefiles
* Leaflet
* Mapbox

---

## Exercise

* Leaflet in Framework
* Add geojson as a layer
* Exercise #2: Add the interaction
* Canvas has github-classroom notebooks

---

## Vector tiles

* [vector tiles](https://docs.stadiamaps.com/guides/switching-your-maps-from-raster-to-vector-tiles/) -- stadiamaps.com
* [Stadia Maps geospatial APIs](https://docs.stadiamaps.com/api-reference/) (reference docs) -- stadiamaps.com
* Vector tiles need to be rendered client side -- don't work on older devices and browsers
* [Maplibre autocomplete search plugin](https://docs.stadiamaps.com/sdks/maplibre-gl-js-autocomplete-search-plugin)
* [vector tiles with Leaflet](https://docs.stadiamaps.com/tutorials/vector-tiles-with-leaflet/)

---

## Geocode

* [Stadia Maps geocoding](https://docs.stadiamaps.com/geocoding-search-autocomplete/overview/) -- stadiamaps.com
  * geocoding and autocomplete search APIs
  * [Autocomplete Search Box for MapLibre](https://docs.stadiamaps.com/sdks/maplibre-gl-js-autocomplete-search-plugin/)
  * [JSFiddle demo](https://jsfiddle.net/api/post/library/pure)
  * This is a complete example
  * EXERCISE: Copy JSFiddle into index.html
* [MapLibre geocoding with Nominatim](https://maplibre.org/maplibre-gl-js/docs/examples/geocoder/)

---

## MapLibre

[maplibre.md](maplibre.md)
