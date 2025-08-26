import 'package:flutter/material.dart';
import 'package:tranning_2/controller/items.dart';

class ProductDetails extends StatelessWidget {
  final Product item;
 const ProductDetails({super.key,required this.item});

  @override
  Widget build(BuildContext context) {

    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width*0.05,
                  left: MediaQuery.of(context).size.width*0.03,
                  right: MediaQuery.of(context).size.width*0.03,
                ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03,),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: item.productName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
                        ],
                      ),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: item.productPrice.toStringAsFixed(2),style: const TextStyle(color: Color.fromARGB(255, 210, 27, 27),fontSize:20,fontWeight:  FontWeight.w700),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        Container(
                  margin: const EdgeInsets.only(left: 10,top:4),
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width*0.7,
                  child: ListView(
                    children: [
                      Text(item.productDetails, 
                        style: const TextStyle(fontSize: 12,fontWeight: FontWeight.w200,height: 1.4,),
                      ),
                    ],
                  ),
                ),
      ],
    );
  }
}