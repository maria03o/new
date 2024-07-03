import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          //  side: const BorderSide(color: Colors.black),
          ),
          backgroundColor:  Color.fromRGBO(198, 198, 201, 0.302),
        ),
        onPressed: press,
        child: Row(
          children: [
            Icon(
              icon,
              color: Color.fromARGB(255, 73, 98, 241),
              size: 18,
            ),
            const SizedBox(width: 20),
            Expanded(child: Text(text ,style: TextStyle ( color: Color.fromARGB(195, 56, 56, 56),),)),
                        Icon(
              Icons.arrow_forward_ios,
              color: Color.fromARGB(255, 0, 0, 0),
            
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}


