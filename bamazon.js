var mysql = require("mysql");
var inquirer = require("inquirer");
var request = require("request");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 8889,

  // Your username
  user: "root",

  // Your password
  password: "root",
  database: "bamazon"
});

connection.connect(function(err){
    if(err) throw err;
    console.log("connected as id " + connection.threadId);
    queryPosts();
});

inquirer
  .prompt([
    // Here we create a basic text prompt.
    {
      type: "input",
      message: "What item would you like? (Input item ID)",
      name: "id"
    },
    {
        type: "input",
        message: "How many would you like?",
        name: "number"
    },
  ]).then(function(inquirerResponse){
    var number = inquirerResponse.number;
    var id = inquirerResponse.id;
    var query = connection.query("SELECT * FROM products WHERE item_id=?", [id], function(err, res){
        if(res[0].stock_quantity >= number){
            var subtract = res[0].stock_quantity -= number;
            var total = subtract;
            var price = res[0].price * number;
            var priceTotal = price;
            var updateNumber = connection.query("UPDATE products SET stock_quantity=? WHERE item_id=?", [total, id]);
            console.log("You bought " + number + " " + res[0].product_name + ", your total price is: " + priceTotal + ". There are " + total + " left.");
            connection.end();
        } else{
            console.log("Not enough in stock")
            connection.end();
        }
  })
});

function queryPosts() {
    var query = connection.query("SELECT ALL * FROM products" , function(err, res) {
      for (var i = 0; i < res.length; i++) {
        console.log(res[i].item_id + " | " + res[i].product_name + " | " + res[i].price);
      }
    });
  
    // logs the actual query being run
    // console.log(query.sql);
    // connection.end();
  }