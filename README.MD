#### Prepare OSM input file

File should be named like:

- eu.osm.pbf

Rename `europe-latest.osm.pbf` to `eu.osm.pbf` or use `osmium merge` to create `eu.pbf` like this:

`.\osmium merge ..\canary-islands-latest.osm.pbf ..\europe-latest.osm.pbf -o ..\eu.osm.pbf`

#### Process file

`.\gen-process.ps1 eu`

#### Create mbtiles in Ubuntu

.\xtile eu
