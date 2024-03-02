if [[ -z "$GCP_SAVED_LOCATION" ]]; then
    echo "Need to set GCP_SAVED_LOCATION"
    exit 1
fi

# echo "Enter Tag or Version"
# read ver


image=$(echo $GCP_SAVED_LOCATION |cut -d/ -f 4)
repo=$(echo $GCP_SAVED_LOCATION |cut -d/ -f 3)
proj=$(echo $GCP_SAVED_LOCATION |cut -d/ -f 2)
regdocker=$(echo $GCP_SAVED_LOCATION |cut -d/ -f 1)

echo $regdocker
reg1=$(echo $regdocker |cut -d- -f 1)
reg2=$(echo $regdocker |cut -d- -f 2)
reg="$reg1-$reg2"




# echo $image
# echo $repo
# echo $proj
# echo "$reg1-$reg2"

gcloud artifacts docker images delete "$regdocker/$proj/$repo/$image"

