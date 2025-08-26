import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tranning_2/view/login.dart';
import 'package:tranning_2/view/setting.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children:  [
             ListTile(
              leading: const Icon(Icons.account_circle, size: 85.0,),
              trailing: IconButton(onPressed: (){Navigator.pop(context);}, 
                           icon: const Icon(Icons.clear, size: 35.0,),
                        )
            ),
            SizedBox(
              height:MediaQuery.of(context).size.height * 0.05,
            ),
            ListTile(
              leading: const Icon(Icons.person,),
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Name: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Qutouf Ghawanmeh',style: TextStyle(color: Color.fromARGB(255, 176, 107, 102),fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.female,),
              title: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Gender: ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    TextSpan(text: 'Female',style: TextStyle(color: Color.fromARGB(255, 176, 107, 102),fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings,),
              title: const Text('Settings',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfileSetting()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout,),
              title: const Text('Log Out ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                  print("signOut");
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>const Login(),),);
                },);
                
              },
            ),
          ],
        ),
      ),
    );
  }
}