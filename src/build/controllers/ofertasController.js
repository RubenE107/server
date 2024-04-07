"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.ofertasController = void 0;
const database_1 = __importDefault(require("../database"));
class OfertasController {
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query('SELECT * FROM oferta');
            res.json(respuesta);
        });
    }
    listOne(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const respuesta = yield database_1.default.query('SELECT * FROM oferta WHERE id = ?', [id]);
            if (respuesta.length > 0) {
                res.json(respuesta[0]);
                return;
            }
            res.status(404).json({ 'mensaje': 'Oferta no encontrada' });
        });
    }
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const resp = yield database_1.default.query("INSERT INTO oferta set ?", [req.body]);
            res.json(resp);
        });
    }
    update(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            console.log(req.params);
            const resp = yield database_1.default.query("UPDATE oferta set ? WHERE id = ?", [req.body, id]);
            res.json(resp);
        });
    }
    delete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id } = req.params;
            const resp = yield database_1.default.query(`DELETE FROM oferta WHERE id = ${id}`);
            res.json(resp);
        });
    }
    ofetasActivas(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query('SELECT * FROM oferta WHERE CURDATE() BETWEEN STR_TO_DATE(fecha_inicio, "%d-%m-%Y") AND STR_TO_DATE(fecha_fin, "%d-%m-%Y");');
            res.json(respuesta);
        });
    }
    numOfetasActivas(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query('SELECT COUNT(*) AS num_ofertas_activas FROM oferta WHERE CURDATE() BETWEEN STR_TO_DATE(fecha_inicio, "%d-%m-%Y") AND STR_TO_DATE(fecha_fin, "%d-%m-%Y");');
            res.json(respuesta);
        });
    }
    duracionOfertas(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query('SELECT nombre AS Nombre_Oferta, DATEDIFF( STR_TO_DATE(fecha_fin, "%d-%m-%Y"), STR_TO_DATE(fecha_inicio, "%d-%m-%Y") ) + 1 AS Duracion_En_Dias FROM oferta;');
            res.json(respuesta);
        });
    }
    ordenarFechaInicio(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query('SELECT * FROM oferta ORDER BY STR_TO_DATE(fecha_inicio, "%d-%m-%Y") DESC;');
            res.json(respuesta);
        });
    }
    listAll_Ofertas_Producto(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query('SELECT id_oferta, id_producto, oferta.nombre as nombre_oferta, precio_orig, porc_descuento, fecha_inicio, fecha_fin, producto.nombre as nombre_producto FROM producto_oferta, oferta, producto WHERE oferta.id = producto_oferta.id_oferta AND producto_oferta.id_producto = producto.id;');
            res.json(respuesta);
        });
    }
}
exports.ofertasController = new OfertasController();
