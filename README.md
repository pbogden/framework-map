# framework-map

How to put a satellite image on MapLibre with Observable Framework

## image processing

Convert from [GeoTIFF](https://www.earthdata.nasa.gov/esdis/esco/standards-and-practices/geotiff)
to PNG using [GDAL](https://gdal.org/index.html). 
(Note: if you installed geopandas from conda-forge, then you have gdal.)
The final projection must be [Web Mercator](https://en.wikipedia.org/wiki/Web_Mercator_projection).

* `gdalinfo data/vt.tif` -- Our demo file is [transverse mercator](https://en.wikipedia.org/wiki/Transverse_Mercator_projection)
* `gdalwarp -t_srs EPSG:3857 -r near vt.tif webmap.tif` -- convert to Web Mercator
* `gdalinfo -json webmap.tif` -- "wgs84Extent" in the JSON output has corner coordinates in decimal degrees
* `gdal_translate webmap.tif webmap.png` -- convert to PNG

## Observable notebook

* [Vermont](https://observablehq.com/@pbogden/vermont)

## Observable Framework

[Framework](https://observablehq.com/framework/) has great documentation.
See: [getting started](https://observablehq.com/framework/getting-started).

Create a framework project
```
yarn create @observablehq
```

See also...
* [MapLibre GL](https://observablehq.observablehq.cloud/pangea/party/maplibre-gl#12/47.27574/11.39085/0/52) -- Fil demo
* [mcclare.blog](https://mclare.blog/posts/building-oss-map-apps-with-observable-framework/)
* [observable-framework-maps](https://github.com/bdon/observable-framework-maps) -- github
  * [demo](https://bdon.github.io/observable-framework-maps/)
