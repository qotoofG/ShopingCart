// import 'package:flutter/material.dart';
// import 'package:tranning_2/controller/items.dart';
// import 'package:tranning_2/view/details.dart';

// class Mygrid extends StatefulWidget {
// final int pageNo;
//   MainClass mainClass;
//    Product? item;
//    Mygrid({super.key,required this.mainClass,this.item,required this.pageNo});

//   @override
//   State<Mygrid> createState() => _MygridState();
// }

// class _MygridState extends State<Mygrid> {

//   @override
//   void initState() {
//     widget.mainClass.filterdList=[];
//     //widget.mainClass.filterdList.addAll(widget.mainClass.productInfo);
     
   
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//                 child:Container(
//                   padding: const EdgeInsets.all(5),
//                   height: MediaQuery.of(context).size.height*0.4,
//                   width: MediaQuery.of(context).size.width,
//                   child: GridView.builder(
//                     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 7,
//                       mainAxisExtent: MediaQuery.of(context).size.height*0.15,
//                       mainAxisSpacing: 7,
//                       ), 
//                     itemCount:widget.pageNo==2?
//                     widget.mainClass.relativeItems.length
//                     :
//                     widget.mainClass. filterdList.length,
//                     itemBuilder: (context,index){
//                       return InkWell(
//                         onTap: (){
//                           Navigator.push(context, MaterialPageRoute(
//                             builder:(context)=>Details(
//                               // pageNo: 1,
//                               mainClass: widget.mainClass,
//                               item:widget.mainClass.filterdList[index]),
//                             ),
//                           );
//                         },
//                         child: Container(
//                           padding:const EdgeInsets.only(right: 5),
//                           decoration: const BoxDecoration(
//                             color: Color.fromARGB(255, 244, 222, 189),
//                             borderRadius: BorderRadius.all(Radius.circular(20))
//                           ),
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 70,
//                                 height: MediaQuery.of(context).size.height*1,
//                                 child:Image.asset(
//                                   widget.pageNo==2?
//                     widget.mainClass.relativeItems[index].productImage
//                     :
//                                   widget.mainClass.filterdList[index].productImage, fit: BoxFit.fill,)),
//                               Expanded(
//                                 child: Column(
//                                   children: [
//                                     SizedBox(
//                                       height: MediaQuery.of(context).size.height*0.09,
//                                       child: ListTile(
//                                         title: RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               TextSpan(text:widget.mainClass. filterdList[index].productName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
//                                             ]
//                                           )
//                                         ),
//                                         subtitle: RichText(
//                                           text: TextSpan(
//                                             children: [
//                                               const TextSpan(
//                                                 text: 'Price : ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
//                                               TextSpan(text:
//                                               widget.pageNo==2?
//                     widget.mainClass.relativeItems[index].productPrice.toString()
//                     :
//                                               widget.mainClass. filterdList[index].productPrice.toString(),style: TextStyle(color: Colors.red.shade800,),)
//                                             ]
//                                           )
//                                         ),
//                                       ),
//                                     ),
//                                     Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children:[
//                                         Button(
//                                           onPressed: (){
//                                             setState(() {
//                                                widget.mainClass.filterdList[index].isInFavirot = !  widget.mainClass.filterdList[index].isInFavirot;
//                                                widget.mainClass.addToFavorit(  widget.mainClass.filterdList[index], );
//                                             });
//                                           },
//                                           icon:  Icon(Icons.favorite,
//                                                 size: 15,
//                                                 color: widget.mainClass.filterdList[index].isInFavirot?Colors.red:Colors.grey, 
//                                               ),
//                                       ),
//                                       IconButton(
//                                           onPressed: (){
//                                             setState(() {
                                              
//                                             });
//                                           },
//                                           icon:  const Icon(Icons.add_shopping_cart_outlined,
//                                                 size: 15,
//                                                 color: Colors.grey, 
//                                               ),
//                                       ),
//                                       ]
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               );
//   }
// }