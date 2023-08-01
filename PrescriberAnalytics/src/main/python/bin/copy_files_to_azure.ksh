############################################################
# Developed By:                                            #
# Developed Date:                                          # 
# Script Name:                                             #
# PURPOSE: Copy input vendor files from local to HDFS.     #
############################################################
  
# Declare a variable to hold the unix script name.
JOBNAME="copy_files_to_azure.ksh"

#Declare a variable to hold the current date
date=$(date '+%Y-%m-%d_%H:%M:%S')
bucket_subdir_name=$(date '+%Y-%m-%d-%H-%M-%S')

#Define a Log File where logs would be generated
LOGFILE="/home/rohitzidane45/PrescriberAnalytics/src/main/python/logs/${JOBNAME}_${date}.log"

###########################################################################
### COMMENTS: From this point on, all standard output and standard error will
###           be logged in the log file.
###########################################################################
{  # <--- Start of the log file.
echo "${JOBNAME} Started...: $(date)"

### Define Local Directories
LOCAL_OUTPUT_PATH="/home/rohitzidane45/PrescriberAnalytics/src/main/python/output"
LOCAL_CITY_DIR=${LOCAL_OUTPUT_PATH}/dimension_city
LOCAL_FACT_DIR=${LOCAL_OUTPUT_PATH}/fact

### Define SAS URLs
citySasUrl="https://prescpipelineanalytics.blob.core.windows.net/dimension-city/${bucket_subdir_name}?st=2023-07-17T14:36:56Z&se=2023-07-17T22:36:56Z&si=writeaccess&spr=https&sv=2022-11-02&sr=c&sig=uE%2BT9INuc2%2F6KcLxecUJTDRusaUNpnSuoRkwJE6XH6o%3D"
prescSasUrl="https://prescpipelineanalytics.blob.core.windows.net/fact/${bucket_subdir_name}?st=2023-07-17T14:37:52Z&se=2023-07-17T22:37:52Z&si=writeaccess&spr=https&sv=2022-11-02&sr=c&sig=kazr1LVlkYpOJNWKjl8MbKIIlRxW%2BP2zFjDUfOdXudw%3D"

### Push City  and Fact files to Azure.
azcopy copy "${LOCAL_CITY_DIR}/*" "$citySasUrl"
azcopy copy "${LOCAL_FACT_DIR}/*" "$prescSasUrl"

echo "The ${JOBNAME} is Completed...: $(date)"

} > ${LOGFILE} 2>&1  # <--- End of program and end of log.

