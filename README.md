- run "docker compose up -d"
- add following line in hosts file
- 127.0.0.0 laravel_13.local
- if docker is installed in a vm use its ip

- open docker container console and run the following command to install laravel installer
-- composer global require laravel/installer
-- export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH"
- create a folder code, otherwise laravel installer will says folder is not empty
- you can move files from code folder to out if you want after laravel installation
-- laravel new laravel_13
- it will asks some questions
- Do you want to use a starter Kit?
-- no
- Which front end stack do you want to build on?
- Blade
- let it install the project
- which boost features would you like to configure?
-- AI Guidelines, Agent Skills, Boost MCP Server Configuration
-- select all three for default behavior
- which integration would you like to configure for boost
-- Laravel Cloud, select none
- which ai agents would you like to configure?
-- github copilot, antigravity
- 

install laravel in another directory
laravel new laravel_13 --no-interaction
move files from that directory to parent directory
cd laravel_13
mv /var/www/html/laravel_13/vendor/* /var/www/html/vendor/
rm -rf vendor
mv /var/www/html/laravel_13/* /var/www/html/





npm install
<!-- npm install --ignore-scripts -->
npm run build
composer run dev


mysql -h shared_mysql80 -u root -p -P 3306
cd laravel_13
composer run dev



to create controller
- php artisan make:controller ChirpController
- php artisan make:controller ChirpController --resource
- php artisan migrate
- php artisan migrate:fresh
- to make seed work allow permission to database folder and database file
-- chmod 775 database/database.sqlite
-- chmod 775 database
-- php artisan migrate:fresh --seed //to remove all tables, create them fresh and populate data
- php artisan migrate:rollback //to revert last migration
- php artisan make:migration
- php artisan tinker
-- \DB::select('SELECT * from chirps');
-- \DB::table('chirps')->get();
- php artisan make:model Chirp
<!-- - php artisan make:model Chirp -mrc -->