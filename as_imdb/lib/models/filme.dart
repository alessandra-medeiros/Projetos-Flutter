class Filme {
  final String titulo;
  final String ano;
  final String tipo;
  final String poster;
  final String imdbID;

  Filme({this.titulo, this.ano, this.tipo, this.poster, this.imdbID});

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
        titulo: json['Título'],
        ano: json['Ano'],
        tipo: json['Tipo'],
        poster: json['Pôster'],
        imdbID: json['imdbID']);
  }
}