# use osgeo/proj base image
FROM dockerhub.dmi.dk/osgeo/proj:latest

# set working directory
WORKDIR /app

RUN apt-get update && apt-get install -y curl

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Setup up PATH for uv
ENV PATH="/root/.local/bin:$PATH"

# Install xpublish-tiles with uv
RUN uv init
RUN uv add xpublish-tiles
RUN uv add aiohttp Pillow
RUN uv add pytest
RUN uv add arraylake

ENTRYPOINT ["uv", "run", "main.py", "--dataset", "zarr:///data.zarr"]