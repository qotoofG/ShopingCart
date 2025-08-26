class MainClass{
List<Product> favoritList= [];
List<Product>  relativeItems=[];
List<Product> cartList=[];

void filterDtls(Product item){
  relativeItems=filterdList.where((element)=>element.id!=item.id).toList(); 
}
void addToFavorit(Product item ){
  if(item.isInFavirot == true){
    favoritList.add(item);
  }
  else{
    for (var element in filterdList) {
      if (element.id==item.id) {
        favoritList.remove(element);
      }
    }
  }
}
void checkFavirot(){
 favoritList = filterdList.where((element)=>element.isInFavirot==true).toList();
}
void checkCart(){
  cartList = filterdList.where((element)=>element.isIncart==true).toList();
}
void addCart(Product item ){
  if(item.isIncart == true){
    cartList.add(item);
  }
  else{
    for (var element in filterdList) {
      if (element.id==item.id) {
        cartList.remove(element);
      }
    }
  }
}
List<Product> productInfo =[
  Product(id: 1,productImage:'assets/images/sun.jpg' ,productName:'SunGlass',productPrice: 15.56, 
  productDetails:'1pc Plastic Men\'Square Fashion Sunglassess, Suitable For Daily Wear And Vacation, Color Black, Shades Beach Accessories' ),
  Product(id: 2,productImage:'assets/images/bag.jpg' ,productName:'Bag',productPrice: 30 ,
  productDetails:'Lightweight, Business Casual Minimalist Large Capacity Top Handle For Teen Girls Woman College Students, Rookies & White-Collar Workers'),
  Product(id: 3,productImage:'assets/images/shoes.jpg' ,productName:'Shoes',productPrice: 25,
  productDetails:'Retro Round Toe Lace-Up Comfortable Flat Sneakers, Casual And Breathable For Daily Wear, Running, Solid Color Athletic Shoes' ),
  Product(id: 4,productImage:'assets/images/dress.jpg' ,productName:'Dress',productPrice: 50 ,
  productDetails:'PARTHEA Elegant Summer Solid Color Lace Up Backless Ruched Boning Corset Cami Dress, Material Woven Fabric, Fit Type Slim Fit'),
  Product(id: 5,productImage:'assets/images/bag.jpg' ,productName:'Bag',productPrice: 70 ,
  productDetails:'Lightweight, Business Casual Minimalist Large Capacity Top Handle For Teen Girls Woman College Students, Rookies & White-Collar Workers'),
  Product(id: 6,productImage:'assets/images/shoes.jpg' ,productName:'Shoes',productPrice: 10 ,
  productDetails:'Retro Round Toe Lace-Up Comfortable Flat Sneakers, Casual And Breathable For Daily Wear, Running, Solid Color Athletic Shoes'),
  Product(id: 7,productImage:'assets/images/sun.jpg' ,productName:'SunGlass',productPrice: 20.67 ,
  productDetails:'1pc Plastic Men\'Square Fashion Sunglassess, Suitable For Daily Wear And Vacation, Color Black, Shades Beach Accessories'),
  Product(id: 8,productImage:'assets/images/dress.jpg' ,productName:'Dress',productPrice: 100.87 ,
  productDetails:'PARTHEA Elegant Summer Solid Color Lace Up Backless Ruched Boning Corset Cami Dress, Material Woven Fabric, Fit Type Slim Fit')
];
List<Product> filterdList=[];
List<Product> filterItems(String search){
  if (search.isEmpty) {
    filterdList=productInfo;
  }
 else{
   filterdList=productInfo.where((element)=>
   element.productName.toLowerCase().replaceAll('', '').contains(
    search.toLowerCase().replaceAll('', '').trim(),
  )
  ).toList(); 
 }
  return filterdList;
}
}

class Product{
  String productName;
  num productPrice;
  String productImage;
  bool  isInFavirot;
  bool isIncart;
  int id;
  String productDetails;
  int itemCount;
  Product({required this.productImage,required this.productName,required this.productPrice,this.isInFavirot=false,this.isIncart=false,required this.id,required this.productDetails,this.itemCount=1});
}
class Category{
late String categoryName;
late int categoryId;
Category({required this.categoryName,required this.categoryId});
}
class Sliderimg{
  late String sliderImg;
  Sliderimg ({required this.sliderImg});
}
