import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  final int solvedQuestions;
  final int mockSessions;
  final double accuracyRate;
  final int categoriesCovered;
  final List<FlSpot> weeklyTimeSpots;

  const ProgressScreen({
    super.key,
    this.solvedQuestions = 160,
    this.mockSessions = 13,
    this.accuracyRate = 88.0,
    this.categoriesCovered = 6,
    this.weeklyTimeSpots = const [
      FlSpot(0, 100),
      FlSpot(1, 170),
      FlSpot(2, 140),
      FlSpot(3, 200),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progress')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "You're making great strides!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              "Keep pushing towards your goals.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Stats Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                StatCard(
                  icon: Icons.check_circle,
                  label: 'Solved Questions',
                  value: '$solvedQuestions',
                  color: Colors.green,
                ),
                StatCard(
                  icon: Icons.person,
                  label: 'Mock Sessions',
                  value: '$mockSessions',
                  color: Colors.blue,
                ),
                StatCard(
                  icon: Icons.percent,
                  label: 'Accuracy Rate',
                  value: '${accuracyRate.toStringAsFixed(1)}%',
                  color: Colors.purple,
                ),
                StatCard(
                  icon: Icons.category,
                  label: 'Categories Covered',
                  value: '$categoriesCovered/8',
                  color: Colors.orange,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Time Spent Graph Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category Time Spent',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  ToggleButtons(
                    isSelected: [true, false],
                    onPressed: (_) {},
                    borderRadius: BorderRadius.circular(12),
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Weekly'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Monthly'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 200,
                    child: LineChart(
                      LineChartData(
                        minY: 0,
                        maxY: 220,
                        gridData: FlGridData(show: true),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, _) {
                                final weeks = [
                                  'Week 1',
                                  'Week 2',
                                  'Week 3',
                                  'Week 4',
                                ];
                                return Text(
                                  weeks[value.toInt() % weeks.length],
                                  style: const TextStyle(fontSize: 10),
                                );
                              },
                            ),
                          ),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 28,
                              getTitlesWidget:
                                  (value, _) => Text(
                                    '${value.toInt()} min',
                                    style: const TextStyle(fontSize: 10),
                                  ),
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            spots: weeklyTimeSpots,
                            isCurved: true,
                            color: Colors.indigo,
                            belowBarData: BarAreaData(
                              show: true,
                              color: Colors.indigo.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const StatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.grey, fontSize: 13),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
