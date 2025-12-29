# Sophielandia 🌸

Sophielandia es un sitio web estático creado con **Astro**, diseñado como un estudio creativo artesanal.  
El proyecto está pensado para ejecutarse **exclusivamente en una red Docker interna**, sin exposición a internet.

---

## 🧠 Tecnologías

- Astro
- Tailwind CSS
- Docker
- Nginx (Alpine)
- Docker Bridge Network (`dvegab_network`)

---

## 📂 Estructura del proyecto

```text
.
├── src/                 # Código fuente Astro
├── public/              # Assets públicos (favicon, imágenes)
├── dist/                # Build de producción (generado)
├── Dockerfile           # Imagen Docker (Nginx)
├── nginx.conf           # Configuración Nginx
├── package.json
└── README.md


## 🚀 Build de producción

Antes de ejecutar Docker, genera el build de Astro:

```bash
npm install
npm run build

Esto genera el directorio:
```bash
dist/


## 🐳 Docker
```bash
docker build -t sophielandia-internal .

```bash
docker run -d \
  --name sophie-web \
  --network dvegab_network \
  --restart unless-stopped \
  sophielandia-internal



## 🌐 Acceso interno
Desde otros contenedores en la misma red Docker:
http://sophie-web


## 🔐 Seguridad
- Sin puertos expuestos al host
- Sin acceso externo
- Sin IP pública
- Sin HTTPS (uso interno)
- Aislado por red Docker


## 🔄 Actualización del sitio
Cada cambio requiere ejecutar nuevamente:
```bash
npm run build
docker build -t sophielandia-internal .
docker rm -f sophie-web
docker run -d \
  --name sophie-web \
  --network dvegab_network \
  --restart unless-stopped \
  sophielandia-internal



# Astro Starter Kit: Basics

```sh
npm create astro@latest -- --template basics
```

> 🧑‍🚀 **Seasoned astronaut?** Delete this file. Have fun!

## 🚀 Project Structure

Inside of your Astro project, you'll see the following folders and files:

```text
/
├── public/
│   └── favicon.svg
├── src
│   ├── assets
│   │   └── astro.svg
│   ├── components
│   │   └── Welcome.astro
│   ├── layouts
│   │   └── Layout.astro
│   └── pages
│       └── index.astro
└── package.json
```

To learn more about the folder structure of an Astro project, refer to [our guide on project structure](https://docs.astro.build/en/basics/project-structure/).

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

## 👀 Want to learn more?

Feel free to check [our documentation](https://docs.astro.build) or jump into our [Discord server](https://astro.build/chat).
