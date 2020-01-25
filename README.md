# Docker stack for x-cart 5
This is a simple docker stack built for running X-Cart 5 software.

## About

### Hostname
Your site will be available at http://0.0.0.0 so if you wish to have a dedicated hostname to reach it, you should edit your local hosts file and add a line, for example:
* `0.0.0.0	mysite.xcart`

You should then be able to reach your website with http://mysite.xcart

### PHP
This image is based on [webdevops/php-apache:7.1](https://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html) so it runs PHP 7.1 with Apache web server and all the necessary libraries and other X-Cart requirements.

### Database
The database is [MariaDB](https://mariadb.org/) and it runs in its own container.

### Emails
This stack comes with [Mailhog](https://github.com/mailhog/MailHog) which will receive all emails sent via the platform. You can reach it at http://0.0.0.0:8025/.

### Docker-sync
To provide a good user-experience and fast sync of the filesystem, this stack uses Docker-sync in `native_osx` mode. It is strongly advised to exclude the `var` directory from the sync. This is done in the `docker-sync.yml` file.

**If you are not on a mac**, you should read more on the [sync strategies](https://github.com/EugenMayer/docker-sync/wiki/8.-Strategies) in the wiki and adapt the `docker-sync.yml` file accordingly. 

## Setting up

### Getting started

Clone this repository into your new project folder, eg. from within your `Sites/` folder:

`mkdir xcart && git clone git@github.com:MrUpsidown/docker-xcart.git xcart`

[Download](https://www.x-cart.com/download.html) the latest X-Cart software and place the archive in the `/app` folder. Unarchive it from there. You should now have the following structure: `<your project folder>/app/xcart/<x-cart files>`.

### PHP configuration
Add your own PHP customizations in the `/conf/xcart.ini` file.

If you make changes to this file (after creating your containers), you must run `service php-fpm restart` from within the web container for your changes to be taken into account.

### Usage

#### Start
Open a terminal window and `cd` to your project folder (where the `docker-compose.yml` file is located), for example `cd Sites/xcart` then start the stack with the following command:

`docker-sync-stack start`

> The first time you start your docker stack, it will take some time as docker-sync will copy all the X-Cart files to the sync container. This is normal behavior. After the first sync, starting the stack should be much faster.

#### Stop
To stop your containers, hit `ctrl + c` from within the same terminal window.

#### Remove
To remove your containers, run:

`docker-compose down && docker-sync clean`

### Notes

If you are here because you want to give X-Cart a try, my advice is: just don't! X-Cart is the worst e-commerce framework ever built. Full stop.
