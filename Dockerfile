FROM python:3.5

# Remove /bin/sh to avoid: `source` not found
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Copy the project to working dir
COPY ./ /home/gestao-br/

# Change the current working dir
WORKDIR /home/gestao-br/

# Environment setup
RUN pip install virtualenv && \
    virtualenv .env && \
    source .env/bin/activate && \
    pip install -r ./requirements/development.txt

CMD ['source .env/bin/activate']
