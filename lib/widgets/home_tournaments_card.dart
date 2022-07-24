import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/models/tournaments_model.dart';
import 'package:paintball_app/widgets/outline_text_widget.dart';

import '../constants/color.dart';

class HomeTournamentsCard extends StatelessWidget {
  const HomeTournamentsCard({
    Key? key,
    required this.tournaments,
  }) : super(key: key);

  final Tournaments tournaments;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        height: 450,
        width: 280,
        child: Card(
          borderOnForeground: false,
          semanticContainer: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              ClipRRect(
                child: Image.asset(
                  tournaments.headImage,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                // color: Colors.white.withOpacity(0.2),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withOpacity(0.05),
                        Colors.black.withOpacity(0.7)
                      ],
                    ),
                    // backgroundBlendMode: BlendMode.luminosity,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            child: Center(
                              child: Text(
                                tournaments.type,
                                style: GoogleFonts.dmSans(
                                    fontSize: 12, color: yellow),
                              ),
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.bookmark,
                          color: yellow,
                        ),
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: SizedBox(
                        child: OutlineTextWidget(
                            text: tournaments.title, fontSize: 25, color: yellow),
                      ),
                    ),
                    SizedBox(
                      child: Text(
                        tournaments.subTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.dmSans(
                          fontSize: 15,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tournaments.eventDate,
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              tournaments.eventLocation,
                              style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_outlined,
                              color: Colors.black,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
