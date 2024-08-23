<?php
require_once __DIR__.'/vendor/autoload.php';

use App\Car\Controller\CarController;

$carController = new CarController();


var_dump($carController->actualModelsServices(1000));
var_dump($carController->outdatedModels('2010-09-30'));

