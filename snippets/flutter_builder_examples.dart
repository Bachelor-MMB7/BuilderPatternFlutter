import 'package:flutter/material.dart';

// Example 1: FutureBuilder with User Data
class UserProfilePage extends StatelessWidget {
  final Future<User> userFuture;

  const UserProfilePage({required this.userFuture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: FutureBuilder<User>(
        future: userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Error: ${snapshot.error}'),
                  ElevatedButton(
                    onPressed: () {
                      // Retry logic
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (snapshot.hasData) {
            final user = snapshot.data!;
            return UserDetails(user: user);
          }

          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}

// Example 2: StreamBuilder with Real-time Counter
class CounterStreamWidget extends StatelessWidget {
  final Stream<int> counterStream;

  const CounterStreamWidget({required this.counterStream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: counterStream,
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Counter Value',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8),
                Text(
                  '${snapshot.data}',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Example 3: LayoutBuilder for Responsive Design
class ResponsiveLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Mobile Layout
          return MobileLayout();
        } else if (constraints.maxWidth < 1200) {
          // Tablet Layout
          return TabletLayout();
        } else {
          // Desktop Layout
          return DesktopLayout();
        }
      },
    );
  }
}

// Example 4: ValueListenableBuilder
class CounterWithValueNotifier extends StatefulWidget {
  @override
  State<CounterWithValueNotifier> createState() =>
      _CounterWithValueNotifierState();
}

class _CounterWithValueNotifierState extends State<CounterWithValueNotifier> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Value Notifier Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You have pushed the button this many times:'),
            ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _counter.value++,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

// Example 5: Custom Async Builder Widget
class AsyncDataBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext, T) builder;
  final Widget? loadingWidget;
  final Widget Function(BuildContext, Object)? errorBuilder;
  final Widget? emptyWidget;

  const AsyncDataBuilder({
    Key? key,
    required this.future,
    required this.builder,
    this.loadingWidget,
    this.errorBuilder,
    this.emptyWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget ??
              Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return errorBuilder?.call(context, snapshot.error!) ??
              Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                ),
              );
        }

        if (snapshot.hasData) {
          return builder(context, snapshot.data as T);
        }

        return emptyWidget ?? Center(child: Text('No data'));
      },
    );
  }
}

// Supporting Models
class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});
}

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${user.name}'),
          Text('Email: ${user.email}'),
        ],
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 100, color: Colors.blue, child: Center(child: Text('Header'))),
        Expanded(child: Container(color: Colors.white, child: Center(child: Text('Content')))),
        Container(height: 60, color: Colors.grey, child: Center(child: Text('Footer'))),
      ],
    );
  }
}

class TabletLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 200, color: Colors.blue.shade100, child: Center(child: Text('Sidebar'))),
        Expanded(
          child: Column(
            children: [
              Container(height: 80, color: Colors.blue, child: Center(child: Text('Header'))),
              Expanded(child: Container(color: Colors.white, child: Center(child: Text('Content')))),
            ],
          ),
        ),
      ],
    );
  }
}

class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 250, color: Colors.blue.shade100, child: Center(child: Text('Sidebar'))),
        Expanded(
          child: Column(
            children: [
              Container(height: 80, color: Colors.blue, child: Center(child: Text('Header'))),
              Expanded(
                child: Row(
                  children: [
                    Expanded(flex: 2, child: Container(color: Colors.white, child: Center(child: Text('Main Content')))),
                    Container(width: 300, color: Colors.grey.shade200, child: Center(child: Text('Right Panel'))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}