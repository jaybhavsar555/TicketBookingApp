import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/screens/login_screen.dart';

import '../utils/app_layout.dart';
import '../utils/app_style.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({super.key});

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  final _formkey= GlobalKey<FormState>();

  final TextEditingController firstnameController=TextEditingController();
  final TextEditingController lastnameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();
  final TextEditingController cnfpasswordController=TextEditingController();




  @override
  Widget build(BuildContext context) {
    //first name field
    final TextFormField firstnamefield= TextFormField(
      autofocus: false,

      controller: firstnameController,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value){
        firstnameController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.account_circle),
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "First name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //last name
    final TextFormField lastnamefield= TextFormField(
      autofocus: false,

      controller: lastnameController,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value){
        lastnameController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon:Icon(Icons.account_circle),
        contentPadding:EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Last name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    //email field
    final TextFormField emailfield= TextFormField(
      autofocus: false,

      controller: emailController,
      keyboardType: TextInputType.name,
      // validator: (){},
      onSaved: (value){
        emailController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.email),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //password field
    final TextFormField passwordfield= TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      // validator: (){},
      onSaved: (value){
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.next,
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final TextFormField cnfpasswordfield= TextFormField(
      autofocus: false,
      obscureText: true,
      controller: cnfpasswordController,
      // validator: (){},
      onSaved: (value){
        cnfpasswordController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding:  EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );


    //registration btn
    final signup=Container(

      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color(0xD91130CE),
        child: MaterialButton(
          padding: EdgeInsets.all(10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: (){},
          child: Text("SignUp",style: Styles.textStyle1.copyWith(color: Colors.white ,fontSize: 17),),
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          //backbtn
          leading: IconButton(
            onPressed: (){
              //to navigate to the root
              Navigator.push(context,MaterialPageRoute(builder: (context)=> LoginScreen()));
            },
              icon: Icon(Icons.arrow_back),
            
          ),
      ),
      backgroundColor: Styles.bgColor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                  key: _formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Image.asset("assets/images/ticket.png",fit: BoxFit.contain,),
                      ),
                      Gap(AppLayout.getHeight(40)),
                      firstnamefield,
                      Gap(AppLayout.getHeight(10)),
                      lastnamefield,
                      Gap(AppLayout.getHeight(10)),
                      emailfield,
                      Gap(AppLayout.getHeight(10)),
                      passwordfield,
                      Gap(AppLayout.getHeight(10)),
                      cnfpasswordfield,
                      Gap(AppLayout.getHeight(20)),
                      signup,
                    ],
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }
}
