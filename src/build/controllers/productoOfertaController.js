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
exports.productoOfertaController = void 0;
const database_1 = __importDefault(require("../database"));
class ProductoOfertaController {
    // list devuelve la lista de todas las entradas registradas en la tabla con todos sus atributos
    list(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query("SELECT * FROM producto_oferta");
            res.json(respuesta);
        });
    }
    // listOneOferta lista buscando por ID de oferta
    listPorOferta(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id_oferta } = req.params;
            const respuesta = yield database_1.default.query("SELECT * FROM producto_oferta WHERE id_oferta=?", [id_oferta]);
            if (respuesta.length > 0) {
                res.json(respuesta);
                return;
            }
            res.status(404).json({ "mensaje": "Oferta no encontrada" });
        });
    }
    // listOneProducto lista buscando por ID de producto
    listPorProducto(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const { id_producto } = req.params;
            const respuesta = yield database_1.default.query("SELECT * FROM producto_oferta WHERE id_producto=?", [id_producto]);
            if (respuesta.length > 0) {
                res.json(respuesta);
                return;
            }
            res.status(404).json({ "mensaje": "Producto no encontrado" });
        });
    }
    // create recibe los datos necesarios en body, y los usa para añadir un nuevo registro
    create(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query("INSERT INTO producto_oferta SET ?", [req.body]);
            res.json(respuesta);
        });
    }
    // No sé si update pueda ser útil, no sabría cómo implementarlo
    /*public async update(req: Request, res: Response): Promise<void> {

    }*/
    // delete recibe la combinación de IDs de producto y oferta que se quiere eliminar
    // (en el json deben venir los atributos id_producto e id_oferta)
    delete(req, res) {
        return __awaiter(this, void 0, void 0, function* () {
            const respuesta = yield database_1.default.query("DELETE FROM producto_oferta WHERE id_producto = ? AND id_oferta = ?", [req.body.id_producto, req.body.id_oferta]);
            res.json(respuesta);
        });
    }
}
exports.productoOfertaController = new ProductoOfertaController();