import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tranning_2/controller/location_controller.dart';


MainLocation mainLocation = MainLocation();

class MyAddresses extends StatefulWidget {
  const MyAddresses({super.key});

  @override
  State<MyAddresses> createState() => _MyAddressesState();
}

class _MyAddressesState extends State<MyAddresses> {
  final Completer<GoogleMapController> _controller = Completer();

  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are disabled');
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
  String location = 'location';
  @override
  void initState() {
    super.initState();
    getCurrentLocation().then((value) async {
      setState(() {
        _addMarker(LatLng(value.latitude, value.longitude));
      });

      final GoogleMapController googleMapController = await _controller.future;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(value.latitude, value.longitude),
            zoom: 13.0,
          ),
        ),
      );
    });
  }

  void _addMarker(LatLng position) {
    setState(() {
      Marker newMarker = Marker(
        markerId: MarkerId('${mainLocation.id}'),
        icon: BitmapDescriptor.defaultMarker,
        position: position,
      );
      mainLocation.savelat = position.latitude;
      mainLocation.savelong = position.longitude;
      mainLocation.marker.add(newMarker);
      mainLocation.id += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await mainLocation.addLocation();
            setState(() {
            });
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.add, color: Colors.red, size: 30),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width * 0.03,
                left: MediaQuery.of(context).size.width * 0.02,
                bottom: MediaQuery.of(context).size.width * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.red),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8,right: 8),
              padding: const EdgeInsets.all(8),
              height: MediaQuery.of(context).size.height*0.48,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: mainLocation.locationlist.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 235, 228, 228),
                        borderRadius: BorderRadius.all(Radius.circular(15),),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.076,
                       child: RadioListTile(
                        value: mainLocation.locationlist[index].street,
                        groupValue: location,
                        onChanged: (selectedlocation){
                          setState(() {
                             location = selectedlocation!; 
                          });
                        },
                        activeColor: Colors.red,
                        title: Padding(
                          padding: const EdgeInsets.only(top: 5,),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(text: '${mainLocation.locationlist[index].street}, ',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                                TextSpan(text: '${mainLocation.locationlist[index].city}, ',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                                TextSpan(text: '${mainLocation.locationlist[index].postalCode} ',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w500)),
                              ]
                            )
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height:MediaQuery.of(context).size.height *0.01 ,
                    )
                  ],
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.315,
              child: GoogleMap(
                markers: mainLocation.marker.map((e) => e).toSet(),
                initialCameraPosition: CameraPosition(
                  target: LatLng(mainLocation.savelat, mainLocation.savelong),
                  zoom: 13.0,
                ),
                onMapCreated: (GoogleMapController controller) async {
                  if (!_controller.isCompleted) {
                    _controller.complete(controller);
                  }
                },
                myLocationButtonEnabled: false,
                onTap: (LatLng tappedPosition) {
                  _addMarker(tappedPosition); // Update marker position
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}