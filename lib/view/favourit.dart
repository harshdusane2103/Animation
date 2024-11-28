
import 'package:animated_pr_ui/controller/controller.dart';
import 'package:animated_pr_ui/utils/golbal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


SingleChildScrollView favoriteListPlanets(
    HomeController homeControllerTrue, BuildContext context, HomeController homeControllerFalse) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: 20,),
        Center(child: Text('Favorite Planets',style: TextStyle(color: Colors.white,fontSize: 36),)),
        ...List.generate(
        homeControllerTrue.favoritePlanetsList.length,
            (index) => Padding(
          padding: const EdgeInsets.only(right: 20.0, top: 20, left: 10),
          child: SizedBox(
            height: 165,
            child: Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff161616),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),

                          image: DecorationImage(
                            image: AssetImage(homeControllerTrue
                                .favoritePlanetsList[index].img),

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  homeControllerTrue.favoritePlanetsList[index].name,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),

                                ),
                                SizedBox(width: 100,),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    onPressed: () {
                                      homeControllerFalse.removeFavoritePlanets(index);
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: 182,
                              child: Text(
                                homeControllerTrue
                                    .favoritePlanetsList[index]
                                    .description,
                                maxLines: 3,
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const Spacer(),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),]
    ),
  );
}

