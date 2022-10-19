import 'package:flutter/material.dart';

import 'cards/have_questions_cards.dart';
import 'cards/holdings_card.dart';
import 'cards/horizontal_list_cards.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        actions: const <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded, color: Colors.white),
            onPressed: null,
          ),
        ],
        title: const Text('Holdings',
            style: TextStyle(color: Colors.white, fontSize: 16)),
        elevation: 0,
        backgroundColor: appBarBackgroundColor,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: appBackgroundColor,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('images/snapshot_bottom_nav.png'),
            label: 'snapshot',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/bottom_nav_holdings.png'),
            label: 'holdings',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/bottom_nav_invest.png'),
            label: 'investments',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/bottom_nav_profile.png'),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: botBgColor,
        onTap: _onItemTapped,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text('Holdings Current Value',
                              style: TextStyle(
                                  color: appBackgroundColor,
                                  fontSize: secondaryFontSize)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset('images/card_title.png'),
                                Image.asset(
                                    'images/percentage_change_holdings.png'),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text('Invested Amount',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: appBackgroundColor,
                                    fontSize: secondaryFontSizeSecond)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Image.asset('images/invested_amount.png'),
                          ),
                        ],
                      ),
                    ),
                    decoration: const BoxDecoration(
                      color: appBarBackgroundColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                  ),
                  Positioned(
                    top: 165,
                    left: 16,
                    right: 16,
                    child: Container(
                      width: 328,
                      height: 64,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const <Widget>[
                                Text('Ask Koshex Bot',
                                    style: TextStyle(
                                        color: appBackgroundColor,
                                        fontSize: secondaryFontSizeSecond)),
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: Text('Show me the updates for 1 day',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: secondaryFontSize)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Image.asset('images/rightArrow.png'),
                          ),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: botBgColor,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 3)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 72,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: HorizontalListCards(
                      heading: 'OVERALL P&L',
                      secondHeader: 'images/overallNumbers.png',
                    ),
                  ),
                  HorizontalListCards(
                    heading: 'TOP PERFORMER',
                    secondHeader: 'images/mftitle.png',
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 30),
              child: Text(
                "YOUR HOLDINGS",
                style: TextStyle(
                    color: botBgColor, fontSize: holdingTitleFontSize),
                textAlign: TextAlign.end,
              ),
            ),
            const HoldingsCard(
              title: 'Mutual Funds',
              cardColor: smartDepositStarColor,
              arrowVector: 'images/upArrowVector.png',
              investmentValue: 'images/investmentValue.png',
              addIcon: 'images/rupee_sign.png',
              extraIcon: 'images/plus_icon.png',
            ),
            const HoldingsCard(
              title: 'Smart Deposits',
              cardColor: smartDepositStarColor,
              arrowVector: 'images/upArrowVector.png',
              investmentValue: 'images/investmentValue.png',
              addIcon: 'images/rupee_sign.png',
              extraIcon: "",
            ),
            const HoldingsCard(
              title: 'Digital Gold',
              cardColor: goldStarColor,
              arrowVector: 'images/down_vector.png',
              investmentValue: 'images/negartive_value.png',
              addIcon: 'images/rupee_sign.png',
              extraIcon: "",
            ),
            const HoldingsCard(
              title: 'Provident fund',
              cardColor: pfStarColor,
              arrowVector: 'images/upArrowVector.png',
              investmentValue: 'images/investmentValue.png',
              addIcon: 'images/plus_icon.png',
              extraIcon: "",
            ),
            const HoldingsCard(
              title: 'Fixed deposits',
              cardColor: fdStarColor,
              arrowVector: 'images/upArrowVector.png',
              investmentValue: 'images/investmentValue.png',
              addIcon: 'images/plus_icon.png',
              extraIcon: "",
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 16.0),
              child: Container(
                width: 328,
                height: 56,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('VIEW ALL TRANSACTIONS',
                          style: TextStyle(
                              color: viewAllTransTextColor,
                              fontSize: secondaryFontSizeSecond)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 110.0),
                      child: Image.asset('images/rightArrowTrans.png'),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  color: viewAllTransColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, spreadRadius: 2, blurRadius: 3)
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 30),
              child: Text(
                "HAVE QUESTIONS?",
                style: TextStyle(
                    color: botBgColor, fontSize: holdingTitleFontSize),
                textAlign: TextAlign.end,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 50.0, top: 16),
              child: SizedBox(
                height: 70,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    HaveQuestionsCards(
                      heading: 'Chat with Us',
                      iconsHaveQuestions: 'images/chatWithUs.png',
                    ),
                    HaveQuestionsCards(
                      heading: 'Read FAQs',
                      iconsHaveQuestions: 'images/ReadFaqs.png',
                    ),
                    HaveQuestionsCards(
                      heading: 'Email Us',
                      iconsHaveQuestions: 'images/emailUs.png',
                    ),
                    HaveQuestionsCards(
                      heading: 'Call Us',
                      iconsHaveQuestions: 'images/callUs.png',
                    ),
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
