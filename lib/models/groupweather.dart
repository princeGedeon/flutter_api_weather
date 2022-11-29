class GroupWeather{
  int min;
  int max;
  String description;
  String icon;
  String day;

  GroupWeather({required this.min,required this.max,required this.description,required this.icon,required this.day});

  String minAndMax(){
    return "Min: $min °C - Max: $max °C";
  }
}