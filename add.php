<?php

    require('config.php');

    $nome = $_POST['nome'];
    $fone = $_POST['fone'];
    $email = $_POST['email'];
    $nasc = $_POST['nasc'];
    $cpf = $_POST['cpf'];
    $rua = $_POST['rua'];
    $numero = $_POST['numero'];
    $complemento = $_POST['complemento'];
    
    $insert = $conn->query("INSERT INTO tb_cidadaos(nome,fone,
    email,nasc,cpf,rua,numero,complemento) VALUES(
        '$nome',
        '$fone',
        '$email',
        '$nasc',
        '$cpf',
        '$rua', 
        '$numero',
        '$complemento')");
        if ($insert){
            echo "Success";
        }
        $conn->close();
        return;