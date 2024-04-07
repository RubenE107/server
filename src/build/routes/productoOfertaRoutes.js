"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const productoOfertaController_1 = require("../controllers/productoOfertaController");
class ProductoOfertaRoutes {
    constructor() {
        this.router = (0, express_1.Router)();
        this.config();
    }
    config() {
        this.router.get('/list', productoOfertaController_1.productoOfertaController.list);
        this.router.get('/listIdProducto', productoOfertaController_1.productoOfertaController.listIdProducto);
        this.router.get('/listPorOferta/:id_oferta', productoOfertaController_1.productoOfertaController.listPorOferta);
        this.router.get('/listPorProducto/:id_producto', productoOfertaController_1.productoOfertaController.listPorProducto);
        this.router.post('/create', productoOfertaController_1.productoOfertaController.create);
        // this.router.put('/update', productoOfertaController.update);
        this.router.delete('/delete', productoOfertaController_1.productoOfertaController.delete);
    }
}
const productoOfertaRoutes = new ProductoOfertaRoutes();
exports.default = productoOfertaRoutes.router;
