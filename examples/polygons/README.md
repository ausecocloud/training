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

geom_file = "covid19.wkt"
git_path = "https://raw.githubusercontent.com/ausecocloud/training/master/examples/polygons"
url = "{}/{}".format(git_path, geom_file)
r = requests.get(url, allow_redirects=True)
open('data/polygons/covid19.wkt', 'wb').write(r.content)
```
