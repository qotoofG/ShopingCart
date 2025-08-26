import 'dart:developer';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tranning_2/models/location_model.dart';

class MainLocation{
  List<LocationModel> locationlist=[];
  List <Marker> marker = [];
  int id = 1;
  double savelat =0.0;
  double savelong =0.0;
  String country = '';
  String city = '';
  String street = '';
  String postalCode = '';
  Future<void> addLocation()async{
   log(savelat.toString());
   log(savelong.toString());
    List<Placemark> placemark = await placemarkFromCoordinates(savelat, savelong);
    country = placemark.last.country!;
    city =placemark.last.locality!;
    street=placemark.last.subLocality!;
    postalCode=placemark.last.isoCountryCode!;
    locationlist.add(LocationModel(city: city,latitudeL:savelat,longitudeL: savelong,postalCode: postalCode,country: country,street: street ,),);
  }
}
// if(locationlist.isEmpty){
    //   locationlist.add(locationModel);
    // }
    // else{
    //   locationlist=locationlist.where(
    //   (element) =>element.latitudeL !=locationModel.latitudeL && element.longitudeL!=locationModel.longitudeL ,
    //   ).toList();
    // }