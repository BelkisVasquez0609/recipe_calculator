import 'package:flutter/material.dart';
import 'package:recibe_calculator/recipe.dart';
import 'package:recibe_calculator/RecipeDetail.dart';

class ListBuilder extends StatefulWidget {
  const ListBuilder({
    super.key,
  });

  @override
  State<ListBuilder> createState() => _ListBuilderState();
}

class _ListBuilderState extends State<ListBuilder> {
  @override
  //Crear un objeto de QuizBrain
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: Recipe.samples.length,
      itemBuilder: (BuildContext context, int index) {
        Recipe receta = Recipe.samples[index];
        return Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),  // Color de la sombra
                spreadRadius: 2,                      // Radio de propagación de la sombra
                blurRadius: 5,                        // Radio de desenfoque de la sombra
                offset: const Offset(0, 3),                  // Desplazamiento de la sombra (eje x, eje y)
              ),
            ],
            borderRadius: BorderRadius.circular(8.0),  // Radio de la esquina del borde
          ),
          child: Card(
            child: Column(
              children: [
                TextButton(
                  child: Image.asset(receta.imageUrl),
                  onPressed: (){
                    var result = Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return RecipeDetail(recetas: receta,);
                        }));
                  }
                ),
                Text(
                  receta.label,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
              ],
            ),
            // child: Image.asset(receta.imageUrl),
            // child: Text(receta.label),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}