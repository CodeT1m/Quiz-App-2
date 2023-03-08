import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quiz_app2/constants.dart';
import 'package:quiz_app2/controllers/question_controller.dart';

class Option extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback press;
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return kGreenColor;
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return kRedColor;
              }
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding),
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  '${index + 1}. $text'
                      .text
                      .color(getTheRightColor())
                      .size(16)
                      .make(),
                  Container(
                    height: 26,
                    width: 26,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: getTheRightColor() == kGrayColor
                                ? Colors.transparent
                                : getTheRightColor()),
                        borderRadius: BorderRadius.circular(50)),
                    child: getTheRightColor() == kGrayColor
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 16,
                          ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
