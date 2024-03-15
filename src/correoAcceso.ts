var email = require("emailjs/email");
console.log("hola");
//module.exports = (formulario: any) => {
var server = email.server.connect({
  user: "alfredo_hjdlo@hotmail.com ",
  password: "",
  port:587,
  host: "smtp-mail.outlook.com",
  ssl: true,
});

var message: any = {};
message = {
  from: "alfredo_hjdlo@hotmail.com",
  to: "Erikue<erikue@hotmail.com>",
  bcc: "",
  subject: "Probando ando",
  attachment: [
    { data: `¡¡Te damos la más cordial bienvenida !!`, alternative: true },
  ],
};
server.send(message, function (err: any, message: any) {
  console.log(err);
});
//}
