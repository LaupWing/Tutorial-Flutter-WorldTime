import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location;
  String time;
  String flag;
  String endpoint;
  WorldTime({this.location, this.flag, this.endpoint});
  Future<void> getTime() async {
    try{
      Response response = await get('http://worldtimeapi.org/api/timezone/$endpoint');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      time = DateFormat.jm().format(now);
    }catch(e){
      print('There is an error $e');
      time = 'Could not get time data';
    }

  }

}

