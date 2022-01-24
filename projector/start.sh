#!/bin/bash

config_name="PyCharm"
config_home="/root/.projector/configs/${config_name}"
config_ini_path="$config_home/config.ini"
logfile_path="$config_home/projector.log"


echo projector --accept-license config show $config_name

echo "Rebuilding PyCharm config based on the config file at $config_ini_path"
projector --accept-license config rebuild $config_name

touch $logfile_path
tail -f $logfile_path &


echo "Starting IDE using config $config_name"
projector --accept-license config run $config_name
echo "IDE $config_name was shut down"
