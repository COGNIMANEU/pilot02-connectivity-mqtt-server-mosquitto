# Pilot02 Connectivity Mosquitto MQTT Broker

This repository contains a docker based version of the Mosquitto MQTT Broker.

See https://github.com/eclipse-mosquitto/mosquitto or https://mosquitto.org/ for more details about the broker.

## Description

The repository includes the following components:
- Configuration file 
- Docker setup for easy containerization
- A Docker Compose-based test environment to verify end-to-end functionality

## Guidelines for build and test the component 

### 1. **Build the Main Docker Image:**

In this step, we build the Docker image using the provided `Dockerfile`. The image is named `pilot02-connectivity-mqtt-server-mosquitto`.

```bash
docker build -t pilot02-connectivity-mqtt-server-mosquitto .
```
Make sure the path to your configuration file is correctly mapped to the Docker container.

### 2. **Run the ROS 2 Container:**

After building the Docker image, you can run the container using the following command:

```bash
docker run pilot02-connectivity-mqtt-server-mosquitto
```

This will start the container and launch the MQTT Broker with the configuration given.

### 3. **Build and Run the test automation:**

Test automation is integrated by docker-compose file:

Run: 
```bash
docker-compose up --build
```

In case broker is working, you should see:
```python
 ✔ Container mosquitto                                                    Created                                  0.0s
 ✔ Container pilot02-connectivity-mqtt-server-mosquitto-mosquitto-test-1  Created                                  0.0s
Attaching to mosquitto, mosquitto-test-1
mosquitto-test-1  | 🚀 Running E2E test for Mosquitto...
mosquitto-test-1  | ✅ Mosquitto E2E test passed: Message received correctly
```

## Broker configuration

Include your broker configuration:

```conf
persistence true
persistence_location /mosquitto/data/

log_dest file /mosquitto/log/mosquitto.log

user mosquitto
listener 1883
protocol mqtt

listener 9001
protocol websockets
allow_anonymous true
```

See the guide at https://mosquitto.org/man/mosquitto-conf-5.html to extend proposed configuration.

## Contributing

Feel free to open issues or submit pull requests. Contributions are welcome!

## License

This project is licensed under Eclipse Public License - v2.0 - see the [LICENSE](LICENSE) file for details.