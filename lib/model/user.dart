class User {
  final int index;
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final String pictureSmall;
  final String pictureLarge;
  final String gender;
  final String dob;

  User(
      {required this.index,
        required this.fname,
        required this.lname,
        required this.email,
        required this.phone,
        required this.pictureSmall,
        required this.pictureLarge,
        required this.gender,
        required this.dob});
}