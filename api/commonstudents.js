const commonStudentsRoute = require('express').Router();
const db = require('../db/index');
const students = db['students'];
const teachers = db['teachers'];

const expectedParam = 'teacher';

const getStudent = (teacherName) => {
    const isTeacher = teachers.find(e => e.techer === teacherName);
    if(isTeacher){
        return [...isTeacher.students.map(e=>{
            return students.filter(each => each.id === e).map(e=>e.student)
        })]
    }else{
        return []
    }
}

commonStudentsRoute.get('/commonstudents', (req, res, next) => {
    console.log("params");

    if(!req.query[expectedParam]){
        res.status(404).json({
            message: 'Expecting "teacher" param in query string to retrieve students data '
        })
    }else{
        let students = [];
        if(Array.isArray(req.query[expectedParam])){
            students = [...req.query[expectedParam].map(getStudent)]
        }else{
            students = [...getStudent(req.query[expectedParam])]
        }
        res.status(200).json({
            students: students
        });
    }
});

module.exports = commonStudentsRoute;