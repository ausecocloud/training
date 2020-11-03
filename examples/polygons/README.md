# Polygons - README

## Introduction

In this folder you will find some polygon files in `*.wkt` format.

The `well known text` (wkt) is a standard format used in [Shapely](https://shapely.readthedocs.io/en/stable/manual.html) to store text files representing geometry objects.

Use these files to run Polygon region selections in SilverEye.

## How-to

Create `data/polygons` folders (in your ecoCloud Jupyter instance) to download polygon files there.

Execute the following sample code to download a polygon file, available from this Github repository, on the left.

```python
import requests

geom_file = "covid19.wkt"  # choose the geometry file

# set source and destination paths
src_path = "https://raw.githubusercontent.com/ausecocloud/training/master/examples/polygons"
dest_path = "data/polygons"

# get the source file
url = "{}/{}".format(src_path, geom_file)
r = requests.get(url, allow_redirects=True)

# store the destination file
dest_file = "{}/{}".format(dest_path, geom_file)
open(dest_file, 'wb').write(r.content)
```
