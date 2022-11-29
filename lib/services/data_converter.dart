import 'package:meteo_app/models/Apiresponse.dart';
import 'package:meteo_app/models/groupweather.dart';

class DataConverter{
  List<Map<String,dynamic>> listMappable(List<dynamic> list){
    return list.map((e) => e as Map<String,dynamic>).toList();
  }

  String fromIcon(String string){
    return "https://openweathermap.org/img/wn/${string}@2x.png";
  }

  List<GroupWeather> byDay(APIResponse response){
    List<GroupWeather> daily=[];
    response.list.forEach((element) {
      var date=DateTime.fromMillisecondsSinceEpoch(element.dt*1000);
      String day=dayFromInt(date.weekday);
      int hour=date.hour;
      int min=element.main.temp_min.toInt();
      int max=element.main.temp_max.toInt();
      String description=element.weather.first.description;
      String icon=element.weather.first.icon;
      final  index=daily.indexWhere((d) => d.day==day);
      if (index==-1){
        daily.add(GroupWeather(min: min, max: max, description: description, icon: icon, day: day));
      }else{
        if (daily[index].min>min) daily[index].min=min;
        if (daily[index].max<max) daily[index].max=max;
        if (hour==12 || hour==13 || hour==14){
          daily[index].description=description;
          daily[index].icon=icon;
        }

      }


    });
    return daily;
  }


  String dayFromInt(int day){
    switch (day){
      case 1:return "Lundi";
      case 2:return "Mardi";
      case 3:return "Mercredi";
      case 4:return "Jeudi";
      case 5:return "Vendredi";
      case 6:return "Samedi";

      default:return "Dimanche";
    }
  }
}