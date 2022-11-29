import 'package:flutter/material.dart';
import 'package:meteo_app/models/groupweather.dart';
import 'package:meteo_app/services/data_converter.dart';

class DailyTile extends StatelessWidget {
   DailyTile({Key? key,required this.day}) : super(key: key);
   GroupWeather day;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Image.network(DataConverter().fromIcon(day.icon)),
      leading: Text(day.day),
      title: Text(day.description),
      subtitle: Text(day.minAndMax()),
    );
  }
}
