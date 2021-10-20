const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')
const cors = require('cors')
const app = express()

const db = mysql.createPool({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'tb_student_details'
})

app.use(cors())
app.use(express.json())
app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json())

app.get("/api/get", (req, res) =>{
    const insertData = "select student_id, student_name, mark_1, mark_2, mark_3, total, result, CASE WHEN @l = total THEN @r ELSE @r := @row + 1 END as rank, @l := total, mark_1, @row := @row + 1 FROM ( select student_id, student_name, mark_1, mark_2, mark_3, sum(total) as total, result from tb_student_marks group by student_id order by total desc ) totals, ( SELECT @r := 0, @row := 0, @l := NULL ) rank"
    db.query(insertData , (error, result) =>{
        res.send(result)
    })
})

app.post("/api/search", (req, res) =>{
    const searchData = req.body.searchvalue
    console.log(searchData)
    const insertData = "select student_id, student_name, mark_1, mark_2, mark_3, total, result, CASE WHEN @l = total THEN @r ELSE @r := @row + 1 END as rank, @l := total, mark_1, @row := @row + 1 FROM ( select student_id, student_name, mark_1, mark_2, mark_3, sum(total) as total, result from tb_student_marks where student_name = ? || result =? group by student_id order by total desc ) totals, ( SELECT @r := 0, @row := 0, @l := NULL ) rank"
    db.query(insertData ,[searchData, searchData ] ,(error, result) =>{
        res.send(result)
        console.log(result)
    })
})

app.post("/api/insert",(req, res)=> {
    const name = req.body.name
    const mark1 = req.body.mark1
    const mark2 = req.body.mark2
    const mark3 = req.body.mark3
    function sum( obj ) {
        var sum = 0;
        for( var el in obj ) {
          if( obj.hasOwnProperty( el ) ) {
            sum += parseFloat( obj[el] );
          }
        }
        return sum;
      }
      var result;
      if(mark1 >= 35 && mark2 >= 35 && mark3 >= 35 ){
          result = "Pass"
      }else{
          result = "Fail"
      }
      var markData = { mark1 , mark2 , mark3 };
      var total = sum( markData );
     console.log(total + "loading sum")

    const insertData = "INSERT INTO tb_student_marks (student_name, mark_1, mark_2, mark_3, total, result) VALUES (?, ?, ?, ?, ?, ?);"
    db.query(insertData ,[name, mark1, mark2, mark3, total, result], (error, result) =>{
        res.send("Data Inserted Successfully")
    })
})

app.listen(3001, ()=> {
    console.log('running on port 3001')
})