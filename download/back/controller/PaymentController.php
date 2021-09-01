<?php
class PaymenyController{
    private $recordRepo;
    public function __construct(){
        $this->recordRepo = new RecordRepo();
    }
    function GetpayAmt($id){
        $data = Input::getJsonData();
        $record = $this->recordRepo->find($id);
        $payitemRepo = new PayItemRepo();
        $record->items = $payitemRepo->findAll($record->id);
        $record->getTotal();
        Output::Success(json_encode($record));
    }
    function getMPGRecord($id){
        $data = Input::getJsonData();
        
        $paytype = $data["paytype"];
        $receipt  = $data["receipt"];

        $uid = Input::getSession("USERID");
        $memberRepo = new MemberRepo();
        $member = $memberRepo->find($uid);
        $email = $member->email;
        $record = $this->recordRepo->find($id);
        $payitemRepo = new PayItemRepo();
        $record->items = $payitemRepo->findAll($record->id);
        
        $orderId = $record->id;
        $ItemName = $record->des;
        $amt = $record->getTotal();
        
        Output::Success(MPG::mpg_encrypt($email,$orderId,$ItemName,$amt,$paytype));
    }
    function PayAll(){
        //delet add return id 
        $uid = Input::getSession("USERID");
        $memberRepo = new MemberRepo();
        $recordRepo = $this->recordRepo;
        $articleRepo = new ArticleRepo();
        $payItemRepo = new PayItemRepo();
        $memberBuilder= new MemberBuilder($memberRepo,$articleRepo,$recordRepo,$payItemRepo);
        $member = $memberBuilder->Build($uid);
        
        $records = $member->paymentRecords;
        $Payitems = [];
        foreach($records as $record){
            if(!$record->getIspay()){
                
                $Payitems = array_merge($Payitems,$record->items);
                $recordRepo->delete($record->id);
            }
        }
        
        $newRecord = new Record(array('items'=>$Payitems,'createtime'=>time(),'des'=>'pay all'));
        $insertid = $recordRepo->insert($uid,$newRecord);
        
        foreach($Payitems as $item){
            $payItemRepo->insert($insertid,$item);
        }
        Output::Success('{"id":"'.$insertid.'"}');
        
    }
    function payNotify(){
        //接收api之街口
    
        $data = Input::getPostData();
        $memberRepo =  new MemberRepo();
        $deTradeInfo = $data['TradeInfo'];
        
        $jsoninfo = json_decode(MPG::mpg_decrypt($deTradeInfo));
        
        //print_r($jsoninfo) $jsoninfo->Status=='SUCCESS'
        if($jsoninfo->Status=='SUCCESS'){//$jsoninfo->Status=='SUCCESS'

            $jsonResult = $jsoninfo->Result;
            $oid = $jsonResult->MerchantOrderNo;
            $amt = $jsonResult->Amt;
            $paytime = $jsonResult->PayTime;
            $this->recordRepo->update($oid,array('paytime'=>$paytime));
            //$oid = $data['oid'];
            //$amt = $data['amt'];
            $member = $memberRepo->findByRecord($oid);
            $email = $member->email;
            $name = $member->name;
            $position = $member->position;


            $postdata = http_build_query(
                array(
                    'email' => $email,
                    'pwd' => 'dav123aaxxccee',
                    'type' => 'receipt',
                    'name'=>$name,
                    'position'=>$position,
                    'amt'=>$amt
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
        }
        else{
            Output::Error();
        }
    }

    function getPayRecord(){
        //顯示付款資訊
        $uid = Input::getSession("USERID");
        $records = $this->recordRepo->findAll($uid);
        $payitemRepo = new PayItemRepo();
        foreach($records as $record){
            $record->items = $payitemRepo->findAll($record->id);
            $record->getTotal();
        }
        Output::Success(json_encode($records));
    }
    function setPayRecord($id){
        $uid = Input::getSession("USERID");
        $data = Input::getJsonData();
        //find record in member 
        $paytime = time();
        $this->recordRepo->update($id,array('paytime'=>$paytime));
        Output::Success();
    }
    function GetPDFPayRecord($sql){
       //pdf
    }
    
    
}