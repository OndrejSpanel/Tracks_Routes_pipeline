## Installation

`./install.sh`

All working folders will be created in `..`

## Processing

#### Prepare OSM input file

Place your OSM data inside of `../Map` directory.

File should be named like:

- `eu.osm.pbf`


#### Process basic layers (routes, powerlines, bus stops...) file

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.pbf` like this:

`.\osmium merge ..\canary-islands-latest.osm.pbf ..\europe-latest.osm.pbf -o ..\eu.osm.pbf`

Run:

`.\gen-process.sh eu`
`.\xtip.sh eu`

Resulting mbtiles: 

- `eu-bus-stops.mbtiles`
- `eu-power-ways.mbtiles`
- `eu-tracks.mbtiles`
- `eu-relations.mbtiles` 

#### Process tracks/paths changes

Convert refrerence file as `eu-ref.o5m`:

`../bin/osmconvert ../Map/czech-republic-180401.osm.pbf -o="../Map/cz-ref.o5m"`

Run:

`./tracks-process.sh eu`

Resulting mbtiles:

- `eu-changes-tracks.mbtiles`
