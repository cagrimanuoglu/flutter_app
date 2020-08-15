import 'package:flutter/material.dart';
import 'package:flutterapp/Models/Student.dart';
import 'package:flutterapp/Validation/Student_validator.dart';
import 'package:flutterapp/main.dart';

class StudentAdd extends StatefulWidget {

  List<Student> students;
  StudentAdd(List<Student> students)
  {
    this.students = students;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(students);
  }
}

class _StudentAddState extends State<StudentAdd> with StudentValidationMixin {
  List<Student> students;
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  _StudentAddState(List<Student> students)
  {
    this.students = students;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni Ögrenci ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
             buildFirstnameField(),
              buildLastnameField(),
              buildGradeField(),
              buidSubmitButton()
            ],
          ),
        ),
      )
    );
  }

  Widget buildFirstnameField() {

     return TextFormField(
      decoration: InputDecoration(labelText: "Ögrenci Adı",hintText: "Cagri"),
      validator: validateFirstname ,
      onSaved: (String value)
      {
        student.Firstname = value;
      },
    );


  }

  Widget buildLastnameField() {

    return TextFormField(
      decoration: InputDecoration(labelText: "Ögrenci Soyadı",hintText: "manuoglu"),
      validator: validateLastname ,
      onSaved: (String value)
      {
        student.Lastname = value;
      },
    );


  }

  Widget buildGradeField() {

    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not",hintText: "100"),
      validator: validateGrade ,
      onSaved: (String value)
      {
        student.Grade = int.parse(value);
      },
    );


  }

  Widget buidSubmitButton() {

    return RaisedButton(

      child: Text("Kaydet") ,
      onPressed: ()
      {
          if(formKey.currentState.validate())
            {
              formKey.currentState.save();

             /* for(Student s in students)
              {
                print(s.Firstname);
              }*/
              students.add(student);


              Navigator.pop(context);

            }
      },
    );


  }

  void saveStudent() {

    print(student.Firstname);
    print(student.Lastname);
    print(student.Grade);



  }
}
