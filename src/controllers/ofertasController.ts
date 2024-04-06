import { Request, Response } from 'express';
import pool from '../database';
class OfertasController {
    public async list(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query('SELECT * FROM oferta');
        res.json(respuesta);
    }

    public async listOne(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const respuesta = await pool.query('SELECT * FROM oferta WHERE id = ?', [id]);
        if (respuesta.length > 0) {
            res.json(respuesta[0]);
            return;
        }
        res.status(404).json({ 'mensaje': 'Oferta no encontrada' });
    }

    public async create(req: Request, res: Response): Promise<void> {
        const resp = await pool.query("INSERT INTO oferta set ?", [req.body]);
        res.json(resp);
    }

    public async update(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        console.log(req.params);
        const resp = await pool.query("UPDATE oferta set ? WHERE id = ?", [req.body, id]);
        res.json(resp);
    }

    public async delete(req: Request, res: Response): Promise<void> {
        const { id } = req.params;
        const resp = await pool.query(`DELETE FROM oferta WHERE id = ${id}`);
        res.json(resp);
    }

    public async ofetasActivas(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query('SELECT * FROM oferta WHERE CURDATE() BETWEEN STR_TO_DATE(fecha_inicio, "%d-%m-%Y") AND STR_TO_DATE(fecha_fin, "%d-%m-%Y");');
        res.json(respuesta);
    }

    public async numOfetasActivas(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query('SELECT COUNT(*) AS num_ofertas_activas FROM oferta WHERE CURDATE() BETWEEN STR_TO_DATE(fecha_inicio, "%d-%m-%Y") AND STR_TO_DATE(fecha_fin, "%d-%m-%Y");');
        res.json(respuesta);
    }

    public async duracionOfertas(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query('SELECT nombre AS Nombre_Oferta, DATEDIFF( STR_TO_DATE(fecha_fin, "%d-%m-%Y"), STR_TO_DATE(fecha_inicio, "%d-%m-%Y") ) + 1 AS Duracion_En_Dias FROM oferta;');
        res.json(respuesta);
    }

    public async ordenarFechaInicio(req: Request, res: Response): Promise<void> {
        const respuesta = await pool.query('SELECT * FROM oferta ORDER BY STR_TO_DATE(fecha_inicio, "%d-%m-%Y") DESC;');
        res.json(respuesta);
    }
}
export const ofertasController = new OfertasController();