import 'package:flutter/material.dart';
import 'package:quran/models/surat.dart';

class CardWidget extends StatelessWidget {
  final Surat surat;
  final Function() onTap;

  const CardWidget({
    super.key,
    required this.surat,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 152,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color.fromRGBO(220, 233, 245, 1),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(221, 40, 81, 0.18),
                      ),
                      child: const Icon(
                        Icons.menu_book,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        width: 37,
                        height: 37,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(221, 40, 81, 0.18),
                        ),
                        child: const Icon(
                          Icons.play_circle,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 25.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        surat.nama,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      textRow('nomor ', surat.nomor.toString()),
                      textRow('Jumlah ayat ', surat.jumlahAyat.toString()),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        surat.deskripsi,
                        style: const TextStyle(
                          color: Color.fromRGBO(19, 22, 33, 1),
                          fontSize: 14.0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}

String getStatus(DateTime date) {
  return date.isBefore(DateTime.now()) ? 'Done' : 'Incoming';
}

Widget textRow(String textOne, String textTwo) {
  return Wrap(
    children: [
      Text(
        '$textOne:',
        style: const TextStyle(
          color: Color.fromRGBO(74, 77, 84, 0.7),
          fontSize: 14.0,
        ),
      ),
      const SizedBox(
        width: 4.0,
      ),
      Text(
        textTwo,
        style: const TextStyle(
          color: Color.fromRGBO(19, 22, 33, 1),
          fontSize: 14.0,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ],
  );
}
