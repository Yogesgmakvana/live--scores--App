import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:live_scores/constants/text_string.dart';

class ApiServices {

 Future<List>getIccRankingData()async{
    var response=await http.get(Uri.parse('https://restapi.entitysport.com/v2/iccranks?token=ec471071441bb2ac538a0ff901abd249'));
    if(response.statusCode == 200){
      var data=jsonDecode(response.body);
      // print(data.toString());
      return data['response']['ranks']['batsmen']['odis'];
    }
    return [];
  }


 Future<List>getMatchlist()async{
     var response=await http.get(Uri.parse('https://restapi.entitysport.com/v2/matches/?status=2&token=ec471071441bb2ac538a0ff901abd249'));
    if(response.statusCode == 200){
      var data=jsonDecode(response.body);
      // print(data.toString());
      List match =data['response']['items'];
         
         return match;


    }
   return [];
  }
}