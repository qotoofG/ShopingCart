import 'package:flutter/material.dart';
import 'package:tranning_2/controller/items.dart';
import 'package:tranning_2/custom_widget/details_widget.dart';
import 'package:tranning_2/custom_widget/product_info.dart';
import 'package:tranning_2/view/favorite.dart';
// import 'package:tranning_2/view/home.dart';

class Details extends StatefulWidget {
  Product item;
  int pageNo;
  MainClass mainClass;
  Details({super.key,required this.item,required this.mainClass,required this.pageNo});

  @override
  State<Details> createState() => _DetailsState();
}
 
class _DetailsState extends State<Details> {
  //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!//
   // final int counter=0;
  @override
  void initState() {
    widget.mainClass.filterDtls(widget.item);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  
    return SafeArea(
      child: Scaffold(
        body: PopScope(
          canPop: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width *0.03,
                      left: MediaQuery.of(context).size.width *0.02,
                    ),
                    child: IconButton(
                      onPressed: (){
                        if(widget.pageNo==2){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite(mainClass:widget. mainClass)));
                        }
                        else if(widget.pageNo==1){
                          Navigator.pop(context);
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }
                      },
                      icon: const Icon(Icons.arrow_back_ios,color: Colors.red,),
                    ),
                  ),
                ],
              ),
              ImageDtlsWidget(
                item: widget.item,
              ),
              ProductDetails(
                item: widget.item
              ),
              Expanded(
                child:Container(
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
                    itemCount: widget. mainClass.relativeItems.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder:(context)=>Details(
                              pageNo: widget.pageNo,
                              mainClass: widget.mainClass,
                              item:widget.mainClass.relativeItems[index]),
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
                                child:Image.asset( widget. mainClass.relativeItems[index].productImage, fit: BoxFit.fill,)),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.09,
                                      child: ListTile(
                                        title: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(text: widget.mainClass.relativeItems[index].productName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                                            ]
                                          )
                                        ),
                                        subtitle: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Price : ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                              TextSpan(text: widget. mainClass.relativeItems[index].productPrice.toString(),style: TextStyle(color: Colors.red.shade800,),)
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
                                              widget.mainClass.relativeItems[index].isInFavirot = ! widget.mainClass.relativeItems[index].isInFavirot;
                                              widget.mainClass.addToFavorit(widget.mainClass.relativeItems[index]);
                                            });
                                          },
                                          icon:  Icon(Icons.favorite,
                                                size: 15,
                                                color: widget. mainClass.relativeItems[index].isInFavirot?Colors.red:Colors.grey, 
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 244, 222, 189),
          selectedItemColor: const Color.fromARGB(255, 121, 120, 120),
          items: [
            BottomNavigationBarItem(
              label: "add to cart",
              icon:Icon(
                Icons.add_shopping_cart,
                color: widget.item.isIncart ? Colors.red : const Color.fromARGB(255, 121, 120, 120),
                ),
            ),
            BottomNavigationBarItem(
              label: "add to favoraite",
              icon:Icon(
                Icons.favorite,
                color: widget.item.isInFavirot ? Colors.red :  const Color.fromARGB(255, 121, 120, 120),
              )
            )
          ],
          onTap: (index){
             setState(() {
               if(index == 1){
                widget.item.isInFavirot= ! widget.item.isInFavirot;
                widget.mainClass.addToFavorit(widget.item);
              }
              // else to add to cart !!!!!
              else{
                widget.mainClass.filterdList[index].isIncart = !widget.mainClass.filterdList[index].isIncart;
                widget.mainClass.addCart( widget.mainClass.filterdList[index], );
              }
            });
          },
        ),
      ),
    );
  }
}
