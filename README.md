# Using Drupal 8.x with Docker

## 1. Clone this repo

```
git clone git@github.com:theodorosploumis/drupal-docker.git
cd drupal-docker
```

## Start the containers with docker-compose

Notice that containers *drupalconsole_volumed* and *drush_volumed*
will exit immetiately after starting as they are volumed
containers used just to for their executables (drush and console accordingly).

Also, they cannot be used separately only as linked containers.

```
// If you want to build the images before running the containers do:
// docker-compose build

docker-compose up
```

## 2. Prepare Drupal site for installation

```
// You can run the prepare-install.sh script
docker exec drupal_8081 bash /scripts/prepare-install.sh

// Or manually
docker exec drupal_8081 sh -c "\
            cp sites/default/default.settings.php sites/default/settings.php && \
            chmod 777 sites/default/settings.php && \
            mkdir sites/default/files && \
            chown -R www-data:www-data sites/default && \
            chmod -R 777 sites/default/files && \
            chmod 644 sites/default/default.settings.php && \
            chmod 644 sites/default/default.services.yml"
```

## Init drupal console and fix requirements


```
// After running the containers
docker exec drupal_8081 sh -c "\
            /drupal/drupal init && \
            /drupal/drupal settings:set checked 'true'"
```

## 3.1 Install with Drush

```
// You can run the drush-install.sh script
docker exec drupal_8081 bash /scripts/drush-install.sh

// Or manually
set DRUPAL_PROFILE=standard

docker exec drupal_8081 /drush/drush \
    site-install -y ${DRUPAL_PROFILE} \
    --site-name="Drupal 8 with Docker - Drush" \
    --db-url=mysql://drupal:drupal@mysql/drupal \
    --site-mail=admin@example.com \
    --account-name=admin \
    --account-pass=admin \
    --account-mail=admin@example.com
```

Or...

## 3.2 Install with Drupal console

```
// You can run the console-install.sh script
docker exec drupal_8081 bash /scripts/console-install.sh

// Or manually
set DRUPAL_PROFILE=standard

docker exec drupal_8081 /drupal/drupal \
            site:install -y ${DRUPAL_PROFILE} \
            --langcode=en \
            --db-type=mysql \
            --db-prefix='' \
            --db-port=3306 \
            --db-host=mysql \
            --db-name=drupal \
            --db-user=drupal \
            --db-pass=drupal \
            --site-name="Drupal 8 with Docker - Console" \
            --site-mail=admin@example.com \
            --account-name=admin \
            --account-pass=admin \
            --account-mail=admin@example.com
```

## Similar projects

- [runeasgar/docker_drupal_stack](https://github.com/runeasgar/docker_drupal_stack)
