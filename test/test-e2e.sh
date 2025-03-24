#!/bin/bash

printf "🚀 Running E2E test for Mosquitto...\n"

# Start subscriber in background
mosquitto_sub -h mosquitto -p 1883 -t test/e2e -C 1 > /tmp/received.txt &
SUB_PID=$!

# Give the subscriber a moment to start
sleep 1

# Publish message
TEST_MSG="Hello Mosquitto MQTT from E2E test"
mosquitto_pub -h mosquitto -p 1883 -t test/e2e -m "$TEST_MSG"

# Wait for subscriber to finish
wait $SUB_PID

RECEIVED=$(cat /tmp/received.txt)

if [ "$RECEIVED" == "$TEST_MSG" ]; then
  printf "✅ Mosquitto E2E test passed: Message received correctly\n"
  exit 0
else
  printf "❌ Mosquitto E2E test failed: Expected '{TEST_MSG}', but got '{RECEIVED}'\n"
  exit 1
fi
