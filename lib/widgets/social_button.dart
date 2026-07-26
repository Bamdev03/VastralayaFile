import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {

  final String label;
  final IconData icon;
  final Color? iconColor;
  final VoidCallback onTap;
 
  const SocialButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon,size: 40,color: iconColor,),
        label: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color:Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}