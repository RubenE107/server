"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const dotenv_1 = __importDefault(require("dotenv"));
const jsonwebtoken_1 = __importDefault(require("jsonwebtoken"));
dotenv_1.default.config();
var email = require("emailjs/email");
module.exports = (formulario) => {
    var token = jsonwebtoken_1.default.sign(formulario, process.env.TOKEN_SECRET || 'tokentest');
    var server = email.server.connect({
        user: process.env.user,
        password: process.env.Correo_Pass,
        host: process.env.host,
        tls: true
    });
    var message = {
        from: "equipWed@hotmail.com",
        to: "<" + formulario.correo + ">",
        bbc: "",
        subject: "Cambio de contraseña",
        attachment: [
            { data: `<a href="http://localhost:4200/home/reestablecer/${token}" style="font-family:corbel, arial, sans-serif; font-size:10pt; font-weight: bold;"> Cambiar la contraseña </a>`, alternative: true },
        ],
    };
    server.send(message, function (err, message) {
        console.log("error=", err);
        message = null;
    });
};
