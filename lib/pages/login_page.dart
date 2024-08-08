import 'package:flutter/material.dart';
import '../widgets/custom_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                'مرحبًا بعودتك',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 40),
              CustomInputField(
                label: 'اسم المستخدم',
                icon: Icons.person,
                controller: _usernameController,
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال اسم المستخدم' : null,
              ),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'البريد الإلكتروني',
                icon: Icons.email,
                controller: _emailController,
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال البريد الإلكتروني' : null,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleLogin,
                child: const Text(
                  'تسجيل الدخول',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(
        context,
        '/dashboard',
        arguments: {
          'username': _usernameController.text,
          'email': _emailController.text,
        },
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
