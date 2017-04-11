FROM python:3.5

# Remove /bin/sh to avoid: `source` not found
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN cd /tmp/ && \
    curl -OL https://github.com/mozilla/geckodriver/releases/download/v0.15.0/geckodriver-v0.15.0-linux64.tar.gz && \
    tar -zxvf geckodriver-v0.15.0-linux64.tar.gz && \
    chmod +x geckodriver && \
    mv geckodriver /usr/local/bin

# Copy the project to working dir
COPY ./ /home/gestao-br/

# Change the current working dir
WORKDIR /home/gestao-br/

# Environment setup
RUN pip install virtualenv && \
    virtualenv .env && \
    source .env/bin/activate && \
    pip install -U selenium && \
    pip install -r ./requirements/development.txt
