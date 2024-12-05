import 'package:flutter/material.dart';
import 'package:quiz_purple/views/quiz.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.purple.shade500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/quiz-logo.png"),
            SizedBox(height: 20,),
            Text("Learn Flutter the fun way", style: TextStyle(
                fontSize: 24,
                color: Colors.white),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.purple),
                foregroundColor: MaterialStatePropertyAll<Color>(Colors.white), // Change text color
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Quiz();
                },));
              },
              child: Text('Empezar'),
            )
          ],
        ),
      ),
    );
  }
}
