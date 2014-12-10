VirtualBox Inside Docker
========================

This projet should allow any user to successfully install VirtualBox inside a docker container allowing you to intall any OS virtually inside a virtual containers! Sounds cool right?

Usage
-----

To use this image, you must install and load the Virtualbox driver on the
host, and mount /dev/vboxdrv to the container.

Example:

```
docker run -v /dev/vboxdrv:/dev/vboxdrv --name=vbox vboxinsidedocker
```
