import 'package:flutter/material.dart';
import 'package:live_scores/ApiServices/api_services.dart';
import 'package:live_scores/constants/text_string.dart';
import 'package:live_scores/widgtes/header.dart';

class PlayersScreen extends StatefulWidget {
  const PlayersScreen({super.key});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  ApiServices _apiServices=ApiServices();

  @override
  void initState() {
    
    super.initState();
  }


  getData()async{
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff767522),
      ),
       backgroundColor: Color(0xffFFFBBD),
      body: Column(
        children: [
            Header(title: "odis Top batsmen", backgroundColor: Color(0xff767522)),
            SizedBox(
              height: 30,
            ),
     
           Expanded(
  child: FutureBuilder<List>(
    future: _apiServices.getIccRankingData(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      if (!snapshot.hasData) {
        return const Center(
          child: Text("No Data"),
        );
      }

      var batsmen = snapshot.data!;

      return ListView.builder(
        itemCount: batsmen.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xffDBF4AD),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(batsmen[index]['rank'],style: TextStyle(
                  fontFamily: SX,
                ),),
              ),
              title: Text(batsmen[index]['player'],style: TextStyle(
                fontFamily: SB,
              ),),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(batsmen[index]['team'],style: TextStyle(
                  fontFamily:L ,
                ),),
                Text(batsmen[index]['careerbestrating'],style: TextStyle(
                  fontFamily: L,
                ),),
                ],
              ),
              trailing: Text("Rating: ${batsmen[index]['rating']}",style: TextStyle(
                fontFamily: SL,
              ),),
            ),
          );
        },
      );
    },
  ),
)

        ],
      ),
    );
  }

  
}