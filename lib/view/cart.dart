import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tranning_2/controller/items.dart';
import 'package:tranning_2/view/home.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
//make the android compatible with android !!!!!!!!!!!!!!!!! 
class MyCart extends StatefulWidget {
  MainClass mainClass;
  MyCart({super.key,required this.mainClass});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  Map<String,dynamic>? payment;
  int currentstep =0;
  String pay = 'pay';
   @override
    void initState() {
      Stripe.instance.applySettings();
      widget.mainClass.checkCart();
      super.initState();
    }
  List<Step> getSteps() =>[
    Step(
      state: currentstep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentstep>=0,
      title: const Text('My Cart'), 
      content: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height*0.59,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: widget.mainClass.cartList.length,
          itemBuilder: (context,index) => Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 235, 228, 228),
                  borderRadius: BorderRadius.all(Radius.circular(15),),
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.13,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.33,
                      height: MediaQuery.of(context).size.height*1,
                      child:Image.asset( widget.mainClass.cartList[index].productImage, fit: BoxFit.fill,)
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.13,
                          width: MediaQuery.of(context).size.width*0.507,
                          child:  Stack(
                            children: [ListTile(
                              title: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text:widget.mainClass.cartList[index].productName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                                  ]
                                )
                              ),
                              subtitle: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: '\$${widget.mainClass.cartList[index].productPrice.toString()}',style: TextStyle(color: Colors.red.shade800,),)
                                  ]
                                )
                              ),
                            ),
                            Positioned(
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
                                          widget.mainClass.cartList[index].itemCount++;
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
                                    child:Center(child: Text(widget.mainClass.cartList[index].itemCount.toString())),
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
                                      child: IconButton(icon: widget.mainClass.cartList[index].itemCount == 1 ? const Icon(Icons.delete,size: 15,): const Icon(Icons.remove,size: 15,),
                                      onPressed: (){
                                        setState(() {
                                          if(widget.mainClass.cartList[index].itemCount == 1){
                                            setState(() {
                                              widget.mainClass.cartList[index].isIncart = ! widget. mainClass.cartList[index].isIncart;
                                              widget.mainClass.addCart( widget.mainClass.cartList[index], );
                                            }); 
                                          }
                                          else{
                                            widget.mainClass.cartList[index].itemCount--;
                                          }
                                        });
                                      },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )
        ),
      )
    ),
    Step(
      state: currentstep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentstep>=1,
      title: const Text('Checkout'), 
      content: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height*0.59,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 228, 228),
                borderRadius: BorderRadius.all(Radius.circular(15),),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.076,
              child: RadioListTile(
                value: 'Visa',
                groupValue: pay,
                onChanged: (selectedmethod)async{
                  setState((){
                    pay = selectedmethod!;
                  });
                  await makePaymant();
                },
                activeColor: Colors.red,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Visa'),
                    Image.asset(
                      'assets/images/visa.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  ],
                )
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 235, 228, 228),
                borderRadius: BorderRadius.all(Radius.circular(15),),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.076,
              child: RadioListTile(
                value: 'Cash',
                groupValue: pay,
                onChanged: (selectedmethod){
                  setState(() {
                    pay = selectedmethod!;
                  });
                },
                activeColor: Colors.red,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Cash'),
                    Image.asset(
                      'assets/images/cash.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  ],
                )
              ),
            ),
          ],
        )
      )
    ),
    Step(
      isActive: currentstep>=2,
      title: const Text('Complete'), 
      content: Container(
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height*0.59,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Lottie.asset('assets/animation/payment.json'),
        ),
      )
    )
  ];
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
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width *0.01,
                    left: MediaQuery.of(context).size.width *0.02,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios,color: Colors.red,),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            Expanded(
              child: widget.mainClass.cartList.isEmpty? 
              Center(
                child: Lottie.asset('assets/animation/cart.json'),
              )
              :SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.8,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(primary: Colors.red),
                  ),
                  child: Stepper(
                    steps: getSteps(),
                    type: StepperType.horizontal,
                    currentStep: currentstep,
                    onStepContinue: ()async{
                      currentstep == getSteps().length-1 ? Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(controle: 1,)))
                      :setState(() {
                        currentstep+=1;
                      });
                    },
                    onStepCancel: (){
                      currentstep == 0 ? null
                      :setState(() {
                        currentstep-=1;
                      });
                    },
                    controlsBuilder:(BuildContext context, ControlsDetails details){
                      return Container(
                        margin: const EdgeInsets.only(top:30),
                        child: Row(
                          mainAxisAlignment: currentstep !=0 && currentstep !=2 ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                          children: [
                            if(currentstep !=0 && currentstep !=2)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all( Radius.circular(10),),
                                ),
                                padding:const EdgeInsets.all(13.0),
                              ), 
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                            ),
                            ElevatedButton(
                              onPressed: details.onStepContinue,
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all( Radius.circular(10),),
                                ),
                                padding:const EdgeInsets.all(13.0),
                              ), 
                              child: currentstep == 1 ? const Text('Confirm')
                              : currentstep == 2 ? const Text('Done') : const Text('Next'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
  Future<void> makePaymant()async{
    try{
      payment = await createPaymentIntent('1000',"USD");
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: payment!['client_secret'],
          style: ThemeMode.dark,
          merchantDisplayName: 'Qutouf')).then((value) {},
      );
      displayPaymentSheet();
    }catch(e,s){
      if(kDebugMode){
        print(s);
      }
    }
  }
  createPaymentIntent(String amount,String currency)async{
    try{
      Map<String,dynamic> body = {
        'amount' : ((int.parse(amount))*100).toString(),
        'currency' : currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization':'Bearer sk_test_51PsKOk01QE1JwKBQHP6elbHrHulndsUWRXRtfB2fNY4py1WA3EHEPQN0NtkKKEjuFWO26mTvg7PTFbp2xwNYchSD00LNBOkGAL',
          'Content-Type': 'application/x-www-form-urlencoded',
        }
      );
      return jsonDecode(response.body);
    }catch(err){
      // ignore: avoid_print
      print(err.toString());
    }
  }
  displayPaymentSheet()async{
    try{
      await Stripe.instance.presentPaymentSheet().then((value){
        payment = null;
      }).onError((error,stackTrace){
        if(kDebugMode){
          print("$error $stackTrace");
        }
      });
    }on StripeException catch(e){
      if(kDebugMode){
        print(e);
      }
      showDialog(
        // ignore: use_build_context_synchronously
        context: context, 
        builder: (_)=> const AlertDialog(content: Text("Cancelled"),)
      );
    }catch(e){
      if(kDebugMode){
        print(e);
      }
    }
  }
}