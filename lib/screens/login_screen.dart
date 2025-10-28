import 'package:flutter/material.dart';
import '../services/program_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final pwdCtrl = TextEditingController();
  bool loading = false;

  void _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await _loadAndNavigate();
  }

  void _guestLogin() async {
    await _loadAndNavigate();
  }

  /// Load data from service, then navigate.
  Future<void> _loadAndNavigate() async {
    setState(() => loading = true);
    // Fetch data and populate the global list
    await ProgramService().fetchPrograms();
    setState(() => loading = false);
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxW =
        MediaQuery.of(context).size.width > 700 ? 600.0 : double.infinity;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxW),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(children: [
                        const CircleAvatar(child: Icon(Icons.school)),
                        const SizedBox(width: 12),
                        Text('Learnly',
                            style: Theme.of(context).textTheme.headlineSmall),
                      ]),
                      const SizedBox(height: 12),
                      Text('Sign in to continue or use Guest mode.',
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(height: 12),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: emailCtrl,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email)),
                              validator: (v) => (v == null || !v.contains('@'))
                                  ? 'Enter a valid email'
                                  : null,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: pwdCtrl,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock)),
                              validator: (v) => (v == null || v.length < 6)
                                  ? 'Password too short'
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: loading ? null : _submit,
                                child: loading
                                    ? const SizedBox(
                                        width: 18,
                                        height: 18,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2))
                                    : const Text('Sign In'),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: loading ? null : _guestLogin,
                              child: const Text('Continue as Guest'),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
