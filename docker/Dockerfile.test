# Stage 1: Build Node.js application
FROM node:16.13.0 AS build

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app
RUN npm install

COPY . /usr/src/app
RUN npm run build -y


# Stage 2: Set up Python environment
FROM python:3.8.10 AS python

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY setup.py /usr/src/app
COPY README.md /usr/src/app
COPY Rockwell.egg-info /usr/src/app
RUN pip install -e .

RUN apt-get update && apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

# Stage 3: Final image with both frontend (Node.js/Nginx) and backend (Python/Supervisor)
FROM nginx:alpine

# Copy the build of the Node.js app from the build stage
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Set up Supervisor to manage both Nginx (for the frontend) and the Python app (backend)
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy Python app files
COPY --from=python /usr/src/app /usr/src/app

# Expose the ports for Nginx and your Python app (assuming Python app runs on port 8000)
EXPOSE 80 8000

# Start both Nginx and Python app using Supervisor
CMD ["/usr/bin/supervisord"]


