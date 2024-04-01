"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
dotenv_1.default.config();
var email = require("emailjs/email");
console.log("hola");
module.exports = (formulario) => {
    var server = email.server.connect({
        user: process.env.user,
        password: process.env.Correo_Pass,
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
    server.send(formulario, function (err, formulario) {
        console.log("error=", err);
        formulario = null;
    });
};
