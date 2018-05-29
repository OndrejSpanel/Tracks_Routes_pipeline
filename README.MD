#### Prepare OSM input file

Place your input files into `../Map` directory

Files should be named like:

- `eu.osm.pbf`

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.pbf` like this:

`.\osmium merge ..\canary-islands-latest.osm.pbf ..\europe-latest.osm.pbf -o ..\eu.osm.pbf`

#### Process file

`.\gen-process.sh eu`
`.\xtile.sh eu`

## Installation

Following guideline assumes you are working in your home directory

### Install tippecanoe

```
sudo apt install git
sudo apt install build-essential libsqlite3-dev zlib1g-dev
git clone https://github.com/mapbox/tippecanoe
cd tippecanoe
make
cd ..
```

### Install ogr2ogr / GDAL

`sudo apt install gdal-bin`

### Install osmconvert + osmfilter

```
mkdir bin
cd bin
wget -O - http://m.m.i24.cc/osmfilter.c |cc -x c - -O3 -o osmfilter
wget http://m.m.i24.cc/osmconvert64
ln osmconvert64 osmconvert
chmod 0744 osmconvert
cd ..
```

### Clone this repository

`git clone https://github.com/OndrejSpanel/Tracks_Routes_pipeline`

### Create data directory

`mkdir Map`

