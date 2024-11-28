
import 'package:animated_pr_ui/controller/controller.dart';
import 'package:animated_pr_ui/utils/golbal.dart';
import 'package:animated_pr_ui/view/favourit.dart';

import 'package:animated_pr_ui/view/second.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late InAppWebViewController webViewController;
TextEditingController searchController = TextEditingController();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(); // Repeats the animation indefinitely
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final HomeController homeControllerTrue = Provider.of<HomeController>(context);
    final HomeController homeControllerFalse = Provider.of<HomeController>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      body: (currentIndex == 2)
          ? favoriteListPlanets(homeControllerTrue, context, homeControllerFalse)
          : Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hello HARSH ',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR32g-r99Tc-rrI29wlHF-FVF6P-thIEKgU0w&s',
                  ),
                ),
              ],
            ),
          ),


          Padding(
            padding: const EdgeInsets.all(8.0),
             child: TextField(
                     controller: searchController,
              onTap: () {
                String query = searchController.text;
              if (query.isNotEmpty) {
                String url =
                Uri.https('www.google.com', '/search', {'q': query})
                    .toString();
                webViewController.loadUrl(
                  urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                );
              }
              },
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  String url =
                  Uri.https('www.google.com', '/search', {'q': query})
                      .toString();
                  webViewController.loadUrl(
                    urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                  );
                }
              },

              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration:InputDecoration(

                  prefixIcon: Icon(Icons.search_rounded,color: Colors.white,),
                  suffixIcon: Icon(Icons.mic,color: Colors.white,),
                  hintText: 'Search Anythings',
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white,width: 2),
                  ),
                  enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white,width: 1),)
              ),

            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 200,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/banner.jpg'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Popular Now 🔥', style: TextStyle(color: Colors.white, fontSize: 24)),
              Text('See All', style: TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
          Expanded(
            child: homeControllerTrue.planetsList.isEmpty
                ? const Center(
              child: Text("No planets available", style: TextStyle(color: Colors.white)),
            )
                : CarouselSlider.builder(
              itemCount: homeControllerTrue.planetsList.length,
              options: CarouselOptions(
                height: 250,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false,
                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIndex) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SecondScreen()),
                    );
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 250,
                        width: 300,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Color(int.tryParse(homeControllerTrue.planetsList[index].color) ?? 0xFF000000),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 50),
                              const Text('Planet', style: TextStyle(color: Colors.white, fontSize: 18)),
                              const SizedBox(height: 5),
                              Text(
                                homeControllerTrue.planetsList[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                homeControllerTrue.planetsList[index].one,
                                style: const TextStyle(color: Colors.white, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -85,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: RotationTransition(
                            turns: _animationController,
                            child: Image.asset(
                              homeControllerTrue.planetsList[index].img,
                              height: 200,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Highlight the selected tab
        onTap: (index) {
          setState(() {
            currentIndex = index; // Update the selected tab
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

 int currentIndex=0;
