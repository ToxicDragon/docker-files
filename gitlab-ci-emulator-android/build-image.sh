echo "Building image"
docker-compose build

echo "Running container"
docker-compose up

echo "Committing image"
docker commit -c 'ENTRYPOINT [""]' emulator toxicdragon/android-emulator-gitlab-ci:latest

echo "Pushing image to dockerhub"
docker push toxicdragon/android-emulator-gitlab-ci:latest