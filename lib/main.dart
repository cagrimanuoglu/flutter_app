import 'package:flutter/material.dart';
import 'package:flutterapp/Models/Student.dart';
import 'package:flutterapp/Screens/Student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String Baslik = "Ögrenci Takip Sistemi";

  int not = 15;

  String Sonuc;

  Student selected_student = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1,"cagri", "manuoglu", 100),
    Student.withId(2,"faruk", "yazıcı", 30),
    Student.withId(3,"murat", "sever", 45)
  ];

 // var ogrenciler = ["ahmet yüzak", "mehmet yurtseven", "cagri manuoglu"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Baslik),
        ),
        body: buildBody(context));
  }


  void alertMessage(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: Text("İşlem sonucu"),
      content: Text(mesaj),
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(students[index].img),
                    ),
                    title: Text(students[index].Firstname +
                        " " +
                        students[index].Lastname),
                    subtitle: Text("Sınavdan Aldıgı not : " +
                        students[index].Grade.toString() +
                        " [" +
                        students[index].getStatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].Grade),
                    onTap: () {
                      setState(() {
                        selected_student = students[index];
                        students=students;
                      });
                    },
                  );
                })),
        Text("Seçili ögrenci : " + selected_student.Firstname),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    //SizedBox(width: 3.0),
                    Text("Yeni ögr"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.amberAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.update),
                    SizedBox(width: 3.0),
                    Text("Güncelle"),
                  ],
                ),
                onPressed: () {
                  String mesaj ="Güncellendi";
                  alertMessage(context, mesaj);
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: RaisedButton(
                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.delete),
                    SizedBox(width: 3.0),
                    Text("Sil"),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selected_student);

                  });

                  String mesaj = "Silindi : "+selected_student.Firstname;
                  alertMessage(context, mesaj);
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade > 50) {
      return Icon(Icons.done);
    } else if (grade >= 40) {
      return Icon(Icons.album);
    } else {
      return Icon(Icons.clear);
    }
  }
}
