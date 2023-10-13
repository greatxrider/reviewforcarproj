# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory to /app
WORKDIR /app

# Install pip and Cloudant
RUN python3.8 -m pip install --upgrade pip && \
    pip3.8 install Cloudant && pip3.8 install flask && pip3.8 install gunicorn

# Copy the current directory contents into the container at /app
COPY . /app

# Start Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "reviews:app"]
