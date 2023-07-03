import 'package:door_remote_control/pages/setting_page.dart';
import 'package:door_remote_control/services/connection_api.dart';
import 'package:door_remote_control/widgets/action_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Door',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Magic Gate'),
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
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(
                  onTap: () async {
                    await ConnectionApi.sendMessage("GPIO,12,1");
                    await Future.delayed(const Duration(milliseconds: 400));
                    await ConnectionApi.sendMessage("GPIO,12,0");
                  },
                  icon: Icons.arrow_drop_up_rounded,
                  size: 80,
                ),
                const SizedBox(height: 30),
                ActionButton(
                  onTap: () async {
                    await ConnectionApi.sendMessage("GPIO,4,1");
                    await Future.delayed(const Duration(milliseconds: 400));

                    await ConnectionApi.sendMessage("GPIO,4,0");
                  },
                  icon: Icons.stop_rounded,
                ),
                const SizedBox(height: 30),
                ActionButton(
                  onTap: () async {
                    await ConnectionApi.sendMessage("GPIO,5,1");
                    await Future.delayed(const Duration(milliseconds: 400));

                    await ConnectionApi.sendMessage("GPIO,5,0");
                  },
                  icon: Icons.arrow_drop_down_rounded,
                  size: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
