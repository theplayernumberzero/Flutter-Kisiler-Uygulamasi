import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kisiler"),
      ),
      body: ElevatedButton(onPressed: (){
        var kisi = Kisiler(kisi_id: 1, kisi_ad: "Bahadir", kisi_tel: "58");
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
            .then((value) {
          print("Anasayfaya dönüldü..");
        });
      }, child: const Text("DETAYA GIT")),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
          .then((value) {
            print("Anasayfaya dönüldü..");
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}