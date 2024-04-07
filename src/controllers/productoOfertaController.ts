import { Request, Response } from "express";
import pool from "../database";

class ProductoOfertaController {

    // list devuelve la lista de todas las entradas registradas en la tabla con todos sus atributos
    public async list(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query("SELECT * FROM producto_oferta");
        res.json(respuesta);
    }

    // listOneOferta lista buscando por ID de oferta
    public async listPorOferta(req: Request, res: Response): Promise<void> {
        const { id_oferta } = req.params;
        const respuesta = await pool.query("SELECT * FROM producto_oferta WHERE id_oferta=?", [id_oferta]);
        if (respuesta.length > 0) {
            res.json(respuesta);
            return;
        }
        res.status(404).json({ "mensaje": "Oferta no encontrada" });
    }
    public async listIdProducto(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query("SELECT id_producto FROM producto_oferta");
        res.json(respuesta);
    }
    public async idproductosdeOfertasActivas(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query('SELECT  DISTINCT p.id AS id_producto FROM producto p INNER JOIN producto_oferta po ON p.id = po.id_producto INNER JOIN oferta o ON po.id_oferta = o.id WHERE CURDATE() BETWEEN STR_TO_DATE(o.fecha_inicio, "%d-%m-%Y") AND STR_TO_DATE(o.fecha_fin, "%d-%m-%Y");')
        res.json(respuesta);
    }

    // listOneProducto lista buscando por ID de producto
    public async listPorProducto(req: Request, res: Response): Promise<void> {
        const { id_producto } = req.params;
        const respuesta = await pool.query("SELECT * FROM producto_oferta WHERE id_producto=?", [id_producto]);
        if (respuesta.length > 0) {
            res.json(respuesta);
            return;
        }
        res.status(404).json({ "mensaje": "Producto no encontrado" });
    }

    // create recibe los datos necesarios en body, y los usa para añadir un nuevo registro
    public async create(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query("INSERT INTO producto_oferta SET ?", [req.body]);
        res.json(respuesta);
    }

    // No sé si update pueda ser útil, no sabría cómo implementarlo
    /*public async update(req: Request, res: Response): Promise<void> {

    }*/

    // delete recibe la combinación de IDs de producto y oferta que se quiere eliminar
    // (en el json deben venir los atributos id_producto e id_oferta)
    public async delete(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query("DELETE FROM producto_oferta WHERE id_producto = ? AND id_oferta = ?", [req.body.id_producto, req.body.id_oferta]);
        res.json(respuesta);
    }

<<<<<<< HEAD
    //Funcion que anula la oferta, recibe un id por medio del body.
    //Lo que hace es que una oferta, la pone en 0 porciento, de tal manera que se guardará en el historial
    //Esta función se ocupa al momento que el carrito pone la cantidad en 0
    public async anularOferta(req: Request, res:Response):Promise<void>{
        const respuesta = await pool.query(`UPDATE producto_oferta SET porc_descuento = 0 WHERE id_producto = ${req.body.id}`)
        res.json(respuesta);
    }
=======
>>>>>>> d9f7238e42c9fe29fdf30f0f7bbede58b152dd58
}

export const productoOfertaController = new ProductoOfertaController();