import geopandas as gpd
import pandas as pd

import matplotlib.pyplot as plt

# change the global options that Geopandas inherits from
pd.set_option('display.max_columns',None)

gdf = gpd.read_file("data/Shape/NHDFlowline.shp")

print(gdf.columns)
print(gdf.head())

# Plot the shapefile
gdf.plot()
plt.savefig('nhd.png')
plt.show()
