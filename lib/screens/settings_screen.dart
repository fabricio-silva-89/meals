import 'package:flutter/material.dart';

import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen({
    Key? key,
    required this.settings,
    required this.onSettingsChanged,
  }) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings settings = Settings();

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Sem Glutén',
                  'Só exibi refeições sem glutén',
                  settings.isGlutenFree,
                  (value) {
                    setState(() {
                      settings.isGlutenFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Sem Lactose',
                  'Só exibi refeições sem lactose',
                  settings.isLactoseFree,
                  (value) {
                    setState(() {
                      settings.isLactoseFree = value;
                    });
                  },
                ),
                _createSwitch(
                  'Vegana',
                  'Só exibi refeições veganas',
                  settings.isVegan,
                  (value) {
                    setState(() {
                      settings.isVegan = value;
                    });
                  },
                ),
                _createSwitch(
                  'Sem Vegetariana',
                  'Só exibi refeições vegetarianas',
                  settings.isVegetarian,
                  (value) {
                    setState(() {
                      settings.isVegetarian = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
