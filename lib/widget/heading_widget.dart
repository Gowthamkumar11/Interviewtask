import 'package:flutter/material.dart';
import 'package:trustayur/model/data.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      color: Colors.green[50],
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: const TextSpan(
              text: 'ayurveda for ',
              style: TextStyle(color: color, fontSize: 26),
              children: <TextSpan>[
                TextSpan(
                  text: 'better health',
                  style: TextStyle(color: color, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'online consultation with ayurvedic doctor',
            style: TextStyle(
              color: color,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: color, // background
              onPrimary: Colors.yellow, // foreground
            ),
            child: const Text(
              'book free consultation',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '*standard consultation fee applicable after first consultation',
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
