#!/bin/bash

ogr2ogr -overwrite -sql "SELECT scaleRank as scalerank, 'Port' as featurecla, City as name, WEBSITE as website, natlScale as natlscale FROM XYPorts_CM_Cruse_anchorage_world2_final WHERE natlscale >= 5 ORDER BY natlscale" ne_10m_ports.shp XYPorts_CM_Cruse_anchorage_world2_final.shp