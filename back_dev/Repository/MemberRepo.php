<?php 
class MemberRepo{
    private $table;
    public function __construct(){

    }
    public function findAll(){
        $table = $this->table;
        $isSuccess = SQL::Select("SELECT * FROM $table WHERE 1");
        if($isSuccess==-1){
            Output::Error(SQL::getMsg());
        }
        else{
            $result = SQL::getResult();
            $members = [];
            foreach($result as $member){
                array_push($members,new Member($member));
            }
            return $members;
        }
    }
    public function find($id){
        $table = $this->table;
        SQL::Select("SELECT * FROM $table WHERE id=$id");
    }
    public function login($email,$pwd){
        $table = $this->table;
        SQL::Select("SELECT * FROM $table WHERE email=$email and pwd=$pwd");

    }
}