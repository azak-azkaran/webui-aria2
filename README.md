# WebUI-Aria2


![Main interface](/screenshots/overview.png?raw=true)

The aim for this project is to create the worlds best and hottest interface to interact with aria2. aria2 is the worlds best file downloader, but sometimes the command line brings more power than necessary. The project was initially created as part of the GSOC scheme, however it has rapidly grown and changed with tremendous support and feedback from the aria2 community.

The program is divided into the webui container and the aria2 container.
Both can be started by using docker-compose:
``` bash
docker-compose up -d
```

The containers can be found at [dockerhub](https://hub.docker.com/r/azakazkaran/webui-aria2)

# Configuration

Read and edit [configuration.js](src/js/services/configuration.js).

# Dependencies

Well, you need aria2. And a web browser (if that even counts!)

# For testing purpose

You can also try or use webui-aria2 in your LAN inside a Docker sandbox.

Build the image

```bash
sudo docker build -t yourname/webui-aria2 .
```

..and run it! It will be available at: `http://localhost:9100`

```bash
sudo docker run -v /Downloads:/data -p 6800:6800 -p 9100:8080 --name="webui-aria2" yourname/webui-aria2
```

`/Downloads` is the directory in the host where you want to keep the downloaded files

# Contributing

WebUI-Aria2 is an Angular JS 1.x application bundled with webpack. Follow the [Get Started Guide](#get-started) to setup the development environment. You'll need `Node > 6` and latest version of `npm` to build the source files.

## Get Started

To start developing an awesome feature or to fix a bug [fork and clone the repo](https://help.github.com/articles/fork-a-repo/) and then install Node.js > 6 and npm.

Next, install this package's dependencies with npm using `npm install` command.

Then run `npm run dev` command to start an HTTP development server on http://localhost:8888 and to watch and compile the source files.

Use `npm run build` to create a production ready build from source files.

## Useful commands

| Command                   | Purpose                                                                                                   |
| ------------------------- | --------------------------------------------------------------------------------------------------------- |
| `npm install`             | will install required dependencies                                                                        |
| `npm run dev`             | will start an HTTP dev server on http://localhost:8888 and will watch and compile the source files        |
| `npm run build`           | will create a production build from source files                                                          |
| `npm run analyze`         | will open a bundle analyzer on port http://localhost:9999. Useful for visualizing contents of your bundle |
| `npm run format --silent` | will format your code for consistency using Prettier                                                      |

# Support

For any support, feature request and bug report add an issue in the [original](https://github.com/ziahamza/webui-aria2/issues) github project or in [my](https://github.com/azak-azkaran/webui-aria2) github project.

# License

Refer to the LICENSE file (MIT License). If the more liberal license is needed then add it as an issue
