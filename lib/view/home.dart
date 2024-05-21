import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/view/tabs/hijb_tab.dart';
import 'package:quran/view/tabs/page_tab.dart';
import 'package:quran/view/tabs/para_tab.dart';
import 'package:quran/view/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavbar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
              headerSliverBuilder: (BuildContext context,
                      bool innerBoxIsScrolled) =>
                  [
                    SliverToBoxAdapter(
                      child: _salam(),
                    ),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      elevation: 0,
                      shape: Border(
                        bottom: BorderSide(
                            width: 3,
                            color: const Color(0XFFAAAAAA).withOpacity(0.1)),
                      ),
                      bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: _tab()),
                    )
                  ],
              body: const TabBarView(
                  children: [SurahTab(), PageTab(), ParaTab(), HijbTab()])),
        ),
      ),
    );
  }

  TabBar _tab() => TabBar(
        labelColor: Colors.purple,
        indicatorColor: Colors.purple,
        indicatorWeight: 3,
        tabs: [
          _tabItem('Surah'),
          _tabItem('Hijb'),
          _tabItem('Pages'),
          _tabItem('Para'),
        ],
      );

  Tab _tabItem(String label) => Tab(
        child: Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );

  Column _salam() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Assalamu'alaikum",
            style: GoogleFonts.plusJakartaSans(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Ali',
            style: GoogleFonts.plusJakartaSans(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 16,
          ),
          _lastRead()
        ],
      );

  Stack _lastRead() => Stack(
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(10),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFDF98FA), Color(0xFF9055FF)])),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('assets/svg/quran_banner.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Last Read',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Al-Fatihah',
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Verse : 1',
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          )
        ],
      );

  AppBar _appBar() => AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/svg/quran_icon.svg'),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Quran App',
              style: GoogleFonts.poppins(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svg/search_icon.svg'))
        ],
      );

  BottomNavigationBar _bottomNavbar() => BottomNavigationBar(
        items: [
          _bottomNavItem(icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
          _bottomNavItem(icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
          _bottomNavItem(
              icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark'),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
      );

  BottomNavigationBarItem _bottomNavItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(icon),
          activeIcon: SvgPicture.asset(icon),
          label: label);
}
