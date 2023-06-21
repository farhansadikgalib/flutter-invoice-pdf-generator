import 'package:flutter/material.dart';
import 'package:generate_pdf/helper/pdf_helper.dart';
import 'package:generate_pdf/helper/pdf_invoice_helper.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.picture_as_pdf,
                  size: 72.0,
                  color: Colors.blue,
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'Generate Invoice',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () async {
                    final pdfFile = await PdfInvoicePdfHelper.generate();
                    PdfHelper.openFile(pdfFile);
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 60.0, vertical: 8.0),
                    child: Text('Generate and Open'),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
