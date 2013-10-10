<?php
        //Datos de configuración de la conexión a la base de datos
        //Se extraen los datos del archivo ini.xml
        $ini= simplexml_load_file('ini.xml');

        //Servidor
        $host=$ini->host;

        //Usuario
        $user=$ini->user;

        //Password
        $password=$ini->password;

        //Base de datos a utilizar
        $db=$ini->db;

        //Limite de Correos a enviar
        $limit_mail=$ini->limit_mail;

        //Limite de Delay entre cada horda de correos
        $delay_seg=$ini->delay_seg;        
?>