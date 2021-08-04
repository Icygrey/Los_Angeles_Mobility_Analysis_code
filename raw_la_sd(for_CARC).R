# step 1: get the 
#v0_la_sd   (v2.0 version Social Distance)
#v1_la_sd    (v2.1)
library(tidyverse)
library(data.table)
library(SafeGraphR)


#we download data to CARC 
#v2.0 2020 Jan1--May 9
v0_sd_path_20<-"./myLocalDirectory/2020"
v0_sd_file_20<-list.files(v0_sd_path_20,pattern = '.csv.gz',full.name= T,recursive = T)

v0_la_sd<-read_many_patterns(filelist = v0_sd_file_20[1:130],
                           select=c('origin_census_block_group','date_range_start','date_range_end','device_count','candidate_device_count','median_percentage_time_home',
                           'median_home_dwell_time','median_non_home_dwell_time','part_time_work_behavior_devices',
                           'full_time_work_behavior_devices','distance_traveled_from_home','completely_home_device_count')
                           ,gen_fips=FALSE) 
#filter LA
v0_la_sd<-v0_la_sd %>% filter(str_detect(origin_census_block_group,pattern = '^6037'))
#write csv
write.csv(v0_la_sd,file = 'v0_la_sd.csv')
