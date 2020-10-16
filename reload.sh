#!/bin/bash

reload=$(qlik reload create --appId d7340cb6-35ed-45ef-a768-3a12f22a519d | jq -r '.id')

boolresult=$true

while [ $boolresult = $true ]; do
        reloadstatus=$(qlik reload get ${reload} | jq -r '.status')
        echo ${reloadstatus}
        sleep 3
        if [ "$reloadstatus" == "SUCCEEDED" ] || [ "$reloadstatus" == "FAILED" ];
        then
        echo "I should be done"
          boolresult=$false
          break;
        else
        echo "I'm here"
        echo ${reloadstatus}
        fi

done