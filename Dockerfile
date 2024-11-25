# Use an official Miniconda image as a base
FROM continuumio/miniconda3:4.12.0

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Create a new conda environment and install dependencies
RUN conda init bash && \
    /bin/bash -c "conda create -n app-env python=3.8 -y" && \
    /bin/bash -c "source activate app-env && pip install -r requirements.txt"

# Expose the port the app runs on
EXPOSE 5005

# Define environment variable to ensure Python output is unbuffered
ENV PYTHONUNBUFFERED=1

# Activate the environment and run the application
CMD ["bash", "-c", "source activate app-env && python application.py"]
