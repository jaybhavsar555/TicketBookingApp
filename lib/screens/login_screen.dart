import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ticketbookapp/screens/regis_screen.dart';
import 'package:ticketbookapp/utils/app_style.dart';

import '../utils/app_layout.dart';
import 'bottom_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key
  final _formkey= GlobalKey<FormState>();

  //editTeext controller
  final TextEditingController emailController=TextEditingController();
  final TextEditingController passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    //text email field
    final TextFormField emailfield= TextFormField(
      autofocus: false,

      controller: emailController,
      keyboardType: TextInputType.emailAddress,
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
    //password text field
    final TextFormField passwordfield= TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      // validator: (){},
      onSaved: (value){
        passwordController.text=value!;
      },
      textInputAction: TextInputAction.done,
      decoration:  InputDecoration(
        prefixIcon: Icon(Icons.key),
        contentPadding:  EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    final loginbtn=Container(
      
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(30),
        color: Color(0xD91130CE),
        child: MaterialButton(
          padding: EdgeInsets.all(10),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: (){
            //go to the HomeScreen
            Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomBar()));
          },
          child: Text("login",style: Styles.textStyle1.copyWith(color: Colors.white ,fontSize: 17),),
        ),
      ),
    );

    return Scaffold(
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
                      emailfield,
                      Gap(AppLayout.getHeight(17)),
                      passwordfield,
                      Gap(AppLayout.getHeight(27)),
                      loginbtn,
                      Gap(AppLayout.getHeight(5)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Text("Don`t have account?"),
                          Gap(AppLayout.getHeight(3)),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => RegisterationScreen()));
                            },
                            child: Text("SignUp",
                              style: Styles.ticketTextStyle1.copyWith(color: Colors.blue,fontWeight: FontWeight.bold),),
                          )
                        ],
                      )
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
