# Using Drupal 8.x with Docker

## Clone this repo

```
git clone git@github.com:theodorosploumis/drupal-docker.git
cd drupal-docker
```

## Build the images

```
# Build drupalconsole image with version 1.0.0-alpha2
docker build --build-arg CONSOLE_VERSION=1.0.0-alpha2 -t drupalconsole-volumed:1.0.0-alpha2 builds/drupalconsole-volumed/.

# Build drush image with version 8.1.1
docker build --build-arg DRUSH_VERSION=8.1.2 -t drush-volumed:8.1.2 builds/drush-volumed/.
```

## Run the containers with docker-compose

```
docker-compose up
```

## Prepare a Drupal site for installation

```
# Assuming your WORKDIR is set to drupal root
docker exec drupal_8081 \
            cp sites/default/default.settings.php sites/default/settings.php && \
            chmod 777 sites/default/settings.php && \
            mkdir sites/default/files && \
            chown -R www-data:www-data sites/default && \
            chmod -R 777 sites/default/files && \
            chmod 644 sites/default/default.settings.php && \
            chmod 644 sites/default/default.services.yml && \
```

## Fix drupalconsole requirements

```
# After running the containers
# Fix error message for Drupal console (php7 has no mysql extension)
docker exec drupal_8081 /drupalconsole/drupal \
            settings:set checked "true"

# Init Drupal console
docker exec drupal_8081 /drupalconsole/drupal init
```

## Install with Drupal console

```
docker exec drupal_8081 /drush/drush \
    site-install -y ${DRUPAL_PROFILE} \
    --site-name="Drupal 8 in Docker" \
    --db-url=mysql://drupal:drupal@mysql/drupal \
    --site-mail=admin@example.com \
    --account-name=admin \
    --account-pass=admin \
    --account-mail=admin@example.com
```

## Install with Drush

```
docker exec drupal_8081 /drupalconsole/drupal \
            site:install -y ${DRUPAL_PROFILE} \
            --langcode=en \
            --db-host=mysql \
            --db-name=drupal \
            --db-user=drupal \
            --db-pass=drupal \
            --site-name="Drupal 8 in Docker" \
            --site-mail=admin@example.com \
            --account-name=admin \
            --account-pass=admin \
            --account-mail=admin@example.com
```
