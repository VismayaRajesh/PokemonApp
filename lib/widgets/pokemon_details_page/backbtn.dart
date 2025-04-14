import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_color.dart';

class Backbtn extends StatelessWidget {
  const Backbtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backbtnclr
        ),
        child: InkWell(child: Icon(Icons.arrow_back,size: 19,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.white),
          onTap: (){
            Navigator.pop(context);
          },),
      ),
    );
  }
}
