# Compte rendu

## Auteurs
Florian Rasemont & Mathis Fouillen

## dockercompose
Le fichier dockercompose de l’étape 2 est disponible [ici](/docker-compose.yml).
Il permet de deployer 4 services nginx et un loadbalancer.
Voici des logs d'une exécution de ce fichier :

```
$ docker ps
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES

$ docker-compose up -d
Creating network "tp1_default" with the default driver
Creating tp1_proxy_1         ... done
Creating tp1_nginx-service_1 ... done
Creating tp1_nginx-service_2 ... done
Creating tp1_nginx-service_3 ... done
Creating tp1_nginx-service_4 ... done

$ docker ps
CONTAINER ID   IMAGE                 COMMAND                  CREATED         STATUS         PORTS                                   NAMES
85d706a75ffe   nginx                 "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   80/tcp                                  tp1_nginx-service_4
7f731a2f5326   nginx                 "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   80/tcp                                  tp1_nginx-service_3
22373a94ffd1   nginx                 "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   80/tcp                                  tp1_nginx-service_2
e82ef9122189   nginx                 "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   80/tcp                                  tp1_nginx-service_1
c5de45eb682a   jwilder/nginx-proxy   "/app/docker-entrypo…"   6 seconds ago   Up 5 seconds   0.0.0.0:8080->80/tcp, :::8080->80/tcp   tp1_proxy_1
```

## dockerfile
Le docker file de l’étape 3 est disponible [ici](/Dockerfile).

Commandes pour créer et lancer l'image docker :

```bash
docker build -t tpdockersample .
docker run -p 8080:8080 -d tpdockersample
```

L'application est ensuite disponible à l'adresse http://localhost:8080.
La taille de l'image est 374MB.

```
$ docker image ls
REPOSITORY               TAG       IMAGE ID       CREATED             SIZE
dockersample             latest    e20bdf7b4e17   2 minutes ago       374MB
```