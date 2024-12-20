deploy:
	cd framework; yarn build
	cp -r framework/dist/* docs

# Generate a PNG to add as a layer on a web map
png:
#	gdalinfo data/vt.tif  # transverse mercator
	gdalwarp -t_srs EPSG:3857 -r near data/vt.tif data/webmap.tif # converts to web Mercator
	gdalinfo -json data/webmap.tif # `wgs84Extent` has corner coordinates in decimal degrees
	gdal_translate data/webmap.tif data/webmap.png # use the png for the map layer

# Create map tiles (another small data solution) for use as a layer in a web map
# Demo: https://observablehq.com/@pbogden/vermont-tiles
tiles:
	gdal2tiles.py data/webmap.tif docs/webmap # this produces TMS tiles -- set scheme to "tms" for MapLibre
#	gdal2tile#.py --xyz data/webmap.tif docs/webmap # MapLibre should support the output by default, but it crashes
