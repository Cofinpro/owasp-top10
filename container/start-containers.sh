CONTAINER_BASENAME="shell-training"
COUNT=0
MAX=15

# comment out to make script work for real
set -n
# comment in see parsed command before executed
# set -x

echo -e "Script >>$0<< starts\n.....\n"

while [[ "$COUNT" -lt "$MAX" ]]
do
	COUNT=$[$COUNT + 1]
	EXTERNAL_PORT=2021
	CONTAINER_NAME="$CONTAINER_BASENAME-$COUNT"

	DOCKER_CMD="docker run --rm -d --name $CONTAINER_NAME -p$[$EXTERNAL_PORT + $COUNT]:22 595944282132.dkr.ecr.us-east-1.amazonaws.com/shell-training:latest"
	if docker ps | grep "$CONTAINER_NAME" >/dev/null 2>&1
	then
		echo "Container with name >>$CONTAINER_NAME<< already running,doing nothing"
	else
		echo "running> $DOCKER_CMD"
		$DOCKER_CMD
	fi

done

echo -e "\n.....\nScript >>$0<< is done"
