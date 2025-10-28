import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final msgCtrl = TextEditingController();
  double rating = 4.0;

  @override
  void dispose() {
    msgCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Thanks! Rating: ${rating.toStringAsFixed(1)}')));
    // In real app: send feedback to server here.
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Text('Help us improve',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(children: [
              const Text('Rating:'),
              const SizedBox(width: 12),
              Expanded(
                  child: Slider(
                      value: rating,
                      min: 1,
                      max: 5,
                      divisions: 8,
                      label: rating.toStringAsFixed(1),
                      onChanged: (v) => setState(() => rating = v)))
            ]),
            const SizedBox(height: 8),
            TextFormField(
              controller: msgCtrl,
              maxLines: 5,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Message'),
              validator: (v) => (v == null || v.trim().length < 5)
                  ? 'Please write at least 5 characters'
                  : null,
            ),
            const SizedBox(height: 12),
            Row(children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: _submit, child: const Text('Submit'))),
              const SizedBox(width: 8),
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'))
            ])
          ]),
        ),
      ),
    );
  }
}
