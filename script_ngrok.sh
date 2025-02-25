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
ngrok http 80 > /dev/null &

# Esperando inicio de ngrok
sleep 5

# Obtener la URL de NGROK
NGROK_URL=$(curl -s localhost:4040/api/tunnels | jq -r '.tunnels[0].public_url')
echo "url de ngrok: $NGROK_URL"
