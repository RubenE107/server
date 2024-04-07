import { Router } from "express";
import { productoOfertaController } from "../controllers/productoOfertaController";

class ProductoOfertaRoutes {
    public router: Router = Router();

    constructor() {
        this.config();
    }

    config(): void {
        this.router.get('/list', productoOfertaController.list);
        this.router.get('/listPorOferta/:id_oferta', productoOfertaController.listPorOferta);
        this.router.get('/listPorProducto/:id_producto', productoOfertaController.listPorProducto);
        this.router.post('/create', productoOfertaController.create);
        // this.router.put('/update', productoOfertaController.update);
        this.router.delete('/delete', productoOfertaController.delete);
        this.router.put('/anularOferta',productoOfertaController.anularOferta);
    }
}

const productoOfertaRoutes = new ProductoOfertaRoutes();
export default productoOfertaRoutes.router;