## Instalar Docker (https://docs.docker.com/installation)

    $ wget -qO- https://get.docker.com/ | sh

## Clonar el repo

	$ sudo apt-get i
    $ git clone https://github.com/Devecoop/docker-tryton.git

## Build de las imágenes base de docker

En realidad este repo tiene varias imágenes de docker con tryton y
aprovecha la herencia que te da docker para ir agregándole
funcionalidades. En la rama 3.2 es una instalación base de tryton con
sqlite, la rama postgres-3.2 es una imagen con postgresql y la rama
argentina-3.2 tiene los módulos de argentina con sus
dependencias.

En resumen, hay que hacer esto para instalarlo con la localización
argentina. Ya que hay que compilar las imágenes base primero y luego
las heredadas.

    $ cd docker-tryton
	$ git checkout 3.2
	$ sudo docker build -t devecoop/tryton-base:3.2 .
	$ git checkout postgres-3.2
	$ sudo docker build -t devecoop/tryton-postgres:3.2


## Localización Argentina

Acá agregué unos scripts para facilitar la instalación.

	$ git checkout argentina-3.2
	$ source drunrc
	$ drun build_image
	$ drun create
	$ drun install_modules
	$ drun stop
	$ drun start # Resetear para que tome los módulos.


## Instalación del cliente.

La versión oficial del cliente tenía un bug que hacía que no arracara,
por lo menos en ubuntu 14.04, por eso recomendamos instalarlo de la
siguiente forma para solucionarlo.

	$ sudo apt-get install python-pip
	$ sudo pip install git+https://github.com/Devecoop/tryton.git@3.2#egg=tryton
