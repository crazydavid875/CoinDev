function doPost(e) {

  var param = e.parameter;
  var type = param.type;
  var pwd = param.pwd;
  var email = param.email;
  var message ='';
  var subject ='';
  if(pwd!='dav123aaxxccee') return ContentService.createTextOutput("error");
  if(type=='verify'){
    var code = param.code;
    subject = 'Verification Code for WOCC 2021 Registration Account';
    message = 'Hello,\n\nYour verification code for WOCC 2021 registration account is '
    +code+"\nPlease use the code to set up your WOCC 2021 registration account.";
    
  }
  else if(type == 'receipt'){
    var name = param.name;
    var position =param.position;
    var amt = param.amt; 
    subject = 'WOCC Registration Fee is received.';
    message = 'Dear '+position+' '+name+',\n\n\n'+
    'This is to confirm that the amount NTD '+amt+' of the registration fee to the 30th IEEE Wireless and Optical Communications Conference (WOCC 2021) has been received by WOCC 2021 organization committee. The official receipts will be delivered during and after the conference.\n\n\n'
    +'Finance Chair\n'+
    'Prof. Po-Hsuan Tseng\n'+
    'National Taipei University of Technology\n'+
    'Taipei, TAIWAN\n';
  }
  MailApp.sendEmail(email, subject, message);
  return ContentService.createTextOutput("success");
}
function doGet(e){
  return '';
}