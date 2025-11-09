import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppLineChart extends StatelessWidget {
  final String? title;
  final List<List<Map<String, dynamic>>> multiPayload;
  final List<Color> colors;
  final bool isCurved;
  final bool showDots;
  final double minY, maxY;

  const AppLineChart({
    super.key,
    required this.multiPayload,
    required this.colors,
    this.title,
    this.isCurved = true,
    this.showDots = true,
    this.minY = 0,
    this.maxY = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (title != null)
              Text(title!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

            SizedBox(
              height: 250,
              child: LineChart(
                LineChartData(
                  rangeAnnotations: RangeAnnotations(),
                  backgroundColor:Color.fromARGB(255, 59, 58, 55) ,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                   
                 
                  ),
                  minX: 0,
                  maxX: (multiPayload.first.length - 1).toDouble(),
                  minY: minY,
                  maxY: maxY,
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: true),

                  lineBarsData: List.generate(multiPayload.length, (i) {
                    final spots = multiPayload[i].asMap().entries.map((entry) {
                      int x = entry.key;
                      double y = entry.value["value"].toDouble();
                      return FlSpot(x.toDouble(), y);
                    }).toList();

                    return LineChartBarData(
                      spots: spots,
                      isCurved: isCurved,
                      barWidth: 3,
                      color: colors[i],
                      dotData: FlDotData(show: showDots),
                      belowBarData: BarAreaData(
                        show: true,
                        color: colors[i].withOpacity(0.2),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
