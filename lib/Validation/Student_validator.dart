class StudentValidationMixin
{

  String validateFirstname(String value)
  {
    if(value.length<2)
      {
        return "İsim en az 2 karakter olmalıdır";
      }
  }

  String validateLastname(String value)
  {
    if(value.length<2)
      {
        return "Soy isim en az 2 karakter olmalıdır";
      }
  }

  String validateGrade(String value)
  {
    var grade = int.parse(value);
    if(grade<0 || grade>100)
      {
        return "Ögrencinin puanı 0'dan küçük veya 100'den büyük olamaz";
      }
  }


}