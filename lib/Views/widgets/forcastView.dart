import 'package:flutter/material.dart';
import 'package:meteo_app/Views/widgets/CurrentWeather.dart';
import 'package:meteo_app/models/Apiresponse.dart';
import 'package:meteo_app/models/groupweather.dart';
import 'package:meteo_app/services/data_converter.dart';

import 'dailyttile.dart';

class ForeCastView extends StatelessWidget {
   ForeCastView({Key? key,required this.response}) : super(key: key);
   final APIResponse response;


  @override
  Widget build(BuildContext context) {
    List<GroupWeather> byDay=DataConverter().byDay(response);
    return Column(
      children: [
        CurrentWeather(forcast: response!.list.first),
        Expanded(child:
         ListView.builder(itemBuilder: (context,index){
           return DailyTile(day:byDay[index]);


         }, itemCount: byDay.length)
        ),

      ],


    );
  }
}
