<?php
class AccountController{
    private $memberRepo;
    public function __construct(){
        $this->memberRepo = new MemberRepo();
    }
    public function regist(){
        echo $this->memberRepo->findAll();
        
    }
    public function addEmptyPayRecord(){
        echo 'addEmptyPayRecord';
    }
    public function login(){
        echo 'login';
    }
    public function logout(){
        echo 'logout';
    }
    public function verifyEmail(){
        //email驗證
        echo 'verifyEmail';
    }
    public function SendVerifyCode(){
        echo 'SendVerifyCode';
        //產生email驗證碼，並記出信箱  todo:寄信
    }
    public function getInfo(){
        echo 'getInfo';
    }
    public function updateInfo(){
        echo 'updateInfo';
    }
    //change name pwd email
    private function getHash(){
        return rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
    }
    
}