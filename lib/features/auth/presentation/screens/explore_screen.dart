import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mat;
import 'package:hotel/core/utils/app_assets.dart';
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
                              const SizedBox(height: 1),
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
                      // Map logic
                    },
                    icon: Row(
                      children: [
                        Text(
                          'الخريطة',
                          style: TextStyle(color: AppColors.black), // Black text
                        ),
                        const ImageIcon(
                          AssetImage('assets/images/mapIcon.png'),
                          color: AppColors.black,
                        ),

                      ],
                    ),
                    label: const Text(
                      '',
                      style: TextStyle(color: AppColors.black), // Black text
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: const Text('تصفية',
                        style: TextStyle(color: AppColors.black)),
                  ),
                  const Row(
                    children: [
                      Text("ترتيب"),
                      Icon(Icons.compare_arrows),
                    ],
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
        child: Directionality(
          textDirection: mat.TextDirection.rtl,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Container(
                width: 110,
                height: 173,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/unsplash.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              // Hotel Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Palm Inn Suites Hotel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          width: 50.0,
                        ),
                        const ImageIcon(
                          AssetImage('assets/images/heart.png'),
                        )
                      ],
                    ),
                    const SizedBox(height: 3.0),
                    Row(
                      children: const [
                        Icon(Icons.star, color: AppColors.black, size: 14),
                        Text('7.8[474',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.black,
                          size: 15.0,
                        ),
                        Text(
                          "غرفة مطلة على البحر، 100 متر من وسط المدينه ",
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        ImageIcon(
                          AssetImage('assets/images/sun-bed.png'),
                          color: AppColors.black,
                          size: 15.0,
                        ),
                        Text("مقابلة الشاطئ", style: TextStyle(fontSize: 12.0)),
                      ],
                    ),
                    const SizedBox(height: 2.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'غرفه فندقية : الاسرة :واحد مزدوج او اتنين منفردين ',
                          style: TextStyle(
                            fontSize: 10,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          ' السعر لليلة الواحده, شخصين بالغين',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'LE',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                        const Text(
                          ' 1,200',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'الغاء مجاني',
                          style: TextStyle(color: AppColors.black, fontSize: 11.0),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.0,),
                    Row(
                      children: [
                        const Text(
                          'لا يطلب دفع مقدم ',
                          style: TextStyle(color: AppColors.black, fontSize: 11.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
