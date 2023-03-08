import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app2/controllers/question_controller.dart';
import 'package:quiz_app2/screens/quiz/components/body.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:websafe_svg/websafe_svg.dart';


class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: 'Skip'.text.make())
        ],
      ),
      body: const Body(),
    );
  }
}