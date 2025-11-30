import 'package:flutter/material.dart';
import 'widgets/expense_summary_card.dart';
import 'widgets/spending_breakdown_item.dart';
import '../../widgets/bottom_nav.dart';

class ReportsPage extends StatefulWidget {
  final bool showBottomNav;

  const ReportsPage({Key? key, this.showBottomNav = true}) : super(key: key);

  @override
  State<ReportsPage> createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> _spendingBreakdown = [
    {
      'category': 'Food & Drink',
      'amount': '\$450.00',
      'percentage': '35%',
      'color': Colors.red,
      'progress': 0.45,
    },
    {
      'category': 'Shopping',
      'amount': '\$320.00',
      'percentage': '25%',
      'color': const Color(0xFF6F4AF6),
      'progress': 0.25,
    },
    {
      'category': 'Housing',
      'amount': '\$280.00',
      'percentage': '22%',
      'color': Colors.amber,
      'progress': 0.22,
    },
    {
      'category': 'Transport',
      'amount': '\$150.00',
      'percentage': '12%',
      'color': Colors.green,
      'progress': 0.12,
    },
    {
      'category': 'Other',
      'amount': '\$70.00',
      'percentage': '6%',
      'color': Colors.grey,
      'progress': 0.06,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  const CircleAvatar(
                    radius: 22,
                    child: Text(
                      'KA',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Welcome back,',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kazi Asif Raihan',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.06),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Page Title
              const Text(
                'Monthly Spending Report',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Expense Summary Card
              const ExpenseSummaryCard(),

              const SizedBox(height: 24),

              // Spending Breakdown Header
              const Text(
                'Spending Breakdown',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              // Spending Breakdown Items
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: _spendingBreakdown
                        .map(
                          (item) => SpendingBreakdownItem(
                            category: item['category'],
                            amount: item['amount'],
                            percentage: item['percentage'],
                            barColor: item['color'],
                            progress: item['progress'],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),

              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widget.showBottomNav
          ? BottomNav(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            )
          : null,
    );
  }
}
