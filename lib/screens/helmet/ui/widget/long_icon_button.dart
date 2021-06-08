import 'package:app_challenege/common/custom_text.dart';
import 'package:flutter/material.dart';

class LongIconButton extends StatelessWidget {
  @required
  final String buttonText;
  @required
  final IconData leadingIcon;
  final Function onPressed;

  const LongIconButton({Key key, this.buttonText, this.leadingIcon, this.onPressed})
      : assert(leadingIcon != null && buttonText != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => null,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          border: Border.all(width: 1, color: Colors.grey[350]),
        ),
        child: Row(
          children: [
            if (leadingIcon != null) Icon(leadingIcon),
            SizedBox(width: 10),
            Expanded(child: CustomText(buttonText ?? "-")),
            SizedBox(width: 10),
            Icon(Icons.chevron_right_sharp),
          ],
        ),
      ),
    );
  }
}
