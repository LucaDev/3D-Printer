#!/bin/bash

config_namespaces=(
"webcams"
"timelapse"
)

getConfig() {
  curl "http://localhost/server/database/item?namespace=$1" -s | jq -c .result.value | sed 's/\\n/\n/g'  
}


value=$(getConfig "mainsail")

for ns in "${config_namespaces[@]}"
do
  value=`echo $value | jq -c --arg ns "$ns" --argjson nsConf "$(getConfig $ns)" '. + {($ns): $nsConf}'`
done

echo $value > ../../mainsail_backup.json
