<?php
class Member{
    public $id = '';
    public $email = '';
    public $indentify = '';
    public $affiliation = '';
    public $name = '';

    public $article = [];
    public $paymentRecord = [];
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
        if(isset($data['indentify'])){
            $this->indentify = $data['indentify'];
        }
    }
    public function print(){
        $data = [];
        $data['email'] = $this->email;
        $data['name'] = $this->name;
        $data['affiliation'] = $this->affiliation;
        $data['indentify'] = $this->indentify;
        return json_encode($data);
    }
}