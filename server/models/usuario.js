const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Usuario = sequelize.define('Usuario', {
  idusuario: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    field: 'idusuario', 
  },
  nombreusuario: {
    type: DataTypes.STRING,
    allowNull: false,
    trim: true,
  },
  contraseña: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  token: {
    type: DataTypes.STRING,
  },
  modoOscuro: {
    type: DataTypes.BOOLEAN,
    defaultValue: false,
  },
  playerid: {
    type: DataTypes.STRING,
    defaultValue: null,
  },
  idpersona: {
    type: DataTypes.INTEGER,
    allowNull: false,
  },
}, {
  tableName: 'usuario',
  timestamps: false
 
});

module.exports = Usuario;
