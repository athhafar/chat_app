import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonMasuk extends StatelessWidget {
  const ButtonMasuk({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0XFF4285F4),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(4, 4),
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.15),
            )
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
              child: Text(
                'Masuk',
                style: GoogleFonts.montserrat(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
