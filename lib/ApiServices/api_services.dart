import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:live_scores/config/secret.dart';
import 'package:live_scores/constants/text_string.dart';

class ApiServices {

 Future<List>getIccRankingData()async{
    var response=await http.get(Uri.parse('${Secret.baseUrlIccRanking}${Secret.token}'));
    if(response.statusCode == 200){
      var data=jsonDecode(response.body);
      // print(data.toString());
      return data['response']['ranks']['batsmen']['odis'];
    }
    return [];
  }


 Future<List>getMatchlist()async{
     var response=await http.get(Uri.parse('${Secret.baseUrlMatchList}${Secret.token}'));
    if(response.statusCode == 200){
      var data=jsonDecode(response.body);
      // print(data.toString());
      List match =data['response']['items'];
         
         return match;


    }
   return [];
  }
}