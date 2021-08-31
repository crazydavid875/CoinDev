<?php
class AccountController{
    private $memberRepo;
    public function __construct(){
        $this->memberRepo = new MemberRepo();
    }
    public function isLogin(){
        $memberRepo = $this->memberRepo ;
        $id = Input::getSession("USERID");
        if($id==null) Output::NotFound("account");
        $memberRepo->find($id);
    }   
    public function regist(){
        $data = Input::getJsonData();
        $member = new Member($data);
        $insertid = $this->memberRepo->insert($member);
        Input::setSession("USERID",$insertid);
        Output::Success('{"id":"'.$insertid.'"}');
    }
    public function updateInfo(){
        $data = Input::getJsonData();
        $id = Input::getSession("USERID");
        $this->memberRepo->update($id,$data);
        Output::Success();
    }
    
    public function login(){
        $data = Input::getJsonData();
        $member = $this->memberRepo->login($data["email"],$data["pwd"]);
        
        Input::setSession("USERID",$member->id);
        Output::Success();
    }
    public function logout(){
        Input::setSession("USERID","");
        Output::Success();
    }
    public function verifyEmail(){
        //email驗證
        $data = Input::getJsonData();
        $ans = Input::getSession("EmailCode");
        $code = $data['code'];
        if($ans==$code)Output::Success();
        else Output::Error('fail');
    }
    public function SendVerifyCode(){
        $data = Input::getJsonData();
        $email = $data['email'];
        $code = $this->getHash();
        Input::setSession("EmailCode",$code);
        $postdata = http_build_query(
            array(
                'email' => $email,
                'pwd' => 'dav123aaxxccee',
                'code'=>$code,

            )
        );
        $opts = array('http' =>
            array(
                'method' => 'POST',
                'header' => 'Content-type: application/x-www-form-urlencoded',
                'content' => $postdata
            )
        );
        $context = stream_context_create($opts);
        $result = file_get_contents('https://script.google.com/macros/s/AKfycbx-cRpMww-Ye7Qr8iGLUJ4GTs9iY708VWncje4hNPGbbnLCW_4o_NaNDbDtfnrwDOvW/exec', false, $context);
        Output::Success($result);
        //產生email驗證碼，並記出信箱  todo:寄信
    }
    
    public function getInfo(){
        $articleRepo = new ArticleRepo(); 
        $RecordRepo = new RecordRepo(); 
        $PayItem = new PayItemRepo(); 
        $memberBuilder = new MemberBuilder($this->memberRepo,$articleRepo,$RecordRepo,$PayItem);
        $id = Input::getSession("USERID");
        $member = $memberBuilder->Build($id);
        Output::Success(json_encode($member));
        //todo print state and article
    }
    
    //change name pwd email
    private function getHash(){
        return rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9).rand(0,9);
    }
    
}