import 'package:endava_profile_app/common/constants/palette.dart';
import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirmPressed;

  ConfirmationDialog({@required this.onConfirmPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
        'Are you sure you want to remove this item?',
        style: Theme.of(context).textTheme.subhead,
      ),
      actions: [
        FlatButton(
          child: Text(
            'Cancel',
            style: Theme.of(context)
                .textTheme
                .subtitle
                .copyWith(color: Palette.darkGray),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        FlatButton(
            child: Text(
              'Yes',
              style: Theme.of(context)
                  .textTheme
                  .subtitle
                  .copyWith(color: Palette.cinnabar),
            ),
            onPressed: () {
              onConfirmPressed();
              Navigator.pop(context);
            }),
      ],
    );
  }
}
