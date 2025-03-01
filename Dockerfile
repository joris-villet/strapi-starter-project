FROM node:18-alpine  

# Installation des dépendances système nécessaires
RUN apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

# Création d'un utilisateur non-root pour résoudre les problèmes de permissions
RUN addgroup -S strapi && adduser -S strapi -G strapi

# Définition du répertoire de travail
WORKDIR /opt/app

# Copie des fichiers package.json et yarn.lock
COPY package.json yarn.lock ./

# Installation des dépendances avec yarn
RUN yarn install

# Copie du reste du code source
COPY --chown=strapi:strapi . .

# Configuration des permissions
RUN mkdir -p /opt/app/public/uploads && \
    chown -R strapi:strapi /opt/app

# Exposition du port
EXPOSE 1337

# Définition de l'utilisateur pour l'exécution
USER strapi

# Commande de démarrage (à adapter selon votre configuration)
CMD ["yarn", "develop"]