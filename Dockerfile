FROM alpine:3.20
WORKDIR /app
COPY . /app
CMD ["sh", "-c", "echo 'Hello from Jenkins -> Docker -> AWS ECR pipeline' && ls -la"]
