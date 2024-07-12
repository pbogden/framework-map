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
gdalwarp -t_srs EPSG:3857 -r near vt.tif webmap.tif
```
Get coorner coordinates in decimal degrees from "wgs84Extent" in the JSON output
```
gdalinfo -json webmap.tif
```
Convert to PNG
```
gdal_translate webmap.tif webmap.png
```

## Observable notebook

* [Vermont](https://observablehq.com/@pbogden/vermont)

## Observable Framework

[Framework](https://observablehq.com/framework/) has great documentation.
See: [getting started](https://observablehq.com/framework/getting-started).

The file `hello-framework/docs/map.md` has a Framework version of the observable notebook.

To deploy on github pages from `./docs`
```
mkdir docs
touch docs/.nojekyll
cd hello-framework
yarn build
cp -r dist/* ../docs
```
The site is here: https://pbogden.github.io/framework-map/

See also...
* [MapLibre GL](https://observablehq.observablehq.cloud/pangea/party/maplibre-gl#12/47.27574/11.39085/0/52) -- Fil demo
* [mcclare.blog](https://mclare.blog/posts/building-oss-map-apps-with-observable-framework/)
* [observable-framework-maps](https://github.com/bdon/observable-framework-maps) -- github
  * [demo](https://bdon.github.io/observable-framework-maps/)
