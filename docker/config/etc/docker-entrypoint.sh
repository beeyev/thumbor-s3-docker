#!/bin/bash

# Get the amount of cpu cores
export NUM_CPUS=`nproc`

if [ ! -f /app/thumbor.conf ]; then
  envtpl /usr/local/etc/thumbor.conf.tpl  --allow-missing --keep-template
fi

# If log level is defined we configure it, else use default log_level = info
if [[ -n "${LOG_LEVEL}" ]]
then
    LOG_PARAMETER="--log-level=${LOG_LEVEL}"
fi

# Check if thumbor port is defined -> (default port 8888)
if [[ -n "${PORT}" ]]
then
    PORT_PARAMETER="--port=${PORT}"
fi

# Set number of processes
if [[ -n "${NUM_PROCESSES}" ]]
then
    NUM_PROCESSES_PARAMETER="--processes=${NUM_PROCESSES}"
fi

for f in /docker-entrypoint.init.d/*; do
    case "$f" in
        *.sh) # this should match the set of files we check for below
            . $f
            break
            ;;
    esac
done

if [ "$1" = 'thumbor' ]; then
    THUMBOR_EXEC="thumbor ${PORT_PARAMETER} --conf=/usr/local/etc/thumbor.conf ${LOG_PARAMETER} ${NUM_PROCESSES_PARAMETER}"
    echo "---> $($(which thumbor) --version)"
    echo "---> 🚀 Starting Thumbor on port ${PORT}, log level: ${LOG_LEVEL}, available ${NUM_CPUS} cpu cores..."
    echo "--->  exec command: ${THUMBOR_EXEC}"

    exec ${THUMBOR_EXEC}
fi

exec "$@"
