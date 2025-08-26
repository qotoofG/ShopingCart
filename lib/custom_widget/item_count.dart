import 'package:flutter/material.dart';

class ItemCountWidget extends StatefulWidget {
  const ItemCountWidget({super.key});
  
  @override
  State<ItemCountWidget> createState() => _ItemCountWidgetState();
}

class _ItemCountWidgetState extends State<ItemCountWidget> {
  late int count;
  @override
  void initState() {
    count = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
                  right: 10,
                  bottom: 10,
                  child: Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.height*0.04,
                        decoration: const BoxDecoration(
                        color: Colors.white38,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft: Radius.circular(15))
                        ),
                        child: IconButton(icon:const Icon(Icons.add,size: 15,),
                        onPressed: (){
                          setState(() {
                            count++;
                          });
                        },
                        ),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height*0.05 ,
                        color: Colors.black,
                        indent: 0.5,
                        thickness: 5,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.height*0.04,
                        color: Colors.white38,
                        child:Center(child: Text(count.toString())),
                      ),
                      Divider(
                        height: MediaQuery.of(context).size.height*0.05 ,
                        color: Colors.black,
                        indent: 0.5,
                        thickness: 5,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.05,
                        width: MediaQuery.of(context).size.height*0.04,
                        decoration: const BoxDecoration(
                         color: Colors.white38,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                        ),
                        child:Center(
                          child: IconButton(icon:const Icon(Icons.remove,size: 15,),
                          onPressed: (){
                           setState(() {
                             if(count == 0){
                              count = 0;
                             }
                             else{
                              count--;
                             }
                           });
                           },
                          ),
                        ),
                      ),
                    ],
                  ),
            );
  }
}