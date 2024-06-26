# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && \
    apt-get install -y git ffmpeg && \
    rm -rf /var/lib/apt/lists/*  # Clean up

# Clone the public repository
RUN git clone https://github.com/Marconi-Lab/radio_mining.git .

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
# CMD ["python", "segment_audio.py"] 
# only one cmd command
# lets run bash instead and run segment audio later
# running bash keeps the container on to be execed into
CMD ["bash"]
