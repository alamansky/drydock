# Drydock

The purpose of the drydock project is to facilitate the the construction, testing, and publishing of the Dockerfiles used to generate custom Docker container images for the [composite](https://github.com/Alamansky/composite) collection.

## Use

A single Dockerfile is stitched together from a series of partials stored in the `/dockerfile-partials` directory. Each one is responsible for a different facet of the resulting whole. Partials are concatenated into a single Dockerfile by executing `build-dockerfile.sh`.

Directory structures and files referenced by the image are stored in the `/image` directory.

Use the following command to build an image from a finished Dockerfile

```
docker image build -t alamansky/<image-name>:<tag-name> --build-arg IMAGE_NAME=<image-name> .
```

Append the `--no-cache` option to the command if a remote resource (e.g. a Github repo) has been updated since the image was last built.
