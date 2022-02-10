// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

import 'package:uran_test/data/models/exhibits_model.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ExhibitItem extends StatefulWidget {

  final Exhibits modelData;
  const ExhibitItem({required this.modelData});

  @override
  _ExhibitItemState createState() => _ExhibitItemState();
}

class _ExhibitItemState extends State<ExhibitItem> {

  var activeSlideIndex = 0;
  // ignore: prefer_typing_uninitialized_variables
  var width;

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
          width: width,
          height: 200.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              PageView.builder(
                itemCount: widget.modelData.images.length,
                onPageChanged: (index) => setState( ()=> activeSlideIndex = index),
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: widget.modelData.images[activeSlideIndex],
                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(value: downloadProgress.progress,),
                            ),
                          ),
                        errorWidget: (context, url, error) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.error, color: Colors.red, size: 50.0,),
                            Text('Could not load this image')
                          ],
                        )
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                child: Text(
                    widget.modelData.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    )
                ),
              ),
              Positioned(
                bottom: 5.0,
                left: 15.0,
                child: Container(
                  width: width,
                  height: 30.0,
                  child: ListView.builder(
                    itemCount: widget.modelData.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // onTap: ()=> setState( ()=> activeSlideIndex = index),
                        onTap: ()=> {},
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            color: index == activeSlideIndex ? Colors.blueAccent : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      );
                    },
                  ),
                )
              )
            ],
          )
      ),
    );
  }

}