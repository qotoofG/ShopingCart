import 'package:flutter/material.dart';
import 'package:tranning_2/controller/location_controller.dart';

MainLocation mainLocation=MainLocation();
class SelectedAddresses extends StatefulWidget {
  const SelectedAddresses({super.key});

  @override
  State<SelectedAddresses> createState() => _SelectedAddressesState();
}

class _SelectedAddressesState extends State<SelectedAddresses> {
  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.only(left: 8,right: 8),
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height*0.48,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Container(
                    decoration:  const BoxDecoration(
                      color: Color.fromARGB(255, 235, 228, 228),
                      borderRadius: BorderRadius.all(Radius.circular(15),),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.076,
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 15, left: 20),
                          child: Text('Location: Amman 204802'),
                        ),
                        Positioned(
                          top: -6,
                          right: -3,
                          child:IconButton(
                            onPressed: (){}, 
                            icon:const Icon(Icons.check_box_rounded, color: Colors.red,)
                            
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height:MediaQuery.of(context).size.height *0.01 ,
                  ),
                ],
              ),
            );
  }
}
// ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: denemelist.length,
//                   itemBuilder: (context,index) =>
//                   Padding(
//                     padding:  EdgeInsets.only(
//                       left: MediaQuery.of(context).size.width *0.03,
//                       top: MediaQuery.of(context).size.width *0.01,
//                     ),
//                     child: SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.1,
//                       width: MediaQuery.of(context).size.width * 0.2,
//                       child: Center(
//                         child: Text(
//                           denemelist[index].categoryName,
//                           style: const TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.red,
//                           ),
//                           ),
//                       ),
//                       ),
//                   ),
//                 ),