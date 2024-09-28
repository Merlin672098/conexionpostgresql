const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('prueba', 'postgres', 'qwerty', {
  host: 'localhost',
  dialect: 'postgres',
  port: 5432,
});

sequelize.authenticate()
  .then(() => {
    console.log('========Conneccion Exitosa a la base de datos!');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });

sequelize.sync({ force: false })
  .then(() => {
    console.log('========Base de datos sincronizada!');
  })
  .catch(err => console.error('Unable to create table:', err));

module.exports = sequelize;
