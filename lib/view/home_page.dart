import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trustayur/widget/grid_widget.dart';
import 'package:trustayur/widget/heading_widget.dart';

import '../model/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollViewController;
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            AnimatedContainer(
              height: _showAppbar ? 70.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: AppBar(
                leading: const Icon(
                  Icons.menu,
                  color: color,
                  size: 35,
                ),
                elevation: 0,
                backgroundColor: Colors.white,
                centerTitle: true,
                title: SvgPicture.asset(
                  "assets/logo.svg",
                  width: 50,
                  height: 40,
                  color: color,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollViewController,
                child: Column(
                  children: [
                    const HeadingWidget(),
                    const SizedBox(height: 40),
                    const GridWidget(),
                    const SizedBox(height: 40),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 25, left: 10, right: 10),
                      color: Colors.green[50],
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'why ',
                                style: TextStyle(color: color, fontSize: 25),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'trustayur?',
                                      style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'trustayur has set out on a path to reconnect people with nature and ayurveda. we bring verified and experienced BAMS doctors, authentic raw herbs and medicines sourced from verified vendors and have designed tried and trusted wellness programs to reverse conditions like PCOS and Diabetes.',
                            style: TextStyle(
                              color: color,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 0,
                                          right: 10,
                                          left: 10),
                                      child: Column(
                                        children: [
                                          // ignore: sized_box_for_whitespace
                                          Text(
                                            whyText[index],
                                            style: const TextStyle(
                                                color: color,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24),
                                          ),
                                          const SizedBox(height: 10),

                                          Center(
                                            child: Text(
                                              whyText2[index],
                                              style: const TextStyle(
                                                  color: color, fontSize: 10),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: color, // background
                              onPrimary: Colors.yellow, // foreground
                            ),
                            child: const Text(
                              'book free consultation',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            '*standard consultation fee applicable after first consultation',
                            style: TextStyle(
                              color: color,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 1),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade500,
                                    size: 35,
                                  ),
                                  backgroundColor: Colors.grey[100],
                                  radius: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  'Shivani Dakwa',
                                  style: TextStyle(color: color, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              ' I had a great service on call with Dr. Anjali. Her excellent diagnosis and prescribed treatment worked like a charm. She is very friendly. She understood my situation and was very empathetic.',
                              style: TextStyle(color: color, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'consult ayurvedic doctor online for',
                            style: TextStyle(
                              color: color,
                              fontSize: 18,
                            ),
                          ),
                          Text('any health concern',
                              style: TextStyle(
                                  color: color,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, mainAxisExtent: 230),
                        itemCount: 24,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, bottom: 0, right: 20, left: 20),
                                child: Column(
                                  children: [
                                    // ignore: sized_box_for_whitespace
                                    Container(
                                        height: 100,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 50,
                                          child: Image.asset(
                                            healthImage[index],
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    const SizedBox(height: 10),
                                    Text(
                                      healthText[index],
                                      style: const TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'consult now',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),
                      color: Colors.green[50],
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'trust in ',
                                style: TextStyle(color: color, fontSize: 22),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'ayurveda',
                                      style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Text(
                            'ayurveda is a science which believes in improving the lifestyle of an individual to bring a positive change in physical and mental health. to bring this change ayurveda focuses on diet, yoga, natural herbs and mindfullness. keeping this mind we have brought experts from the field of science, yoga, and diet to provide a holistic solution to reverse or treat diseases and conditions.',
                            style: TextStyle(
                              color: color,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: color, // background
                              onPrimary: Colors.yellow, // foreground
                            ),
                            child: const Text(
                              'book free consultation',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ),
                          const Text(
                            '*standard consultation fee applicable after first consultation',
                            style: TextStyle(color: color, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 40, left: 10, right: 10),

                      //color: Colors.green[50],
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: RichText(
                              text: const TextSpan(
                                text: 'our',
                                style: TextStyle(color: color, fontSize: 25),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: ' family',
                                      style: TextStyle(
                                          color: color,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                            ),
                            width: 350,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      child: Image.asset('assets/varsha.jfif'),
                                      backgroundColor: Colors.transparent,
                                      radius: 40,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Dr.Varsha',
                                          style: TextStyle(
                                              color: color, fontSize: 18),
                                          textAlign: TextAlign.left,
                                        ),
                                        const SizedBox(height: 5),
                                        const Text(
                                          'BAMS, MS',
                                          style: TextStyle(
                                              color: color, fontSize: 14),
                                          textAlign: TextAlign.left,
                                        ),
                                        SizedBox(
                                            height: 40,
                                            width: 60,
                                            child:
                                                Image.asset('assets/5star.png'))
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 350,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                              ),
                              // borderRadius: BorderRadius.circular(20),
                              color: Colors.grey,
                              boxShadow: [
                                BoxShadow(color: Colors.grey, spreadRadius: 1),
                              ],
                            ),
                            child: const Text(
                              ' 3 years of experience',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(top: 10, left: 10, right: 10),

                      // color: Colors.green[50],
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: const [
                                  Text(
                                    'frequently asked ',
                                    style: TextStyle(
                                      color: color,
                                      fontSize: 22,
                                    ),
                                  ),
                                  Text(
                                    'questions ',
                                    style: TextStyle(
                                        color: color,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'are your doctors qualified?',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Trustayur is committed to the highest standards of excellence. We manually verify necessary documents, registrations and certifications to ensure that every doctor on our site has their credentials in order before they'
                            're'
                            ' approved to provide services online with us!',
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                            ),
                            // textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'is online consultation safe on trustayur?',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'We are committed to the security and confidentiality of patient information, so we have implemented industry-standard practices and encryption techniques across our process. You can rest assured that your online consultation with a doctor will be completely safe!',
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                            ),
                            // textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'can i do a free online doctor consultation on trustayur?',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'your first consultation from the doctors on the trustayur preferred panel is 100% free. For any follow up consultation, you will have to pay our standard consultation charge.',
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                            ),
                            // textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            thickness: 2,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'what happens if i don'
                            't'
                            ' get a response from a doctor?',
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Your satisfaction is our priority. In the unlikely event that you do not receive a response from us, please let us know and we will give you a 100% refund!',
                            style: TextStyle(
                              color: color,
                              fontSize: 16,
                            ),
                            // textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        '*standard consultation fee applicable after first consultation',
                        style: TextStyle(color: color, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      height: 650,
                      //color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              text: 'boost ',
                              style: TextStyle(color: color, fontSize: 28),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'immunity',
                                    style: TextStyle(
                                        color: color,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' with ayurveda',
                                    style: TextStyle(
                                      color: color,
                                    ))
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          GridView.builder(
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2, mainAxisExtent: 250),
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //     border: Border.all(color: Colors.grey)),
                                    // color: Colors.orange,
                                    height: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 0,
                                          right: 10,
                                          left: 10),
                                      child: Column(
                                        children: [
                                          // ignore: sized_box_for_whitespace
                                          Container(
                                              height: 100,
                                              child: Image.asset(
                                                immunityImage[index],
                                                fit: BoxFit.cover,
                                              )),
                                          const SizedBox(height: 10),
                                          Text(
                                            immunityText[index],
                                            style: const TextStyle(
                                                color: color,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                            // textAlign: TextAlign.center,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            ('\u{20B9}${immunityPrice[index]}'),
                                            style: const TextStyle(
                                                color: color, fontSize: 14),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: color, // background
                        onPrimary: Colors.yellow, // foreground
                      ),
                      child: const Text(
                        'View all products',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
