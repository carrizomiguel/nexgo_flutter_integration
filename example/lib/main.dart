import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:printer/printer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String message = '';

  void _setMessage(String text) {
    setState(() => message = text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  _setMessage('');
                  final result = await Printer.print();
                  result.when(
                    ok: (_) {
                      ElegantNotification.success(
                        title: const Text('Respuesta!'),
                        description: const Text('Impresión iniciada...'),
                      ).show(context);
                    },
                    err: (failure) {
                      _setMessage(failure);
                      ElegantNotification.error(
                        title: const Text('Falló!'),
                        description: Text(failure),
                      ).show(context);
                    },
                  );
                },
                child: const Text('Print Sample'),
              ),
            ),
            if (message.isNotEmpty) ...[
              const SizedBox(height: 85),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text('ERROR ===> $message'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
