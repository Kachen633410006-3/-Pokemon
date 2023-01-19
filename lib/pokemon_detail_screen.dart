import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_model.dart';
import 'package:pokedex/pokemon_service.dart';
import 'pokemon_service.dart';

class PokemonDetailScreen extends StatelessWidget {
  PokemonService pokemonService = PokemonService();
  PokemonDetailScreen(
      {required this.title, required this.url, required this.t});
  String title;
  String url;
  String t;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        //TODO Display pokemon detail from url
        body: FutureBuilder(
          future: pokemonService.getPokemonDetail(t.toString()),
          builder: (context, AsyncSnapshot<PokemonModel> snapshot) {
            if (snapshot.hasData) {
              PokemonModel data = snapshot.data!;
              String? image;
              image = data.sprites?.frontDefault;
              return Scaffold(
                //TODO Display pokemon detail from url
                body: SafeArea(
                  child: ListView(
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(image!)),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Pokedex ID : ${data.id}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Pokemon Name : ${data.name!.toString().toUpperCase()}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Max Height: ${data.height!}"),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Max Weight: ${data.weight!}"),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }
}
