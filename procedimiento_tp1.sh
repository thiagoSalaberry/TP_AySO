# En este archivo detallaré paso a paso la resolución del TP
# Resolución del TP1 de Arquitectura y Sistemas Operativos - Thiago Salaberry

# Nos paramos en el directorio raíz del usuario, creamos el directorio 'repogit' y nos paramos en él
cd
mkdir repogit
cd repogit

# Clonamos el repositorio remoto e ingresamos en su carpeta
git clone git@github.com:thiagoSalaberry/TP_AySO.git
cd TP_AySO

# Vemos el contenido del archivo '/etc/os-release'
cat /etc/os-release

# Realizamos la búsqueda del patrón 'HOME_URL' de las siguiente formas: 1. HOME_URL; 2. home_url; 3. -i Home_url usando -i para ignorar la diferencia entre mayúsculas y minúsculas
grep HOME_URL /etc/os-release
grep home_url /etc/os-release
grep -i Home_url /etc/os-release
# Agregamos la salida del último comando al archivo datos_usuario.txt
grep -i Home_url /etc/os-release > datos_url.txt

# Vemos el usuario actual
whoami

# Creamos el archivo datos_usuario.txt con la salida del comando anterior
echo "Usuario=$(whoami)" > datos_usuario.txt

# Agregamos todos los archivos al stagging del repositorio local
git add .
# En caso de no haberlo hecho antes, debemos registrar nuestro email y name en git local para autenticarnos ante el repositorio
git config --global user.email "thiagosalaberry99@gmail.com"
git config --global user.name "Thiago"
git commit -m "ADD: agregado 1er ejercicio sobre datos_usuario.txt"
git status
git push origin main

# Agregamos la información del modelo del CPU que está en el archivo /proc/cpuinfo, agregamos una sola línea ya que aparece la cantidad N de nucleos que tengamos
grep "model name" /proc/cpuinfo | head -n 1 >> datos_usuario.txt

# Volvemos a agregar el contenido del directorio al stagging area
git add .
git commit -m "FEAT: Añadiendo información de CPU"

# Agregamos información del usuario al README usando HereDoc
cat <<EOF >> datos_usuario.txt
    Alumno: Thiago Salaberry
    División: 116
Turno: Mañana
EOF

# Agregamos nuevamente al stagging area y enviamos al repositorio remoto de GitHub
git add README.md datos_usuario.txt
git commit -m "ADD: Añadiendo Readme y datos de usuario"
git push origin main

# Creamos la estructura de directorios en un solo comando. Tenemos que usar '-p' ya que los directorios materia1 y materia2 no existen
mkdir -p materia{1..2}/uni{1..3}

# Agregamos el comando anterior al archivo script_dir.sh y le damos permisos de ejecución para todos
echo "mkdir -p materia{1..2}/uni{1..3}" > script_dir.sh && chmod 775 script_dir.sh

# Agregamos al stagging area el nuevo archivo, commiteamos y enviamos al repositorio remoto
git add .
git commit -m "ADD: Añadiendo script"
git push origin main

# Para referirnos al directorio raíz del usuario actual, estando en /home/Thiago/repogit/TP_AySO, podemos usar '~/', '$HOME' o '../../'
# Con 'history -a' escribimos en el archivo ~/.bash_history todo el historial de comandos que se encutra en memoria
history -a
# Copiamos el contenido de ~/.bash_history al archivo Historial_comandos_Salaberry.txt en el directorio actual
cp ~/.bash_history ./Historial_comandos_Salaberry.txt 

# Agregamos al stagging, commiteamos y enviamos al repositorio remoto
git add .
git commit -m "ADD: Historial de comandos de Salaberry"
git push origin main


