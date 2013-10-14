<?php
require_once('class.phpmailer.php');
require_once("class.smtp.php");
//include("class.smtp.php"); // optional, gets called from within class.phpmailer.php if not already loaded

$mail             = new PHPMailer(true);

$body             = file_get_contents('../notificacion.html');
//$body             = eregi_replace("[\]",'',$body);
 
$mail->IsSMTP(); // telling the class to use SMTP
//$mail->Host       = "smtp.gmail.com"; // SMTP server
$mail->Mailer="smtp";
$mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
// 1 = errors and messages
// 2 = messages only
$mail->IsSMTP(); // send via SMTP
$mail->SMTPAuth   = true;                  // enable SMTP authentication
$mail->SMTPSecure = "SSL";                 // sets the prefix to the servier
$mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
$mail->Port       = 465;                   // set the SMTP port for the GMAIL server
$mail->Username   = "arturohv@gmail.com";  // GMAIL username
$mail->Password   = "Mimbos1982";            // GMAIL password

 
$mail->setFrom('dracosurvey@gmail.com', 'First Last');
$mail->addReplyTo("dracosurvey@gmail.com","First Last");
$mail->Subject    = "PHPMailer Test Subject via smtp, basic with authentication";
 
$mail->AltBody    = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test 
$mail->MsgHTML($body);
 
$address = "arturohv@gmail.com";
$mail->AddAddress($address, "John Doe");
 
/*$mail->AddAttachment("images/phpmailer.gif");      // attachment
$mail->AddAttachment("images/phpmailer_mini.gif"); // attachment*/
 
if(!$mail->Send()) {
echo "Mailer Error: " . $mail->ErrorInfo;
} else {
echo "Message sent!";
}


?>
