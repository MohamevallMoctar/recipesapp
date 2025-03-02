import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget{
  final Recipe recipe;
  const RecipeDetail({ super.key, required this.recipe,});
  @override
  State<RecipeDetail> createState(){
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail>{
  int sliderVal = 1;
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(image: AssetImage(widget.recipe.imageUrl)),
              ),

              const SizedBox(
                height: 4,
              ),
              Text(
                widget.recipe.label,
                style: const TextStyle( fontSize:  18),
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(7.0),
                    itemCount: widget.recipe.ingredients.length,
                    itemBuilder: (BuildContext context,int index){
                        final ingredients =  widget.recipe.ingredients[index];
                        return Text('${ingredients.quantity * sliderVal} ${ingredients.measure} ${ingredients.name}');
                    }
                ),
              ),
              Slider(
                  min: 1,
                  max: 10,
                  divisions: 9,
                  label: '${ sliderVal * widget.recipe.servings} servings.',
                  value: sliderVal.toDouble(),
                  onChanged: (newValue){
                    setState(() {
                      sliderVal = newValue.round();
                        print(sliderVal);
                    });
                  },
                  activeColor: Colors.green,
                  inactiveColor: Colors.black,
              ),
            ],
          )
      ),
    );
  }
}