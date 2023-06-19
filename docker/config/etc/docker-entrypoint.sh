#!/bin/sh
# Alexander Tebiev - https://github.com/beeyev

#String Colors
NC='\033[0;m'      # Default Color
GRN='\033[32;1m'
RED='\033[31;1m'
BLK='\033[30;1m'
GRY='\033[90;1m'

# Set the number of cpu cores
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

# Run custom script before the main docker process gets started
for f in /docker-entrypoint.init.d/*; do
    case "$f" in
        *.sh) # this should match the set of files we check for below
            echo "⚙	 Executing entrypoint.init file: ${f}"
            . $f
            break
            ;;
    esac
done

THUMBOR_EXEC="thumbor ${PORT_PARAMETER} --conf=/usr/local/etc/thumbor.conf ${LOG_PARAMETER} ${NUM_PROCESSES_PARAMETER}"

printf "\n\n${GRN}--->${NC} $($(which thumbor) --version)"
printf "\n${GRN}--->${NC} Starting Thumbor on port: ${GRN}${PORT}${NC}, log level: ${GRN}${LOG_LEVEL}${NC}, CPU cores available: ${GRN}${NUM_CPUS}${NC}"
printf "\n${GRN}--->${NC} Exec command: ${GRY}${THUMBOR_EXEC}${NC}"
printf "\n${GRN}--->${NC} Docker image build date: ${GRY}${BUILD_DATE}${NC}, fingerprint: ${GRY}${BUILD_FINGERPRINT}${NC}"
printf "\n${GRN}--->${NC} Docker image project website: ${GRY}https://github.com/beeyev/thumbor-s3-docker${NC}\n\n"
exec ${THUMBOR_EXEC}

