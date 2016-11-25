#!/usr/bin/env bash
# Install Drupal using drush

if [[ ! -e "/var/www/html/sites/default/settings.php" ]]
  then
    bash  "/scripts/prepare-install.sh"
fi

DRUPAL_PROFILE=standard

drush site-install -y ${DRUPAL_PROFILE} \
  --site-name="Drupal 8 with Docker - Drush" \
  --db-url=mysql://drupal:drupal@mysql/drupal \
  --site-mail=admin@example.com \
  --account-name=admin \
  --account-pass=admin \
  --account-mail=admin@example.com