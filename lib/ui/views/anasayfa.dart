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

  Future<List<Kisiler>> kisileriYukle() async{
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Bahadir", kisi_tel: "58");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Umut", kisi_tel: "34");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Uzay", kisi_tel: "38");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);

    return kisilerListesi;
  }

  Future<void> sil(int kisi_id) async{
    print("Kisi sil: $kisi_id");
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
      body: FutureBuilder<List<Kisiler>>(
        future: kisileriYukle(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length, //3
              itemBuilder: (context, index){ //0,1,2 for döngüsü gibi çalışıyor
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(kisi: kisi)))
                        .then((value) {
                      print("Anasayfaya dönüldü..");
                    });
                  },
                  child: Card(
                    child: SizedBox(height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(kisi.kisi_ad, style: const TextStyle(fontSize: 20),),
                                Text(kisi.kisi_tel),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text("${kisi.kisi_ad} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      sil(kisi.kisi_id);
                                    },
                                  ),
                                )
                            );
                          }, icon: const Icon(Icons.clear, color: Colors.black54,))
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
            }
          },
      ),
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