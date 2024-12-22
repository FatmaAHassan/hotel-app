import 'package:flutter/material.dart';
import 'package:hotel/core/utils/app_colors.dart';
import 'package:hotel/features/tabs/explore.dart';
import 'package:hotel/features/tabs/favorite.dart';
import 'package:hotel/features/tabs/messages.dart';
import 'package:hotel/features/tabs/profile.dart';
import 'package:hotel/features/tabs/trips.dart';

class ExploreScreen extends StatefulWidget {
  static const String routeName = "explore";

  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int index = 0;
  List<Widget> tabs = [
    ExploreTab(),
    TripsTab(),
    MessagesTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 15, left: 15),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Filter Icon
                    IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/images/Filter.png'),
                        color: AppColors.black,
                      ),
                      onPressed: () {},
                    ),
                    // Search Hint (Styled RichText)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Handle search bar interaction
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // First Line of Text
                              Text(
                                "أين وجهتك؟",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Vertical Space Between Text Lines
                              const SizedBox(height:1),
                              // Second Line of Text
                              Text(
                                "أي مكان. أي أسبوع. إضافة الضيوف",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: AppColors.lightGray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Search Icon
                    IconButton(
                      icon: const ImageIcon(
                        AssetImage('assets/images/Search.png'),
                        color: AppColors.black,
                      ),
                      onPressed: () {
                        // Handle search action
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Tab-like Row
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      // Map view logic
                    },
                    icon: const ImageIcon(AssetImage('assets/images/mapIcon.png'),
                        color: AppColors.black,),
                    label: const Text('الخريطة',
                      style: TextStyle(color: AppColors.black), // Black text
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      // Filter by rating
                    },
                    child: const Text('تصفية',
                    style: TextStyle(color: AppColors.black)),
                  ),

                  TextButton.icon(
                    onPressed: () {

                      // Sort by price
                    },
                    icon: Icon(Icons.arrow_downward_sharp, color: AppColors.black),
                    label: const Text('ترتيب',
                      style: TextStyle(color: AppColors.black), // Black text
                    ),
                  ),
                ],
              ),
            ),
            // List of Hotels
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with your data count
                itemBuilder: (context, index) {
                  return HotelCard();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.lightGray,
        showSelectedLabels: true,
        currentIndex: index,
        onTap: (value) {
          index = value;
          setState(() {});
        },
        items: const [
          // backgroundColor: AppColors.darkBlack,
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/User.png"),
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/Message.png"),
            ),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/trips.png"),
            ),
            label: 'Trips',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/heart.png"),
            ),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage("assets/images/explore.png"),
            ),
            label: 'Explore',
          ),
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
           // Image
            Container(
              width: 110,
              height: 173,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/unsplash.png'),
                  // Example image
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            // Hotel Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const ImageIcon(AssetImage('assets/images/heart.png')),
                  const Text(
                    'Palm Inn Suites Hotel',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: const [
                      Icon(Icons.star, color:AppColors.black, size: 14),
                      Text('4.7[478)'),
                    ],
                  ),
                  const SizedBox(height: 3.0),
                  const Text(
                    'غرفة مطلة على البحر، 100 متر من وسط المدينة',
                    style: TextStyle(fontSize: 11.0),
                  ),
                  const SizedBox(height: 3.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '1,200 LE / الليلة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),

                      // IconButton(
                      //   icon: const ImageIcon(
                      //     AssetImage('assets/images/heart.png'),),
                      //   onPressed: () {
                      //     // Handle favorite toggle
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
