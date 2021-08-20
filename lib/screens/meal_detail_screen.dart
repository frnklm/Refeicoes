import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 330,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              _createSectionTitle(context, 'ingredientes'),
              _createSectionContainer(
                ListView.builder(
                    itemCount: meal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Card(
                          child: Text(
                            meal.ingredients[index],
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          color: Theme.of(context).accentColor,
                        ),
                      );
                    }),
              ),
              _createSectionTitle(context, 'Passos'),
              _createSectionContainer(
                ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(meal.steps[index]),
                        ),
                        Divider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: () {
          Navigator.of(context).pop(meal.title);
        },
      ),
    );
  }
}
