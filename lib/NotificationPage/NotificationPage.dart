// notification_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<String> _notifications = [
    'Welcome to the Aniket app!',
    'Your profile was updated.',
    'New job alert: Flutter Developer',
    'Interview tips are now available.',
    'Daily challenge is live!',
  ];

  @override
  void initState() {
    super.initState();
    _addTodayNotification();
  }

  void _addTodayNotification() {
    String todayMessage =
        'Daily update: ${DateFormat('d MMMM yyyy').format(DateTime.now())}';
    if (!_notifications.contains(todayMessage)) {
      setState(() {
        _notifications.insert(0, todayMessage);
      });
    }
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Notification deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
            _notifications.isEmpty
                ? const Center(
                  child: Text(
                    'No notifications yet.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                : ListView.builder(
                  itemCount: _notifications.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.notifications),
                        title: Text(_notifications[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _deleteNotification(index),
                        ),
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
