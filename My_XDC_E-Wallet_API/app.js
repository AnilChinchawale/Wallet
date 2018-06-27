var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var balance = require('./routes/balance');
var blockNumber = require('./routes/blockNumber');
var call = require('./routes/call');
var estimateGas = require('./routes/estimateGas');
var gasPrice = require('./routes/gasPrice');
var getTransactionCount = require('./routes/getTransactionCount');
var sendRawTransaction = require('./routes/sendRawTransaction');
var transactionByHash = require('./routes/transactionByHash');




var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/balance', balance);
app.use('/blockNumber', blockNumber);
app.use('/call', blockNumber);
app.use('/estimateGas', blockNumber);
app.use('/gasPrice', blockNumber);
app.use('/getTransactionCount', blockNumber);
app.use('/sendRawTransaction', blockNumber);
app.use('/transactionByHash', blockNumber);



// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;