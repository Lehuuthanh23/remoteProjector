import 'package:flutter/material.dart';
import 'package:remote_project/features/packet/widgets/packet_item.dart';

class PackageSection extends StatelessWidget {
  final List<PackageItem> packages;

  const PackageSection({super.key, required this.packages});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: packages.map((package) => package.build(context)).toList(),
        ),
      ],
    );
  }
}
