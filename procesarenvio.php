<?php

/*Incluimos el fichero de la clase Db*/
require_once 'Db.php';
/*Incluimos el fichero de la clase Conf*/
require_once 'Conf.php';
/*Incluimos el fichero de la clase que realiza los envios de correo*/
require_once 'PHPMailer/class.enviarcorreo.php';
/*Inclimos la clase de notificaciones*/
require_once 'class.notifica.php';

/*Creamos la instancia del objeto. Ya estamos conectados*/
$bd=Db::getInstance();

/*Creamos una query sencilla*/
$sql='SELECT 
				t.id as test_id,
				t.description as description_test,
                                e.id as estudiante_id,
				e.first_name as nombre_estudiante,
				e.last_name as apellido_estudiante,
                                e.email as correo_estudiante,
				c.`name` as nombre_curso,
				t.application_date as fecha_aplicacion,
				t.term_in_minutes as tiempo_minutos,
				p.first_name as nombre_profesor,
				p.last_name as apellido_profesor		
				
FROM test AS t 
inner JOIN `group` as g on g.id = t.group_id
INNER JOIN registration as r on r.group_id = g.id
inner join student as e	on e.id = r.student_id
inner join course as c on c.id = g.course_id
inner join professor as p on p.id = g.professor_id
where t.application_date < CURDATE()
and t.`status` = 1
and NOT EXISTS (SELECT * from notification_sent 
where student_id = e.id and test_id = p.id)';

/*Ejecutamos la query*/
$stmt=$bd->ejecutar($sql);

/*Realizamos un bucle para ir obteniendo los resultados*/
$envios = 0;
$buenos = 0;
while ($x=$bd->obtener_fila($stmt,0)){
   $email =  $x['correo_estudiante'];
   $nombreCompleto = $x['nombre_estudiante'] . ' ' . $x['apellido_estudiante'];
   //Obtiene los valores para la inserccion en la tabla notificacion_sent;
   $quizId = $x['test_id'];
   $estudianteId = $x['estudiante_id'];
   //Instacia la notificacion para crear el archivo con los valores por correo
   $notifica = new Notifica($nombreCompleto, $x['description_test'], 
           $x['nombre_curso'], $x['fecha_aplicacion'], $x['tiempo_minutos'], $x['nombre_profesor'] . ' ' . $x['apellido_profesor']);
   $notifica->crearArchivo();
   $mails = new enviarcorreo($email,$nombreCompleto);
   
   
   if ($mails->enviar() == 1) {
       $buenos=$buenos+1;
       
       
   }  
   $envios = $envios + 1;
   
}
echo "Correo enviado. <br>";       
echo 'Total de envios ' . $envios . " correctos: " . $buenos;    

?>
