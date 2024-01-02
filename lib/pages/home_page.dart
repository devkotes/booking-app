import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> menus = ['Best', 'Popular', 'Immediate', 'New', 'Profitable'];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xffF9F9FB),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: _buildHeaderHome(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _customFieldSearch(),
              ),
              const SizedBox(height: 28),
              _tabCategories(),
              const SizedBox(height: 28),
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          right: 24, left: (index == 0) ? 24 : 0),
                      child: _cardItem(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderHome() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You are Here',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffA1A7B0),
              ),
            ),
            Row(
              children: [
                const Text(
                  'Indonesia',
                  style: TextStyle(
                    color: Color(0xff464646),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Image.asset(
                  'assets/images/arrow.png',
                  width: 10,
                  height: 10,
                ),
              ],
            ),
          ],
        ),
        const Stack(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 5,
                  backgroundColor: Color(0xffFF8383),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _customFieldSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            cursorColor: const Color(0xffCED0D4),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              hintText: 'Enter city or region',
              hintStyle: const TextStyle(
                color: Color(0xffCED0D4),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Color(0xffCED0D4),
              ),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            color: const Color(0xff61AAC9),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Image.asset('assets/images/filter.png'),
          ),
        ),
      ],
    );
  }

  Widget _tabCategories() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(
            left: (index == 0) ? 24 : 0,
          ),
          child: GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(right: 32),
              padding: const EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: (currentIndex == index)
                      ? const BorderSide(
                          color: Color(0xff464646),
                        )
                      : BorderSide.none,
                ),
              ),
              child: Center(
                child: Text(
                  menus[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: (currentIndex == index)
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: (currentIndex == index)
                        ? const Color(0xff464646)
                        : const Color(0xff464646).withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _cardItem() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width - 80,
      child: Column(
        children: [
          SizedBox(
            height: 336,
            child: Stack(
              children: [
                Container(
                  height: 336,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: const DecorationImage(
                      image: NetworkImage('https://source.unsplash.com/random'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 65,
                        height: 28,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber[400],
                              size: 18,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              '4,93',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 24,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Villa, Kemah Tinggi',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff464646),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_bed.png',
                            width: 24,
                            height: 24,
                          ),
                          const Text(
                            '2 bedrooms',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffA1A7B0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_square.png',
                            width: 24,
                            height: 24,
                          ),
                          const Text(
                            '214M',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffA1A7B0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$920',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4C9FC1),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'per month',
                    style: TextStyle(fontSize: 10, color: Color(0xffA1A7B0)),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
