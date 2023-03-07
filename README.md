dockerized-z-way
================

Run Z-Way as a Docker container.

----------

### Start Z-Way with docker compose:

      version: "3"

      services:
         z-way:
            container_name: z-way
            build: https://github.com/dariusaurius/dockerized-z-way_rpi-cm4.git
            image: z-way:latest
            expose:
               - 8083
            ports:
               - 8083:8083
            volumes:
               - z-way-config:/opt/z-way-server/config
               - z-way-automation-storage:/opt/z-way-server/automation/storage
               - z-way-htdocs-smarthome-user:/opt/z-way-server/htdocs/smarthome/user
               - z-way-zddx:/opt/z-way-server/ZDDX
            devices:
               - '/dev/ttyAMA0:/dev/ttyAMA0'
            restart: unless-stopped

      volumes:
         z-way-config:
         z-way-automation-storage:
         z-way-htdocs-smarthome-user:
         z-way-zddx:


----------


### Backup and restore Z-Way with docker compose:

      version: "3"

      services:
         z-way-backup:
            container_name: z-way-backup
            build: https://github.com/dariusaurius/dockerized-z-way_rpi-cm4.git#:backup
            image: z-way-backup:latest
            volumes:
               - z-way-config:/opt/z-way-server/config
               - z-way-automation-storage:/opt/z-way-server/automation/storage
               - z-way-htdocs-smarthome-user:/opt/z-way-server/htdocs/smarthome/user
               - z-way-zddx:/opt/z-way-server/ZDDX
               - ./z-way-backup:/opt/z-way-backup

         z-way-restore:
            container_name: z-way-restore
            build: https://github.com/dariusaurius/dockerized-z-way_rpi-cm4.git#:restore
            image: z-way-restore:latest
            volumes:
               - z-way-config:/opt/z-way-server/config
               - z-way-automation-storage:/opt/z-way-server/automation/storage
               - z-way-htdocs-smarthome-user:/opt/z-way-server/htdocs/smarthome/user
               - z-way-zddx:/opt/z-way-server/ZDDX
               - ./z-way-backup:/opt/z-way-backup

      volumes:
         z-way-config:
         z-way-automation-storage:
         z-way-htdocs-smarthome-user:
         z-way-zddx:
