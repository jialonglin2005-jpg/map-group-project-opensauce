import 'package:easyrent/data/constants/constants.dart';
import 'package:easyrent/views/widgets/resetPassword/reset_password_title.dart';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ResetPasswordTitle(
              title: "Verification",
              description:
                  "We have sent the 4-digit verification code to abcd@gmail.com",
            ),
            
          ],
        ),
      ),
    );
  }
}
