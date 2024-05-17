import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQRcode extends StatefulWidget {
  const ScanQRcode({super.key});

  @override
  _ScanQRcodeState createState() => _ScanQRcodeState();
}

class _ScanQRcodeState extends State<ScanQRcode> {
  String qrResult = 'Scanned data will be appered here';
  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrResult = qrCode.toString();
      });
    } on PlatformException {
      qrResult = 'Fail to read QR Code ';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR scanner'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              '$qrResult',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 38,
            ),
            ElevatedButton(onPressed: scanQR, child: Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
