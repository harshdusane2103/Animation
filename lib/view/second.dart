import 'package:animated_pr_ui/controller/controller.dart';
import 'package:animated_pr_ui/utils/golbal.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin {
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
    HomeController homeControllerTrue = Provider.of<HomeController>(context);
    HomeController homeControllerFalse = Provider.of<HomeController>(context,listen: false);
    return   Scaffold(
      backgroundColor: Colors.black,

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                    Navigator.of(context).pop();
                
                
                
                    });
                  },
                    child: Icon(Icons.arrow_back_ios_new,color: Colors.white,)),
                Text(homeControllerTrue.planetsList[selectedIndex].name,style: TextStyle(color: Colors.white,fontSize: 20),),
                IconButton(onPressed: () {
                  
                }, icon: Icon(Icons.more_vert,color: Colors.white,))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 220,
                width: 400,
                decoration: BoxDecoration(

                ),
                child: RotationTransition(
                  turns: _animationController,
                    child: Image.asset(homeControllerTrue.planetsList[selectedIndex].img,fit: BoxFit.fitHeight,)),
              ),
            ),
            Container(
              height: 511,
              width: 400,
              decoration: BoxDecoration(
                 gradient: LinearGradient(
                  colors: [Color(int.parse(homeControllerTrue.planetsList[selectedIndex].color)), Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,),
              
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(homeControllerTrue.planetsList[selectedIndex].name,style:  TextStyle(color: Colors.white, fontSize:42 ,fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: () {
                              homeControllerFalse.addFavoritePlanets();
                            },
                            child: Icon(
                              (homeControllerTrue.planetsList[selectedIndex].like)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              shadows: const [
                                Shadow(
                                    color: Colors.red,
                                    blurRadius: 20,
                                    offset: Offset(0.5, 0.5))
                              ],

                          color: homeControllerTrue.planetsList[selectedIndex].like
                              ? Colors.red
                              : Colors.white, // Change color based on the 'like' status
                          size: 33,
                            ),
                          )



                        ],
                      ),

                      Text(homeControllerTrue.planetsList[selectedIndex].description,style:  TextStyle(color: Colors.white, fontSize:18 ,)),
                      Text('Distance :'+' '+homeControllerTrue.planetsList[selectedIndex].distance,style:  TextStyle(color: Colors.white, fontSize:28 ,)),
                      Text('Velocity  :'+' '+homeControllerTrue.planetsList[selectedIndex].velocity,style:  TextStyle(color: Colors.white, fontSize:28 ,)),
                    ]),
                  ),
                ),
              )

        
        
          ],
        ),
      ),
    );
  }
}
