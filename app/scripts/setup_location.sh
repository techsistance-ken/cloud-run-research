#!/bin/bash
# Ask the user for their name
# gcloud artifacts docker images delete $in_region-docker.pkg.dev/$in_project/$in_repo/$in_image

for ARGUMENT in "$@"
do
   KEY=$(echo $ARGUMENT | cut -f1 -d=)

   KEY_LENGTH=${#KEY}
   VALUE="${ARGUMENT:$KEY_LENGTH+1}"

   export "$KEY"="$VALUE"
done

if [[ -n "$GCP_SAVED_LOCATION" ]]; then
   echo "Saved Location: $GCP_SAVED_LOCATION"
   echo "Use This? (Y/n)"
   read usesaved
   if [[ -z "$usesaved" ]]; then
     usesaved="y"
   fi

fi

if [[ $usesaved != "y" ]]; then
    if [[ -z "$proj" ]]; then
        echo Project ID?
        read proj
    fi

    if [[ -z "$region" ]]; then
        echo 'Region (us-central1)?'
        read region 
        if [[ -z "$region" ]]; then
        region="us-central1"
        fi
    fi

    if [[ -z "$repo" ]]; then
        echo "Repo?"
        read repo 
    fi

    if [[ -z "$image" ]]; then
        echo "Image?"
        read image 
    fi
    loc="$region-docker.pkg.dev/$proj/$repo/$image"

else
    loc=$GCP_SAVED_LOCATION
fi

export GCP_SAVED_LOCATION=$loc
echo "Use Command: export GCP_SAVED_LOCATION=$loc"
