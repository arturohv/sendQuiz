<?php
    
    class enviarcorreo
    {
        
        
        private $_destinatario = "";
        private $_destinatarioNombre = "";
        
        
        public function __construct($pDestinatario, $pDestinaNombre){
            $this->_destinatario = $pDestinatario;
            $this->_destinatarioNombre = $pDestinaNombre;
        }
        
        
        public function getDestinatario(){
            $var=$this->_destinatario;
            return $var;
        }
        
        public function getDestinatarioNombre(){
            $var=$this->_destinatarioNombre;
            return $var;
        }
        

        public function enviar(){
            require_once 'PHPMailerAutoload.php';
            //SMTP needs accurate times, and the PHP time zone MUST be set
            //This should be done in your php.ini, but this is how to do it if you don't have access to that
            date_default_timezone_set('Etc/UTC');
            //Create a new PHPMailer instance
            $mail = new PHPMailer();
            //Tell PHPMailer to use SMTP
            $mail->isSMTP();
            //Enable SMTP debugging
            // 0 = off (for production use)
            // 1 = client messages
            // 2 = client and server messages
            $mail->SMTPDebug = 0;
            //Ask for HTML-friendly debug output
            $mail->Debugoutput = 'html';
            //Set the hostname of the mail server
            $mail->Host = 'smtp.gmail.com';
            //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
            $mail->Port = 587;
            //Set the encryption system to use - ssl (deprecated) or tls
            $mail->SMTPSecure = 'tls';
            //Whether to use SMTP authentication
            $mail->SMTPAuth = true;
            //Username to use for SMTP authentication - use full email address for gmail
            $mail->Username = "dracosurvey@gmail.com";
            //Password to use for SMTP authentication
            $mail->Password = "MIMBOS1983";
            //Set who the message is to be sent from
            $mail->setFrom('dracosurvey@gmail.com', 'Servidor de Notificaciones (UTN)');
            //Set an alternative reply-to address
            $mail->addReplyTo('dracosurvey@gmail.com', 'Servidor de Notificaciones (UTN)');
            //Set who the message is to be sent to
            $mail->addAddress($this->getDestinatario(), $this->getDestinatarioNombre());
            //Set the subject line
            $mail->Subject = '(UTN) NOTIFICACION DE ENLACE A QUIZ (UTN)';
            //Read an HTML message body from an external file, convert referenced images to embedded,
            //convert HTML into a basic plain-text alternative body
            $mail->msgHTML(file_get_contents('notificacion.html'), dirname(__FILE__));
            //Replace the plain text body with one created manually
            $mail->AltBody = 'SU CONFIGURACION DE CORREO NO ADMITE FORMATO HTML.';
            //Attach an image file
            //$mail->addAttachment('images/phpmailer_mini.gif');

            //send the message, check for errors
            if (!$mail->send()) {
                echo "Error: No se ha enviado el correo a: " . $this->getDestinatarioNombre() . 
                " debido al siguiente error:" . $mail->ErrorInfo;
                return 0;
            } else {
                return 1;
                //echo "Correo enviado a: " . $this->getDestinatarioNombre() . ", correctamente." . "</br>" ;
            }
            
        }
        
    }
?>




