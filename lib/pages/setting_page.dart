import 'package:door_remote_control/widgets/save_button.dart';
import 'package:flutter/material.dart';

import '../services/preferences_service.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    PreferencesService.instance
        .then((value) => controller.text = value.getIpAddress);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: controller,
                  cursorColor: Colors.indigo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.indigo,
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    hintText: "Ip address",
                  ),
                ),
                const SizedBox(height: 30),
                SaveButton(
                  title: "Save",
                  onTap: () async {
                    PreferencesService service =
                        await PreferencesService.instance;
                    service.setIpAddress(controller.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
