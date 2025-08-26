import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranning_2/custom_widget/text_from_field.dart';
import 'package:tranning_2/view/create_account.dart';
import 'package:tranning_2/view/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
class _LoginState extends State<Login> {
 late  bool securetext ;
 final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    securetext =true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
               decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors:[
                    Color.fromARGB(255, 216, 134, 121),
                    Color.fromARGB(255, 237, 117, 48),
                    ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(
                          top: MediaQuery.of(context).size.width *0.03,
                          left: MediaQuery.of(context).size.width *0.05,
                        ),
                        child: Image.asset(
                          'assets/images/login_pic.png',
                          height: 100,
                          width: 150,
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                   const Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.05,
                      right: MediaQuery.of(context).size.width*0.05
                    ),
                    child: MainTextField(
                      controller: _emailController,
                      curve: 15,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person,
                              color: Colors.white,
                            ),
                      labelText: 'Email',
                      validator: (name){
                        if(name == null || name.isEmpty){
                          return 'Please Enter your Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.05,
                      right: MediaQuery.of(context).size.width*0.05
                    ),
                    child: MainTextField(
                      controller: _passwordController,
                      curve: 15,
                      keyboardType: TextInputType.visiblePassword,
                      obscure: securetext,
                      prefixIcon: const Icon(Icons.lock,
                                    color: Colors.white,),
                      suffixIcon: IconButton(
                          icon:securetext==true?const Icon(Icons.visibility_off,color: Colors.white,):const Icon(Icons.visibility,color: Colors.white,) ,
                          onPressed:(){
                            setState(() {
                              securetext =   !securetext ;
                  
                            });
                          },
                        ),
                        labelText: 'Password',
                        validator: (pass){
                          if(pass == null || pass.isEmpty){
                            return 'Please Enter your Password';
                          }
                          return null;
                        },
                      ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03
                  ),
                  ElevatedButton(
                    onPressed: (){
                      if (_formkey.currentState!.validate()) {
                        FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then((value) {
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context)=> HomePage(),),);  
                        },);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 249, 101, 2),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      padding:const EdgeInsets.all(20.0),
                      shadowColor: Colors.black,
                      elevation: 5,
                    ), 
                    child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 18,),),
                    ),
                  // InkWell(
                  //   onTap: ()=>print("pressed"),
                  //   child: Container(
                  //     padding: const EdgeInsets.all(20.0),
                  //     margin: const EdgeInsets.all(20.0),
                  //     decoration: BoxDecoration(
                  //       color: Colors.brown[700],
                  //       border: Border.all(),
                  //       boxShadow: const [
                  //          BoxShadow(
                  //           blurRadius: 5.0,
                  //           offset: Offset(-2, 5),
                  //         ),
                  //       ],
                  //       borderRadius: const BorderRadius.only(
                  //         bottomLeft: Radius.circular(20),
                  //         topLeft: Radius.circular(20)
                  //       ),
                  //     ),
                  //     child:  const Text(
                  //       'Press to login',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03
                  ),
                  TextButton(
                    onPressed: ()=>Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>const
                     CreateAccountScreen(),),), 
                    child: const Text(
                      'Create account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ), 
                    ),
                ],
              ),
            ),
          ),
        ),
      )
      );
  }
}