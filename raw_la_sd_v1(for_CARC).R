# step 1: get the 
#v0_la_sd   (v2.0 version Social Distance)
#v1_la_sd    (v2.1)
library(tidyverse)
library(data.table)
library(SafeGraphR)





#we download data to CARC 
#v2.1 2020 May 10----current & 2018,2019
v1_sd_path_20<-"./myLocalDirectory/2020"
v1_sd_file_20<-list.files(v1_sd_path_20,pattern = '.csv.gz',full.name= T,recursive = T)
v1_sd_file_20<-v1_sd_file_20[131:length(v1_sd_file_20)]

v1_sd_path_19<-"./myLocalDirectory/2019"
v1_sd_file_19<-list.files(v1_sd_path_19,pattern = '.csv.gz',full.name= T,recursive = T)

v1_sd_path_21<-"./myLocalDirectory/2021"
v1_sd_file_21<-list.files(v1_sd_path_21,pattern = '.csv.gz',full.name= T,recursive = T)

v1_sd_file<-c(v1_sd_file_19,v1_sd_file_20,v1_sd_file_21)




v1_la_sd<-read_many_patterns(filelist = v1_sd_file,
                             select=c('origin_census_block_group','date_range_start','date_range_end','device_count','candidate_device_count','median_percentage_time_home',
                                      'median_home_dwell_time','mean_home_dwell_time','median_non_home_dwell_time','mean_non_home_dwell_time','part_time_work_behavior_devices',
                                      'full_time_work_behavior_devices','distance_traveled_from_home','mean_distance_traveled_from_home','completely_home_device_count')
                             ,gen_fips=FALSE) 
#filter LA
v1_la_sd<-v1_la_sd %>% filter(str_detect(origin_census_block_group,pattern = '^6037'))
#write csv
write.csv(v1_la_sd,file = 'v1_la_sd.csv')













