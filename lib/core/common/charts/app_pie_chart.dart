import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AppPieChart extends StatelessWidget {
  final String? title;
  final List<Map<String, dynamic>> payload;
  final bool showCenterText;

  const AppPieChart({
    super.key,
    required this.payload,
    this.title,
    this.showCenterText = true,
  });

  @override
  Widget build(BuildContext context) {
    double total = payload.fold(0, (sum, item) => sum + item['value']);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            if (title != null)
              Text(
                title!,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 12),

            SizedBox(
              height: 250,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 2,
                  centerSpaceRadius: showCenterText ? 40 : 0,
                  sections: payload.map((item) {
                    final double value = item['value'].toDouble();
                    final Color color = item['color'];
                    return PieChartSectionData(
                      color: color,
                      value: value,
                      title: "${((value / total) * 100).toStringAsFixed(1)}%",
                      radius: 60,
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            if (showCenterText)
              Column(
                children: [
                  const SizedBox(height: 10),
                  Text(
                    "Total: $total",
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
