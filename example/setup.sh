#!/bin/sh -e

#=============================================================================
#  Use this script build hipay images and run Hipay's containers
#==============================================================================
if [ "$1" = '' ] || [ "$1" = '--help' ];then
    printf "\n                                                                                  "
    printf "\n ================================================================================ "
    printf "\n                                  HiPay'S HELPER                                 "
    printf "\n                                                                                  "
    printf "\n ================================================================================ "
    printf "\n                                                                                  "
    printf "\n                                                                                  "
    printf "\n      - init      : Build images and run containers (Delete existing volumes)     "
    printf "\n      - restart   : Run all containers if they already exist                      "
    printf "\n      - up        : Up containters                                                "                                           "
    printf "\n      - log       : Log.                                               "
    printf "\n                                                                                  "
fi

if [ "$1" = 'init' ] && [ "$2" = '' ];then
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml stop
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
fi

if [ "$1" = 'init-production' ] && [ "$2" = '' ];then
     docker-compose -f docker-compose.yml -f docker-compose.production.yml stop
     docker-compose -f docker-compose.yml -f docker-compose.production.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f docker-compose.production.yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d
fi

if [ "$1" = 'init-stage' ] && [ "$2" = '' ];then
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml stop
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose.stage.yml up -d
fi

if [ "$1" = 'init' ] && [ "$2" != '' ];then
     docker-compose -f docker-compose.yml -f  docker-compose-"$2".yml stop
     docker-compose -f docker-compose.yml -f  docker-compose-"$2".yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
     docker-compose -f docker-compose.yml -f  docker-compose-"$2".yml build --no-cache
     docker-compose -f docker-compose.yml -f docker-compose-"$2".yml up  -d
fi

if [ "$1" = 'restart' ];then
     docker-compose -f docker-compose.yml stop
     docker-compose -f docker-compose.yml up -d
fi

if [ "$1" = 'kill' ];then
     docker-compose -f docker-compose.yml stop
     docker-compose -f docker-compose.yml rm -fv
     rm -Rf example/public/lib/vendor
     rm -Rf example/public/lib/node_modules
fi

if [ "$1" = 'up' ] && [ "$2" != '' ];then
     docker-compose -f docker-compose.yml -f docker-compose-"$2".yml up -d
fi

# if [ "$1" = 'exec' ] && [ "$2" != '' ];then
#     docker exec -it hipay-enterprise-shop-ps"$2" bash
# fi

# if [ "$1" = 'log' ] && [ "$2" != '' ];then
#    docker logs -f hipay-enterprise-shop-ps"$2"
# fi

if [ "$1" = 'console' ] && [ "$2" != '' ] && [ "$3" != '' ];then
#     docker exec -it hipay-enterprise-shop-ps"$2" bash php console/console.php "$3"
fited! Do not forget to add your HiPay Fullservice credentials into the example/credentials.php file."
fi