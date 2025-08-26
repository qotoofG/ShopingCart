class LocationModel{
  num latitudeL;
  num longitudeL;
  String street;
  String city;
  String country;
  String postalCode;
  bool isSelected;
  LocationModel({required this.latitudeL,required this.longitudeL,required this.postalCode,required this.street,this.isSelected=false,required this.city,required this.country});
}