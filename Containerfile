# use osgeo/proj base image
FROM dockerhub.dmi.dk/osgeo/proj:latest

# set working directory
WORKDIR /app

COPY pyproject.toml .
COPY main.py .

RUN apt-get update && apt-get install -y curl

# Install uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Setup up PATH for uv
ENV PATH="/root/.local/bin:$PATH"

RUN uv venv
RUN uv sync

ENTRYPOINT ["uv", "run", "python", "main.py", "--dataset", "zarr:///data.zarr"]