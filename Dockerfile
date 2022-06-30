FROM python:3-bullseye

WORKDIR /app

RUN pip install vt-py keyring requests
RUN apt update  && apt install git
RUN git clone https://github.com/vmsv/vti_search.git 
RUN ln -s ./vti_search/vti_search.py vti_search.py

# just run it like
# docker run -e VT_API_KEY='YOUR_KEY' -it vti-search /bin/bash for an interactive run

# For a batch run here is an example
# docker run -e VT_API_KEY='<YOUR KEY>' -v $PWD/downloads/:/app/downloads/ vti-search bash -c "python3 vti_search.py -q 'type:msoffice fs:2022-06-30+ p:5+ (tag:exploit or tag:macros)'"