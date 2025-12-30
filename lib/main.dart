import 'package:flutter/material.dart';

void main() {
  runApp(FlutterLearningApp());
}

class FlutterLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mastery',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// ==================== SPLASH SCREEN ====================
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1613376023733-0a73315d9b06?w=1200'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 2),
              FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.deepPurple, Colors.purpleAccent],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.deepPurple.withOpacity(0.5),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(Icons.flutter_dash, size: 80, color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Flutter Mastery',
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(
                              color: Colors.deepPurple,
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'From Zero to Hero',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(flex: 2),
              FadeTransition(
                opacity: _fadeAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Start Learning',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== MAIN PAGE ====================
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Basics',
      'icon': Icons.school,
      'color': Colors.blue,
      'topics': [
        {
          'name': 'Introduction to Flutter',
          'description': 'Understanding Flutter framework and setup',
          'code': '''void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}'''
        },
        {
          'name': 'What is Flutter?',
          'description': 'Flutter is Google\'s UI toolkit for building natively compiled applications',
          'code': '''// Key Features of Flutter:
// 1. Cross-platform (iOS, Android, Web, Desktop)
// 2. Fast development with Hot Reload
// 3. Expressive and flexible UI
// 4. Native performance
// 5. Single codebase

// Flutter Architecture:
// - Framework (Dart)
// - Engine (C/C++)
// - Embedder (Platform-specific)'''
        },
        {
          'name': 'Dart Basics',
          'description': 'Dart language fundamentals for Flutter',
          'code': '''// Variables
var name = 'Flutter';
String title = 'Developer';
int age = 25;
double price = 99.99;
bool isActive = true;

// Final vs Const
final currentTime = DateTime.now(); // Runtime constant
const pi = 3.14159; // Compile-time constant

// Null Safety
String? nullableString; // Can be null
String nonNullString = 'Hello'; // Cannot be null

// Functions
int add(int a, int b) => a + b;

void greet(String name, {int age = 0}) {
  print('Hello \$name, age: \$age');
}

// Lists
List<String> items = ['Apple', 'Banana', 'Orange'];
items.add('Mango');

// Maps
Map<String, int> scores = {
  'John': 95,
  'Jane': 88,
};'''
        },
        {
          'name': 'Widget Tree Concept',
          'description': 'Everything in Flutter is a Widget - UI building blocks',
          'code': '''// Widget Tree Example
MaterialApp              // Root
  └─ Scaffold           // Structure
      ├─ AppBar         // Top bar
      │   └─ Text       // Title
      └─ Body
          └─ Column     // Layout
              ├─ Text   // Child 1
              ├─ Image  // Child 2
              └─ Button // Child 3

// Each widget creates an element in the element tree
// Which is rendered to the render tree'''
        },
        {
          'name': 'StatelessWidget',
          'description': 'Immutable widgets that don\'t change',
          'code': '''class MyStatelessWidget extends StatelessWidget {
  final String title;
  
  MyStatelessWidget({required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(title),
    );
  }
}

// Use cases:
// - Static content
// - UI that doesn't change based on user interaction
// - Displaying data passed from parent'''
        },
        {
          'name': 'StatefulWidget',
          'description': 'Widgets with mutable state that can change',
          'code': '''class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;
  
  void _increment() {
    setState(() {
      _count++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: \$_count'),
        ElevatedButton(
          onPressed: _increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}

// Lifecycle methods:
// - initState() - Called once when widget is inserted
// - dispose() - Called when widget is removed
// - didUpdateWidget() - Called when parent rebuilds'''
        },
        {
          'name': 'BuildContext',
          'description': 'Handle to the location of a widget in the tree',
          'code': '''// BuildContext provides:
// 1. Access to theme
Theme.of(context).primaryColor

// 2. Navigation
Navigator.of(context).push(...)

// 3. Scaffold features
ScaffoldMessenger.of(context).showSnackBar(...)

// 4. MediaQuery for screen info
MediaQuery.of(context).size.width

// 5. InheritedWidget access
Provider.of<MyModel>(context)

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // context represents this widget's location in tree
    return Text('Context example');
  }
}'''
        },
        {
          'name': 'Hot Reload vs Hot Restart',
          'description': 'Fast development features',
          'code': '''// Hot Reload (r key or save)
// - Injects updated code into running app
// - Preserves app state
// - Fast (~1 second)
// - Works for UI changes
// - Does NOT work for:
//   * Changes to main()
//   * Changes to initState()
//   * Global variables initialization

// Hot Restart (R key or restart button)
// - Fully restarts app
// - Loses all state
// - Slower (~3-5 seconds)
// - Works for all code changes
// - Use when Hot Reload doesn't work'''
        },
        {
          'name': 'MaterialApp vs CupertinoApp',
          'description': 'Different design systems',
          'code': '''// Material Design (Google/Android style)
MaterialApp(
  theme: ThemeData(primarySwatch: Colors.blue),
  home: Scaffold(
    appBar: AppBar(title: Text('Material')),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    ),
  ),
)

// Cupertino (Apple/iOS style)
CupertinoApp(
  theme: CupertinoThemeData(primaryColor: Colors.blue),
  home: CupertinoPageScaffold(
    navigationBar: CupertinoNavigationBar(
      middle: Text('Cupertino'),
    ),
    child: Center(child: Text('iOS Style')),
  ),
)'''
        },
        {
          'name': 'Keys in Flutter',
          'description': 'Preserve state and control widget identity',
          'code': '''// ValueKey - for widgets with unique values
ListView(
  children: items.map((item) => 
    ListTile(
      key: ValueKey(item.id),
      title: Text(item.name),
    )
  ).toList(),
)

// ObjectKey - for objects
Container(key: ObjectKey(myObject))

// UniqueKey - guaranteed unique
Widget(key: UniqueKey())

// GlobalKey - access widget state from anywhere
final key = GlobalKey<FormState>();
Form(
  key: key,
  child: TextFormField(...),
)
// Later: key.currentState?.validate()

// When to use Keys:
// - Reorderable lists
// - Preserve scroll position
// - Maintain state during rebuilds
// - Access widget state from outside'''
        },
      ],
    },
    {
      'title': 'Interview Questions',
      'icon': Icons.question_answer,
      'color': Colors.indigo,
      'topics': [
        {
          'name': 'StatelessWidget vs StatefulWidget',
          'description': 'Key differences and when to use each',
          'code': '''// StatelessWidget:
// - Immutable (doesn't change)
// - No setState()
// - Rebuilds only when parent rebuilds
// - Better performance
// - Use for: static content, UI that doesn't change

class StaticText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('I never change');
  }
}

// StatefulWidget:
// - Mutable state
// - Can call setState() to rebuild
// - Has lifecycle methods
// - Use for: forms, animations, user interactions

class DynamicCounter extends StatefulWidget {
  @override
  _DynamicCounterState createState() => _DynamicCounterState();
}

class _DynamicCounterState extends State<DynamicCounter> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Text('Count: \$count');
  }
}'''
        },
        {
          'name': 'Widget Lifecycle',
          'description': 'Understanding widget lifecycle methods',
          'code': '''class LifecycleDemo extends StatefulWidget {
  @override
  _LifecycleDemoState createState() => _LifecycleDemoState();
}

class _LifecycleDemoState extends State<LifecycleDemo> {
  // 1. Constructor (optional)
  _LifecycleDemoState() {
    print('Constructor called');
  }
  
  // 2. initState - Called once when widget is inserted
  @override
  void initState() {
    super.initState();
    print('initState called');
    // Initialize data, subscriptions, controllers
  }
  
  // 3. didChangeDependencies - After initState, when dependencies change
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies called');
  }
  
  // 4. build - Called every time widget needs to be rendered
  @override
  Widget build(BuildContext context) {
    print('build called');
    return Container();
  }
  
  // 5. didUpdateWidget - When parent rebuilds with new config
  @override
  void didUpdateWidget(LifecycleDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget called');
  }
  
  // 6. setState - Triggers rebuild
  void updateState() {
    setState(() {
      print('setState called');
    });
  }
  
  // 7. deactivate - When widget is removed from tree (temporarily)
  @override
  void deactivate() {
    print('deactivate called');
    super.deactivate();
  }
  
  // 8. dispose - Called when widget is removed permanently
  @override
  void dispose() {
    print('dispose called');
    // Clean up: cancel subscriptions, dispose controllers
    super.dispose();
  }
}'''
        },
        {
          'name': 'setState() Deep Dive',
          'description': 'How setState works internally',
          'code': '''// setState() workflow:
// 1. Marks widget as dirty
// 2. Schedules a rebuild
// 3. Calls build() method
// 4. Updates only changed widgets (not entire tree)

class SetStateExample extends StatefulWidget {
  @override
  _SetStateExampleState createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  int counter = 0;
  
  void increment() {
    setState(() {
      counter++; // Update state here
    });
    // Widget rebuilds automatically after setState
  }
  
  @override
  Widget build(BuildContext context) {
    print('Widget rebuilt'); // Called on every setState
    return Column(
      children: [
        Text('Counter: \$counter'),
        ElevatedButton(
          onPressed: increment,
          child: Text('Increment'),
        ),
      ],
    );
  }
}

// Common mistakes:
// ❌ setState(() {}); // Empty - no state change
// ❌ counter++; setState(() {}); // State change outside
// ✅ setState(() { counter++; }); // Correct'''
        },
        {
          'name': 'Async in Flutter',
          'description': 'Future, async/await, and FutureBuilder',
          'code': '''// Future - Represents a potential value or error
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded';
}

// Using async/await
void loadData() async {
  try {
    String data = await fetchData();
    print(data);
  } catch (e) {
    print('Error: \$e');
  }
}

// FutureBuilder - Build UI based on Future
FutureBuilder<String>(
  future: fetchData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    } else if (snapshot.hasData) {
      return Text(snapshot.data!);
    }
    return Text('No data');
  },
)

// Stream - Multiple async values over time
Stream<int> countStream() async* {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

// StreamBuilder
StreamBuilder<int>(
  stream: countStream(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text('Count: \${snapshot.data}');
    }
    return CircularProgressIndicator();
  },
)'''
        },
        {
          'name': 'BuildContext Explained',
          'description': 'What is BuildContext and how to use it',
          'code': '''// BuildContext is a handle to the location of a widget
// in the widget tree

class ContextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. Access theme
    Color primary = Theme.of(context).primaryColor;
    
    // 2. Get screen size
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    
    // 3. Navigate
    void navigateToPage() {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NewPage()),
      );
    }
    
    // 4. Show SnackBar
    void showMessage() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hello')),
      );
    }
    
    // 5. Access InheritedWidget
    // ThemeData theme = Theme.of(context);
    
    return Container();
  }
}

// Common error: Using context before widget is built
class WrongContextUsage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ❌ This context is from parent, might not have Scaffold
    showDialog(context: context, builder: (_) => AlertDialog());
    
    return Scaffold(
      body: Builder(
        builder: (innerContext) {
          // ✅ This context has Scaffold
          return ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(innerContext).showSnackBar(
                SnackBar(content: Text('Works!')),
              );
            },
            child: Text('Show SnackBar'),
          );
        },
      ),
    );
  }
}'''
        },
        {
          'name': 'const vs final',
          'description': 'Understanding compile-time vs runtime constants',
          'code': '''// const - Compile-time constant
// - Value must be known at compile time
// - Deeply immutable
// - Better performance (reuses instances)

const String appName = 'MyApp'; // ✅ Compile-time constant
const int maxUsers = 100; // ✅
const List<int> numbers = [1, 2, 3]; // ✅
const Color primary = Colors.blue; // ✅

// const DateTime.now(); // ❌ Not compile-time constant

// final - Runtime constant
// - Value assigned once at runtime
// - Cannot be reassigned
// - Can be instance variables

final String currentTime = DateTime.now().toString(); // ✅
final List<int> items = [1, 2, 3];
items.add(4); // ✅ Can modify list contents
// items = [5, 6]; // ❌ Cannot reassign

// In widgets:
// const constructor improves performance
const Text('Hello'); // ✅ Reuses widget instance
Text('Hello'); // Creates new widget each time

class MyWidget extends StatelessWidget {
  final String title; // Instance variable
  const MyWidget({required this.title}); // const constructor
  
  @override
  Widget build(BuildContext context) {
    return const Text('Static'); // ✅ Reused
  }
}'''
        },
        {
          'name': 'Keys - When and Why',
          'description': 'Understanding widget keys',
          'code': '''// Keys preserve state when widget position changes

// Problem without keys:
List<Widget> items = [
  ColoredBox(color: Colors.red),
  ColoredBox(color: Colors.blue),
];
// If you remove first item, blue becomes red (wrong!)

// Solution with keys:
List<Widget> itemsWithKeys = [
  ColoredBox(key: UniqueKey(), color: Colors.red),
  ColoredBox(key: UniqueKey(), color: Colors.blue),
];
// Keys preserve identity and state

// Types of Keys:
// 1. ValueKey - Based on a value
ListView(
  children: items.map((item) => 
    ListTile(
      key: ValueKey(item.id), // Unique ID
      title: Text(item.name),
    )
  ).toList(),
)

// 2. ObjectKey - Based on object
Container(key: ObjectKey(myObject))

// 3. UniqueKey - Always unique
Widget(key: UniqueKey())

// 4. GlobalKey - Access state from anywhere
final formKey = GlobalKey<FormState>();
Form(
  key: formKey,
  child: TextFormField(
    validator: (value) => value?.isEmpty ?? true ? 'Required' : null,
  ),
)
// Access: formKey.currentState?.validate()

// 5. PageStorageKey - Preserve scroll position
ListView(
  key: PageStorageKey('myListView'),
  children: [...],
)

// When to use keys:
// - Lists with reorderable items
// - Stateful widgets in collections
// - Preserving scroll position
// - Form validation
// - Accessing widget state externally'''
        },
        {
          'name': 'InheritedWidget',
          'description': 'Share data down the widget tree efficiently',
          'code': '''// InheritedWidget passes data down tree without passing
// through every widget manually

class MyInheritedWidget extends InheritedWidget {
  final int data;
  final Function(int) updateData;
  
  const MyInheritedWidget({
    Key? key,
    required this.data,
    required this.updateData,
    required Widget child,
  }) : super(key: key, child: child);
  
  // How to access from descendant widgets
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
  
  // When to rebuild dependent widgets
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}

// Usage:
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  
  void updateCounter(int value) {
    setState(() {
      counter = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      data: counter,
      updateData: updateCounter,
      child: MaterialApp(home: HomePage()),
    );
  }
}

// Access anywhere in tree:
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inherited = MyInheritedWidget.of(context);
    
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Count: \${inherited?.data}'),
            ElevatedButton(
              onPressed: () {
                inherited?.updateData((inherited.data) + 1);
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// Modern alternative: Provider package (built on InheritedWidget)'''
        },
        {
          'name': 'Performance Optimization',
          'description': 'Tips to optimize Flutter app performance',
          'code': '''// 1. Use const constructors
const Text('Hello'); // ✅ Reuses widget
Text('Hello'); // ❌ Creates new widget

// 2. Avoid rebuilding entire tree
class Parent extends StatefulWidget {
  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  int counter = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ❌ Child rebuilds unnecessarily
        ExpensiveWidget(),
        
        // ✅ Child won't rebuild
        const ExpensiveWidget(),
        
        Text('Counter: \$counter'),
        ElevatedButton(
          onPressed: () => setState(() => counter++),
          child: Text('Increment'),
        ),
      ],
    );
  }
}

// 3. Use ListView.builder for long lists
// ❌ Bad - Creates all widgets at once
ListView(children: List.generate(1000, (i) => ListTile()))

// ✅ Good - Creates widgets on demand
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) => ListTile(),
)

// 4. Avoid setState in build method
// ❌ Infinite loop
Widget build(BuildContext context) {
  setState(() {}); // Never do this!
  return Container();
}

// 5. Use RepaintBoundary for expensive widgets
RepaintBoundary(
  child: ComplexWidget(), // Won't repaint with parent
)

// 6. Dispose controllers and subscriptions
@override
void dispose() {
  _controller.dispose();
  _subscription.cancel();
  super.dispose();
}

// 7. Use addPostFrameCallback for operations after build
@override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    // Code runs after first frame is drawn
  });
}

// 8. Profile app with Flutter DevTools
// - Widget rebuild counts
// - Frame rendering times
// - Memory usage
// - Network calls'''
        },
        {
          'name': 'Difference: main() vs runApp()',
          'description': 'Understanding app entry point',
          'code': '''// main() - Entry point of Dart program
// - First function that executes
// - Required in every Dart/Flutter app

void main() {
  // Setup before app starts
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize services
  // await Firebase.initializeApp();
  
  // Run the app
  runApp(MyApp());
}

// runApp() - Starts Flutter app
// - Takes a Widget (usually MaterialApp/CupertinoApp)
// - Inflates widget and attaches to screen
// - Makes widget the root of widget tree

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello Flutter'),
        ),
      ),
    ),
  );
}

// Common patterns:

// 1. With async initialization
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeServices();
  runApp(MyApp());
}

// 2. With error handling
void main() {
  FlutterError.onError = (details) {
    // Log errors
  };
  runApp(MyApp());
}

// 3. Different environments
void main() {
  const environment = String.fromEnvironment('ENV');
  
  if (environment == 'production') {
    runApp(ProductionApp());
  } else {
    runApp(DevelopmentApp());
  }
}'''
        },
      ],
    },
    {
      'title': 'Layout Widgets',
      'icon': Icons.view_quilt,
      'color': Colors.green,
      'topics': [
        {
          'name': 'Container',
          'description': 'Box model widget with decoration',
          'code': '''Container(
  width: 200,
  height: 100,
  padding: EdgeInsets.all(16),
  margin: EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10,
        offset: Offset(0, 5),
      ),
    ],
  ),
  child: Text('Hello Flutter'),
)'''
        },
        {
          'name': 'Row & Column',
          'description': 'Linear layout widgets',
          'code': '''// Row - Horizontal Layout
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Icon(Icons.star),
    Text('Rating'),
    Icon(Icons.star),
  ],
)

// Column - Vertical Layout
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text('Title'),
    Text('Subtitle'),
    ElevatedButton(onPressed: () {}, child: Text('Action')),
  ],
)'''
        },
        {
          'name': 'Stack',
          'description': 'Overlay widgets on top of each other',
          'code': '''Stack(
  children: [
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    ),
    Positioned(
      top: 20,
      left: 20,
      child: Icon(Icons.star, color: Colors.yellow, size: 50),
    ),
    Positioned(
      bottom: 10,
      right: 10,
      child: Text('Overlay Text'),
    ),
  ],
)'''
        },
        {
          'name': 'Flexible & Expanded',
          'description': 'Flexible space allocation',
          'code': '''Row(
  children: [
    Flexible(
      flex: 1,
      child: Container(color: Colors.red, height: 100),
    ),
    Flexible(
      flex: 2,
      child: Container(color: Colors.green, height: 100),
    ),
    Expanded(
      child: Container(color: Colors.blue, height: 100),
    ),
  ],
)'''
        },
      ],
    },
    {
      'title': 'UI Widgets',
      'icon': Icons.widgets,
      'color': Colors.orange,
      'topics': [
        {
          'name': 'Text & Styling',
          'description': 'Text display with custom styles',
          'code': '''Text(
  'Hello Flutter',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.blue,
    letterSpacing: 1.5,
    decoration: TextDecoration.underline,
    fontStyle: FontStyle.italic,
  ),
  textAlign: TextAlign.center,
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)'''
        },
        {
          'name': 'Buttons',
          'description': 'All types of buttons',
          'code': '''// ElevatedButton
ElevatedButton(
  onPressed: () {},
  child: Text('Elevated'),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  ),
)

// TextButton
TextButton(
  onPressed: () {},
  child: Text('Text Button'),
)

// OutlinedButton
OutlinedButton(
  onPressed: () {},
  child: Text('Outlined'),
)

// IconButton
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {},
)

// FloatingActionButton
FloatingActionButton(
  onPressed: () {},
  child: Icon(Icons.add),
)'''
        },
        {
          'name': 'TextField',
          'description': 'Input fields and forms',
          'code': '''TextField(
  decoration: InputDecoration(
    labelText: 'Enter your name',
    hintText: 'John Doe',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  keyboardType: TextInputType.text,
  obscureText: false,
  maxLines: 1,
  onChanged: (value) {
    print('Input: \$value');
  },
)'''
        },
        {
          'name': 'Image',
          'description': 'Display images from various sources',
          'code': '''// Network Image
Image.network(
  'https://picsum.photos/200',
  width: 200,
  height: 200,
  fit: BoxFit.cover,
)

// Asset Image
Image.asset(
  'assets/images/logo.png',
  width: 100,
  height: 100,
)

// CircleAvatar with Image
CircleAvatar(
  radius: 50,
  backgroundImage: NetworkImage('https://picsum.photos/200'),
)'''
        },
        {
          'name': 'Card',
          'description': 'Material design card',
          'code': '''Card(
  elevation: 5,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Card Title', style: TextStyle(fontSize: 20)),
        SizedBox(height: 10),
        Text('Card content goes here'),
      ],
    ),
  ),
)'''
        },
      ],
    },
    {
      'title': 'Scrollable Widgets',
      'icon': Icons.view_list,
      'color': Colors.purple,
      'topics': [
        {
          'name': 'ListView',
          'description': 'Scrollable list of widgets',
          'code': '''// ListView with children
ListView(
  children: [
    ListTile(
      leading: Icon(Icons.person),
      title: Text('John Doe'),
      subtitle: Text('Software Developer'),
      trailing: Icon(Icons.arrow_forward),
    ),
    ListTile(
      leading: Icon(Icons.email),
      title: Text('jane@email.com'),
    ),
  ],
)

// ListView.builder for dynamic lists
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item \$index'),
    );
  },
)'''
        },
        {
          'name': 'GridView',
          'description': '2D scrollable grid',
          'code': '''GridView.count(
  crossAxisCount: 2,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  padding: EdgeInsets.all(10),
  children: List.generate(10, (index) {
    return Container(
      color: Colors.blue,
      child: Center(child: Text('Item \$index')),
    );
  }),
)

// GridView.builder
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    childAspectRatio: 1.0,
  ),
  itemCount: items.length,
  itemBuilder: (context, index) {
    return Card(child: Center(child: Text('Item \$index')));
  },
)'''
        },
        {
          'name': 'SingleChildScrollView',
          'description': 'Make any widget scrollable',
          'code': '''SingleChildScrollView(
  child: Column(
    children: [
      Container(height: 200, color: Colors.red),
      Container(height: 200, color: Colors.green),
      Container(height: 200, color: Colors.blue),
      Container(height: 200, color: Colors.yellow),
    ],
  ),
)'''
        },
        {
          'name': 'PageView',
          'description': 'Swipeable pages',
          'code': '''PageView(
  children: [
    Container(color: Colors.red, child: Center(child: Text('Page 1'))),
    Container(color: Colors.green, child: Center(child: Text('Page 2'))),
    Container(color: Colors.blue, child: Center(child: Text('Page 3'))),
  ],
)

// PageView.builder
PageView.builder(
  itemCount: pages.length,
  itemBuilder: (context, index) {
    return Container(
      child: Center(child: Text('Page \$index')),
    );
  },
)'''
        },
      ],
    },
    {
      'title': 'Navigation',
      'icon': Icons.navigation,
      'color': Colors.red,
      'topics': [
        {
          'name': 'Navigator Push/Pop',
          'description': 'Basic navigation between screens',
          'code': '''// Navigate to new screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// Go back
Navigator.pop(context);

// Push with data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailScreen(id: 123),
  ),
);

// Pop with result
Navigator.pop(context, 'Result data');'''
        },
        {
          'name': 'Named Routes',
          'description': 'Navigation using route names',
          'code': '''// Define routes in MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomeScreen(),
    '/details': (context) => DetailsScreen(),
    '/profile': (context) => ProfileScreen(),
  },
)

// Navigate using named route
Navigator.pushNamed(context, '/details');

// Navigate with arguments
Navigator.pushNamed(
  context,
  '/details',
  arguments: {'id': 123, 'name': 'Item'},
);

// Receive arguments
final args = ModalRoute.of(context)!.settings.arguments as Map;'''
        },
        {
          'name': 'BottomNavigationBar',
          'description': 'Bottom tab navigation',
          'code': '''class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  
  final List<Widget> _pages = [
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}'''
        },
        {
          'name': 'Drawer',
          'description': 'Side navigation drawer',
          'code': '''Scaffold(
  appBar: AppBar(title: Text('App')),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text('Header', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {},
        ),
      ],
    ),
  ),
)'''
        },
      ],
    },
    {
      'title': 'State Management',
      'icon': Icons.settings_input_component,
      'color': Colors.teal,
      'topics': [
        {
          'name': 'setState',
          'description': 'Basic state management',
          'code': '''class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Counter: \$_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}'''
        },
        {
          'name': 'InheritedWidget',
          'description': 'Share data down the widget tree',
          'code': '''class MyInheritedWidget extends InheritedWidget {
  final int data;
  
  MyInheritedWidget({
    required this.data,
    required Widget child,
  }) : super(child: child);
  
  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return data != oldWidget.data;
  }
  
  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

// Usage
final inheritedData = MyInheritedWidget.of(context)?.data;'''
        },
        {
          'name': 'Provider Pattern',
          'description': 'Popular state management solution',
          'code': '''// Add provider package to pubspec.yaml
// provider: ^6.0.0

import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  
  void increment() {
    _count++;
    notifyListeners();
  }
}

// Provide the model
ChangeNotifierProvider(
  create: (context) => Counter(),
  child: MyApp(),
)

// Consume the model
Consumer<Counter>(
  builder: (context, counter, child) {
    return Text('Count: \${counter.count}');
  },
)

// Or use Provider.of
final counter = Provider.of<Counter>(context);'''
        },
        {
          'name': 'ValueNotifier',
          'description': 'Lightweight state management',
          'code': '''class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  
  @override
  void dispose() {
    _counter.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: _counter,
          builder: (context, value, child) {
            return Text('Count: \$value');
          },
        ),
        ElevatedButton(
          onPressed: () => _counter.value++,
          child: Text('Increment'),
        ),
      ],
    );
  }
}'''
        },
      ],
    },
    {
      'title': 'Animations',
      'icon': Icons.animation,
      'color': Colors.pink,
      'topics': [
        {
          'name': 'AnimationController',
          'description': 'Basic animation controller',
          'code': '''class AnimatedWidget extends StatefulWidget {
  @override
  _AnimatedWidgetState createState() => _AnimatedWidgetState();
}

class _AnimatedWidgetState extends State<AnimatedWidget> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _animation = Tween<double>(begin: 0, end: 300).animate(_controller);
    _controller.forward();
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        );
      },
    );
  }
}'''
        },
        {
          'name': 'Implicit Animations',
          'description': 'Easy-to-use animated widgets',
          'code': '''// AnimatedContainer
AnimatedContainer(
  duration: Duration(seconds: 1),
  width: _isExpanded ? 200 : 100,
  height: _isExpanded ? 200 : 100,
  color: _isExpanded ? Colors.blue : Colors.red,
  curve: Curves.easeInOut,
)

// AnimatedOpacity
AnimatedOpacity(
  opacity: _isVisible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  child: Text('Fade me'),
)

// AnimatedPositioned (inside Stack)
AnimatedPositioned(
  duration: Duration(seconds: 1),
  top: _isTop ? 0 : 100,
  left: _isLeft ? 0 : 100,
  child: Container(width: 50, height: 50, color: Colors.blue),
)'''
        },
        {
          'name': 'Hero Animation',
          'description': 'Shared element transition',
          'code': '''// First Screen
Hero(
  tag: 'imageHero',
  child: Image.network('https://picsum.photos/200'),
)

// Navigate to second screen
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondScreen()),
);

// Second Screen
Hero(
  tag: 'imageHero',
  child: Image.network('https://picsum.photos/200'),
)'''
        },
        {
          'name': 'Custom Animations',
          'description': 'Create complex custom animations',
          'code': '''class CustomAnimation extends StatefulWidget {
  @override
  _CustomAnimationState createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> 
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    
    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Transform.rotate(
            angle: _rotationAnimation.value,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}'''
        },
      ],
    },
    {
      'title': 'Advanced',
      'icon': Icons.rocket_launch,
      'color': Colors.deepOrange,
      'topics': [
        {
          'name': 'FutureBuilder',
          'description': 'Build UI based on Future',
          'code': '''Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded!';
}

FutureBuilder<String>(
  future: fetchData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    } else if (snapshot.hasData) {
      return Text('Data: \${snapshot.data}');
    } else {
      return Text('No data');
    }
  },
)'''
        },
        {
          'name': 'StreamBuilder',
          'description': 'Build UI based on Stream',
          'code': '''Stream<int> counterStream() async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

StreamBuilder<int>(
  stream: counterStream(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      return Text('Count: \${snapshot.data}');
    } else if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    } else {
      return CircularProgressIndicator();
    }
  },
)'''
        },
        {
          'name': 'Custom Paint',
          'description': 'Draw custom graphics',
          'code': '''class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;
    
    // Draw circle
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      50,
      paint,
    );
    
    // Draw line
    canvas.drawLine(
      Offset(0, 0),
      Offset(size.width, size.height),
      paint,
    );
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Usage
CustomPaint(
  size: Size(200, 200),
  painter: MyPainter(),
)'''
        },
        {
          'name': 'Platform Channels',
          'description': 'Communicate with native code',
          'code': '''import 'package:flutter/services.dart';

class PlatformChannel {
  static const platform = MethodChannel('com.example.app/battery');
  
  Future<int> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      return result;
    } on PlatformException catch (e) {
      print("Failed to get battery level: '\${e.message}'.");
      return -1;
    }
  }
}'''
        },
        {
          'name': 'Isolates',
          'description': 'Background computation',
          'code': '''import 'dart:isolate';

// Heavy computation function
int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// Run in isolate
Future<int> computeFibonacci(int n) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_isolateEntry, receivePort.sendPort);
  
  final sendPort = await receivePort.first as SendPort;
  final resultPort = ReceivePort();
  sendPort.send([n, resultPort.sendPort]);
  
  return await resultPort.first as int;
}

void _isolateEntry(SendPort sendPort) {
  final port = ReceivePort();
  sendPort.send(port.sendPort);
  
  port.listen((message) {
    final n = message[0] as int;
    final replyPort = message[1] as SendPort;
    replyPort.send(fibonacci(n));
  });
}'''
        },
        {
          'name': 'Themes & Dark Mode',
          'description': 'Custom themes and dark mode',
          'code': '''MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      elevation: 0,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyText1: TextStyle(fontSize: 16),
    ),
  ),
  darkTheme: ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Color(0xFF121212),
  ),
  themeMode: ThemeMode.system, // or ThemeMode.light, ThemeMode.dark
)'''
        },
      ],
    },
  ];

  List<Map<String, dynamic>> getFilteredTopics() {
    if (_searchQuery.isEmpty) return categories;
    
    return categories.where((category) {
      return category['title'].toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (category['topics'] as List).any((topic) =>
              topic['name'].toLowerCase().contains(_searchQuery.toLowerCase()));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredCategories = getFilteredTopics();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Mastery'),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showAboutDialog(
                context: context,
                applicationName: 'Flutter Mastery',
                applicationVersion: '1.0.0',
                applicationIcon: Icon(Icons.flutter_dash, size: 50),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search topics...',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                return CategoryCard(
                  title: category['title'],
                  icon: category['icon'],
                  color: category['color'],
                  topics: category['topics'],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TopicsListPage(
                          categoryTitle: category['title'],
                          topics: category['topics'],
                          color: category['color'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================== CATEGORY CARD ====================
class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final List<Map<String, dynamic>> topics;
  final VoidCallback onTap;

  CategoryCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.topics,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: Colors.white),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${topics.length} topics',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================== TOPICS LIST PAGE ====================
class TopicsListPage extends StatelessWidget {
  final String categoryTitle;
  final List<Map<String, dynamic>> topics;
  final Color color;

  TopicsListPage({
    required this.categoryTitle,
    required this.topics,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: color,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          final topic = topics[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: double.infinity,
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  topic['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(topic['description']),
                ),
                trailing: Icon(Icons.code, color: color),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopicDetailPage(
                        topic: topic,
                        color: color,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// ==================== TOPIC DETAIL PAGE ====================
class TopicDetailPage extends StatelessWidget {
  final Map<String, dynamic> topic;
  final Color color;

  TopicDetailPage({required this.topic, required this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(topic['name']),
        backgroundColor: color,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color.withOpacity(0.2), color.withOpacity(0.1)],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb, color: color, size: 40),
                  SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      topic['description'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Icon(Icons.code, color: color),
                SizedBox(width: 8),
                Text(
                  'Code Example',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withOpacity(0.3)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SelectableText(
                  topic['code'],
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Code copied to clipboard!'),
                      backgroundColor: color,
                    ),
                  );
                },
                icon: Icon(Icons.copy),
                label: Text('Copy Code'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}