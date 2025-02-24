# Deteniendo nginx y ngrok
echo "Deteniendo nginx y ngrok!"
sudo systemctl stop nginx
pkill ngrok

# Actualizando el repositorio
echo "Actualizando el repositorio"
cd /var/www/ada-perfil-profesional
git pull origin main

# Encender nginx
echo "Encendiendo nginx!"
sudo systemctl start nginx

# Generar url
echo "Generando url de ngrok!"
ngrok http 80
