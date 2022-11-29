
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:meteo_app/Views/nosdataViews.dart';
import 'package:meteo_app/Views/widgets/addcityView.dart';
import 'package:meteo_app/Views/widgets/myDrawer.dart';
import 'package:meteo_app/models/geoposition.dart';
import 'package:meteo_app/services/DatasServices.dart';
import 'package:meteo_app/services/LocationSevice.dart';
import 'package:meteo_app/services/apiService.dart';

import '../../models/Apiresponse.dart';
import '../widgets/forcastView.dart';

class HomeView extends StatefulWidget {
  final String title;
  HomeView({Key? key,required this.title}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  GeoPosition? userPosition;
  GeoPosition? positioncall;
  List<String> cities=[];
  APIResponse? apiResponse;
  @override
  void initState() {


    getUserLocation();
    // TODO: implement initState
    updateCities();
    super.initState();
    getUserLocation();


  }

  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      drawer: MyDrawer(myposition: userPosition, cities: cities, onTap: onTap,onDelete: remove,),
      appBar: AppBar(
        title: Text("${positioncall?.city} | By PrinceGedeon" ?? "Ma météo by PrinceG"),
      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: Column(
          children: [
            AddCityView( onaddCity: onaddCity),
            Expanded(child:     (apiResponse==null)?NoDataView():ForeCastView(response: apiResponse!,),)

          ],
        ),
      ),


      floatingActionButton: FloatingActionButton(onPressed: () { getUserLocation();
        print("h");
        print(userPosition?.toMap());},

      ),

    );
  }

  //Obtenir position via gps

  getUserLocation() async{
    final loc=await LocationService().getCity();
    print(loc);
    if (loc!=null){
      setState(() {
        userPosition=loc;
        positioncall=loc;

      });
      callApi();
    }
  }

  //callAi
  callApi() async{
    if (positioncall==null) return;
    apiResponse=await ApiService().callApi(positioncall!);
    print(apiResponse!.toJson());
    setState(() {

    });

  }

  //Nouvelle volle
  onTap(String string) async{
      Navigator.of(context).pop();
      removeKeyBoard();
      if (string==userPosition?.city){
        positioncall=userPosition;
        callApi();
      }
      else{
        positioncall=await LocationService().getCoordsFromCity(string);
        callApi();
      }

  }

  removeKeyBoard(){
    FocusScope.of(context).requestFocus(FocusNode());
  }
  //ajouter
  onaddCity(String text) async{
    DataServices().addCity(text).then((value) => updateCities());
    removeKeyBoard();


  }

  //Supprimer

  remove(String string) async{

    DataServices().removeCity(string).then((value) => updateCities());
  }



//Mettre ajour
updateCities() async{
    cities=await DataServices().getCities();
    setState(() {

    });
}

}
