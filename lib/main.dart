import 'package:flutter/material.dart';
import 'package:recipes/recipe_detail.dart';
import 'recipe.dart';
void main() {
  runApp(const RecipesApp());
}

class RecipesApp extends StatelessWidget {
  const RecipesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipes Calculator',
      theme: theme.copyWith(

        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.greenAccent,
        )
      ),
      home: const MyHomePage(title: 'Recipe Calculator'),
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      // 2
        title: Text(widget.title),
      ),
      // 3
      body:  SafeArea(
        //TO DO REPLACE CHILD: Container()
        // 4
        child:
        ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (BuildContext context, int index){
            return GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            // TODO : REplacing with return RecipeDetail
                            return RecipeDetail(recipe: Recipe.samples[index]);
                          },
                      )
                  );
                },
                child: buildRecipeCard(Recipe.samples[index])
            );
          },
        ),
      ),
    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Add buildRecipeCard() here
  Widget buildRecipeCard(Recipe recipe){
    return Card(
      elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Image(image: AssetImage(recipe.imageUrl)),
              const SizedBox(
                height: 14.0,
              ),
              Text(
                  recipe.label,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Palatino',
                ),
              ),
            ],
          ),
        ),
    );
  }
}
