import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tranning_2/controller/items.dart';
import 'package:tranning_2/custom_widget/text_from_field.dart';
import 'package:tranning_2/view/cart.dart';
import 'package:tranning_2/view/details.dart';
import 'package:tranning_2/view/favorite.dart';
import 'package:tranning_2/view/navbar.dart';


List<Category> denemelist =[
    Category(categoryName: 'Women', categoryId: 132),
    Category(categoryName: 'Men', categoryId: 156),
    Category(categoryName: 'Kids', categoryId: 122),
    Category(categoryName: 'Shoes', categoryId: 243),
    Category(categoryName: 'Home', categoryId: 376),
    Category(categoryName: 'Beauty', categoryId: 198),

];
List<Sliderimg> imgpath =[
  Sliderimg(sliderImg: 'assets/images/slider_1.jpg'),
  Sliderimg(sliderImg: 'assets/images/slider_2.jpg'),
  Sliderimg(sliderImg: 'assets/images/slider_3.jpg'),
  Sliderimg(sliderImg: 'assets/images/slider_4.jpg'),
];


MainClass mainClass=MainClass();
class HomePage extends StatefulWidget {
  int controle;
  HomePage({super.key,this.controle=0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageNo =1;
  late final PageController pagecontroller;
  final TextEditingController _controller = TextEditingController();
  
  int sliderNo = 0;
  late final Timer slidertimer ;

  Timer getTimer(){
   return Timer.periodic(
    const Duration(seconds: 2),
    (timer){
      if (sliderNo == imgpath.length){
        sliderNo = 0;
      }
      pagecontroller.animateToPage(
        sliderNo, 
        duration: const Duration(seconds: 1), 
        curve: Curves.easeInOutCirc
      );
      sliderNo++;
    });
 }
  @override
  void initState() {
    if(widget.controle == 0){
      mainClass.filterdList=[];
      mainClass.filterdList=mainClass.productInfo;
    }
    pagecontroller =PageController();
    slidertimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height*0.06,
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.red),
          ),
          drawer: const NavBar(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:  EdgeInsets.only(
                    left: MediaQuery.of(context).size.width *0.01,
                    top: MediaQuery.of(context).size.width *0.01,
                    right:  MediaQuery.of(context).size.width *0.02,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> MyCart(mainClass: mainClass,)));
                        }, 
                        icon: const Icon(Icons.shopping_cart,
                          color:  Color.fromARGB(255, 142, 141, 141),
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Favorite(
                            mainClass: mainClass,
                          )),);
                        }, 
                        icon: const Icon(Icons.favorite,
                          color:  Color.fromARGB(255, 142, 141, 141),
                        ),
                      ),
                      Expanded(
                        child: MainTextField( 
                          controller: _controller,
                          hintText: 'Search for Items', 
                          curve: 30,
                          prefixIcon: const Icon(Icons.add_shopping_cart,color:  Color.fromARGB(255, 142, 141, 141),),
                          suffixIcon: IconButton( icon:const Icon(Icons.clear,
                                                  color:  Color.fromARGB(255, 142, 141, 141),),
                                                  onPressed: (){
                                                   _controller.clear();
                                                   setState(() {
                                                    if( _controller.text.isEmpty){
                                                      mainClass.filterdList= mainClass.productInfo;
                                                    }
                                                   });
                                                },
                                      ),
                          onChanged: (p0) {
                            setState(() {
                              mainClass.filterItems(p0);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: denemelist.length,
                  itemBuilder: (context,index) =>
                  Padding(
                    padding:  EdgeInsets.only(
                      left: MediaQuery.of(context).size.width *0.03,
                      top: MediaQuery.of(context).size.width *0.01,
                    ),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Center(
                        child: Text(
                          denemelist[index].categoryName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                          ),
                      ),
                      ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                width: MediaQuery.of(context).size.width * 1,
                child: PageView.builder(
                  controller: pagecontroller,
                  onPageChanged: (index){
                    sliderNo = index;
                    setState(() {
                      
                    });
                  },
                  itemBuilder: (context,index){
                    return AnimatedBuilder(animation: pagecontroller, builder: (context,child){
                      return child!;
                    },
                    child: Container(
                      decoration:  BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(image: AssetImage(imgpath[index].sliderImg), fit: BoxFit.fill),
                      ),
                      margin: const EdgeInsets.all(6),
                    ) ,
                    );
                  },
                  itemCount: imgpath.length,
                  ),
              ),
               SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    imgpath.length, 
                    (index)=>  Container(
                      margin: const EdgeInsets.all(2.0),
                      child:  Icon(Icons.circle,size: 12.0,
                      color: sliderNo == index
                      ?const Color.fromARGB(255, 254, 182, 74)
                      :const Color.fromARGB(255, 142, 141, 141),),
                    ),
                  ),
                ),
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
                    itemCount:mainClass.filterdList.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                            builder:(context)=>Details(
                              pageNo: pageNo,
                              mainClass: mainClass,
                              item:mainClass.filterdList[index]),
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
                                child:Image.asset( mainClass.filterdList[index].productImage, fit: BoxFit.fill,)
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: MediaQuery.of(context).size.height*0.09,
                                      child: ListTile(
                                        title: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(text:mainClass.filterdList[index].productName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                                            ]
                                          )
                                        ),
                                        subtitle: RichText(
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'Price : ',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                              TextSpan(text: mainClass.filterdList[index].productPrice.toString(),style: TextStyle(color: Colors.red.shade800,),)
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
                                              mainClass.filterdList[index].isInFavirot = ! mainClass.filterdList[index].isInFavirot;
                                              mainClass.addToFavorit(mainClass.filterdList[index]);
                                            });
                                          },
                                          icon:  Icon(Icons.favorite,
                                                size: 15,
                                                color: mainClass.filterdList[index].isInFavirot?Colors.red:Colors.grey, 
                                              ),
                                      ),
                                      IconButton(
                                          onPressed: (){
                                            setState(() {
                                              mainClass.filterdList[index].isIncart = !mainClass.filterdList[index].isIncart;
                                              mainClass.addCart( mainClass.filterdList[index], );
                                            });
                                          },
                                          icon:   Icon(Icons.add_shopping_cart_outlined,
                                                size: 15,
                                                color: mainClass.filterdList[index].isIncart ? Colors.red:Colors.grey,
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
      ),
    );
  }
}