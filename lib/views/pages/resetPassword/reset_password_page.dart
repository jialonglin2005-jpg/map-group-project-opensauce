import 'package:easyrent/views/widgets/resetPassword/reset_password_title.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: SizedBox(
          width: double.infinity,
          child: ResetPasswordTitle(title: "Reset Password", description: "Please reset your password"),
        ),
      ),
    );
  }
}