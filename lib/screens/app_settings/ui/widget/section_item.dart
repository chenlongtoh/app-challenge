import 'package:app_challenege/common/custom_text.dart';
import 'package:app_challenege/common/styles.dart';
import 'package:flutter/material.dart';

class SectionItem extends StatelessWidget {
  @required
  final String sectionTitle;
  @required
  final List<Widget> sectionItems;

  const SectionItem({Key key, this.sectionTitle, this.sectionItems})
      : assert(sectionTitle != null),
        assert(sectionItems != null || sectionItems.length != 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(sectionTitle, style: CustomTextStyle.bold_16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: sectionItems,
            ),
          ),
        ],
      ),
    );
  }
}
