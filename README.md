# infra

### Инфрастурктурный репозиторий

Команда создания инстанса на GCP reddit-app с установкой ruby, mongoDB и деплоем приложения reddit

gcloud compute instances create --boot-disk-size=10GB --image=ubuntu-1604-xenial-v20170815a --image-project=ubuntu-os-cloud --machine-type=g1-small --tags puma-server --restart-on-failure --zone=europe-west1-b --metadata-from-file startup-script=setup.sh reddit-app