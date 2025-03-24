# Use the official Eclipse Mosquitto image as a base
FROM eclipse-mosquitto:2.0

# Copy custom configuration files
COPY config/mosquitto.conf /mosquitto/config/mosquitto.conf

# Create folders for data and logs (optional if you want a clean base)
RUN mkdir -p /mosquitto/data /mosquitto/log

# (Optional) Set permissions if needed
# RUN chown -R mosquitto:mosquitto /mosquitto

# Expose ports
EXPOSE 1883
EXPOSE 9001
