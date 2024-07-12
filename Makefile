png:
#	gdalinfo data/vt.tif  # transverse mercator
	gdalwarp -t_srs EPSG:3857 -r near data/vt.tif data/webmap.tif
	gdalinfo -json data/webmap.tif # `wgs84Extent` has corner coordinates in decimal degrees
	gdal_translate data/webmap.tif data/webmap.png

#tiles:
#	-rm -rf webmap
#	gdal2tiles.py webmap.tif # this produces TMS tiles -- MapLibre doesn't support them
#	gdal2tiles.py --xyz data/webmap.tif # this crashes -- in principle MapLibre should support the output
