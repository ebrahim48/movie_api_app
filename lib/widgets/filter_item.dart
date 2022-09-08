import 'package:flutter/material.dart';

class FilterItem extends StatelessWidget {
  final IconData filterIcon;
  final String title;
  FilterItem({Key? key, required this.filterIcon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 60,
          width: 60,
          child: Icon(
            filterIcon,
            color: Colors.white,
            size: 35,
          ),
          decoration: BoxDecoration(
              color: Color(0xff51535D),
              borderRadius: BorderRadius.circular(20)),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
