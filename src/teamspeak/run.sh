#!/usr/bin/env bash

puppet apply --modulepath=/src/teamspeak/run/modules /src/teamspeak/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
