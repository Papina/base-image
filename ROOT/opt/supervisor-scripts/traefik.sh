#!/bin/bash

utils=/opt/supervisor-scripts/utils
. "${utils}/logging.sh"
. "${utils}/cleanup_generic.sh"
. "${utils}/environment.sh"
. "${utils}/exit_serverless.sh"

# # Run the caddy configurator
cd /opt/portal-aio/traefik

# # /opt/portal-aio/venv/bin/python caddy_config_manager.py

# # Ensure the portal config file exists if running without PORTAL_CONFIG
# touch /etc/portal.yaml

if [[ -f /opt/portal-aio/traefik.yml ]]; then
    # Frontend log viewer will force a page reload if this string is detected
    echo "Starting Traefik..." 
    /opt/portal-aio/traefik/traefik 2>&1
    exit $?
else
    echo "Skipping Traefik startup - No config file was available"
fi
