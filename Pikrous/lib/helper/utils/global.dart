String? checkLength(
    String value, int length, String nullInfo, String lengthInfo) {
  if (value == '') {
    return nullInfo;
  }
   else if (value.length < length) {
    return lengthInfo;
  }
  return null;
}

// String saveUser(int id, String name, String email, String password){
  
// }

late dynamic userData;

late int id2;
late String name;
late String phoneNumber2;
late String email2;