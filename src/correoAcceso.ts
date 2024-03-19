
var email = require("emailjs/email");
console.log("hola");

module.exports = (formulario:any) =>{
console.log("hola");
var server = email.server.connect({
  user: "equipWed@hotmail.com", 
  password: "qwer145A",
   host: "smtp-mail.outlook.com",  
  tls: true 
});

/*var message = {
  from: "equipWed@hotmail.com",
  to: "irtu098@gmail.com", 
  subject: "Probando ando",
  attachment: [
    { data: "¡¡Te damos la más cordial bienvenida !!", alternative: true },
  ],
};*/

server.send(formulario, function (err:any, formulario:any) {
  console.log("error=",err);
  formulario=null;
});
}
