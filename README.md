


```bash

podman build -t xpub-danra:latest .

podman run --rm -it \
  -v /dmidata/projects/cloudphysics/danra/data/v0.5.0/single_levels.zarr/:/data.zarr:ro \
  -p 8080:8080 \
  xpub-danra:latest
  

# backend 
docker run --rm -it -v /tmp/dini-recent/single_levels.zarr/:/data.zarr:ro --name xpub-dini -p 8080:8080 xpub-dini:latest

# frontend
sudo python3 -c "import http.server, socketserver; http.server.SimpleHTTPRequestHandler.extensions_map[''] = 'text/html'; http.server.SimpleHTTPRequestHandler.directory='.'; socketserver.TCPServer(('',80), http.server.SimpleHTTPRequestHandler).serve_forever()"



```
