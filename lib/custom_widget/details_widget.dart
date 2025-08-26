import 'package:flutter/material.dart';
import 'package:tranning_2/controller/items.dart';
import 'package:tranning_2/custom_widget/item_count.dart';

class ImageDtlsWidget extends StatelessWidget {
   final Product item;
  const ImageDtlsWidget({super.key,required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
              alignment: Alignment.bottomRight,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.3,
                  width: MediaQuery.of(context).size.width,
                 // margin: const EdgeInsets.all(3),
                  child:Image.asset(item.productImage,fit: BoxFit.fill,),
                ),
               const ItemCountWidget()
              ],
            );
  }
}