<?php
class Router{
    private $account ;
    public function Route($method,$service,$action){
        $this->account = new AccountController();
        if($service=='account'){
            $this->Account($method,$action); 
        }
        else if($service == 'article'){
            $this->Article($method,$action);
        }
        else if($service == 'payment'){
            $this->Record($method,$action);
        }
        else if($service == 'admin'){
            $this->Admin($method,$action);
        }
        else if($service == 'receipt'){
            $this->Receipt($method,$action);
        }
        else{
            Output::NotFound();
        }
    }
    private function Account($method,$action){
        $account = $this->account  ;
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
                case 'verifyEmail'://  ip/back/account/verifyEmail
                    $account->verifyEmail();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='GET'){
            switch ($action) {
                case 'info':
                    $account->isLogin();
                    $account->getInfo();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='PATCH'){
            switch ($action) {
                case '':
                    $account->isLogin();
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
    private function Article($method,$action){
        $article = new ArticleController();
        $this->account->isLogin();
        if($method=='POST'){
            switch ($action) {
                case '':
                    $article->addArticle();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='GET'){
            switch ($action) {
                case '':
                    $article->getArticles();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='PATCH'){
            switch ($action) {
                case 'aid':
                    $article->SetArticle(Input::getPerms(2));
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method=='DELETE'){
            switch ($action) {
                case 'aid':
                    $article->DeleteArticle(Input::getPerms(2));
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
    private function Record($method,$action){
        $record = new PaymenyController();
        
        if($method == 'POST'){
            switch ($action) {
                case 'payAll':
                    $this->account->isLogin();
                    $record->PayAll();
                    break;
                case 'getMPGRecord':
                    $this->account->isLogin();
                    $record->getMPGRecord(Input::getPerms(2));
                    break;
                case 'payNotify':
                    $record->payNotify();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }   
        else if($method=='GET'){
            switch ($action) {
                case 'record':
                    if(Input::getPerms(2)!=null)
                        $record->GetpayAmt(Input::getPerms(2));
                    else
                        $record->getPayRecord();
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
    private function Receipt($method,$action){
            $receipt = new ReceiptController();
            
            if($method == 'POST'){
                switch ($action) {
                    case 'createAll':
                        $this->account->isLogin();
                        $id = Input::getSession("USERID");
                        $receipt->createRecepit($id);
                        break;
                    default:
                        Output::NotFound();
                        break;
                }
            }   
            else if($method=='GET'){
                switch ($action) {
                    case 'list':
                        $this->account->isLogin();
                        $receipt->ListRecepit();
                        break;
                    case 'pdf':
                        $this->account->isLogin();
                        $receipt->GetRecepitPDF(Input::getPerms(2));
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
    private function Admin($method,$action){
        $admin = new AdminController();
        $receipt = new ReceiptController();
        if($method == 'GET'){
            switch ($action) {
                case "":
                    $admin->isLogin();
                    $admin->getAdminPage();
                    break;
                case 'createAllReceipt':
                    $admin->isLogin();
                    $members = $admin->getMemberIds();
                    echo count($members);
                    for($i=Input::getPerms(2);$i<Input::getPerms(3);$i++){
                        $receipt->createRecepit($members[$i]['id']);
                    }
                    //foreach($members as $member){
                        //$event = new SyncEvent("GetAppReport");
                        //$event->fire();
                     //   $receipt->createRecepit($member['id']);
                    //}                    
                    break;
                case "login":
                    $admin->getloginpage();
                    break;
                case "logout":
                    $admin->logout();
                    break;
                case 'members':
                    $admin->isLogin();
                    $admin->getMembers();
                    break;
                case 'articles':
                    $admin->isLogin();
                    $admin->getArticles();
                    break;
                case 'pdftest':
                    $admin->isLogin();
                    $no='Excemple';$title='中文中文中文    統編：12334242';$amt=100;
                    $prticipant="ccddee";$paper='123';$date='2021/10/11';
                    $pdf = new pdfMaker();
                    $pdf->createpdf($no,$title,$amt,$prticipant,$paper,$date);
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
        else if($method == 'POST'){
            switch ($action) {
                case 'login':
                    $admin->login();
                    break;
                default:
                    Output::NotFound();
                    break;
            }
        }
    }
}

