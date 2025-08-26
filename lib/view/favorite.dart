import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tranning_2/controller/items.dart';
import 'package:tranning_2/view/details.dart';
import 'package:tranning_2/view/home.dart';

class Favorite extends StatefulWidget {
  MainClass mainClass;
 Favorite({super.key,required this.mainClass});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  int pageNo =2;
  @override
  void initState() {
    widget.mainClass.checkFavirot();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.only(
                    top: MediaQuery.of(context).size.width *0.03,
                    left: MediaQuery.of(context).size.width *0.02,
                  ),
                  child: IconButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(controle: 1,)));
                    },
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.red,),
                  ),
                ),
              ],
            ),
            Expanded(
                child: widget.mainClass.favoritList.isEmpty?
                Center(
                  child: Lottie.asset('assets/animation/empty.json'),
                )
                :Container(
                  padding: const EdgeInsets.all(5),
                  height: MediaQuery.of(context).size.height*0.49,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 7,
                      mainAxisExtent: MediaQuery.of(context).size.height*0.15,
                      mainAxisSpacing: 7,
                      ), 
                    itemCount: widget. mainClass.favoritList.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder:(context)=>Details(
                              pageNo: pageNo,
                              mainClass: widget.mainClass,
                              item:widget.mainClass.favoritList[index]),
                            ),
                          );
                        },
                        child: Container(
                          padding:const EdgeInsets.only(right: 5),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 244, 222, 189),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                                height: MediaQuery.of(context).size.height*1,
                                child:Image.asset( widget. mainClass.favoritList[index].productImage, fit: BoxFit.fill,)),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.09,
                                      child: ListTile(
                                        title: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(text: widget. mainClass. favoritList[index].productName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                                            ]
                                          )
                                        ),
                                        subtitle: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Price : ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                              TextSpan(text: widget. mainClass. favoritList[index].productPrice.toString(),style: TextStyle(color: Colors.red.shade800,),)
                                            ]
                                          )
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children:[
                                        IconButton(
                                          onPressed: (){
                                            setState(() {
                                              widget.mainClass.favoritList[index].isInFavirot = ! widget. mainClass.favoritList[index].isInFavirot;
                                              widget.mainClass.addToFavorit( widget.mainClass.favoritList[index], );
                                            });
                                          },
                                          icon:  Icon(Icons.favorite,
                                                size: 15,
                                                color: widget. mainClass.favoritList[index].isInFavirot?Colors.red:Colors.grey, 
                                              ),
                                      ),
                                      IconButton(
                                          onPressed: (){
                                            setState(() {
                                              
                                            });
                                          },
                                          icon:  const Icon(Icons.add_shopping_cart_outlined,
                                                size: 15,
                                                color: Colors.grey, 
                                              ),
                                      ),
                                      ]
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
