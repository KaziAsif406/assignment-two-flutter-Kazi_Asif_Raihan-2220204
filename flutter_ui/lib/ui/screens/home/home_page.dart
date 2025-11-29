import 'package:flutter/material.dart';
import 'widgets/balance_card.dart';
import 'widgets/action_buttons.dart';
import 'widgets/transaction_list_item.dart';
import '../../widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  final bool showBottomNav;

  const HomePage({Key? key, this.showBottomNav = true}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _transactions = [
    {
      'title': 'Netflix Subscription',
      'subtitle': 'Entertainment • Today',
      'amount': '-\$19.99',
      'color': Colors.red,
      'icon': Icons.movie,
    },
    {
      'title': 'Coffee Shop',
      'subtitle': 'Food & Drink • Today',
      'amount': '-\$4.50',
      'color': Colors.red,
      'icon': Icons.coffee,
    },
    {
      'title': 'Salary Deposit',
      'subtitle': 'Income • Yesterday',
      'amount': '+\$3500.00',
      'color': Colors.green,
      'icon': Icons.attach_money,
    },
    {
      'title': 'Grocery Store',
      'subtitle': 'Shopping • Yesterday',
      'amount': '-\$55.80',
      'color': Colors.red,
      'icon': Icons.shopping_cart,
    },
    {
      'title': 'Amazon Purchase',
      'subtitle': 'Shopping • 2 days ago',
      'amount': '-\$120.45',
      'color': Colors.red,
      'icon': Icons.shopping_cart_outlined,
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

              const SizedBox(height: 18),

              // Balance Card
              const BalanceCard(),

              const SizedBox(height: 18),

              // Action buttons row
              const ActionButtons(),

              const SizedBox(height: 22),

              // Recent transactions header
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Color(0xFF6F4AF6)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Transactions list
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _transactions.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final t = _transactions[index];
                  return TransactionListItem(
                    title: t['title'],
                    subtitle: t['subtitle'],
                    amount: t['amount'],
                    color: t['color'],
                    icon: t['icon'],
                  );
                },
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
