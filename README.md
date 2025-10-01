


```bash

podman build -t xpub-danra:latest .

podman run --rm -it \
  -v /dmidata/projects/cloudphysics/danra/data/v0.5.0/single_levels.zarr/:/data.zarr:ro \
  -p 8080:8080 \
  xpub-danra:latest
  

```