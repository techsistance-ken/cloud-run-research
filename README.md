# Cloud Run Research

## App Folder
 
A simple express NODE.JS app to containorize and deploy.


Example Docker Build Command:
```
docker build -t $dkr . --platform linux/amd64
```
In this example $dkr was a variable I set equal the GCP location.  

Format:

`[region]-docker.pkg.dev/[project-id]/[repo-id]/[image-name]:[tag]`

Example:
`us-central1-docker.pkg.dev/iac-test-random-pet/micro1/iac-test:0.0.0`


> Remember:  Since I'm on a mac to include the `docker build -t $dkr . --platform linux/amd64` we need to add the platform arguement

## iac folder

Setting up a project that I can recreate and destroy quickly.  I want to minimize costs by making sure when I'm done I can destroy everything. 

## iac-run folder

I was messing around with deploying the cloud run app separately.  Not really used.  