import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/controllers/question_controller.dart';
import 'package:quiz_app2/screens/welcome/welcome.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Spacer(
            flex: 3,
          ),
          WebsafeSvg.asset('assets/icons/bg.svg', fit: BoxFit.fill),
          Column(
            children: [
              const Spacer(),
              Text(
                'Score',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(),
              Text(
                '${_qnController.correctAns * 10} / ${_qnController.questions.length * 10}',
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: kSecondaryColor),
              ),
              const Spacer(
                flex: 3,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                    onTap: () => Get.to(const WelcomeScreen()),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                      decoration: const BoxDecoration(
                          gradient: kPrimaryGradient,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Text(
                        'Go Back To Home',
                        style: Theme.of(context)
                            .textTheme
                            .button!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
              ),
                const Spacer(
                  flex: 2,),
            ],
          )
        ],
      ),
    );
  }
}
