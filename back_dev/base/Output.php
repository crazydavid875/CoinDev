<?php
    class Output{
        public static function Init(){
            
        }
        public static function Success($val='success'){
            http_response_code(200);
            echo $val;
            exit();
        }
        public static function Create($val=''){
            http_response_code(201);
            echo $val;
            exit();
        }
        public static function Error($val='error'){
            http_response_code(400);
            echo $val;
            exit();
        }
        public static function NotFound(){
            http_response_code(404);
            echo $obj.'request not found';
            exit();
        }
    }