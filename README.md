# framework-map

How to put a satellite image on MapLibre with Observable Framework

## image processing

Convert from [GeoTIFF](https://www.earthdata.nasa.gov/esdis/esco/standards-and-practices/geotiff)
to PNG using [GDAL](https://gdal.org/index.html). 
(Note: if you installed geopandas from conda-forge, then you have gdal.)
The final projection must be [Web Mercator](https://en.wikipedia.org/wiki/Web_Mercator_projection).

Our demo file is [transverse Mercator](https://en.wikipedia.org/wiki/Transverse_Mercator_projection)

```
gdalinfo data/vt.tif
```
Convert to Web Mercator
```
gdalwarp -t_srs EPSG:3857 -r near data/vt.tif data/webmap.tif
```
Get corner coordinates in decimal degrees from "wgs84Extent" in the JSON output
```
gdalinfo -json data/webmap.tif
```
Convert to PNG
```
gdal_translate data/webmap.tif data/webmap.png
```

## Observable notebook

* [Vermont](https://observablehq.com/@pbogden/vermont)

## Observable Framework

[Framework](https://observablehq.com/framework/) has great documentation.
See: [getting started](https://observablehq.com/framework/getting-started).
The `./framework` directory is a barebones project created with
```
yarn create @observablehq
```

Copy the PNG into the data directory of the Framework project. For example:
```
cp data/webmap.png framework/docs/data
```

`framework/docs/map.md` has a Framework version of the Observable notebook: 
[Vermont](https://observablehq.com/@pbogden/vermont).

Deploy on github pages, in this case served from `./docs`
```
mkdir docs
touch docs/.nojekyll
cd framework
yarn build
cp -r dist/* ../docs
```
The site is here: https://pbogden.github.io/framework-map/

See also...
* [MapLibre GL](https://observablehq.observablehq.cloud/pangea/party/maplibre-gl#12/47.27574/11.39085/0/52) -- Fil demo
  * Source: https://raw.githubusercontent.com/Fil/pangea/refs/heads/main/src/party/maplibre-gl.md
  * Noteworthy: the map div and link to the css do *not* use html code blocks.
  They're explicit at the top of the markdown page -- I believe that's done to assure that they're
  both part of the DOM before any of the JavaScript executes...
  ```
  <div id="map" style="width: 100%; height: 450px;"></div>
  <link rel="stylesheet" href="npm:maplibre-gl/dist/maplibre-gl.css">
  ```
* [pangea](https://github.com/Fil/pangea) -- Fil's github repo with a bunch of framework demos
* [mclare.blog](https://mclare.blog/posts/building-oss-map-apps-with-observable-framework/)

## Map tiles

The solution above creates a single image. The approach here creates raster map tiles,
which are also available on the github-pages demo.
Create the tiles with:

```
gdal2tiles.py data/webmap.tif docs/webmap
```

`framework/docs/tiles.md` has a Framework version of the observable notebook: 
[Vermont tiles](https://observablehq.com/@pbogden/vermont-tiles).
