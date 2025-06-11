import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String btnText;
  final VoidCallback onTap;
  const TitleWidget({
    super.key,
    required this.title,
    required this.onTap,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        TextButton(
            onPressed: onTap,
            child: Row(
              spacing: 5,
              children: [
                Text(
                  btnText,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                )
              ],
            ))
      ],
    );
  }
}
