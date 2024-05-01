class UserModel{

  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? password;
  // Constructor using named parameters
  UserModel({this.uid,this.email,this.firstName,this.lastName,this.password});


  //fn to receive the data from server
  factory UserModel.fromMap(map)=> UserModel(
        uid: map["uid"],
        email: map["email"],
        firstName: map["firstName"],
        lastName: map["lastName"],
    password: map["password"]
      );

  //fn to send the data to server
  Map<String,dynamic> toMap(){
    return{
      'uid':uid,
      'email':email,
      'firstName': firstName,
      'lastName':lastName,
      'password':password
    };
  }

}