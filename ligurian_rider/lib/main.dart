import 'package:flutter/material.dart';
import 'package:ligurian_rider/Pages/about_page.dart';
import 'package:ligurian_rider/Pages/map_page.dart';
import 'package:ligurian_rider/Pages/videos_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ligurian Rider',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 216, 29)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Ligurian Rider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = VideosPage();
      case 1:
        page = MapPage();
      case 2:
        page = AboutPage();
      default:
        throw UnimplementedError("No widget for $selectedIndex");
    }
    var mainArea = ColoredBox(
      color: colorScheme.surfaceContainerHighest,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 450) {
          return Column(
            children: [
              Expanded(child: mainArea),
              SafeArea(
                top: false,
                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.video_collection_rounded),
                      label: "Videos",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.map_rounded),
                      label: "Map",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.attribution_rounded),
                      label: "About",
                    )
                  ],
                  currentIndex: selectedIndex,
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
            ],
          );
        } else {
          return Row(
            children: [
              SafeArea(
                child: NavigationRail(
                  extended: constraints.maxWidth >= 800,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.video_collection_rounded),
                      label: Text("Videos"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.map_rounded),
                      label: Text("Map"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.attribution_rounded),
                      label: Text("About"),
                    )
                  ],
                  selectedIndex: selectedIndex,
                  onDestinationSelected: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  child: mainArea,
                ),
              )
            ],
          );
        }
      }),
    );
  }
}
