# Layers

The pipeline processes several layers:

## Routes

Marked routes (hiking, cycling, skying, ...)

See `filterpars.txt`

## Power lines

See `filterpars-power.txt`

## POI (tourism points)

See `filterpars-poi.txt`

## Other lines (cut-lines)

See `filterpars-other-lines.txt`

# Not used

There is also a pipeline prepared, but not used, for following:

## Track changes

Process track changes since `curr`. This was used when MapBox updates were not frequent enough to get
track changes published in a preliminary way.
 
See `filterpars-tracks` and `tracks-process.sh`

## All tracks

Experimental to get more detailed track and path data - see `filterpars-tracks` and `tracks-all-process.sh`