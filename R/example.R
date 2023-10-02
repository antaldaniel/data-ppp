
"https://registry.sdmx.org/sdmx/v2/structure/codelist/ESTAT/CL_AREA/1.8"

cl_area_root <- "urn:sdmx:org.sdmx.infomodel.codelist.Code=ESTAT:CL_AREA(1.8)."

obs_status_root <- "urn:sdmx:org.sdmx.infomodel.codelist.Code=SDMX:CL_OBS_STATUS(2.2)."

GDP = "https://elsst.cessda.eu/id/4/7348c6ec-5293-4ea2-9c3d-e1b61e211b01"


?eurostat::get_eurostat
library(dplyr)
gdp_dataset <- eurostat::get_eurostat(id = "naida_10_gdp", 
                       filters = list (geo = c("LI", "AD", "SM"))) %>%
  filter ( time > as.Date("2015-12-31"), 
           time < as.Date("2020-12-31")) %>%
  filter ( na_item %in% c("B1GQ", "P6"), 
           unit == "CP_MEUR") %>%
  mutate ( obs_status  = ifelse (is.na(.data$values), "O", "A")) %>%
  mutate ( id = 1:nrow(.)) %>%
  select ( id, time, geo, values, obs_status, na_item, unit )

data.frame ( gdp = )