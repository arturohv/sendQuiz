
<?php

/*Clase que obtiene de config.php
Toma los valores y los agrega a la clase.
*/
Class Conf
{
   private $_domain;
   private $_userdb;
   private $_passdb;
   private $_hostdb;
   private $_db;
   private $_email_batch_limit;
   private $_delay_seg;

   static $_instance;

   private function __construct(){
      
      require_once 'config.php';
      $this->_userdb=$user;
      $this->_passdb=$password;
      $this->_hostdb=$host;
      $this->_db=$db;
      $this->_email_batch_limit=$email_batch_limit;
      $this->_delay_seg=$delay_seg;           
   }

   private function __clone(){ }

   public static function getInstance(){
      if (!(self::$_instance instanceof self)){
         self::$_instance=new self();
      }
      return self::$_instance;
   }

   public function getUserDB(){
      $var=$this->_userdb;
      return $var;
   }

   public function getHostDB(){
      $var=$this->_hostdb;
      return $var;
   }

   public function getPassDB(){
      $var=$this->_passdb;
      return $var;
   }

   public function getDB(){
      $var=$this->_db;
      return $var;
   }
   
   public function getEmailBatchLimit(){
      $var=$this->_email_batch_limit;
      return $var; 
   }
   
   public function getDelaySeg(){
      $var=$this->_delay_seg;
      return $var; 
   }

}

?>
