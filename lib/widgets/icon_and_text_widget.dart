import 'package:flutter/cupertino.dart';
import 'package:dofd_driver_panel/utils/dimensions.dart';
import 'package:dofd_driver_panel/widgets/small_text.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const IconAndTextWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.iconSize24,
        ),
        SizedBox(
          width: 5,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
