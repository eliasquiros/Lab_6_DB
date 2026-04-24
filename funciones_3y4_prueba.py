import mysql.connector
from mysql.connector import Error

# Configuración de MySQL
DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'TU_CONTRASEÑA_AQUI',  # ⚠️ Reemplaza con tu contraseña
    'database': 'proyecto_bd'
}

def conectar_bd():
    """
    Conecta a MySQL
    Retorna: conexión o None si falla
    """
    try:
        conexion = mysql.connector.connect(**DB_CONFIG)
        if conexion.is_connected():
            db_info = conexion.get_server_info()
            print(f"✓ Conectado a MySQL Server versión {db_info}")
            return conexion
    except Error as e:
        print(f" Error al conectar: {e}")
        return None

def cerrar_bd(conexion):
    """Cierra la conexión"""
    if conexion and conexion.is_connected():
        conexion.close()
        print(" Conexión cerrada")

conexion = conectar_bd()
