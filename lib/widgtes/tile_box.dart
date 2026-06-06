import 'package:flutter/material.dart';
import 'package:live_scores/constants/text_string.dart';
import 'package:live_scores/screens/home_screen.dart';

class TileBox extends StatelessWidget{
  TileBox({super.key,required this.titleText, this.onTap});
  final String titleText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context){
    return   InkWell(
              onTap: onTap,
              child: Card(
                elevation: 4.5,
                child: ListTile(
                  trailing: Icon(Icons.arrow_circle_right),
                  title: Text(titleText, style: TextStyle(fontFamily: X)),
                ),
              ),
            );
  }
}
