<?php

require('config.php');

$id = $_POST['id'];
$nome = $_POST['nome'];
$fone = $_POST['fone'];
$email = $_POST['email'];
$nasc = $_POST['nasc'];
$cpf = $_POST['cpf'];
$rua = $_POST['rua'];
$numero = $_POST['numero'];
$complemento = $_POST['complemento'];

    //do something
    $insert = $conn->query("UPDATE tb_cidadaos SET 
    nome ='$nome', 
    fone ='$fone', 
    email ='$email', 
    nasc ='$nasc', 
    rua ='$rua', 
    numero ='$numero',
     complemento ='$complemento'
      WHERE id =  '$id'
      ");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;
 
 