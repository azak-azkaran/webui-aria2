# This declares a job named "docs". There can be exactly one
# job declaration per job file.
job "docs" {
  # Run this job as a "service" type. Each job type has different
  # properties. See the documentation below for more examples.
  type = "service"

  # Specify this job to have rolling updates, two-at-a-time, with
  # 30 second intervals.
  # update {
  #   stagger      = "30s"
  #   max_parallel = 1
  # }

  # A group defines a series of tasks that should be co-located
  # on the same client (host). All tasks within a group will be
  # placed on the same host.
  # group "webs" {
  #   # Specify the number of these tasks we want.
  #   count = 5

    # Create an individual task (unit of work). This particular
    # task utilizes a Docker container to front a web application.
    task "aria2" {
      driver = "docker"
      config {
        image = "azakazkaran/aria2:latest"
        labels {
         group = "aria2"
        }
        volumes = [
            "~/Downloads/:/downloads",
        ]
      }
      env {
        "CONCURRENT_DOWNLOADS"="4"
        "CONNECTIONS_PER_SERVER"="4"
        "SPLIT"="4"
        "AUTO_FILE_RENAMING"="false"
        "SAVE_SESSION_INTERVAL"="10"
        "LOG"="-"
      }
      resources {
        cpu    = 200 # MHz
        memory = 128 # MB

        network {
          mode = "bridge"
          mbits = 100
          port "aria" {
            static = 6800
            to     = 6800
          }
        }
      }
    }
    task "webui" {
      driver = "docker"
      config {
        image = "azakazkaran/webui-aria2:latest"
        labels {
         group = "aria2"
        }
      }
      resources {
        cpu    = 200 # MHz
        memory = 128 # MB

        network {
          mbits = 100
          port "http" {}
          }
        }
      }
    }
  }
}
