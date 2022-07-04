FROM gitpod/workspace-mysql

RUN curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | \
    sudo apt-key add -
RUN echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | \
    sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
RUN sudo add-apt-repository ppa:ondrej/php
RUN sudo apt update
RUN sudo apt install -y elasticsearch php7.4-xdebug php8.1-xdebug

RUN echo "alias osmc='php vendor/osmphp/core/bin/compile.php'"  >> $HOME/.bashrc
RUN echo "alias osmh='php vendor/osmphp/core/bin/hint.php'"  >> $HOME/.bashrc
RUN echo "alias osmt='php vendor/osmphp/framework/bin/tools.php'"  >> $HOME/.bashrc
RUN echo "alias osm='php vendor/osmphp/framework/bin/console.php'"  >> $HOME/.bashrc

RUN sudo echo "xdebug.mode=debug" | sudo tee -a /etc/php/8.1/mods-available/xdebug.ini
RUN sudo echo "xdebug.discover_client_host = 1" | sudo tee -a /etc/php/8.1/mods-available/xdebug.ini
RUN sudo echo "xdebug.client_port = 9000" | sudo tee -a /etc/php/8.1/mods-available/xdebug.ini
RUN sudo echo "xdebug.max_nesting_level = 500" | sudo tee -a /etc/php/8.1/mods-available/xdebug.ini