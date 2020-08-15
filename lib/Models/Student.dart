class Student {

  int id;
  String Firstname;
  String Lastname;
  int Grade;
  String _Status;
  String img ="https://cdn.pixabay.com/photo/2020/07/10/12/08/hot-air-balloon-5390488_960_720.jpg";


  Student.withoutInfo()
  {

  }


  Student(String Firstname,String Lastname,int Grade)
  {

    this.Firstname=Firstname;
    this.Lastname=Lastname;
    this.Grade=Grade;


  }

  Student.withId(int id,String Firstname,String Lastname,int Grade)
  {
    this.id=id;
    this.Firstname=Firstname;
    this.Lastname=Lastname;
    this.Grade=Grade;


  }

  String get getStatus
  {
    String message="";
    if(this.Grade>50)
      {
        message="Geçti";
      }
    else if(this.Grade>=40)
      {
        message="Bütünlemeye kaldı";
      }
    else
      {
        message="Kaldı";
      }
    return message;
  }




}