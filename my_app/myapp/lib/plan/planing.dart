import 'package:flutter/material.dart';
import 'package:myapp/plan/planingdet.dart';

class PlanningPage extends StatefulWidget {
  final String title;

  const PlanningPage({Key? key, required this.title}) : super(key: key);

  @override
  State<PlanningPage> createState() => _PlanningPage();
}

class _PlanningPage extends State<PlanningPage> {
  
  final List<Map<String, String>> wilayas = [
    {'name': 'Adrar', 'image': 'assets/caption.jpg'},
    {'name': 'Chlef', 'image': 'assets/caption.jpg'},
    {'name': 'Laghouat', 'image': 'assets/caption.jpg'},
    {'name': 'Oum El Bouaghi', 'image': 'assets/caption.jpg'},
    {'name': 'Batna', 'image': 'assets/caption.jpg'},
    {'name': 'Béjaïa', 'image': 'assets/caption.jpg'},
    {'name': 'Biskra', 'image': 'assets/biskra.jpg'},
    {'name': 'Béchar', 'image': 'assets/bechar.jpg'},
    {'name': 'Blida', 'image': 'assets/blida.jpg'},
    {'name': 'Bouira', 'image': 'assets/bouira.jpg'},
    {'name': 'Tamanrasset', 'image': 'assets/tamanrasset.jpg'},
    {'name': 'Tébessa', 'image': 'assets/tebessa.jpg'},
    {'name': 'Tlemcen', 'image': 'assets/tlemcen.jpg'},
    {'name': 'Tiaret', 'image': 'assets/tiaret.jpg'},
    {'name': 'Tizi Ouzou', 'image': 'assets/tizi_ouzou.jpg'},
    {'name': 'Algiers', 'image': 'assets/algiers.jpg'},
    {'name': 'Djelfa', 'image': 'assets/djelfa.jpg'},
    {'name': 'Jijel', 'image': 'assets/jijel.jpg'},
    {'name': 'Sétif', 'image': 'assets/setif.jpg'},
    {'name': 'Saïda', 'image': 'assets/saida.jpg'},
    {'name': 'Skikda', 'image': 'assets/skikda.jpg'},
    {'name': 'Sidi Bel Abbès', 'image': 'assets/sidi_bel_abbes.jpg'},
    {'name': 'Annaba', 'image': 'assets/annaba.jpg'},
    {'name': 'Guelma', 'image': 'assets/guelma.jpg'},
    {'name': 'Constantine', 'image': 'assets/constantine.jpg'},
    {'name': 'Médéa', 'image': 'assets/medea.jpg'},
    {'name': 'Mostaganem', 'image': 'assets/mostaganem.jpg'},
    {'name': 'M\'Sila', 'image': 'assets/msila.jpg'},
    {'name': 'Mascara', 'image': 'assets/mascara.jpg'},
    {'name': 'Ouargla', 'image': 'assets/ouargla.jpg'},
    {'name': 'Oran', 'image': 'assets/oran.jpg'},
    {'name': 'El Bayadh', 'image': 'assets/el_bayadh.jpg'},
    {'name': 'Illizi', 'image': 'assets/illizi.jpg'},
    {'name': 'Bordj Bou Arréridj', 'image': 'assets/bordj_bou_arreridj.jpg'},
    {'name': 'Boumerdès', 'image': 'assets/boumerdes.jpg'},
    {'name': 'El Tarf', 'image': 'assets/el_tarf.jpg'},
    {'name': 'Tindouf', 'image': 'assets/tindouf.jpg'},
    {'name': 'Tissemsilt', 'image': 'assets/tissemsilt.jpg'},
    {'name': 'El Oued', 'image': 'assets/el_oued.jpg'},
    {'name': 'Khenchela', 'image': 'assets/khenchela.jpg'},
    {'name': 'Souk Ahras', 'image': 'assets/souk_ahras.jpg'},
    {'name': 'Tipaza', 'image': 'assets/tipaza.jpg'},
    {'name': 'Mila', 'image': 'assets/mila.jpg'},
    {'name': 'Aïn Defla', 'image': 'assets/ain_defla.jpg'},
    {'name': 'Naâma', 'image': 'assets/naama.jpg'},
    {'name': 'Aïn Témouchent', 'image': 'assets/ain_temouchent.jpg'},
    {'name': 'Ghardaïa', 'image': 'assets/ghardaia.jpg'},
    {'name': 'Relizane', 'image': 'assets/relizane.jpg'},
    {'name': 'Timimoun', 'image': 'assets/timimoun.jpg'},
    {'name': 'Bordj Badji Mokhtar', 'image': 'assets/bordj_badji_mokhtar.jpg'},
    {'name': 'Ouled Djellal', 'image': 'assets/ouled_djellal.jpg'},
    {'name': 'Béni Abbès', 'image': 'assets/beni_abbes.jpg'},
    {'name': 'In Salah', 'image': 'assets/in_salah.jpg'},
    {'name': 'In Guezzam', 'image': 'assets/in_guezzam.jpg'},
    {'name': 'Touggourt', 'image': 'assets/touggourt.jpg'},
    {'name': 'Djanet', 'image': 'assets/djanet.jpg'},
    {'name': 'El M\'Ghair', 'image': 'assets/el_mghair.jpg'},
    {'name': 'El Meniaa', 'image': 'assets/el_meniaa.jpg'},
  ];

  String searchQuery = '';
  int currentPage = 0;
  final int itemsPerPage = 6;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredWilayas = wilayas.where((wilaya) {
      return wilaya['name']!.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    List<Map<String, String>> paginatedWilayas = filteredWilayas.skip(currentPage * itemsPerPage).take(itemsPerPage).toList();

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 2,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Everything to make trip \n creation as you like',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 22,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'Plan your trip for free',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 500,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Icon(Icons.search, color: Color.fromRGBO(255, 255, 255, 1)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchQuery = value;
                                      currentPage = 0;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Choose a destination',
                                    hintStyle: TextStyle(
                                      color: Color.fromARGB(102, 255, 255, 255),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 74, 96, 240),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 30, 30, 30).withOpacity(0.4),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.75, // Adjust this ratio as needed
                      ),
                      itemCount: paginatedWilayas.length,
                      itemBuilder: (context, index) {
                        final wilaya = paginatedWilayas[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DropDown()),
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                wilaya['image']!,
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(height: 10),
                              Text(
                                wilaya['name']!,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 12,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (currentPage > 0)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentPage--;
                              });
                            },
                            child: Text('Previous'),
                          ),
                        if ((currentPage + 1) * itemsPerPage < filteredWilayas.length)
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentPage++;
                              });
                            },
                            child: Text('Next'),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}









