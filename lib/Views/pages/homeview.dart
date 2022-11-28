
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:meteo_app/models/geoposition.dart';
import 'package:meteo_app/services/LocationSevice.dart';
import 'package:meteo_app/services/apiService.dart';

import '../../models/Apiresponse.dart';

class HomeView extends StatefulWidget {
  final String title;
  HomeView({Key? key,required this.title}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  GeoPosition? userPosition;
  APIResponse? apiResponse;
  @override
  void initState() {


    getUserLocation();
    // TODO: implement initState
    super.initState();
    getUserLocation();


  }

  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Notre position:\n ${userPosition?.lat} / ${userPosition?.lon} \nNotre reponse est:${apiResponse?.cnt??0}"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () { getUserLocation();
        print("h");
        print(userPosition?.toMap());},

      ),

    );
  }

  getUserLocation() async{
    final loc=await LocationService().getCity();
    print(loc);
    if (loc!=null){
      setState(() {
        userPosition=loc;

      });
      apiResponse=await ApiService().callApi(userPosition!);
      setState(() {

      });
    }
  }
}
