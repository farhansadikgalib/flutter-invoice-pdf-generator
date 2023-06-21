import 'dart:io';

import 'package:generate_pdf/helper/pdf_helper.dart';
import 'package:generate_pdf/model/invoice.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfInvoicePdfHelper {
  static Future<File> generate() async {
    final pdf = Document();
    // final font = await PdfGoogleFonts.openSansRegular();
    String svgRaw = '''
<svg width="180" height="25" viewBox="0 0 180 32" fill="none" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" clip-rule="evenodd" d="M14.5276 27.851C15.4915 27.851 16.2718 28.6212 16.2718 29.5725C16.2718 30.5239 15.4915 31.294 14.5276 31.294C13.5636 31.294 12.7833 30.5239 12.7833 29.5725C12.7833 28.6212 13.5636 27.851 14.5276 27.851Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M24.9471 27.851C25.911 27.851 26.6913 28.6211 26.6913 29.5725C26.6913 30.5239 25.911 31.294 24.9471 31.294C23.9832 31.294 23.2029 30.5239 23.2029 29.5725C23.2029 28.6211 23.9832 27.851 24.9471 27.851Z" fill="white"/>
<path d="M53.2563 15.5153C55.4022 16.5743 56.2915 18.1825 55.9243 20.3401L55.7751 21.2235C55.4538 23.1148 54.6448 24.5532 53.3424 25.5329C52.04 26.5182 50.3187 27.0052 48.1728 27.0052C46.027 27.0052 44.5065 26.5125 43.5368 25.5329C42.5672 24.5532 42.2459 23.1035 42.5672 21.1838C42.6819 20.5043 43.2786 20.0059 43.9786 20.0059H46.6925C46.6925 20.0059 46.7384 20.0286 46.7384 20.0569L46.5376 21.2574C46.2737 22.8034 47.0138 23.5792 48.7581 23.5792C50.5023 23.5792 51.5752 22.8204 51.8334 21.2971L51.9424 20.6345C52.1088 19.6492 51.6555 18.8904 50.5883 18.3524L46.8991 16.4384C44.8622 15.3341 44.036 13.6749 44.4089 11.4664L44.5294 10.7642C44.8507 8.87284 45.6368 7.42882 46.8876 6.43216C48.1384 5.43551 49.8252 4.93718 51.9482 4.93718C54.0711 4.93718 55.5858 5.43551 56.5038 6.43216C57.4218 7.42882 57.7202 8.87284 57.3989 10.7642L57.2382 11.7212C57.2382 11.7212 57.2153 11.7552 57.1923 11.7552H54.3924C53.8186 11.7552 53.3826 11.2456 53.4744 10.6849C53.6121 9.87516 53.526 9.2749 53.2104 8.8785C52.9006 8.48777 52.2867 8.28957 51.3801 8.28957C50.4736 8.28957 49.7966 8.48211 49.3548 8.86152C48.913 9.24092 48.6204 9.83552 48.4884 10.651L48.3966 11.2059C48.213 12.2875 48.649 13.0747 49.7048 13.5617L53.2735 15.5153H53.2563Z" fill="white"/>
<path d="M58.1965 27.0117L62.4596 1.71017C62.626 0.724841 63.4923 0 64.5079 0H66.7628L65.4259 7.92229C65.7472 7.35601 66.3095 6.8237 67.1128 6.31971C67.916 5.81572 68.8857 5.56655 70.0217 5.56655C71.6111 5.56655 72.7758 6.03091 73.5159 6.96527C74.2561 7.89964 74.4913 9.1398 74.2331 10.6857L71.7086 25.6696C71.5766 26.4454 70.8996 27.0117 70.1021 27.0117H67.4341L70.0504 11.4955C70.3258 9.84765 69.6201 9.02654 67.9332 9.02654C67.1759 9.02654 66.5046 9.24173 65.9136 9.6721C65.3226 10.1025 64.9669 10.6971 64.8349 11.4616L62.2129 27.0117H58.2023H58.1965Z" fill="white"/>
<path d="M90.0433 21.2093C89.722 23.1233 88.8728 24.6183 87.5073 25.6886C86.1417 26.7588 84.409 27.2911 82.3148 27.2911C80.2205 27.2911 78.637 26.7588 77.6443 25.6886C76.6517 24.6183 76.319 23.129 76.6403 21.2093L78.3099 11.2993C78.6312 9.3853 79.4689 7.89031 80.823 6.82004C82.177 5.74977 83.9155 5.21746 86.0327 5.21746C88.1499 5.21746 89.6761 5.75543 90.6802 6.83703C91.6843 7.91863 92.0285 9.40229 91.7072 11.2937L90.0376 21.2036L90.0433 21.2093ZM87.7024 11.2993C87.9892 9.60615 87.2376 8.75672 85.4417 8.75672C83.6459 8.75672 82.5729 9.60615 82.2861 11.2993L80.6164 21.2093C80.3295 22.9025 81.0984 23.7519 82.9115 23.7519C84.7245 23.7519 85.7401 22.9025 86.027 21.2093L87.6966 11.2993H87.7024Z" fill="white"/>
<path d="M106.593 20.0851C106.306 21.784 105.595 23.1034 104.453 24.0491C103.311 24.9948 101.94 25.4648 100.345 25.4648C98.7499 25.4648 97.5564 25.0401 96.9999 24.1907L96.0589 29.7742C95.9098 30.6576 95.1352 31.3032 94.2286 31.3032H91.9508L96.122 6.57931C96.2827 5.63362 97.1089 4.94276 98.0786 4.94276H100.253L99.9662 6.6416C100.282 6.19424 100.81 5.77519 101.538 5.38446C102.273 4.99372 103.133 4.80119 104.126 4.80119C105.727 4.80119 106.892 5.25987 107.62 6.18291C108.349 7.10029 108.578 8.35178 108.314 9.9317L106.605 20.0851H106.593ZM97.7114 19.9436C97.5909 20.6514 97.7401 21.2064 98.1589 21.6084C98.5777 22.0105 99.163 22.2087 99.9089 22.2087C101.533 22.2087 102.474 21.4329 102.738 19.8756L104.327 10.464C104.591 8.90673 103.908 8.13093 102.284 8.13093C101.533 8.13093 100.879 8.32912 100.328 8.73118C99.7769 9.13324 99.4384 9.6882 99.3179 10.3961L97.7056 19.9492L97.7114 19.9436Z" fill="white"/>
<path d="M116.032 0H118.465L114.196 25.3072C114.03 26.2925 113.169 27.0117 112.153 27.0117H109.893L114.19 1.53462C114.339 0.645562 115.12 0 116.026 0L116.032 0Z" fill="#FFC900"/>
<path d="M132.281 20.929C131.96 22.843 131.11 24.338 129.745 25.4083C128.379 26.4786 126.647 27.0109 124.552 27.0109C122.458 27.0109 120.874 26.4786 119.882 25.4083C118.889 24.338 118.557 22.8487 118.878 20.929L120.547 11.019C120.869 9.10502 121.706 7.61003 123.061 6.53976C124.415 5.46948 126.153 4.93718 128.27 4.93718C130.387 4.93718 131.914 5.47515 132.918 6.55675C133.922 7.63835 134.266 9.12201 133.945 11.0134L132.275 20.9233L132.281 20.929ZM129.94 11.019C130.227 9.32587 129.475 8.47644 127.679 8.47644C125.883 8.47644 124.81 9.32587 124.524 11.019L122.854 20.929C122.567 22.6222 123.336 23.4716 125.149 23.4716C126.962 23.4716 127.978 22.6222 128.265 20.929L129.934 11.019H129.94Z" fill="#FFC900"/>
<path d="M141.369 13.9762C141.432 15.4485 141.461 16.9152 141.449 18.3818C141.438 19.8428 141.409 20.9414 141.363 21.6776L141.335 22.7818C142.109 20.1883 143.113 17.2549 144.347 13.9762L147.147 6.45593C147.485 5.54421 148.363 4.94395 149.344 4.94395H151.823L143.245 27.0176H138.036L136.865 4.94395H141.054L141.369 13.9762Z" fill="#FFC900"/>
<path d="M155.753 17.0953L155.093 21.0026C154.812 22.6731 155.592 23.5056 157.434 23.5056C159.276 23.5056 160.337 22.6675 160.619 21.0026C160.768 20.1305 161.531 19.4906 162.426 19.4906H164.847L164.606 20.929C164.285 22.843 163.436 24.338 162.07 25.4083C160.705 26.4786 158.96 27.0109 156.843 27.0109C154.726 27.0109 153.165 26.4786 152.173 25.4083C151.18 24.338 150.842 22.8487 151.169 20.929L152.838 11.019C153.16 9.10502 153.997 7.61003 155.352 6.53976C156.706 5.46948 158.444 4.93718 160.561 4.93718C162.678 4.93718 164.245 5.47515 165.249 6.55675C166.253 7.63835 166.597 9.12201 166.276 11.0134L165.255 17.0556H165.105V17.0953H155.753ZM162.357 10.9398C162.638 9.26924 161.846 8.4368 159.976 8.4368C158.106 8.4368 157.073 9.2749 156.792 10.9398L156.281 13.9637H161.846L162.357 10.9398Z" fill="#FFC900"/>
<path d="M179.306 8.9577C178.91 8.83312 178.382 8.76516 177.728 8.76516C176.839 8.76516 176.053 9.06529 175.364 9.65989C174.676 10.2601 174.245 11.0529 174.079 12.0439L171.876 25.1137C171.692 26.2067 170.734 27.0108 169.609 27.0108H167.401L171.13 4.91444H175.089L174.595 7.85345C174.831 7.08897 175.353 6.39244 176.162 5.75254C176.977 5.1183 177.981 4.80119 179.186 4.80119C179.576 4.80119 179.851 4.81251 180 4.84083L179.306 8.96336V8.9577Z" fill="#FFC900"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M0 0H8.38838L9.78835 3.61854H4.0278L3.34502 1.82343H0.688513L0 0Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M4.53845 4.96046L34.8617 4.93214L32.8076 10.3911H12.2326L12.9096 12.1749H32.1363L28.5733 21.6261H18.412L16.9259 17.7754H24.2816L24.9529 15.9916H8.68674L4.53845 4.96046Z" fill="white"/>
<path fill-rule="evenodd" clip-rule="evenodd" d="M9.45569 18.0469L12.8237 27.0111L26.5652 27.0054L28.0226 23.1547H17.1326L15.1646 18.0469H9.45569Z" fill="#FFC900"/>
</svg>
''';
    pdf.addPage(MultiPage(
      pageFormat: PdfPageFormat.a4,
      orientation: PageOrientation.portrait,
      margin: pw.EdgeInsets.zero,
      build: (context) => [
        buildHeader(svgRaw),
        pw.SizedBox(height: 10),
        // buildInvoice(invoice),
        pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 18),
            child: Divider(height: 5, color: PdfColor.fromHex("EDEFF5"))),
        pw.SizedBox(height: 10),
        buildTotal(),
      ],
    ));

    return PdfHelper.saveDocument(name: 'invoice.pdf', pdf: pdf);
  }

  static Widget buildHeader(svgRaw) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pw.Container(
              padding: const pw.EdgeInsets.symmetric(horizontal: 18),
              height: 75,
              width: double.infinity,
              color: PdfColors.black,
              child: pw.Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    pw.SvgImage(svg: svgRaw),
                    pw.Text("INVOICE",
                        style: pw.TextStyle(
                            fontWeight: FontWeight.bold,
                            color: PdfColors.white,
                            fontSize: 24))
                  ])),
          pw.Container(
              padding: const pw.EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 5),
              color: PdfColor.fromHex("EDEFF5"),
              height: 100,
              width: double.infinity,
              child: pw.Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    pw.Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          pw.Text("Shoplover.com"),
                          pw.SizedBox(height: 5),
                          pw.RichText(
                            text: const TextSpan(
                              text: 'Phone: ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: '+8801322-819423',
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.RichText(
                            text: const TextSpan(
                              text: 'Email: ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'support@shoplover.com',
                                ),
                              ],
                            ),
                          ),
                        ]),
                    pw.Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          pw.RichText(
                            text: const TextSpan(
                              text: 'Order ID: ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'SLW230511438',
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.RichText(
                            text: const TextSpan(
                              text: 'Order Date: ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'May 16, 2023',
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.RichText(
                            text: const TextSpan(
                              text: 'Payment Method: ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'bKash',
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(height: 5),
                          pw.RichText(
                            text: const TextSpan(
                              text: 'Payment Status: ',
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Paid',
                                ),
                              ],
                            ),
                          ),
                        ])
                  ])),
          pw.SizedBox(height: 10),
          pw.Padding(
            padding: const pw.EdgeInsets.symmetric(horizontal: 16),
            child: pw.Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // buildSupplierAddress(invoice.supplier),
                pw.Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pw.SizedBox(height: 15),
                      pw.Text('Bill To: '),
                      pw.RichText(
                        text: const TextSpan(
                          text: 'Name: ',
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Farhan',
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: const TextSpan(
                          text: 'Address: ',
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Dinajpur sadar, Dinajpur',
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: const TextSpan(
                          text: 'Email: ',
                          children: <TextSpan>[
                            TextSpan(
                              text: 'farhan@gmail.com',
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: const TextSpan(
                          text: 'Phone: ',
                          children: <TextSpan>[
                            TextSpan(
                              text: '01676797997',
                            ),
                          ],
                        ),
                      ),
                    ]),
                pw.Container(
                  height: 75,
                  width: 75,
                  child: BarcodeWidget(
                    barcode: Barcode.qrCode(),
                    data: "01233242342",
                  ),
                ),
              ],
            ),
          ),
        ],
      );

  static Widget buildInvoice(Invoice invoice) {
    final headers = ['Item Name', 'Unit Price', 'Qty', 'Total'];

    final data = invoice.items.map((item) {
      final total = item.unitPrice * item.quantity * (1 + item.vat);
      return [
        item.description,
        '${item.quantity}',
        '\$ ${item.unitPrice}',
        '\$ $total',
      ];
    }).toList();

    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 16),
        child: Table.fromTextArray(
          headers: headers,
          headerAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerRight,
            2: Alignment.centerRight,
            3: Alignment.centerRight,
          },
          data: data,
          border: null,
          // cellStyle: pw.TextStyle(font: cusfont),
          headerStyle: TextStyle(fontWeight: FontWeight.bold),
          headerDecoration: BoxDecoration(color: PdfColor.fromHex("EDEFF5")),
          cellHeight: 30,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerRight,
            2: Alignment.centerRight,
            3: Alignment.centerRight,
          },
        ));
  }

  static Widget buildTotal() {
    return pw.Padding(
        padding: const pw.EdgeInsets.symmetric(horizontal: 16),
        child: pw.Row(
          children: [
            pw.Expanded(
                flex: 4,
                child: pw.Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      pw.RichText(
                        text: const TextSpan(
                          text: 'Delivery Type: ',
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Home Delivery',
                            ),
                          ],
                        ),
                      ),
                      pw.RichText(
                        text: const TextSpan(
                          text: 'Seller Name: ',
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Ummea Sarah',
                            ),
                          ],
                        ),
                      )
                    ])),
            Expanded(
              flex: 4,
              child: pw.Container(
                  height: 100,
                  padding: const pw.EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: PdfColor.fromHex("EDEFF5")),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: PdfColor.fromHex("#f9f9fa")),
                  child: pw.Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        pw.Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              pw.SizedBox(height: 5),
                              pw.Text('Sub-Total:'),
                              pw.SizedBox(height: 5),
                              pw.Text('Total-Tax:'),
                              pw.SizedBox(height: 5),
                              pw.Text('Discount:'),
                              pw.SizedBox(height: 5),
                              pw.Text('Total:'),
                              pw.SizedBox(height: 5),
                            ]),
                        pw.Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              pw.SizedBox(height: 5),
                              pw.Text('BDT 15,000'),
                              pw.SizedBox(height: 5),
                              pw.Text('BDT 0'),
                              pw.SizedBox(height: 5),
                              pw.Text('BDT 50'),
                              pw.SizedBox(height: 5),
                              pw.Text('BDT 15,050'),
                            ])
                      ])),
            )
          ],
        ));
  }
}
