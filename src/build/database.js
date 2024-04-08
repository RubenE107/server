"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const keys_1 = __importDefault(require("./keys"));
const { createPool } = require("promise-mysql");
console.log("intentando conectar");
const pool = createPool(keys_1.default.database);
console.log("conectado");
exports.default = pool;
// import mysql from 'promise-mysql' //datos de la librería
// import keys from './keys'
// const pool = mysql.createPool(keys.database);
// pool.getConnection().then(connection =>{
//     pool.releaseConnection(connection)
//     console.log("Base de datos conectada")
// })
// export default pool
