import 'package:flutter/material.dart';
import 'package:trustayur/model/data.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 250),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 0, right: 20, left: 20),
                    child: Column(
                      children: [
                        // ignore: sized_box_for_whitespace
                        Container(
                            height: 80,
                            child: Image.asset(
                              image[index],
                              fit: BoxFit.cover,
                            )),
                        const SizedBox(height: 10),
                        Text(
                          title[index],
                          style: const TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          subTitle[index],
                          style: const TextStyle(color: color, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
