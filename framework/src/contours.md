# Contours

Testing -- Dynamic DEM contours using the [maplibre-contour plugin](https://github.com/onthegomap/maplibre-contour) 

[Portland DEM Contours](https://observablehq.com/@pbogden/portland-dem-contours) -- my notebook

<link href="https://unpkg.com/maplibre-gl/dist/maplibre-gl.css" rel="stylesheet" />

```js
import maplibregl from "npm:maplibre-gl";
import mlcontour from "npm:maplibre-contour";
```

```js
const demSource = new mlcontour.DemSource({
    url: "https://elevation-tiles-prod.s3.amazonaws.com/terrarium/{z}/{x}/{y}.png",
//    url: "https://pbogden.github.io/geo/tiles/{z}/{x}/{y}.png",
    encoding: "terrarium",
    maxzoom: 13,
});

demSource.setupMaplibre(maplibregl);
```

```js
const div = display(document.createElement("div"));
div.style = "height: 400px;";

const map = new maplibregl.Map({
  // interactive: false,
  boxZoom: true, // use shift+drag to create bounding box, "zoom to" follows
  pitch: 0,
  bearing: 0,
  maplibreLogo: true,
  container: div,
  center: [-70.2568, 43.6591], zoom: 12, // Portland, ME
  style: "https://basemaps.cartocdn.com/gl/voyager-gl-style/style.json",
  scrollZoom: true
});

map.addControl(new maplibregl.NavigationControl());

// Set map limits
map.setMinZoom(10);
map.setMaxZoom(15);

  map.on('load', () => {
    map.addSource("contour-source", {
      type: "vector",
      tiles: [
        demSource.contourProtocolUrl({
          // convert meters to feet, default=1 for meters
          multiplier: 3.28084,
          thresholds: {
            10: 10,
            12: 5,
            // zoom: [minor, major]
            //  9: [200, 1000],
            // 10: [200, 1000],
            // 11: [200, 1000],
            // 12: [100, 500],
            // 14: [50, 200],
            // 15: [20, 100],
          },
          // optional, override vector tile parameters:
          contourLayer: "contours",
          elevationKey: "ele",
          levelKey: "level",
          extent: 4096,
          buffer: 1,
        }),
      ],
      maxzoom: 15,
    });
    
    map.addLayer({
      id: "contour-lines",
      type: "line",
      source: "contour-source",
      "source-layer": "contours",
      paint: {
        "line-color": "rgba(0,0,0, 50%)",
        // level = highest index in thresholds array the elevation is a multiple of
        "line-width": ["match", ["get", "level"], 1, 1, 0.5],
      },
    });
    
  })

// resolve(map); // See: https://observablehq.com/@mbostock/mapbox-fly-to
invalidation.then(() => map.remove());
```
