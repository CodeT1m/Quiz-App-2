import 'package:get/get.dart';
import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/controllers/question_controller.dart';
import 'package:quiz_app2/models/Questions.dart';
import 'package:quiz_app2/screens/quiz/components/options.dart';

class QuestionCard extends StatelessWidget {
  final Question question;
  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
                text: question.options[index],
                index: index,
                press: () => _controller.checkAns(question, index)),
          ),
        ],
      ),
    );
  }
}
