import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(text: "All"),
                  Tab(text: "Pending"),
                  Tab(text: "Completed"),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text("All")),
                    Center(child: Text("Pending")),
                    Center(child: Text("Completed")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
