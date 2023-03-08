import 'package:quiz_app2/constants.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        border: Border.all(color: kGrayColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          '1. Test'.text.color(kGrayColor).size(16).make(),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              border: Border.all(color: kGrayColor),
                borderRadius: BorderRadius.circular(50)),
          )
        ],
      ),
    );
  }
}