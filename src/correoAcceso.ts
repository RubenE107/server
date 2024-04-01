import dotenv from 'dotenv';
import jwt from 'jsonwebtoken';

dotenv.config();

var email = require("emailjs/email");

module.exports = (formulario:any) =>{
  var token = jwt.sign(formulario, process.env.TOKEN_SECRET || 'tokentest')
var server = email.server.connect({
  user: process.env.user, 
  password:process.env.Correo_Pass,
   host: process.env.host,  
  tls: true 
});

var message = {
  from: "equipWed@hotmail.com",
  to: "<"+formulario.correo+">", 
  bbc : "",
  subject: "Cambio de contraseña",
  attachment: [
    { data: `<a href="http://localhost:4200/home/reestablecer/${token}" style="font-family:corbel, arial, sans-serif; font-size:10pt; font-weight: bold;"> Cambiar la contraseña </a>`, alternative: true },
  ],
};

server.send(message, function (err:any, message:any) {
  console.log("error=",err);
  message=null;
});
}
