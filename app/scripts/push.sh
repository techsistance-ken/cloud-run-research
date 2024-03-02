if [[ -z "$GCP_SAVED_LOCATION" ]]; then
    echo "Need to set GCP_SAVED_LOCATION"
    exit 1
fi

echo "Enter Tag or Version"
read ver


push=$(docker push $GCP_SAVED_LOCATION:$ver)

echo $push

