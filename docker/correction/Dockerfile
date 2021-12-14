#se basant sur une image alpine
FROM alpine:latest 

#installer Git et Curl a l’aide apk
RUN apk update
RUN apk add --no-cache bash git curl 

#créer et se positionner dans le répertoire /tp
RUN mkdir -p /var/www/tp
WORKDIR "/var/www/tp"

#copier le script précédent
COPY ./exo1.sh .

#définir le script précédent autant que point d’entrée
CMD ["sh", "exo1.sh"]


