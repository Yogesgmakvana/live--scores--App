import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:live_scores/constants/text_string.dart';
import 'package:toastification/toastification.dart';

class Util {
  
  // void toastMsg(String msg){
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.blueGrey,
  //       textColor: Colors.white,
  //       fontSize: 16.0
  //   );
  // }

  void toastMsg(String msg, context){
      toastification.show(
  context: context, // optional if you use ToastificationWrapper
  type: ToastificationType.success,
  style: ToastificationStyle.flat,
  autoCloseDuration: const Duration(seconds: 3),
  title: Text(msg,style: TextStyle(
    fontFamily: SX,
  ),),
  // you can also use RichText widget for title and description parameters
  description: RichText(text: TextSpan(text:msg)),
  alignment: Alignment.bottomCenter,
  direction: TextDirection.ltr,
  animationDuration: const Duration(milliseconds: 300),
  // animationBuilder: (context, animation, alignment, child) {
  //   return FadeTransition(
  //     turns: animation,
  //     child: child,
  //   );
  // },
  icon: const Icon(Icons.check),
  showIcon: true, // show or hide the icon
  primaryColor: Colors.green,
  backgroundColor: Color(0xff69D2E7),
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color(0x07000000),
      blurRadius: 14,
      offset: Offset(0, 25),
      spreadRadius: 0,
    )
  ],
  showProgressBar: true,
  closeButton: ToastCloseButton(
    showType: CloseButtonShowType.onHover,
    buttonBuilder: (context, onClose) {
      return OutlinedButton.icon(
        onPressed: onClose,
        icon: const Icon(Icons.close, size: 20),
        label: const Text('Close'),
      );
    },
  ),
  closeOnClick: false,
  pauseOnHover: true,
  dragToClose: true,
  applyBlurEffect: true,
  onHoverMouseCursor: SystemMouseCursors.click,
  callbacks: ToastificationCallbacks(
    onTap: (toastItem) => print('Toast ${toastItem.id} tapped'),
    onCloseButtonTap: (toastItem) => print('Toast ${toastItem.id} close button tapped'),
    onAutoCompleteCompleted: (toastItem) => print('Toast ${toastItem.id} auto complete completed'),
    onDismissed: (toastItem) => print('Toast ${toastItem.id} dismissed'),
  ),
);
  }
}