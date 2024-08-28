import 'package:e_commerce/uitls/app_colors.dart';
import 'package:flutter/material.dart';

class LabelWithValueRow extends StatelessWidget {
  final String label;
  final String value;
  const LabelWithValueRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.grey2,
              ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}