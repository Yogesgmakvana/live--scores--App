import 'package:flutter/material.dart';

class BottomAuthWidget extends StatelessWidget {
  final String simpleText;
  final String navigateText;
  final Widget navigatePage;

  const BottomAuthWidget({
    super.key,
    required this.simpleText,
    required this.navigateText,
    required this.navigatePage,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(50),
      ),
      child: Container(
        height: 80,
        width: double.infinity,
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              simpleText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => navigatePage,
                  ),
                );
              },
              child: Text(
                navigateText,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}