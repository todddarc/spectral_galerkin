FROM gitpod/workspace-full:latest

# system deps
USER root
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
      libopenmpi-dev openmpi-bin \
  && rm -rf /var/lib/apt/lists/*

# switch back to gitpod user
USER gitpod

# python deps
RUN pip3 install --upgrade pip
COPY requirements.txt /workspace/requirements.txt
RUN pip3 install -r /workspace/requirements.txt
