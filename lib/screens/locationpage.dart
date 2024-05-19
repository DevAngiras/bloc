import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  currentlocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      print("You are not allowed to acess location");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position location = await Geolocator.getCurrentPosition();
      print(location.latitude);
      print(location.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("location"),
      ),
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: currentlocation,
            child: Text("Get Location"),
          ),
        ),
      ),
    );
  }
}
