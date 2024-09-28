const { Sequelize } = require('sequelize');

const sequelize2 = new Sequelize('backup_defensoria', 'postgres', 'qwerty', {
  host: 'localhost',
  dialect: 'postgres',
  port: 5432,
});

sequelize2.authenticate()
  .then(() => {
    console.log('========Conneccion Exitosa a la base de datos2!');
  })
  .catch(err => {
    console.error('Unable to connect to the database:', err);
  });

  sequelize2.sync({ force: false })
  .then(() => {
    console.log('========Base de datos sincronizada!');
  })
  .catch(err => console.error('Unable to create table:', err));

module.exports = sequelize2;
