# Cloud Functions API

In this sample, you will create an API with API Gateway where each path is
handled by a different Cloud Function.

## Cloud Functions

We'll deploy two simple functions defined in [index.js](index.js):

```nodejs
exports.helloWorld = (req, res) => {
    res.send('Hello, World');
};

exports.byeWorld = (req, res) => {
    res.send('Bye, World');
};
```

Deploy both functions:

```sh
./1_deploy_functions.sh
```

## API Gateway

### Create an API

Enable required services for API Gateway and create a `greeter-api` API:

```sh
./2_create_api.sh
```

### Create an API config

Create an API config using the OpenAPI spec to define which path goes to which
function.

We'll use [openapi2-functions.yaml](openapi2-functions.yaml) as a starter but replace `REGION` and
`PROJECT_ID` with real values. This definition routes `/greeter/hello` to the
hello function and `/greeter/bye` to the bye function.

```sh
./3_create_api_config.sh
```

### Create a gateway

The final step is to deploy the API config to a gateway:

```sh
./4_create_gateway.sh
```

## Test

To test the API, first fetch the default host name of the gateway and then make
a call with `/greeter/hello` and `/greeter/bye` paths:

```sh
./5_test_gateway.sh
```

You should see something similar:

```sh
# Test hello
curl https://greeter-gateway-5abbajef.ew.gateway.dev/greeter/hello
Hello, World
# Test bye
curl https://greeter-gateway-5abbajef.ew.gateway.dev/greeter/bye
Bye, World%
```
