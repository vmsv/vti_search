FROM python:3-bullseye

WORKDIR /app

RUN pip install vt-py keyring requests
RUN apt update  && apt install git
RUN git clone https://github.com/vmsv/vti_search.git 
RUN ln -s ./vti_search/vti_search.py vti_search.py

COPY . . 
