import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tranning_2/view/addresses.dart';
import 'package:tranning_2/view/home.dart';


class ProfileSetting extends StatefulWidget {
  const ProfileSetting({super.key});

  @override
  State<ProfileSetting> createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  File? imagefile;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width *0.03,
                    left: MediaQuery.of(context).size.width *0.02,
                    bottom: MediaQuery.of(context).size.width *0.01, 
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,color: Colors.red,),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(controle: 1,)));
                        },
                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: const Text('Save',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundImage: imagefile == null ? const AssetImage('assets/images/person.jpg')
                      : FileImage(imagefile!,),
                      radius: 65,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),
                          color: const Color.fromARGB(255, 237, 85, 83)
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.edit,color: Colors.white,),
                          onPressed: (){
                            setState(() {
                              showImagePicker(context);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.only(left:15,bottom: 15),
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'UserName',
                            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300),
                          ),
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.edit,color: Colors.red,),
                          ),
                        ],
                      ),
                      const Text(
                            'Qutouf',
                            style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.only(left:15,bottom: 15),
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Email',
                            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300),
                          ),
                          IconButton(
                            onPressed: (){
                              
                            }, 
                            icon: const Icon(Icons.edit,color: Colors.red,),
                          ),
                        ],
                      ),
                      const Text(
                            'ghawanmehqq@gmail.com',
                            style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.only(left:15,bottom: 15),
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Phone',
                            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300),
                          ),
                          IconButton(
                            onPressed: (){}, 
                            icon: const Icon(Icons.edit,color: Colors.red,),
                          ),
                        ],
                      ),
                      const Text(
                            '0796987652',
                            style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.only(left:15,bottom: 15),
                  margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Location',
                            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w300),
                          ),
                          IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyAddresses(),));
                            }, 
                            icon: const Icon(Icons.add_box_rounded,color: Colors.red,size: 30,),
                          ),
                        ],
                      ),
                      const Text(
                            'Add Location',
                            style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.width*0.03),
                  child: InkWell(
                          onTap: (){},
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.red.shade400,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Text('My Orders',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      );
  }
   final picker = ImagePicker(); 
  void showImagePicker(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (builder){
        return Card(
          child: Container(
            width:  MediaQuery.of(context).size.width,
            height:  MediaQuery.of(context).size.height/5.2,
            margin: const EdgeInsets.only(top: 8.0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(Icons.image, size: 60.0,color: Colors.red,),
                        SizedBox(height: 12.0),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 15,color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: (){
                      _fromGallery();
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: [
                        Icon(Icons.camera_alt_rounded, size: 60.0,color: Colors.red,),
                        SizedBox(height: 12.0),
                        Text(
                          'Gallery',
                          style: TextStyle(fontSize: 15,color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: (){
                      _fromCamera();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  _fromGallery()async{
    await picker.pickImage(
      source: ImageSource.gallery, imageQuality: 65 
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));
      }
    });
  }
  _fromCamera()async{
    await picker.pickImage(
      source: ImageSource.camera, imageQuality: 65 
    ).then((value){
      if(value != null){
        _cropImage(File(value.path));
      }
    });
  }
  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        
      );
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imagefile = File(croppedFile.path);
      });
    }
  }
}