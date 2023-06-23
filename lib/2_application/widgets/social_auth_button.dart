import 'package:flutter/material.dart';

class SocialAuthButton extends StatelessWidget {
  final Icon? iconLogo;
  final Image? imageLogo;
  final Color colorTheme;
  final String text;
  final Function onPressed;

  const SocialAuthButton({
    super.key,
    this.iconLogo,
    this.imageLogo,
    required this.colorTheme,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    late Widget logo;
    const defaultIcon = Icon(Icons.question_mark);

    if (iconLogo != null) {
      logo = iconLogo ?? defaultIcon;
    }

    if (imageLogo != null) {
      logo = imageLogo ?? defaultIcon;
    }

    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: colorTheme,
        minimumSize: const Size(200, 50),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 1, // thickness
              color: colorTheme // color
              ),
          // border radius
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          logo,
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: colorTheme),
          ),
        ],
      ),
    );
  }
}
