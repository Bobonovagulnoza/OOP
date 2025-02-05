import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Recipe {
  final String name;
  final String description;
  final String time;
  final int rating;
  final String image;

  Recipe({
    required this.name,
    required this.description,
    required this.time,
    required this.rating,
    required this.image,
  });
}

class RecipeApp extends StatefulWidget {
  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    fetchRecipes();
  }

  void fetchRecipes() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      recipes = [
        Recipe(
            name: "Crispy Shrimp",
            description: "A feast for the senses",
            time: "20min",
            rating: 4,
            image: "assets/broccoli_lasagna.png"),
        Recipe(
            name: "Chicken Wings",
            description: "Delicious and juicy wings",
            time: "30min",
            rating: 5,
            image: "assets/chicken.png"),
        Recipe(
            name: "Colors Macarons",
            description: "Sweet bites full of elegance",
            time: "40min",
            rating: 4,
            image: "assets/sweet.png"),
        Recipe(
            name: "Pina Colada",
            description: "A tropical explosion in every sip",
            time: "30min",
            rating: 4,
            image: "assets/pina.colada.png"),
        Recipe(
            name: "Colors Macarons",
            description: "Sweet bites full of elegance",
            time: "40min",
            rating: 4,
            image: "assets/drink.png"),
        Recipe(
            name: "Colors Macarons",
            description: "Sweet bites full of elegance",
            time: "40min",
            rating: 4,
            image: "assets/fastfood.png"),
        Recipe(
            name: "Colors Macarons",
            description: "Sweet bites full of elegance",
            time: "40min",
            rating: 4,
            image: "assets/waffles.png"),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // 2 ta tab bor: Recipes va Favorites
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          leadingWidth: 102,
          toolbarHeight: 102,
          backgroundColor: Colors.black,
          elevation: 0,
          leading: Row(
            children: [
              Image(
                image: AssetImage("assets/dianne.png"),
                height: 100,
                width: 100,
              ),
            ],
          ),
          title: Column(
            children: [
              SizedBox(width: 70),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Dianne Russell",
                      style: TextStyle(color: Colors.pink, fontSize: 15)),
                  Text("@dianne_r",
                      style: TextStyle(color: Color(0xffEC888D), fontSize: 12)),
                  Text("My passion is cooking and sharing",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text("new recipes with the world.",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
          actions: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 28,
                height: 28,
                color: Color(0xffFFC6C9),
                child: Icon(Icons.add, color: Color(0xffEC888D)),
              ),
            ),
            SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 28,
                height: 28,
                color: Color(0xffFFC6C9),
                child: Icon(Icons.menu, color: Color(0xffEC888D)),
              ),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 70),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 175,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Color(0xffFFC6C9),
                        ),
                        alignment: Alignment.center,
                        child: Text("Edit Profile",
                            style: TextStyle(color: Color(0xffEC888D))),
                      ),
                    ),
                    SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 175,
                        height: 27,
                        decoration: BoxDecoration(
                          color: Color(0xffFFC6C9),
                        ),
                        alignment: Alignment.center,
                        child: Text("Share Profile",
                            style: TextStyle(color: Color(0xffEC888D))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),

                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    width: 356,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Color(0xffFFC6C9)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(
                          "60 recipes",
                          style: TextStyle(
                            color: Color(0xffEC888D),
                          ),
                        ),
                        SizedBox(width: 32,),
                        Text(
                          "120 following",
                          style: TextStyle(
                            color: Color(0xffEC888D),
                          ),
                        ),
                        SizedBox(width: 35,),
                        Text(
                          "120 Followers",
                          style: TextStyle(
                            color: Color(0xffEC888D),
                          ),
                        ),
                      ],

                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),

          ),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Text("Recipes"),
                Text("Favorites"),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(15)),
                            child: Image.asset(
                              recipe.image,
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  recipe.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  recipe.description,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_alarm,
                                      color: Colors.pinkAccent,
                                    ),
                                    Text(
                                      recipe.time,
                                      style:
                                          TextStyle(color: Colors.pinkAccent),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 281,
                height: 56,
                decoration: BoxDecoration(
                  color: Color(0xffEC888d),
                  borderRadius: BorderRadius.circular(33),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset("assets/svg/home.svg"),
                    SvgPicture.asset("assets/svg/community.svg"),
                    SvgPicture.asset("assets/svg/categories.svg"),
                    SvgPicture.asset("assets/svg/profile.svg"),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}



