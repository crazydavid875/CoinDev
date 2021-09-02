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
        $this->verifyEmail();
        $member = new Member($data);

        $insertid = $this->memberRepo->insert($member);
        Input::setSession("USERID",$insertid);
        Output::Success('{"id":"'.$insertid.'"}');
    }
    public function updateInfo(){
        $memberRepo = $this->memberRepo;
        $data = Input::getJsonData();
        $id = Input::getSession("USERID");
        $memberRepo->update($id,$data);
        $member = $memberRepo->find($id);
        
        if($member->complete){
            $this->createRecord();
        }
        
        Output::Success();
    }
    private function createRecord(){
        $uid = Input::getSession("USERID");
        $memberRepo = $this->memberRepo;
        $recordRepo = new RecordRepo();
        $articleRepo = new ArticleRepo();
        $payItemRepo = new PayItemRepo();
        $memberBuilder= new MemberBuilder($memberRepo,$articleRepo,$recordRepo,$payItemRepo);
        $member = $memberBuilder->Build($uid);
        
        $records = $member->paymentRecords;
        if(count($records)==0){
            $newRecord = new Record(array('createtime'=>time(),'des'=>'no paper,'.$member->indent));
            $insertid = $recordRepo->insert($uid,$newRecord);
            $item = new PayItem(array(
                'paymode'=>"without article",
                'indent'=>$member->indent,
                'page'=>1
            ));
            
            $payItemRepo->insert($insertid,$item);
        }
        else{
            
            foreach($records as $record){
                if(!$record->getIspay()){
                    $indent = $member->indent;
                    $hasArticle = count($member->articles)>0;
                    $payItemRepo->updatePids($record->id,$hasArticle,$indent);
                    $splitrecordDes = explode(',',$record->des);
                    
                    if(count($splitrecordDes)>=2)
                    $str = $splitrecordDes[0].','.$indent;
                        $recordRepo->update($record->id,array('des'=>$str ));
                }
            }
        }
        Output::Success(json_encode(array('id'=>$insertid)));
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
        if($ans==$code){
            Input::setSession("emailVerify",true);
            //Output::Success();
        }
        else {
            Input::setSession("emailVerify",false);
            Output::Error('Email Verification fail');
        }
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
                'type' => 'verify',
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
        $result = file_get_contents('https://script.google.com/macros/s/AKfycbyqPotkZmEVQUhrGSFU__UxK79p-acvd5NjRQ5UG76DFQ_uIK1imQEQ1x_dEW_aNJPd/exec', false, $context);
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