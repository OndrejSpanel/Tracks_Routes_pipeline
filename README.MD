_Note: This guide assumes you `cd` into directory of this project._

## Installation

`./install.sh`

All working folders will be created in `..`

## Processing

#### Prepare OSM input file

Place your OSM data inside of `../Map` directory.

File should be named like `eu.osm.pbf`:

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.pbf` like this:

`osmium merge --overwrite ../Map/canary-islands-latest.osm.pbf ../Map/europe-latest.osm.pbf -o ../Map/eu.osm.pbf`

#### Process basic layers (routes, powerlines, bus stops...) file

Run:

`./gen-process.sh eu`
`./xtip.sh eu`

Resulting mbtiles: 

- `eu-bus-stops.mbtiles`
- `eu-power-ways.mbtiles`
- `eu-tracks.mbtiles`
- `eu-relations.mbtiles` 

#### Process tracks/paths changes

Convert reference file as `eu-ref.o5m`:

`../bin/osmconvert ../Map/europe-180401.osm.pbf -o="../Map/eu-ref.o5m"`

Link curent file `europe-latest.osm.pbf` as `eu-curr.osm.pbf`

Run:

`./tracks-process.sh eu`

Resulting mbtiles:

- `eu-changes-tracks.mbtiles`
