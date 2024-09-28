const express = require("express");
const jwt = require("jsonwebtoken");
const Usuario = require('../models/usuario'); 
const Persona = require('../models/persona'); 
const auth = require("../middlewares/auth");

const authRouter = express.Router();

authRouter.post('/api/signinGoogle', async (req, res) => {
    try {
        const { email, usuarionombre, playerId } = req.body;

        console.log('Email Recibido:', email);

        if (email) {
            let persona = await Persona.findOne({ where: { email } });

            if (!persona) {
                persona = await Persona.create({
                    nombre: usuarionombre, 
                    email,
                    idrol: 1,
                    telefono: "S/N"
                });
                console.log('Persona añadida:', persona);
            }

            let usuario = await Usuario.findOne({ where: { idpersona: persona.idpersona } });

            if (!usuario) {
                usuario = await Usuario.create({
                    nombreusuario: usuarionombre,  
                    contraseña: "", 
                    token: "",
                    modoOscuro: false,
                    playerid: playerId,
                    idpersona: persona.idpersona,
                });
                console.log('Usuario Creado:', usuario);
            }

            const token = jwt.sign({ id: usuario.id }, 'passwordKey');
            usuario.token = token;
            await usuario.save();

            res.json({ token, ...usuario.toJSON() });
            console.log('User logged in successfully');
        } else {
            res.status(400).json({ msg: 'Un email es requerido' });
        }
    } catch (e) {
        console.error('Error durante el inicio de sesion con Google:', e);
        res.status(500).json({ error: e.message });
    }
});

authRouter.get("/", auth, async (req, res) => {
    const user = await Usuario.findById(req.user);
    res.json({ ...user._doc, token: req.token });
});

module.exports = authRouter;
