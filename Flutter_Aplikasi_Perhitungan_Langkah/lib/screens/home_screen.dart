import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:async';

// Pedometer & Permission hanya impor kalau bukan Web
// (hindari crash saat build Web)
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Stream<StepCount>? _stepCountStream;
  int _steps = 0;
  String _status = 'Menunggu izin...';

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      _initPlatformState();
    } else {
      setState(() {
        _status = 'Fitur tidak tersedia di Web';
      });
    }
  }

  Future<void> _initPlatformState() async {
    // Cek dan minta permission (khusus Android)
    if (Platform.isAndroid) {
      var status = await Permission.activityRecognition.request();
      if (!status.isGranted) {
        setState(() {
          _status = 'Izin ditolak';
        });
        return;
      }
    }

    // Mulai pedometer
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream!.listen(_onStepCount).onError(_onStepCountError);

    setState(() {
      _status = 'Menghitung langkah...';
    });
  }

  void _onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps;
    });
  }

  void _onStepCountError(error) {
    setState(() {
      _status = 'Error menghitung langkah';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penghitung Langkah')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_status, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            if (!kIsWeb)
              Text(
                'Langkah: $_steps',
                style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )
            else
              const Text(
                'Gunakan Android untuk menghitung langkah.',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
