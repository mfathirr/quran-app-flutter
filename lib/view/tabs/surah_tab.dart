import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/model/surah.dart';
import '../detail_screen.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getListSurah() async {
    String data = await rootBundle.loadString('assets/data/list-surah.json');
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getListSurah(),
        initialData: const [],
        builder: (((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: ((context, index) => _surahItem(
                  context: context, surah: snapshot.data!.elementAt(index))),
              separatorBuilder: ((context, index) => Divider(
                    color: const Color(0xFFAAAAAA).withOpacity(0.1),
                  )),
              itemCount: snapshot.data!.length);
        })));
  }

  Widget _surahItem({required BuildContext context, required Surah surah}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (((context) => DetailScreen(
                    nomorSurah: surah.nomor,
                  )))));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  SvgPicture.asset('assets/svg/nomor_surah.svg'),
                  SizedBox(
                    height: 36,
                    width: 36,
                    child: Center(
                      child: Text(
                        surah.nomor.toString(),
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    surah.namaLatin.toString(),
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surah.tempatTurun.toString(),
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF8789A3),
                        fontSize: 12),
                  ),
                ],
              ))
            ],
          ),
        ),
      );
}
