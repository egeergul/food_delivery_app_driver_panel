import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dofd_driver_panel/utils/colors.dart';
import 'package:dofd_driver_panel/utils/dimensions.dart';
import 'package:dofd_driver_panel/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}


class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  double textHeight = Dimensions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondHalf.isEmpty
            ? SmallText(
                size: Dimensions.font16,
                color: AppColors.paraColor,
                text: firstHalf)
            : Container(
                child: Column(
                  children: [
                    SmallText(
                        height: 1.8,
                        size: Dimensions.font16,
                        color: AppColors.paraColor,
                        text: hiddenText
                            ? (firstHalf + "...")
                            : (firstHalf + secondHalf)),
                    InkWell(
                      onTap: () {
                        setState(() {
                          hiddenText = !hiddenText;
                        });
                      },
                      child: Row(
                        children: [
                          SmallText(
                            height: 1.8,
                            text: hiddenText ? "Show more" : "Show less ",
                            color: AppColors.mainColor,
                          ),
                          Icon(
                            hiddenText
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
  }
}
