## Installation

`sudo ./install.sh`

All working folders will be created in `..`

## Processing

#### Prepare OSM input file

Place your OSM data inside of `../Map` directory.

Files should be named like:

- `eu.osm.pbf`

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.pbf` like this:

`.\osmium merge ..\canary-islands-latest.osm.pbf ..\europe-latest.osm.pbf -o ..\eu.osm.pbf`

#### Process file

`.\gen-process.sh eu`
`.\xtip.sh eu`

