library(did)
library(dplyr)
library(rgdal)
msas <- readOGR("tl_2019_us_cbsa", layer="tl_2019_us_cbsa")
centroids<-gCentroid(msas, byid=TRUE, id=msas$CBSAFP)
write.csv(x = centroids, file = "./TEST_CENTROIDS.csv")
# manually change the TEST_CENTROIDS file to include lat, lon, and truncated CBSA codes (remove the trailing 0)

