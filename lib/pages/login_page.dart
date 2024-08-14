// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quran/fingerprint_channel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool authenticated = await FingerprintChannel.authenticate();
            if (authenticated) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Berhasil masuk',
                  ),
                ),
              );
              Navigator.popAndPushNamed(
                context,
                '/list-surat',
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Gagal masuk',
                  ),
                ),
              );
            }
          },
          child: const Text('Login dengan Fingerprint'),
        ),
      ),
    );
  }
}
