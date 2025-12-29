# Imagen base ligera
FROM nginx:alpine

# Elimina config default
RUN rm /etc/nginx/conf.d/default.conf

# Copia tu config personalizada
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia el build de Astro
COPY dist /usr/share/nginx/html

# Expone el puerto 80
EXPOSE 80

# Inicia nginx
CMD ["nginx", "-g", "daemon off;"]
