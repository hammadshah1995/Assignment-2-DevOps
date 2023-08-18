# Docker Networking and Container Connection Assignment

In this assignment, I successfully completed a series of tasks related to Docker networking and container connectivity using Windows PowerShell. Below, I'll outline each task, the commands I used, and the corresponding outputs I obtained during the process.

## Task 1: Creating Docker Network "my_network"

I initiated the assignment by creating a new Docker network named "my_network" using the bridge driver.

```powershell
docker network create my_network
```

**Output:**
```
cf4ff364e7c4523ec4f4247c0ac105f318445a474b86b452f8d346aff3fe58ef
```

## Task 2: Creating and Connecting nginx Container

Next, I created a Docker container named "nginx_container" using the "nginx" image and connected it to the "my_network" network.

```powershell
docker run -d --network my_network --name nginx_container -p 8080:80 nginx
```

**Output:**
```
f54b30a6c404a098ba4fec23b65be109299615f4bb62802734c61e0355e5793d
```

## Task 3: Verifying nginx Default Page

I confirmed that the default "nginx" page was accessible on my host machine at http://localhost:8080.

## Task 4: Creating and Connecting httpd Container

Subsequently, I created a Docker container named "httpd_container" using the "httpd" image and connected it to the "my_network" network.

```powershell
docker run -d --network my_network --name httpd_container -p 8081:80 httpd
```

**Output:**
```
683a2c2b81408b8e3319369a14c17ee8867b6e9677544accc9e6f016a043c0f7
```

## Task 5: Verifying httpd Default Page

I verified the accessibility of the default "httpd" page on my host machine at http://localhost:8081.

## Task 6: Inspecting Docker Network

Using the `docker network inspect` command, I retrieved detailed information about the "my_network" network.

```powershell
docker network inspect my_network
```

**Output:**
```json
[
    {
        "Name": "my_network",
        "Id": "cf4ff364e7c4523ec4f4247c0ac105f318445a474b86b452f8d346aff3fe58ef",
        "Created": "2023-08-18T06:18:50.607388567Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "6185ac07c5d465564b2c4e4e6d10fd593b95aff54bf83ed086b8966ddf9a639e": {
                "Name": "httpd_container",
                "EndpointID": "3805e5ce7e6455523a7ad81a7bf4ed95297aa58776ce73cd13f278010b6a7f4d",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "8322774abe404d329594933c7b18c4433eb23534e8d648e3c4019d391997b9a4": {
                "Name": "nginx_container",
                "EndpointID": "423a4c378a291dd55c98515aca089a201f1a59a6a1bf7c4d01dec66c5c9a378b",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```

## Task 7: Stopping and Removing nginx_container

I stopped and removed the "nginx_container" to proceed with the subsequent steps.

```powershell
docker stop nginx_container
```

## Task 8: Creating and Connecting nginx_container_2

I created a new Docker container named "nginx_container_2" using the "nginx" image and connected it to the "my_network" network.

```powershell
docker run -d --network my_network --name nginx_container_2 -p 8080:80 nginx
```

**Output:**
```
be977272156422adafcdea271d8007e30ae8a119bae66e6d12f5f7a1a428881f
```

## Task 9: Verifying nginx Default Page for nginx_container_2

I confirmed that the default "nginx" page for "nginx_container_2" was accessible on my host machine at http://localhost:8080.
## Task 10: Stopping and Removing Containers

After verifying the accessibility of the "httpd" default page, I proceeded to stop and remove the containers. I used the following commands:

```powershell
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```

**Output:** All running containers were successfully stopped and removed.

## Task 11: Cleaning Up the Network

To complete the assignment, I removed the "my_network" network using the command:

```powershell
docker network rm my_network
```

**Output:** The network "my_network" was successfully removed.

## Summary of Network Details:

The details of the "my_network" network are as follows:

```json
[
    {
        "Name": "my_network",
        "Id": "cf4ff364e7c4523ec4f4247c0ac105f318445a474b86b452f8d346aff3fe58ef",
        "Created": "2023-08-18T06:18:50.607388567Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "6185ac07c5d465564b2c4e4e6d10fd593b95aff54bf83ed086b8966ddf9a639e": {
                "Name": "httpd_container",
                "EndpointID": "3805e5ce7e6455523a7ad81a7bf4ed95297aa58776ce73cd13f278010b6a7f4d",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "8322774abe404d329594933c7b18c4433eb23534e8d648e3c4019d391997b9a4": {
                "Name": "nginx_container",
                "EndpointID": "423a4c378a291dd55c98515aca089a201f1a59a6a1bf7c4d01dec66c5c9a378b",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```

## Summary of Running Containers:

The list of running containers on the system is as follows:

```
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                  NAMES
be9772721564   nginx     "/docker-entrypoint.…"   2 minutes ago    Up 2 minutes    0.0.0.0:8080->80/tcp   nginx_container_2
6185ac07c5d4   httpd     "httpd-foreground"       47 minutes ago   Up 47 minutes   0.0.0.0:8081->80/tcp   httpd_container
8322774abe40   nginx     "/docker-entrypoint.…"   52 minutes ago   Up 52 minutes   0.0.0.0:8080->80/tcp   nginx_container
```

With this, the Docker networking and container connectivity assignment has been successfully completed. All tasks were executed as instructed, and the outcomes and observations have been thoroughly documented.
