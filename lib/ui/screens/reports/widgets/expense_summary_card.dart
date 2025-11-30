import 'package:flutter/material.dart';

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Expenses (Last 30 days)',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),
            const Text(
              '-\$1270.00',
              style: TextStyle(
                color: Colors.red,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.trending_up, color: Colors.red, size: 18),
                SizedBox(width: 6),
                Text(
                  'Up 12% from last month',
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
