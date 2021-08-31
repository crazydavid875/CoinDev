<?php
class ArticleController{
    private $articleRepo;
    public function __construct(){
        $this->articleRepo = new ArticleRepo();
    }
    //新增論文
    public function addArticle(){
        $data = Input::getJsonData();
        $uid = Input::getSession("USERID");
        //insert article
        $article = new Article($data);
        $insertid = $this->articleRepo->insert($uid,$article);
        //find has without Article and !ispay  record and delete
        $memberRepo = new MemberRepo();
        $recordRepo = new RecordRepo();
        $payItemRepo = new PayItemRepo();
        $memberBuilder= new MemberBuilder($memberRepo,$this->articleRepo,$recordRepo,$payItemRepo);
        $member = $memberBuilder->Build($uid);
        $where = false;
        $records = $member->paymentRecords;
        foreach($records as $record){
            if(!$record->getIspay()){
                foreach($record->items as $payitem){
                    
                    if($payitem->paymode=="without article"){
                        
                        $recordRepo->delete($record->id);
                    }
                }
            }
        }
        //new a record and item
        
        $des = $article->pagecount." pages paper, ".$member->indent;
        $newRecord = new Record(array('createtime'=>time(),'des'=>$des));
        $recordid = $recordRepo->insert($uid,$newRecord);
        $payitem = new PayItem(array(
            'paymode'=>"has article",
            'indent'=>$member->indent,
            'page'=>1
        ));
        $payItemRepo->insert($recordid,$payitem);
        
        //extr page
        $pagecount = intval($article->pagecount);
        if($pagecount>5){
            $payitem = new PayItem(array(
                'paymode'=>"extra page",
                'page'=>$pagecount-5
            ));
            $payItemRepo->insert($recordid,$payitem);
        }
        Output::Success('{"id":"'.$insertid.'"}');
        
    }
    
    //取得使用者論文
    public function getArticles(){
        $uid = Input::getSession("USERID");
        $articles = $this->articleRepo->findAll($uid);
        Output::Success(json_encode($articles));
        
    } 
    //修改論文
    public function SetArticle($id){
        $data = Input::getJsonData();
        
        $articles = $this->articleRepo->update($id,$data);
        Output::Success();
    }
    
}