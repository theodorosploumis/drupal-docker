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

## Drupal console requirements

```
# Remove error message for Drupal console (php7)
docker exec drupal_8081 /drupalconsole/drupal \
            settings:set checked "true"

# Init drupal console (after building the container)
docker exec drupal_8081 /drupalconsole/drupal init
```

# Install with Drupal console

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

# Install with Drush

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