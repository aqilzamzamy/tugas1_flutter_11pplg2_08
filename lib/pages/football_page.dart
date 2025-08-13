import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_controller.dart';
import '../models/player.dart';
import 'editplayer_page.dart';
import '../components/custom_text.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  final FootballController footballController = Get.put(FootballController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const CustomText(
          myText: "Sun Eater Member",
          myTextColor: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          align: TextAlign.center,
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        elevation: 4,
      ),
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: footballController.players.length,
          itemBuilder: (context, index) {
            Player player = footballController.players[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(player.image),
                  onBackgroundImageError: (_, __) {
                    print("Gagal memuat gambar: ${player.image}");
                  },
                ),
                title: CustomText(
                  myText: player.name,
                  myTextColor: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  align: TextAlign.start,
                ),
                subtitle: CustomText(
                  myText: "${player.position} | No. ${player.number}",
                  myTextColor: Colors.grey[800]!,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  align: TextAlign.start,
                ),
                trailing: const Icon(Icons.edit, color: Colors.deepPurple),
                onTap: () {
                  Get.to(
                    () => EditPlayerPage(),
                    arguments: {'index': index, 'player': player},
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }
}
