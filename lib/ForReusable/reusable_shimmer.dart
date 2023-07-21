import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;
  const ShimmerContainer({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Container(height: height, width: width, color: Colors.grey),
    );
  }
}

class ShimmerList extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  const ShimmerList(
      {super.key,
      required this.height,
      required this.width,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 7,
          child: Container(
            height: height,
            width: width,
            child: Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: radius,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          ShimmerContainer(width: 100, height: 20),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 53),
                        child: Container(
                            width: 200, height: 20, color: Colors.amber),
                      ),
                    )
                  ]);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
