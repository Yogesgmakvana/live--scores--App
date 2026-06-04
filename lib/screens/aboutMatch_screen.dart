import 'package:flutter/material.dart';
import 'package:live_scores/constants/text_string.dart';

class AboutmatchScreen extends StatefulWidget {
   AboutmatchScreen({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<AboutmatchScreen> createState() => _AboutmatchScreenState();
}

class _AboutmatchScreenState extends State<AboutmatchScreen> {

  
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffFFFBBD),
      appBar: AppBar(
        title: Text(widget.data['title'],style: TextStyle(
          fontFamily: SB,
        ),),
        backgroundColor: Color(0xffFFFBBD),
      ),
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          children: [
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                   Column(
                    children: [
                         CircleAvatar(
                    radius: 45,
                    child: Image.network(widget.data['teama']['logo_url'])),
                    Text(widget.data['teama']['scores_full'],style: TextStyle(
                      fontFamily: SL,
                    ),),
                    ],
                   ),
                    SizedBox(
                      width: 30,
                    ),
                     Text('VS',style: TextStyle(
                      fontFamily: X,
                      fontSize: 33,
                     ),),
                      SizedBox(
                      width: 30,
                    ),
                   Column(
                    children: [
                        CircleAvatar(
                    radius: 45,
                    child: Image.network(widget.data['teamb']['logo_url'])),
                      Text(widget.data['teamb']['scores_full'],style: TextStyle(
                      fontFamily: SL,
                    ),),
                    ],
                   ),
        
              ],
            ),
                 Text(widget.data['status_note'],style: TextStyle(
                  color: Colors.green,
                  fontFamily: SB,
                 ),),
                SizedBox(
                      height: 50,
                    ),
        
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadiusGeometry.circular(35),
                        child: Container(
                          height:height * 0.6,
                          width: width,
                          decoration: BoxDecoration(
                            color: Color(0xff6BBAEC),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                        Text("Match: ${widget.data['title']},",style: TextStyle(
                                              fontFamily: SB,
                                             ),),
                                Text("Short Title: ${widget.data['short_title']}",style: TextStyle(
                      fontFamily: SL,
                    ),),
                                Text("Subtitle: ${widget.data['subtitle']}",style: TextStyle(
                      fontFamily: SL,
                    ),),
                                Text("Format: ${widget.data['format_str']}",style: TextStyle(
                      fontFamily: SL,
                    ),),
                                Text("Status: ${widget.data['status_str']}",style: TextStyle(
                      fontFamily: SL,
                    ),),
                                Text("Result: ${widget.data['status_note']}",style: TextStyle(
                      fontFamily: SL,
                    ),),
                                Text("Match Number: ${widget.data['match_number']}",style: TextStyle(
                      fontFamily: SL,
                    ),),
                            
                                const SizedBox(height: 20),
                            
                                Text(
                                  "Competition Details",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                     fontFamily: SB,
                                  ),
                                ),
                            
                                Text(
                                  "Tournament: ${widget.data['competition']['title']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Abbreviation: ${widget.data['competition']['abbr']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Category: ${widget.data['competition']['category']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Match Format: ${widget.data['competition']['match_format']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Season: ${widget.data['competition']['season']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Tournament Status: ${widget.data['competition']['status']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Start Date: ${widget.data['competition']['datestart']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "End Date: ${widget.data['competition']['dateend']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Country: ${widget.data['competition']['country']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Total Matches: ${widget.data['competition']['total_matches']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                                Text(
                                  "Total Teams: ${widget.data['competition']['total_teams']}",style: TextStyle(
                      fontFamily: SL,
                    ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
          ],
        ),
      )),
    );
  }
}