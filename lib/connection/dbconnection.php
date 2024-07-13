<?php

function dbconnection()
{
    $con=mysqli_connect("localhost:3306","root","","foodcater");
    return $con;
}

?>