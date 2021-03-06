var express  = require('express'); 
var app = express(); 

var port = process.env.port || 1337; 

var mssql = require('mssql'); 


// параметры соединения с бд
var config = {
	
	driver: 'tedious',   // драйвер mssql
	user: 'demo_user',   // пользователь базы данных
	password: '12345', 	 // пароль пользователя 
	server: 'localhost', // хост
	database: 'demo',    // имя бд
	port: 1433,			 // порт, на котором запущен sql server
    pool: {
        max: 10, // максимальное допустимое количество соединений пула 
        min: 0,  // минимальное допустимое количество соединений пула 
        idleTimeoutMillis: 30000 // время ожидания перед завершением неиспользуемого соединения 
    }
	
}

app.use(function(req, res) { 

	var connection = new mssql.Connection(config); 

	connection.connect(function(err){
		
		// конструктор для предварительного форматирования запросов к бд - PreparedStatement
		
	
			var ps = new mssql.PreparedStatement(connection); 
			
			// метод input позволяет указать значение параметра, который будет использован в запросе  
			// аргументы: 
			
			// name - имя параметра 
			// type - SQL тип данных 
			
			ps.input('param', mssql.Int);
			
			// подготовка запроса 
			ps.prepare('SELECT * FROM items WHERE id=@param ', function(err) {
				
				if (err) console.log(err); 

				// выполнение запроса 
				ps.execute({param: 2}, function(err, recordset) {
					if (err) console.log(err); 
					
					res.send(recordset[0].description); 
					console.log('prepared statement executed'); 
					
					
					// метод unprepare возвращает текущее соединение в пул соединений 
					ps.unprepare(function(err) {
						if (err) console.log(err); 
						console.log('statement unprepared')
					});
				});
			})
		
	})
}); 

app.listen(port, function() { 

	console.log('app listening on port ' + port); 

}); 