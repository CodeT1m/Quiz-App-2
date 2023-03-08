import 'package:get/get.dart';
import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/models/Questions.dart';

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;

  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageController => this._pageController;

  final List<Question> _questions = sample_data
      .map((question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index'],
          ))
      .toList();

      List<Question> get questions => this._questions;

  @override
  void onInit() {
    // TODO: implement onInit
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    super.onInit();
  }
}
