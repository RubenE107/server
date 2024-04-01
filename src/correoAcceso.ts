import dotenv from 'dotenv';
dotenv.config();

var email = require("emailjs/email");
console.log("hola");

module.exports = (formulario:any) =>{
var server = email.server.connect({
  user: process.env.user, 
  password:process.env.Correo_Pass,
   host: process.env.host,  
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
