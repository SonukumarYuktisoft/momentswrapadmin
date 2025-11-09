import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:momentswrapadmin/core/common/charts/app_line_chart.dart';
import 'package:momentswrapadmin/core/common/charts/app_pie_chart.dart';
import 'package:momentswrapadmin/core/helpers/pdf_screen.dart';
import 'package:printing/printing.dart';

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final payload = [
    {"value": 3},
    {"value": 4},
    {"value": 6},
    {"value": 8},
    {"value": 8},
  ];
  final salesData = [
    {"value": 3},
    {"value": 4},
    {"value": 6},
    {"value": 5},
    {"value": 8},
  ];

  final expenseData = [
    {"value": 2},
    {"value": 3},
    {"value": 4},
    {"value": 3},
    {"value": 5},
  ];
  final piepayload = [
    {"label": "Books", "value": 40, "color": Colors.blue},
    {"label": "Stationary", "value": 25, "color": Colors.green},
    {"label": "E-books", "value": 20, "color": Colors.orange},
    {"label": "Magazines", "value": 15, "color": Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // PdfPreview(build: (format) {
                //   return PdfScreen.generatePdfWithImageAndIcon(format, "test");
                // },),
                // ElevatedButton(onPressed: () {
                //   PdfScreen.generatePdfWithImageAndIcon();
                // }, child: Text("Generate PDF")),
                AppLineChart(
                  multiPayload: [salesData, expenseData, payload],
                  colors: [Colors.red, Colors.green, Colors.blue],
                  isCurved: true,
                  title: 'test',
                ),
                AppPieChart(
                  title: "Sales Category Share",
                  payload: piepayload, // API se aaya data
                  showCenterText: true,
                ),
                BarLineComboChart()
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class BarLineComboChart extends StatelessWidget {
  const BarLineComboChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [
          // BAR CHART
          BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              barGroups: [
                BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8)]),
                BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 10)]),
                BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 14)]),
                BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 15)]),
                BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 13)]),
              ],
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(show: false),
            ),
          ),

          // LINE CHART ON TOP
          LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: const [
                    FlSpot(0, 6),
                    FlSpot(1, 9),
                    FlSpot(2, 11),
                    FlSpot(3, 13),
                    FlSpot(4, 12),
                  ],
                  isCurved: true,
                  dotData: FlDotData(show: true),
                ),
              ],
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(show: false),
              gridData: FlGridData(show: false),
            ),
          ),

          PieChart(
             duration: Duration(milliseconds: 150), // Optional
  curve: Curves.linear,
            PieChartData(

              sections: [
                PieChartSectionData(value: 7, color: Colors.red),
                PieChartSectionData(value: 5, color: Colors.yellow),
                PieChartSectionData(value: 3, color: Colors.purple),
              ],
              borderData: FlBorderData(show: false),
              centerSpaceColor: Colors.white.withOpacity(.5),
              centerSpaceRadius: 20,
              pieTouchData: PieTouchData(enabled: false),
              // sectionsSpace: 4552,
              // startDegreeOffset: 5151,
              // titleSunbeamLayout: true,
            

            )),
    
        ],
      ),
    );
  }
}
