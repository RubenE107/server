import { Router } from 'express';
import { ofertasController } from '../controllers/ofertasController';
class ProductoRoutes
{
public router: Router=Router();
    constructor()
    {
    this.config();
    }
    config() : void{
        this.router.post('/create', ofertasController.create);
        this.router.put('/update/:id',ofertasController.update);
        this.router.delete('/delete/:id', ofertasController.delete);
        this.router.get('/showAll/', ofertasController.list );
        this.router.get('/listOne/:id', ofertasController.listOne );
        this.router.get('/ofertasActivas/', ofertasController.ofetasActivas);
        this.router.get('/numOfertasActivas/', ofertasController.numOfetasActivas);
        this.router.get('/duracionOfertas/', ofertasController.duracionOfertas);
        this.router.get('/ordenarFechaInicio/', ofertasController.ordenarFechaInicio);
    }
}
const productoRoutes= new ProductoRoutes();
export default productoRoutes.router;