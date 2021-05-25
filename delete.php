<?php

    require('config.php');

    $id = $_POST['id'];

    $delete = $conn->query("DELETE FROM tb_cidadaos
      WHERE id =  '$id'
      ");
        if ($delete){
            echo "Success";
        }
        $conn->close();
        return;