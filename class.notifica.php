
<?php

    /*
    Clase qque crea la notificacion.
    Recibe parametros y construye el archivo fisico, el cual se incluye dentro
    del correo.
    */

    class Notifica{
        private $_estudianteNombre;
        private $_quizDescripcion;
        private $_cursoNombre;
        private $_fechaAplica;
        private $_tiempo;
        private $_profesorNombre;
        
        public function __construct($pEstudiante, $pDescripcion, $pCurso, $pFecha,
                $pTiempo, $pProfesor) {
                $this->_estudianteNombre = $pEstudiante;
                $this->_quizDescripcion = $pDescripcion;
                $this->_cursoNombre = $pCurso;
                $this->_fechaAplica = $pFecha;
                $this->_tiempo = $pTiempo;
                $this->_profesorNombre = $pProfesor;               
        }
        
        public function crearArchivo(){
            $contenido = '<html>
                        <head>
                                <title></title>
                        </head>
                        <body>
                                <center>
                                        <h2>UNIVERSIDAD TECNICA NACIONAL - SEDE SAN CARLOS</h2>
                                        <H2>SISTEMA DE ENVIO DE NOTIFICACIONES</H2>
                                </center>
                                <h3>Estimado(a): ' . $this->_estudianteNombre . '</h3>                                
                                <p>
                                        El quiz ' . $this->_quizDescripcion . ' del curso ' . $this->_cursoNombre . ' ha sido activado a partir de 
                                        ' . $this->_fechaAplica . ' y por un lapso de ' . $this->_tiempo . ' minutos.
                                </p>

                                <p>
                                        Seguir el siguiente link para ingresar al sistema automatizado de quices de la UTN.
                                        <a href="http://localhost/test/"$ID DEL QUIZ>Click aqui para continuar...</a>		
                                </p>

                                <h3>
                                        Atentamente: Prof. ' . $this->_profesorNombre . '.
                                </h3>


                        </body>
                        </html>';
            $file = "notificacion.html";
            file_put_contents($file, $contenido);
            
        }
    }
?>
