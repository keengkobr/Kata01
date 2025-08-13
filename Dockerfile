# Define the base image to use.
FROM alpine

# Set the working directory.
WORKDIR /home/kobr

# Install Python.
RUN apk add python3

# Copy our source code.
COPY backend.py backend.py
COPY index.html index.html

# Create a non-root user with no password (-D).
RUN adduser -D kobr -h /home/kobr

# Set permissions.
RUN chown -R kobr:kobr /home/kobr

# Switch to a non-root user.
USER kobr

# Identify what TCP port will be used by our server.
EXPOSE 8000

# Start the server.
CMD ["python", "backend.py"]