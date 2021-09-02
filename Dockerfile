# set base image (host OS)
FROM python:3.8

RUN pip install flask
RUN pip install flask_restful

#ADD python.py /python.py

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY src/ .
EXPOSE 80

# command to run on container start
CMD [ "python", "./server.py" ]
