import 'package:flutter/material.dart';
import 'package:workhours/constants.dart';

class Botao extends StatelessWidget {
  final String? text;
  final Function? press;
  final Color color, textColor;
  const Botao({
    Key? key,
    this.text,
    this.press,
    this.color = cor1,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          //color: color,
          onPressed: () => {},
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) return Colors.green;
                return color; // Use the component's default.
              },
            ),
          ),
          child: Text(text!, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
