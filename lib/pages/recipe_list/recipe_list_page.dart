import 'package:flutter/material.dart';
import 'package:reciperlich/data/recipe_repository.dart';

import 'widgets/recipe_item_widget.dart';
import '../../constants/app_image_paths.dart';
import '../../shared_widgets/app_bar_widget.dart';
import 'widgets/footer_widget.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    final recipes = RecipeRepository.getRecipes();

    return Scaffold(
      // 2
      body: CustomScrollView(
        // 3
        slivers: <Widget>[
          const AppBarWidget(
            imagePath: AppImagePaths.mainImage,
            centerTitle: true,
            text: 'Reciperlich',
          ),

          // 4
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverFixedExtentList(
              // 5
              itemExtent: 110,
              // 6
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    // 7
                    child: RecipeItem(recipes[index])),
                childCount: recipes.length,
              ),
            ),
          ),

          // SliverPadding(
          //   padding: const EdgeInsets.all(20.0),
          //   sliver: SliverList(
          //     delegate: SliverChildBuilderDelegate(
          //       (context, index) => SizedBox(
          //         height: 110,
          //         child: Padding(
          //             padding: const EdgeInsets.only(bottom: 20),
          //             child: RecipeItem(recipes[index])),
          //       ),
          //       childCount: recipes.length,
          //     ),
          //   ),
          // ),
          const SliverToBoxAdapter(
            child: FooterWidget(),
          ),
        ],
      ),
    );
  }
}
