import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glowvy/Utils/app_text.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasBackground = backgroundColor != null;

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: hasBackground
          ? ElevatedButton(
              onPressed: onPressed ?? () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: _buildContent(),
            )
          : OutlinedButton(
              onPressed: onPressed ?? () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: _buildContent(),
            ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(icon, height: 20),
        const SizedBox(width: 12),
        Text(
          text,
          style: AppFontStyles.titleSemiBold(
            fontSize: 16,
            color: textColor ?? Colors.black,
          ),
        ),
      ],
    );
  }
}
