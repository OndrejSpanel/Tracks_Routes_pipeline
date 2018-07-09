_Note: This guide assumes you `cd` into directory of this project._

## Installation

`./install.sh`

All working folders will be created in `..`

## Processing

#### Prepare OSM input file

Place your OSM data inside of `../Map` directory.

File should be named like `eu.osm.pbf`:

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.osm.pbf` like this:

`osmium merge --overwrite ../Map/canary-islands-latest.osm.pbf ../Map/europe-latest.osm.pbf -o ../Map/eu.osm.pbf`

#### Process basic layers (routes, powerlines, bus stops...) file

Run:

`./xprocess eu`

Resulting mbtiles will be placed in the folder `eu`: 

- `bus-stops.mbtiles`
- `power-ways.mbtiles`
- `tracks.mbtiles`
- `relations.mbtiles` 

#### Process tracks/paths changes

Convert reference file as `eu-ref.o5m`:

`../bin/osmconvert ../Map/europe-180401.osm.pbf -o="../Map/eu/ref.o5m"`

Link current file `europe-latest.osm.pbf` as `eu/curr.osm.pbf`

Run:

`./tracks-process.sh eu`

Resulting mbtiles in the folder `eu``:

- `changes-tracks.mbtiles`
