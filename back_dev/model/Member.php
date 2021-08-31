<?php
class Member{
    public $id = '';
    public $email = '';
    //public $indentid ;
    public $affiliation = '';
    public $name = '';
    public $pwd = '';   
    public $position = '';  
    public $country = '';
    public $tel = '';                   
    public $ieeeid = '';
    public $studentid = '';
    public $indent ;
    public $articles = [];
    public $paymentRecords = [];
    public $totalpaied=0;
    public $totalUnPay=0;
    public static $columns = ['pwd','name', 'email', 'position', 
    'affiliation', 'country', 'tel', 'ieeeid', 'studentid'];
    public function __construct($data){
        if(isset($data['id'])){
            $this->id = $data['id'];
        }
        if(isset($data['email'])){
            $this->email = $data['email'];
        }
        if(isset($data['name'])){
            $this->name = $data['name'];
        }
        if(isset($data['affiliation'])){
            $this->affiliation = $data['affiliation'];
        }
        
        if(isset($data['pwd'])){
            $this->pwd = $data['pwd'];
        }
        if(isset($data['position'])){
            $this->position = $data['position'];
        }
        if(isset($data['country'])){
            $this->country = $data['country'];
        }
        if(isset($data['tel'])){
            $this->tel = $data['tel'];
        }
        //if(isset($data['indentid'])){
        //    $this->indentid = $data['indentid'];
        //}
        if(isset($data['indent'])){
            $this->indent = $data['indent'];
        }
        else{
            $this->indent = 'non ieee member';  
        }
        if($data['indent']!='root'){
            if(isset($data['ieeeid'])&&$data['ieeeid']!=''){
                $this->ieeeid = $data['ieeeid'];
                $this->indent = 'ieee member';
            }
            if(isset($data['studentid'])&&$data['studentid']!=''){
                $this->studentid = $data['studentid'];
                $this->indent = 'student';
            }
        }
    }
    public function getTotalpaied(){
        $this->totalpaied = 0;
        foreach($this->paymentRecords as $item){
            if($item->getIspay())
                $this->totalpaied +=$item->getTotal();
        }
        return $this->totalpaied;
    }
    public function getTotalUnPay(){
        $this->totalUnPay = 0;
        foreach($this->paymentRecords as $item){
            if(!$item->getIspay())
                $this->totalUnPay +=$item->getTotal();
        }
        return $this->totalUnPay;
    }
    public function print(){
        $data = [];
        $data['email'] = $this->email;
        $data['name'] = $this->name;
        $data['affiliation'] = $this->affiliation;
        $data['indentify'] = $this->indentify;
        return $data;
    }
}