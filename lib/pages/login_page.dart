import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../utils/constans.dart';
import '../widgets/custom_input.dart';
import '../models/home_owner.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _cinController = TextEditingController();
  final _meterNumberController = TextEditingController();

  // Set default values for testing

  @override
  void initState() {
    super.initState();
    _cinController.text = 'd91cd6f5-6f0a-439d-8590-7a5dea3662a5';
    _meterNumberController.text = '1000';
  }

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
                label: 'رقم البطاقة الوطنية',
                icon: Icons.person,
                controller: _cinController,
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال رقم البطاقة الوطنية' : null,
              ),
              const SizedBox(height: 20),
              CustomInputField(
                label: 'رقم العداد',
                icon: Icons.confirmation_number,
                controller: _meterNumberController,
                validator: (value) =>
                    value!.isEmpty ? 'الرجاء إدخال رقم العداد' : null,
                keyboardType: TextInputType.number,
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

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('${Constants.apiUrl}/auth/login-homeowner'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'cin': _cinController.text,
            'meterNumber': int.parse(_meterNumberController.text),
          }),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          final homeOwner = HomeOwner.fromJson(data['homeOwner']);

          // Save home owner data to local storage
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('homeOwner', json.encode(homeOwner.toJson()));

          // Navigate to dashboard
          Navigator.pushReplacementNamed(context, '/dashboard');
        } else {
          // Show error toast
          Fluttertoast.showToast(
            msg: "بيانات الاعتماد غير صالحة",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } catch (e) {
        print(e);
        // Show error toast
        Fluttertoast.showToast(
          msg: "حدث خطأ أثناء تسجيل الدخول",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }
    }
  }

  @override
  void dispose() {
    _cinController.dispose();
    _meterNumberController.dispose();
    super.dispose();
  }
}
