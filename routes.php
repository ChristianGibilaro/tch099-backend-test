<?php

    require_once(__DIR__.'/router.php');
    
    require 'config.php';
    require './src/controllers/ActivitiesController.php';


    get('/api/activities', function() {
        ActivitiesController::getAllActivities();
    });

    get('/api/activities/filter', function() {

        
            $filtre = array(
                "niveau" => $_GET['niveau'],
                "lieu" => $_GET['lieu'],
                "coach" => $_GET['coach'],
                "jour" => $_GET['jour'],
            );
            ActivitiesController::getFilteredActivities($filtre);

        
    });

    //Route Random
    get('/api/activities/random', function() {
        ActivitiesController::getRandomActivities();
    });
    get('/api/activities/$id', function($id){
       ActivitiesController::getActivity($id);
    });

    post('/api/activities', function(){
        $data = file_get_contents("php://input");
        $activite = json_decode($data, true);
        ActivitiesController::addNewActivite($activite);
    });

    put('/api/activities/$id', function($id){
        $data = file_get_contents("php://input");
        $activite = json_decode($data, true);
        ActivitiesController::modifierActivite($id, $activite);
    });



    any('/404', function() {
        http_response_code(404);
        echo json_encode(["error" => "route not found"]);
    });

    

?>