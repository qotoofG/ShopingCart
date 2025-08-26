import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranning_2/custom_widget/text_from_field.dart';
import 'package:tranning_2/view/home.dart';


class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
 
class _CreateAccountScreenState extends State<CreateAccountScreen> {
  
late  bool securetext ;
 final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    securetext =true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                          left: MediaQuery.of(context).size.width *0.02,
                        ),
                          child: IconButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.02,
                    ),
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.05,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width*0.05,
                      right: MediaQuery.of(context).size.width*0.05
                      ),
                      child: MainTextField(
                        curve: 15,
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.person,
                                color: Colors.white,
                              ),
                        labelText: 'UseName',
                        validator: (name){
                          if(name == null || name.isEmpty){
                            return 'Please Enter your Name';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *0.04,
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
                      height: MediaQuery.of(context).size.height *0.04,
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
                      height: MediaQuery.of(context).size.height *0.04,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if (_formkey.currentState!.validate()){
                          FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).then( (value){
                          print("account created");
                          Navigator.push(context,
                         MaterialPageRoute(builder: (context)=> HomePage(),),);
                        });
                        }
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 249, 101, 2),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all( Radius.circular(20),),
                        ),
                        padding:const EdgeInsets.all(20.0),
                      ),
                      child: const Text('Create',style: TextStyle(color: Colors.white,fontSize: 18,),),
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