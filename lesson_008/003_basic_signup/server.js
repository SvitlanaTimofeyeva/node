var express = require('express');
var app = express(); 

var cookieParser = require('cookie-parser');
var session = require('express-session'); 
var bodyParser = require('body-parser'); 
var path = require('path'); 

var jsonParser = bodyParser.json();
app.use(jsonParser);  

var port = process.env.port || 1337;


// создание хранилища для сессий 
var sessionHandler = require('./js/session_handler'); 
var store = sessionHandler.createStore(); 

// создание сессии 
app.use(cookieParser());
app.use(session({
    store: store,
    resave: false,
    saveUninitialized: true,
    secret: 'supersecret'
})); 


app.set('views', './pages');
app.set('view engine', 'ejs');

// пользователи 
var users = [
{ username: 'admin', password: '12345' }
]; 

app.get('/', function (req, res) {
    // загрузить страницу регистрации пользователей
    res.render('sign_up'); 
});

app.post('/signup', function (req, res) {
    // регистрация нового пользователя  

    var user = {
        username: req.body.username,
        password: req.body.password
    }

    users.push(user); 

    res.status(200).send('OK'); 
}); 

app.get('/login', function (req, res) {

    res.sendFile(path.join(__dirname, 'index.html'));


});

app.post('/login', function(req, res) {
   
   var foundUser; 

   	  // поиск пользователя в массиве users 
	  for (var i = 0; i < users.length; i++) {
	      var u = users[i];
	      console.log(users); 
	    if (u.username == req.body.username && u.password == req.body.password) {
	      foundUser = u.username
	     }      
	  }

	  if (foundUser !== undefined) {

	    req.session.username = req.body.username;
	    console.log("Login succeeded: ", req.session.username)

	    res.send('Login successful: ' + 'sessionID: ' + req.session.id + '; user: ' +  req.session.username);
	  } else {

	    console.log("Login failed: ", req.body.username)
	    res.status(401).send('Login error');
	  }

}); 

app.get('/logout', function(req, res) {
    req.session.username = '';
    console.log('logged out'); 
	res.send('logged out!');  
}); 

// ограничение доступа к контенту на основе авторизации 
app.get('/admin', function (req, res) {
    // страница доступна только для админа 
    if (req.session.username == 'admin') {
        console.log(req.session.username + ' requested admin page');
        res.render('admin_page');
    } else {
        res.status(403).send('Access Denied!');
    }

}); 

app.get('/user', function (req, res) {

    // страница доступна для любого залогиненного пользователя 
    if (req.session.username.length > 0) {
        console.log(req.session.username + ' requested user page');
        res.render('user_page');
    } else {
        res.status(403).send('Access Denied!');
    }

});

app.get('/guest', function (req, res) {

    // страница без ограничения доступа 
    res.render('guest_page');
}); 

app.listen(port, function () {
    console.log('app running on port ' + port);
}); 
