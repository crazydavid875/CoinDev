<?php
class Router{
    function Route($method,$service,$action){
        if($service=='account'){
            $this->Account($method,$action);
        }
        else{
            Output::NotFound();
        }
    }
    function Account($method,$action){
        $account = new AccountController();
        if($method=='POST'){
            switch ($action) {
                case 'regist':
                    $account->regist();
                    break;
                case 'login':
                    $account->login();
                    break;
                case 'logout':
                    $account->logout();
                    break;
                case 'SendVerifyCode':
                    $account->SendVerifyCode();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='GET'){
            switch ($action) {
                case 'info':
                    $account->getInfo();
                    break;
                case 'emailVerify':
                    $account->verifyEmail();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='PATCH'){
            switch ($action) {
                case '':
                    $account->updateInfo();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else{
            Output::NotFound();
        }
    }
}