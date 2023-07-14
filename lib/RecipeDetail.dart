import 'package:flutter/material.dart';
import 'package:recibe_calculator/Ingredient.dart';
import 'package:recibe_calculator/recipe.dart';

class RecipeDetail extends StatefulWidget {
  RecipeDetail({super.key,required this.recetas});
  final Recipe recetas;

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  double sliderValue = 0.0;
  @override
  void initState() {
    super.initState();
    sliderValue = widget.recetas.servings.toDouble();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Detalles de la receta'),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(widget.recetas.imageUrl),
            const SizedBox(height: 16.0),
            Text(
              widget.recetas.label,
              style: const TextStyle(fontSize: 25.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Ingredientes de la receta',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.recetas.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                double updatedQuantity =
                    widget.recetas.ingredients[index].quantity *
                        (sliderValue / widget.recetas.servings.toDouble());
                return ListTile(
                  title: Text('$updatedQuantity  ${widget.recetas.ingredients[index].name}'),
                );
              },
            ),
            const Text(
              'Servings',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 15.0,
                ),
                overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 30.0,
                ),
                overlayColor: const Color(0x29EB1555),
                thumbColor: const Color(0xFFEB1555),
                activeTrackColor: const Color(0xFFEB1555),
                inactiveTrackColor: const Color(0x29EB1555),
              ),
              child: Tooltip(
                message: sliderValue.toString(),
                child: Slider(
                  value: sliderValue,
                  min: widget.recetas.servings.toDouble(),
                  max: widget.recetas.servings.toDouble() * 10,
                  onChanged: (newValue) {
                    setState(() {
                      sliderValue =
                          (newValue / widget.recetas.servings).roundToDouble() *
                              widget.recetas.servings.toDouble();
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '${sliderValue.toInt()}',
              style: TextStyle(fontSize: 24.0),
            ),
          ],
        ),
      ),
    );
  }
}
