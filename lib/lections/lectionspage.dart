import 'package:flutter/material.dart';
import 'package:signapp/lections/video2.dart';

class LectionsPage extends StatefulWidget {
  const LectionsPage({super.key});

  @override
  State<LectionsPage> createState() => _LectionsPageState();
}

class _LectionsPageState extends State<LectionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lections"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          ExpansionTile(
            title: Text("Nivel Basico"),
            children: [
              ExpansionTile(
                title: Text("Leccion 1: El abecedario"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/SXNJCma9MEc",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 2: Dias de la semana y meses"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/Qt7dGwpRPgo",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 3: Relaciones Familiares"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/NWEJI39YaKA",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 4: Numeros y tiempos"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/K8mXU1Q7o7A",
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Nivel Medio"),
            children: [
              ExpansionTile(
                title: Text("Leccion 5: Vocabulario Comun"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/d74Y5sE0868",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 6: Cuestionamientos"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/yinh2hENVpY",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 7: Colores"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/U7m4daxkSBQ",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text(
                    "Leccion 8: Sustantivos, adjetivos, sentimientos y estados de ánimo"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/nKGH3mJxRcs",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 9: Verbos narrativos"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/ZpsRJUCkUO0",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 10: Verbos comunes"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/USQOKJSFOrE",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 11: Adverbios de tiempo"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/CwHSLLMMe2o",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 12: Grupo de señas"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/hBdnKn6tmx4",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 13: Ciudades y estados"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/D4D7xJyLZB0",
                  ),
                ],
              ),
            ],
          ),
          ExpansionTile(
            title: Text("Nivel Avanzado"),
            children: [
              ExpansionTile(
                title: Text("Leccion 14: Vocabulario escolar"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/Md9EaeQ9KIY",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 15: Vocabulario comun medico"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/wEtVaJd1SHk",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 16: Vocabulario medico avanzado"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/DSpeIpOVrlg",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 17: Oficios y profeciones"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/zjNNVRsMhVI",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 18: Vocabulario legal"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/P7FGpKtlzzI",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 19: Vocabulario religioso"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/Ilc8IWsLgas",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 20: Vocabulario comun en hoteles"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/4EncGFVWI5U",
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Leccion 21: Vocabulario de cine"),
                children: [
                  videoplayer(
                    video: "https://youtu.be/mqvu-fvdwac",
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
