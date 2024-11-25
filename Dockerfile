# Use Miniconda as the base image
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Ensure the environment is activated every time
SHELL ["conda", "run", "-n", "komal", "/bin/bash", "-c"]

# Install any needed packages in the existing `komal` environment
RUN conda run -n komal pip install --no-cache-dir -r requirements.txt

# Expose the port the app runs on
EXPOSE 5005

# Define environment variable to avoid python buffering
ENV PYTHONUNBUFFERED 1

# Run the application with the `komal` environment activated
CMD ["conda", "run", "-n", "komal", "python", "application.py"]
