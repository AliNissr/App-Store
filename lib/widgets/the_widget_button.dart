import 'package:flutter/material.dart';
class BuildTextButton extends StatelessWidget {
  BuildTextButton( {required this.title_button ,  this.ontap} );
  String title_button;
  VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: ontap,
        child: Container(
            decoration: BoxDecoration(color: Colors.tealAccent
                , borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            height: 50,
            child:Center( child : Text(title_button))),
      ),
    );
  }
}
