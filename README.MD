_Note: This guide assumes you `cd` into directory of this project._

## Prerequisites

Tested with Ubuntu 18.04 LTS Linux Subsystem for Windows 

## Installation

`./install.sh`

All working folders will be created in `..`

## Processing

#### Prepare OSM input file

Place your OSM data inside of `../Map` directory.

File should be named like `eu.osm.pbf`:

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.osm.pbf` like this:

`./merge.sh eu canary-islands europe`

#### Process basic layers (routes, powerlines, bus stops...) file

Run:

`./xprocess.sh eu`

Resulting mbtiles will be placed in the folder `eu`: 

- `poi.mbtiles`
- `power-ways.mbtiles`
- `relations.mbtiles` 

#### Process tracks/paths changes

Convert reference file as `eu-ref.o5m`:

`./ref-define.sh` eu ../Map/europe-180501.osm.pbf

Link current file `europe-latest.osm.pbf` as `eu/curr.osm.pbf`

Run:

`./tracks-process.sh eu`

Resulting mbtiles in the folder `eu``:

- `changes-tracks.mbtiles`
