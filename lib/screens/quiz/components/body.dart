import 'package:get/get.dart';

import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/controllers/question_controller.dart';
import 'package:quiz_app2/screens/quiz/components/progress_bar.dart';
import 'package:quiz_app2/screens/quiz/components/question_card.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: ProgressBar()),
              kDefaultPadding.heightBox,
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text.rich(TextSpan(
                      text: "Question 1",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                            text: "/10",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: kSecondaryColor))
                      ]))),
              const Divider(
                thickness: 1.5,
              ),
              kDefaultPadding.heightBox,
              Expanded(
                  child: PageView.builder(
                      itemBuilder: (context, index) => QuestionCard(
                            question: _questionController.questions[index],
                          )))
            ],
          ),
        )
      ],
    );
  }
}
