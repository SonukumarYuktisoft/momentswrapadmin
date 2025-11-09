import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfScreen {
  static Future<Uint8List> generatePdfWithImageAndIcon(
    PdfPageFormat format,
    String title,
  ) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

    final dio = Dio();

    // 🖼️ Load image from assets
    final assetImageBytes = (await rootBundle.load(
      'lib/assets/images/stap.png',
    )).buffer.asUint8List();
    final assetImage = pw.MemoryImage(assetImageBytes);

    // 🌐 Load image from network
    final url = 'https://picsum.photos/200';
    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    final networkImage = pw.MemoryImage(response.data);

    // 🧩 Use a Material icon (built into pdf package)
    // final icon = pw.Icon(Icons.h_mobiledata as pw.IconData, size: 40); // Home icon (Material)

    // 🧱 Add Page
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text(
              "PDF Example with Icon and Images",
              style: pw.TextStyle(
                fontSize: 20,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blue800,
              ),
            ),
            pw.SizedBox(height: 20),

            // 🖼 Asset Image
            pw.Text("Asset Image:"),
            // pw.Image(assetImage, width: 120, height: 120),
            pw.SizedBox(height: 20),

            // 🌐 Network Image
            pw.Text("Network Image:"),
            pw.Image(networkImage, width: 120, height: 120),
            pw.SizedBox(height: 20),

            // 🧩 Icon Example
            pw.Text("Material Icon (Home):"),
            // icon,
          ],
        ),
      ),
    );

    // 💾 Save file locally and return bytes
    final bytes = await pdf.save();

    final output = Directory.systemTemp;
    final file = File("${output.path}/image_icon_pdf.pdf");
    await file.writeAsBytes(bytes);

    // 📤 Show / share PDF
    await Printing.sharePdf(bytes: bytes, filename: 'image_icon_pdf.pdf');

    return bytes;
  }

  static Future<Uint8List> generatePdf(
    PdfPageFormat format,
    String title,
  ) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.albertSansMediumItalic();
    final font2 = await PdfGoogleFonts.albertSansRegular();
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/stap.png')).buffer.asUint8List(),
    );
    final dio = Dio();
    final url = 'https://picsum.photos/200';
    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    final networkImage = pw.MemoryImage(response.data);
    final primaryColor = PdfColor.fromInt(const Color(0xFF37474F).hashCode);
    final broderColor = PdfColor.fromInt(const Color(0xFF545556).hashCode);
    final boxShadowColor = PdfColor.fromInt(
      const Color.fromARGB(255, 129, 135, 141).hashCode,
    );
    final List<Map<String, dynamic>> apiData = [
      {
        "model": "apple iphone 15",
        "color": "golden",
        "ram": "8",
        "rom": "256",
        "quantity": 1,
        "sellingPrice": 20.00,
        "accessoryName": "apple",
        "accessoryIncluded": false,
        "imei": "233639639258143",
        "company": "apple",
      },
      {
        "model": "apple iphone 15",
        "color": "golden",
        "ram": "8",
        "rom": "256",
        "quantity": 1,
        "sellingPrice": 20.00,
        "accessoryName": "apple",
        "accessoryIncluded": false,
        "imei": "233639639258143",
        "company": "apple",
      },
      {
        "model": "apple iphone 15",
        "color": "golden",
        "ram": "8",
        "rom": "256",
        "quantity": 1,
        "sellingPrice": 20.00,
        "accessoryName": "apple",
        "accessoryIncluded": false,
        "imei": "233639639258143",
        "company": "apple",
      },
    ];

    pdf.addPage(
      pw.Page(
        margin: pw.EdgeInsets.all(10),
        orientation: pw.PageOrientation.natural,
        // pageTheme:pw. PageTheme(
        //     orientation: pw.PageOrientation.landscape,
        //     buildBackground: (context) {
        //       return pw.Container(color: PdfColors.grey100);
        //     },
        // ),
        pageFormat: format,
        build: (context) {
          return pw.Container(
            width: double.infinity,
            height: double.infinity,
            padding: pw.EdgeInsets.all(6),
            decoration: pw.BoxDecoration(
              color: PdfColors.white,

              border: pw.Border.all(
                color: broderColor,
                width: 2,
                style: pw.BorderStyle.solid,
              ),
              borderRadius: pw.BorderRadius.circular(10),
            ),
            child: pw.Column(
              children: [
                pw.Header(
                  outlineColor: broderColor,
                  text: FlutterVersion.channel,
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Row(
                        children: [
                          pw.Image(logoImage, width: 100, height: 100),
                          pw.SizedBox(width: 8),
                          pw.Text(
                            "MomentsWrap Report",
                            style: pw.TextStyle(
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      pw.Text(
                        "Date: ${DateTime.now().toString().split(' ')[0]}",
                        style: pw.TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Text(
                      "Sone Shop",
                      style: pw.TextStyle(
                        fontSize: 20,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      "Shop Address ₹",
                      style: pw.TextStyle(
                        font: font, // 👈 Apply custom font
                        fontSize: 18,
                        color: PdfColors.blue,
                      ),
                    ),

                    pw.Text(
                      "Shop Address ₹500 only",
                      style: pw.TextStyle(
                        font: font2, // 👈 Apply custom font
                        fontSize: 18,
                        color: PdfColors.blue,
                      ),
                    ),
                    pw.Text("Phone Number"),
                    pw.Text("Email"),
                    pw.Text("GST Number"),
                    pw.Text("Website"),
                  ],
                ),

                pw.Container(
                  // height: 100,
                  width: double.infinity,
                  alignment: pw.Alignment.centerLeft,
                  padding: pw.EdgeInsets.symmetric(horizontal: 10),
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey100,
                    borderRadius: pw.BorderRadius.circular(10),
                    border: pw.Border.all(
                      color: broderColor,
                      width: 2,
                      style: pw.BorderStyle.solid,
                    ),
                  ),
                  child: pw.Column(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.center,
                        children: [
                          pw.Text(
                            "Invoice",
                            style: pw.TextStyle(
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      pw.Row(
                        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                        children: [
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Customer Name :",
                                style: pw.TextStyle(
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "Shop Address ₹",
                                style: pw.TextStyle(
                                  font: font, // 👈 Apply custom font
                                  fontSize: 18,
                                  color: PdfColors.blue,
                                ),
                              ),

                              pw.Text(
                                "Shop Address ₹500 only",
                                style: pw.TextStyle(
                                  font: font2, // 👈 Apply custom font
                                  fontSize: 18,
                                  color: PdfColors.blue,
                                ),
                              ),
                            ],
                          ),
                          pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            mainAxisAlignment: pw.MainAxisAlignment.start,
                            children: [
                              pw.Text(
                                "Sone Shop",
                                style: pw.TextStyle(
                                  fontSize: 20,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                              pw.Text(
                                "Shop Address ₹",
                                style: pw.TextStyle(
                                  font: font, // 👈 Apply custom font
                                  fontSize: 18,
                                  color: PdfColors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                pw.SizedBox(height: 10),

                pw.Table(
                  border: pw.TableBorder.all(color: PdfColors.grey400),

                  columnWidths: {
                    0: pw.FlexColumnWidth(0.5),
                    1: pw.FlexColumnWidth(3),
                    2: pw.FlexColumnWidth(0.8),
                    3: pw.FlexColumnWidth(1),
                    4: pw.FlexColumnWidth(1),
                  },
                  children: [
                    pw.TableRow(
                      verticalAlignment: pw.TableCellVerticalAlignment.middle,
                      children: [
                        pw.Expanded(child: pw.Text("S.No")),
                        pw.Expanded(child: pw.Text("ITEM DESCRIPTION")),
                        pw.Expanded(child: pw.Text("QTY")),
                        pw.Expanded(child: pw.Text("RATE")),
                        pw.Expanded(child: pw.Text("AMOUNT")),
                      ],
                    ),
                    ...apiData.map(
                      (e) => pw.TableRow(
                        children: [
                          pw.Expanded(child: pw.Text(e['model'])),
                          pw.Expanded(child: pw.Text(e['color'])),
                          pw.Expanded(child: pw.Text(e['ram'])),
                          pw.Expanded(child: pw.Text(e['rom'])),
                          pw.Expanded(
                            child: pw.Text(e['sellingPrice'].toString()),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _tableHeaderCell(String text) {
    return pw.Padding(padding: pw.EdgeInsets.all(5), child: pw.Text(text));
  }

  pw.Widget _tableBodyCell(
    String text, {
    pw.Alignment alignment = pw.Alignment.centerRight,
  }) {
    return pw.Container(
      alignment: alignment,
      padding: pw.EdgeInsets.all(5),
      child: pw.Text(text),
    );
  }

  Future<Uint8List> generateInvoicePdf(
    Map<String, dynamic> invoiceData,
    PdfPageFormat format,
  ) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.robotoRegular();
    final boldFont = await PdfGoogleFonts.robotoBold();
    final emoji = await PdfGoogleFonts.notoColorEmoji();
    final stempLogoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/stap.png')).buffer.asUint8List(),
    );
    final signature = pw.MemoryImage(
      (await rootBundle.load(
        'assets/images/signature.png',
      )).buffer.asUint8List(),
    );

    final items = List<Map<String, dynamic>>.from(invoiceData["items"]);

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        margin: const pw.EdgeInsets.all(16),
        theme: pw.ThemeData.withFont(base: font),
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // 🔹 HEADER
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Logo (square box with initial)
                  pw.Container(
                    width: 40,
                    height: 40,
                    alignment: pw.Alignment.center,
                    decoration: pw.BoxDecoration(
                      color: PdfColors.blue700,
                      borderRadius: pw.BorderRadius.circular(6),
                    ),
                    child: pw.Text(
                      "S",
                      style: pw.TextStyle(
                        font: boldFont,
                        fontSize: 20,
                        color: PdfColors.white,
                      ),
                    ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        "SONU MOBILE SHOP",
                        style: pw.TextStyle(
                          font: boldFont,
                          fontSize: 14,
                          color: PdfColors.black,
                        ),
                      ),
                      pw.Text("Address: BIHAR, 778787"),
                      pw.Text("Mobile: 8306251238"),
                      pw.Text("Email: sonukumar.ykjitsf@gmail.com"),
                      pw.Text("GST No: 29ABCDE3247F26"),
                    ],
                  ),
                ],
              ),

              pw.Divider(thickness: 1),
              pw.SizedBox(height: 10),

              // 🔹 Invoice Header
              pw.Center(
                child: pw.Text(
                  "INVOICE",
                  style: pw.TextStyle(font: boldFont, fontSize: 16),
                ),
              ),
              pw.SizedBox(height: 8),

              // 🔹 Customer Info
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Customer Name: ${invoiceData["customerName"]}"),
                      pw.Text("Address: ${invoiceData["address"]}"),
                      pw.Text("Mobile No: ${invoiceData["mobile"]}"),
                    ],
                  ),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Invoice No: ${invoiceData["invoiceNo"]}"),
                      pw.Text("Date: ${invoiceData["date"]}"),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 10),

              // 🔹 Table Header
              pw.Table(
                border: pw.TableBorder.all(color: PdfColors.grey400),
                columnWidths: {
                  0: pw.FlexColumnWidth(0.6),
                  1: pw.FlexColumnWidth(3),
                  2: pw.FlexColumnWidth(0.8),
                  3: pw.FlexColumnWidth(1),
                  4: pw.FlexColumnWidth(1),
                },
                children: [
                  pw.TableRow(
                    decoration: pw.BoxDecoration(color: PdfColors.grey300),
                    children: [
                      _headerCell("S.No"),
                      _headerCell("ITEM DESCRIPTION"),
                      _headerCell("QTY"),
                      _headerCell("RATE"),
                      _headerCell("AMOUNT"),
                    ],
                  ),
                  ...items.asMap().entries.map((entry) {
                    final i = entry.key + 1;
                    final item = entry.value;
                    final rate = item["sellingPrice"];
                    final qty = item["quantity"];
                    final amount = rate * qty;
                    return pw.TableRow(
                      children: [
                        _cell("$i", align: pw.Alignment.center),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(6),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text("Company: ${item["company"]}"),
                              pw.Text("Model: ${item["model"]}"),
                              pw.Text("IMEI: ${item["imei"]}"),
                              pw.Text(
                                "RAM: ${item["ram"]}GB ROM: ${item["rom"]}GB",
                              ),
                              pw.Text("Color: ${item["color"]}"),
                              pw.Text("Accessory: ${item["accessoryName"]}"),
                            ],
                          ),
                        ),
                        _cell("$qty", align: pw.Alignment.center),
                        _cell(
                          "₹${rate.toStringAsFixed(2)}",
                          align: pw.Alignment.centerRight,
                        ),
                        _cell(
                          "₹${amount.toStringAsFixed(2)}",
                          align: pw.Alignment.centerRight,
                        ),
                      ],
                    );
                  }),
                ],
              ),

              pw.SizedBox(height: 15),

              // 🔹 Summary Section
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "TERMS & CONDITIONS:",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text("1. Goods once sold will not be taken back."),
                        pw.Text("2. Warranty as per company terms."),
                        pw.Text("3. Payment is due at the time of purchase."),
                        pw.Text("4. Subject to local jurisdiction only."),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "PAYMENT DETAILS:",
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text("Payment Method: Cash"),
                        pw.Text("Total Payable: ₹20.00"),
                      ],
                    ),
                  ),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.end,
                      children: [
                        _summaryRow("Without GST", "₹16.95"),
                        _summaryRow("Repair Charges", "₹0.00"),
                        _summaryRow("Accessories Cost", "₹0.00"),
                        _summaryRow("Discount", "₹0.00"),
                        _summaryRow("Taxable Amount", "₹16.95"),
                        _summaryRow("CGST (9%)", "₹1.53"),
                        _summaryRow("SGST (9%)", "₹1.53"),
                        pw.Divider(),
                        _summaryRow("TOTAL", "₹20.00", bold: true, font: font),
                      ],
                    ),
                  ),
                ],
              ),
              
              pw.SizedBox(height: 15),
              pw.Text(
                "Amount in Words: Twenty Only",
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
                  pw.Row(
                    children: [
                         pw.Spacer(),
                      pw.Image(stempLogoImage, width: 200, height: 200),
                      pw.Stack(
                        alignment: pw.Alignment.center,
                        children: [
                          
                          pw.ClipRRect(
                            horizontalRadius: 20,
                            verticalRadius: 20,
                            child: pw.FittedBox(
                              child: pw.Image(
                                signature,
                                width: 200,
                                height: 200,
                              ),
                            ),
                            // child: pw.Image(signature, width: 200,height: 200),
                          ),
                          pw.Positioned(
                            top: 100,
                            child: pw.Text(
                              "Authorized Signature",
                              style: const pw.TextStyle(fontSize: 10),
                            ),
                          ),
                        
                          // pw.Image(stempLogoImage, width: 200, height: 200),
                        ],
                      ),
                    ],
                  ),
                ],
              ),


              pw.Spacer(),
              pw.Center(
                child: pw.Text(
                  "Thank you for supporting a paperless world 🌱",
                  style: pw.TextStyle(
                    color: PdfColors.green,
                    fontSize: 10,
                    font: font,
                    fontFallback: [emoji],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _headerCell(String text) => pw.Padding(
    padding: const pw.EdgeInsets.all(6),
    child: pw.Text(
      text,
      style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 9),
    ),
  );

  pw.Widget _cell(
    String text, {
    pw.Alignment align = pw.Alignment.centerLeft,
  }) => pw.Container(
    alignment: align,
    padding: const pw.EdgeInsets.all(6),
    child: pw.Text(text, style: const pw.TextStyle(fontSize: 9)),
  );

  pw.Widget _summaryRow(
    String label,
    String value, {
    bool bold = false,
    pw.Font? font,
  }) => pw.Row(
    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    children: [
      pw.Text(
        label,
        style: pw.TextStyle(
          fontSize: 9,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
      pw.Text(
        value,
        style: pw.TextStyle(
          font: font,
          fontSize: 9,
          fontWeight: bold ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
    ],
  );
}
