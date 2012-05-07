## About

Loosely based on the work of Craig. Combing with several other datasets and original research.


## Location values

WARNING: These values are still in flux.

_Ordered best to worst_

**Land office** - For marinas and cargo ports.
**Crane** - If more than one, the central one. For cargo ports.
**Dock** - The area of water between two piers or alongside a pier that receives a ship for loading, unloading, or repairs.
**Pier** - Has a 'dock' on either side. Usually a few in a row.
**Quay** - A wharf or reinforced bank where ships are loaded or unloaded.
**Wharf** - A landing place or pier where ships may tie up and load or unload. Usually singular.
**Marina** - Place for recreational ships to tie up.
**Port**  - A place on a waterway with facilities for loading and unloading ships.
**Harbor** - (Harbour) A sheltered part of a body of water deep enough to provide anchorage for ships.
**Anchorage** - A harbour with no facilities.
**Approximate** - Could be up to 20 miles away from the actual port location. 
More often it's within a mile of the actual location. Accuracy is low due to geocoding 
based on town name, use of DD.DD° or DD.DDDD° format instead of DD.DDDDDD° for latitude 
and longitude values.
**City** - Purely "there's a port in City A, so the port XY gets the longLat of City A, often putting it on land instead of water.

Less useful:

**Jetty** -  1. A structure, such as a pier, that projects into a body of water to influence the current or tide or to protect a harbor or shoreline from storms or erosion. 2. a wharf

Note: some above from [Yahoo! Answers](http://answers.yahoo.com/question/index?qid=20100530145659AAHL8k4) and American Heritage Dictionary

### Type values

1. **[harbor](http://en.wikipedia.org/wiki/Harbor)** (aka harbour or haven) - is a place where ships, boats, and barges can seek shelter through stormy weather, or else are stored for future use. Harbors can be natural or artificial.
1. **[port](http://en.wikipedia.org/wiki/Port)** - A port is a facility for loading and unloading vessels; ports are usually located in harbors.
1. **anchorage** - where a boat or other vessel lies at anchor

### Activity:

1. **cargo port** (bulk, break bulk, container)
1. **cruise terminal**: cruise home port, cruise port of call
1. **fishing port**
1. **recreational**
1. **dry port** - storing ships on land

### Location:

1. **seaport** - on the sea (blue water)
1. **inland** - on a river or large inland body of water (brown water)
1. **warm water** - ice-free year round port in an otherwise winter sea-ice zone

### Construction:

1. **Natural** - can still include later enhancements.
1. **Artificial** - 


## Exporting for Natural Earth

The included shell script:

	export_natural_earth_version.sh
	
can be run as:

	./export_natural_earth_version.sh
	
To create the following files:

	ne_10m_ports.dbf
	ne_10m_ports.prj
	ne_10m_ports.shp
	ne_10m_ports.shx
	
Using the following **ogr2ogr** command (relies on GDAL and OGR being installed and will **overwrite** existing files):

	ogr2ogr -overwrite -sql "SELECT scaleRank as scalerank, 'Port' as featurecla, City as name, WEBSITE as website, natlScale as natlscale FROM XYPorts_CM_Cruse_anchorage_world2_final WHERE natlscale >= 5 ORDER BY natlscale" ne_10m_ports.shp XYPorts_CM_Cruse_anchorage_world2_final.shp
	
Note: 
	
**natlScale** is converted to Natural Earth's modified web map zoom integers (**scaleRank**):

    Conversion from: https://github.com/nvkelso/geo-how-to/wiki/Map-scales---zooms
    Which are slightly differnt than raw web map zooms.
    
	if [natlScale] = 150     then scaleRank = 2    // consistent with web zoom...
	if [natlScale] =  75     then scaleRank = 3    
	if [natlScale] =  50     then scaleRank = 4    // special to natural earth
	if [natlScale] =  30     then scaleRank = 5    // 1 off from web zoom...
	if [natlScale] =  20     then scaleRank = 6
	if [natlScale] =  10     then scaleRank = 7
	if [natlScale] =   5     then scaleRank = 8
	if [natlScale] =   2     then scaleRank = 9
	if [natlScale] =   1     then scaleRank = 10
	if [natlScale] =   0.5   then scaleRank = 11
	if [natlScale] =   0.25  then scaleRank = 12
	if [natlScale] =   0.15  then scaleRank = 13
	if [natlScale] =   0.10  then scaleRank = 14
	if [natlScale] =   0.015 then scaleRank = 16
	if [natlScale] =   0.01  then scaleRank = 18   // mostly back on track
	if [natlScale] =  -1     then scaleRank = 100  // these should be removed


## Metadata

These GIS data files are in Windows-1252 character encoding and in the geographic lat/long projection (WGS84). 

They are from a variety of sources, merged and quality checked by Nathaniel Vaughn KELSO based partly on work by Aaron.


## Requirements 

Only for shell script mentioned above only.

* GDAL/OGR => `1.9`


## Further research:

There are at least another 1500 to add world wide, and another 2000 to merge in for the USA.

Oil platforms:

* Oil platforms in the Gulf of Mexico (USA waters) - http://coastalmap.marine.usgs.gov/GISdata/regional/gomex/mms/platforms/platform_nad83meta.htm and also http://geocommons.com/search?query=tag%3Aplatform
* Pacific coast (USA waters) - [Pacific Coast Platforms](http://www.boemre.gov/ld/Offshore_Cadastre/Pacific/gis/pacific/pc_plat.zip) from [boemre](http://www.boemre.gov/offshore/mapping/pacific.htm)
* North Sea platforms - http://www.cartotalk.com/index.php?showtopic=4666