#!/usr/bin/env bash
# Install Drupal using drupal console

if [[ ! -e "/var/www/html/sites/default/settings.php" ]]
  then
    bash  "/scripts/prepare-install.sh"
fi

DRUPAL_PROFILE=standard

/drupal/drupal site:install -y ${DRUPAL_PROFILE} \
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
