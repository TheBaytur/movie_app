import 'package:flutter/material.dart';
import 'package:movie_app/Theme/app_button_style.dart';
import 'package:movie_app/library/widgets/inherited/provider.dart';
import 'package:movie_app/widgets/auth/auth_model.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login to your account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(children: const [_HeaderWidget()]),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const _FormWidget(),
          const SizedBox(height: 25),
          const Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          ElevatedButton(onPressed: () {}, child: const Text('Register')),
          const SizedBox(height: 25),
          const Text(
            'If you signed up but didn\'t receive the verification email, click here to have it resent. ',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 5),
          ElevatedButton(onPressed: () {}, child: const Text('Verify email')),
        ],
      ),
    );
  }
}

class _FormWidget extends StatelessWidget {
  const _FormWidget();

    @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AuthModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const _ErrorMessageWidget(),
        const Text(
          'Username', 
          style: TextStyle(),
          ),
        TextField(
          controller: model?.loginTextController,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Password', style: TextStyle()),
        TextField(
          controller: model?.passwordTextController,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),

        const SizedBox(height: 20),
        Row(
          children: [
           const _AuthButtonWidget(),
            const SizedBox(width: 30),
            ElevatedButton(
              onPressed: ()  {},
              style: AppButtonStyle.linkButton,
              child: const Text(
                'Reset password here',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget();

  

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed = model?.canStartAuth == true ? () => model?.auth(context) : null;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.blue),
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget();

  @override
  Widget build(BuildContext context) {
    final errorMessage = 
    NotifierProvider.watch<AuthModel>(context)?.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontSize: 17),
            ),
    );
  }
}




