FROM ubuntu:20.04

# Install bash (if not already included)
RUN apt-get update && apt-get install -y bash

# Add the shell script to the container
COPY script.sh /script.sh

# Make the script executable
RUN chmod +x /script.sh

# Run the script
CMD ["/script.sh"]
