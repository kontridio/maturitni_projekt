# Use the official Python image as a base image
FROM python:3.11.7

# Set the working directory in the container
WORKDIR /website

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Copy the content of the local src directory to the working directory
COPY . /website

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Specify the command to run on container start
CMD ["python", "run.py"]
