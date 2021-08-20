import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool)? onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged!(value);
          widget.onSettingsChanged(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glútem',
                  'Só Exibe Refeições Sem Glúten',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Lactose',
                  'Só Exibe Refeições Sem Lactose',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Vegana',
                  'Só Exibe Refeições Veganas',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Vegetariana',
                  'Só Exibe Refeições Vegetarianas',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
