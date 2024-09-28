const { Sequelize, DataTypes } = require('sequelize');
const sequelize = require('../config/db');
const Persona = sequelize.define('Persona', {
  idpersona: {
    type: DataTypes.INTEGER,
    primaryKey: true,
    autoIncrement: true,
    field: 'idpersona',
  },
  nombre: {
    type: DataTypes.STRING,
    allowNull: true,
    trim: true,
  },
  email: {
    type: DataTypes.STRING,
    allowNull: true,
    validate: {
      isEmail: {
        msg: 'email valido',
      },
    },
  },
  telefono:{
    type: DataTypes.STRING,
    allowNull: true
  },
  idrol: {
    type: DataTypes.INTEGER,
    allowNull: true,
  },
}, {
  tableName: 'persona', 
  timestamps: false

});

module.exports = Persona;
