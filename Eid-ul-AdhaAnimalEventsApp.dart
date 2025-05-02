import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 5.0;
  runApp(const EventApp());
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eid-ul-Adha Animal Events',
      debugShowCheckedModeBanner: false,
      home: EventListScreen(),
    );
  }
}

class Event {
  final String title;
  final String imagePath;
  final String date;
  final String location;
  final String description;

  Event({
    required this.title,
    required this.imagePath,
    required this.date,
    required this.location,
    required this.description,
  });
}

class EventListScreen extends StatelessWidget {
  EventListScreen({super.key});

  final List<Event> events = [
    Event(
      title: 'Eid-ul-Adha Cow Auction 2025',
      imagePath: 'assets/cow_image.jpeg', // Replace with your cow image
      date: 'July 28-30, 2025',
      location: 'Karachi Dairy Farm, Karachi',
      description:
          'The Karachi Dairy Farm hosts an exclusive cow auction for Eid-ul-Adha, featuring top-quality cows of various breeds. This event provides a chance to learn about cow care and select the best cows for the festival.',
    ),
    Event(
      title: 'Eid-ul-Adha Goat Sale 2025',
      imagePath: 'assets/goat_image.jpeg', // Replace with your goat image
      date: 'July 23-26, 2025',
      location: 'Karachi Goat Farm, Karachi',
      description:
          'The Karachi Goat Farm holds its annual goat sale for Eid-ul-Adha, featuring healthy goats from various breeds. The event also includes goat competitions and workshops on goat care and health.',
    ),
    Event(
      title: 'Eid Camel Show & Sale 2025',
      imagePath: 'assets/camel_image.jpeg', // Replace with your camel image
      date: 'July 20-24, 2025',
      location: 'Karachi Camel Farm, Karachi',
      description:
          'The Karachi Camel Farm organizes an Eid Camel Show & Sale where visitors can purchase camels for Eid-ul-Adha. The event also features camel care workshops and a live camel show.',
    ),
    Event(
      title: 'Eid-ul-Adha Sheep Sale & Festival 2025',
      imagePath: 'assets/sheep_image.jpeg', // Replace with your sheep image
      date: 'July 25-27, 2025',
      location: 'Karachi Sheep Farm, Karachi',
      description:
          'The Karachi Sheep Farm hosts a special Eid-ul-Adha sheep sale, offering healthy sheep for sacrifice. The event also includes sheep care demonstrations and a market for Eid-related goods.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eid-ul-Adha Animal Events'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EventDetailScreen(event: event),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              margin: const EdgeInsets.only(bottom: 6),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Row(
                children: [
                  Hero(
                    tag: event.imagePath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        event.imagePath,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${event.date} • ${event.location}',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: event.imagePath,
            child: Image.asset(
              event.imagePath,
              width: 400,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.date_range),
                    const SizedBox(width: 8),
                    Text(event.date),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on),
                    const SizedBox(width: 8),
                    Text(event.location),
                  ],
                ),
                const SizedBox(height: 16),
                Text(event.description, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
