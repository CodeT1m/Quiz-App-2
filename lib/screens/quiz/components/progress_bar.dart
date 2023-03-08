import 'package:get/state_manager.dart';
import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/controllers/question_controller.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)),
      child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
          
          return Stack(
            children: [
              LayoutBuilder(
                  builder: (context, constraints) => Container(
                        // width: constraints.maxWidth * 0.5,
                        width: constraints.maxWidth * controller.animation.value,
                        decoration: BoxDecoration(
                            gradient: kPrimaryGradient,
                            borderRadius: BorderRadius.circular(50)),
                      )),
                      Positioned.fill(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            '${(controller.animation.value * 60).round()} sec'.text.make(),
                            WebsafeSvg.asset("assets/icons/clock.svg")
                          ],
                        ),
                      ))
            ],
          );
        }
      ),
    );
  }
}