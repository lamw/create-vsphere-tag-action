# Github Action for Creating a vSphere Tag

## Description

This Docker Container uses [govc](https://github.com/vmware/govmomi/tree/master/govc) to login to vCenter Server and creates a new vSphere Tag provided a name and the Tag Category.

## Usage

```
workflow "Create vSphere Tag" {
  resolves = ["docker://lamw/create-vsphere-tag"]
  on = "push"
}

action "docker://lamw/create-vsphere-tag" {
  uses = "docker://lamw/create-vsphere-tag"
  secrets = ["GOVC_PASSWORD"]
  env = {
    GOVC_URL = "https://<VMC-VC>/sdk"
    GOVC_USERNAME = "cloudadmin@vmc.local"
    TAG_NAME = "My-Tag"
    TAG_CATEGORY = "github-actions"
  }
}
```

## Secrets

| Variable      | Definition              |
|---------------|-------------------------|
| GOVC_PASSWORD | vCenter Server Password |

## Environmental Variables

| Variable     | Definition                    |
|--------------|-------------------------------|
| GOVC_URL     | vCenter Server URL            |
| GOVC_USERNAME| vCenter Server Username       |
| TAG_NAME     | Name of vSphere Tag to create |
| TAG_CATEGORY | vSphere Tag Category to use   |

## Testing

To ensure the Docker Container will run successfully, you can test locally by building/running the container locally and then specifying the input using the `--env-file` and the name of the file.

Step 1 - Create a file which contains the following variables along with the values from your vSphere environment:

```
GOVC_URL=https://<vcenter>/sdk
GOVC_USERNAME=
GOVC_PASSWORD=
TAG_NAME=MyTag-Name
TAG_CATEGORY=MyTag-Category-Name
```

Step 2 - Run the Container

```
docker run --rm -it --env-file myEnvFile lamw/create-vsphere-tag
```

If the operation was successful, you should see a message like the following:
```
Creating vSphere Tag: foo ...
urn:vmomi:InventoryServiceTag:ae21eadc-1b89-48d5-9134-49b73bcd5e0d:GLOBAL
```

If you head over to your vSphere environment, you should a new vSphere Tag created in your environment.

## License

The Dockerfile and associated scripts and documentation in this project are released under the MIT License.
