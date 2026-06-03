import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:live_scores/ApiServices/api_services.dart';
import 'package:live_scores/screens/auth/login_screen.dart';
import 'package:live_scores/constants/text_string.dart';
import 'package:live_scores/screens/players_screen.dart';
import 'package:live_scores/utils/Util.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  FirebaseAuth _auth=FirebaseAuth.instance;
 
 ApiServices _apiServices=ApiServices();

 logOut(){
    _auth.signOut().then((value) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
              },).onError((error, stackTrace) {
                Util().toastMsg(error.toString());
              },);
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFBBD),
        actions: [
          IconButton(onPressed:() {
             showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Are you sure?',style: TextStyle(
          fontFamily: SX,
        ),),
        content: const Text('Do you wanna Logout',style: TextStyle(
          fontFamily: SX,
        ),),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel',style: TextStyle(
          fontFamily: SL,
        ),),
            onPressed: () => Navigator.of(context).pop(),
          ),
          TextButton(
            child: const Text('confirm',style: TextStyle(
          fontFamily: SL,
        ),),
            onPressed:() {
            logOut();
            },
          ),
        ],
      );
    },
  );
          }, icon: Icon(Icons.logout_outlined))
        ],
        title: Text("Live Scores",style: TextStyle(
          fontFamily:B,
          fontSize: 35,

        ),),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xffDBF4AD),
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration:BoxDecoration(
              color: Color(0xff767522),
            ),
            arrowColor: Color(0xffCDC776),
            currentAccountPicture: CircleAvatar(child: Text(_auth.currentUser!.email.toString().substring(0,1),style: TextStyle(
              fontFamily: ST,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),),
            accountName:Text(""), accountEmail: Text(_auth.currentUser!.email.toString(),style: TextStyle(
              fontFamily: X,
            ),)),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
              },
              child: Card(
                elevation: 4.5,
                child: ListTile(
                  trailing: Icon(Icons.arrow_circle_right),
                  title: Text('All Matches',style: TextStyle(
                    fontFamily: X,
                  ),),
                ),
              ),
            ),
             InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PlayersScreen()));
              },
               child: Card(
                elevation: 4.5,
                 child: ListTile(
                  trailing: Icon(Icons.arrow_circle_right),
                  title: Text('Players',style: TextStyle(
                    fontFamily: X,
                  ),),
                             ),
               ),
             ),
             Card(
              elevation: 4.5,
               child: ListTile(
                trailing: Icon(Icons.arrow_circle_right),
                title: Text('Help',style: TextStyle(
                  fontFamily: X,
                ),),
                           ),
             ),
             Card(
              elevation: 4.5,
               child: ListTile(
                trailing: Icon(Icons.arrow_circle_right),
                title: Text('Contact',style: TextStyle(
                  fontFamily: X,
                ),),
                           ),
             ),
             Card(
              elevation: 4.5,
               child: ListTile(
                trailing: Icon(Icons.arrow_circle_right),
                title: Text('About us',style: TextStyle(
                  fontFamily: X,
                ),),
                           ),
             ),
            //  InkWell(
            //   onTap: () {
            //     _auth.signOut().then((value) {
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
            //   },).onError((error, stackTrace) {
            //     Util().toastMsg(error.toString());
            //   },);
            //   },
            //    child: Card(
            //     elevation: 4.5,
            //      child: ListTile(
            //       trailing: Icon(Icons.arrow_circle_right),
            //       title: Text('Logout',style: TextStyle(
            //         fontFamily: X,
            //       ),),
            //                  ),
            //    ),
            //  ),
        ],
      ),
      ),
        backgroundColor: Color(0xffFFFBBD),
      body: Column(
        children: [

           Expanded(child: FutureBuilder<List>(
            future: _apiServices.getMatchlist(),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData) {
                return Center(child: Text('No Data Found'),);
              }

              var matchData=snapshot.data!;

              return ListView.builder(
                itemCount: matchData.length,
                itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    leading: Column(
                      children: [
                        CircleAvatar(child: Image.network(matchData[index]['teama']['logo_url'],scale: 0.8,)),
                        Text(matchData[index]['teama']['scores_full'],style: TextStyle(
                          fontFamily: L,
                        ),),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        CircleAvatar(child: Image.network(matchData[index]['teamb']['logo_url'],scale: 0.8,)),
                        Text(matchData[index]['teamb']['scores_full'],style: TextStyle(
                          fontFamily: L,
                        ),),
                      ],
                    ),
                    title: Text(matchData[index]['title'].toString(),style: TextStyle(
                      fontFamily: SB,
                    ),),
                    subtitle: Column(
                      children: [
                         Align(
                          alignment: Alignment.centerLeft,
                           child: Text(matchData[index]['format_str'].toString(),style: TextStyle(
                                                   fontFamily: SB,
                                                 ),),
                         ),
                       Text(matchData[index]['status_note'].toString(),style: TextStyle(
                        fontFamily: SB,
                        color: Colors.green,
                      ),),
                      ],
                    ),
                  ),
                );
              });
            }))
        ],
      ),
    );
  }
    
}