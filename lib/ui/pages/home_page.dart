import 'package:flutter/material.dart';
import '../../controllers/meal_controller.dart';
import '../widgets/stroke_text.dart'; // ✅ Import reusable stroke text

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = MealController();

  @override
  Widget build(BuildContext context) {
    final Color highlightColor = Color(0xFFFF6F00);

    return Scaffold(
      appBar: AppBar(title: Text("NutriMeal")),
      body: controller.currentMeal == null
          ? Center(
              child: ElevatedButton(
                onPressed: () async {
                  await controller.fetchRandomMeal();
                  setState(() {});
                },
                child: Text("Generate Meal"),
              ),
            )
          : Stack(
              children: [
                // Background image
                Positioned.fill(
                  child: Image.network(
                    controller.currentMeal!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                // Foreground content
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 🟧 Title
                      Center(
                        child: StrokeText(
                          controller.currentMeal!.name,
                          fontSize: 26,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Cards Row
                      Expanded(
                        child: Row(
                          children: [
                            // Ingredients Card
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: highlightColor, width: 1.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StrokeText("📋 Ingredients"),
                                    SizedBox(height: 8),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: controller
                                              .currentMeal!.ingredients
                                              .map(
                                                (e) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 2),
                                                  child: StrokeText(
                                                    "🍽️ $e",
                                                    fontSize: 16,
                                                    strokeWidth: 1,
                                                    strokeColor: Colors.white,
                                                    fillColor: Colors.black,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 12),

                            // Instructions Card
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: highlightColor, width: 1.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    StrokeText("📖 Instructions"),
                                    SizedBox(height: 8),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: controller
                                              .currentMeal!.instructions
                                              .split('.')
                                              .map((e) => e.trim())
                                              .where((e) => e.isNotEmpty)
                                              .map(
                                                (step) => Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 4),
                                                  child: StrokeText(
                                                    "👉 $step.",
                                                    fontSize: 16,
                                                    strokeWidth: 1,
                                                    strokeColor: Colors.white,
                                                    fillColor: Colors.black,
                                                  ),
                                                ),
                                              )
                                              .toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 20),

                      // Button
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            await controller.fetchRandomMeal();
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            backgroundColor: highlightColor,
                          ),
                          child: Text("Generate Meal"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
