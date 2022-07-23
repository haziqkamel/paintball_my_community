import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paintball_app/widgets/outline_text_widget.dart';

import '../constants/color.dart';
import '../models/news_model.dart';

class HomeCardNewsWidget extends StatelessWidget {
  const HomeCardNewsWidget({Key? key, required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  news.newsHeadImage,
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
                                news.type,
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
                        width: 165,
                        height: 66,
                        child: OutlineTextWidget(
                            text: news.newsTitle, fontSize: 25, color: yellow),
                      ),
                    ),
                    SizedBox(
                      height: 74,
                      width: 143,
                      child: Text(
                        news.newsDescription,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: GoogleFonts.dmSans(
                            fontSize: 12, color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Image.asset(news.authorImageUrl),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news.authorName,
                              style: GoogleFonts.dmSans(
                                  fontSize: 9,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              news.newsPostedOn,
                              style: GoogleFonts.dmSans(
                                  fontSize: 9,
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