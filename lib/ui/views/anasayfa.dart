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
  bool aramaYapiliyorMu = false;

  Future<void> ara(String aramaKelimesi) async{
    print("Kisi ara: $aramaKelimesi");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
        onChanged: (aramaSonucu){
          ara(aramaSonucu);
        },
        ) :
        const Text("Kisiler"),
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
          }, icon: const Icon(Icons.clear)):
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search_rounded))
        ],
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