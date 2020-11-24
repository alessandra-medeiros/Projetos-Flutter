class FilmeInfo {
  final String titulo;
  final String ano;
  final String avaliacao;
  final String duracao;
  final String genero;
  final String diretor;
  final String trama;
  final String poster;
  final String imdbAvaliacao;
  final String metaScore;

  FilmeInfo(
      {this.titulo,
      this.ano,
      this.avaliacao,
      this.duracao,
      this.genero,
      this.diretor,
      this.trama,
      this.poster,
      this.imdbAvaliacao,
      this.metaScore});

  factory FilmeInfo.fromJSON(Map<String, dynamic> json) {
    return FilmeInfo(
        titulo: json['Título'],
        ano: json['Ano'],
        avaliacao: json['Avaliação'],
        duracao: json['Duração'],
        genero: json['Gênero'],
        diretor: json['Diretor'],
        trama: json['Trama'],
        poster: json['Pôster'],
        imdbAvaliacao: json['Avaliacao IMDB'],
        metaScore: json['Metascore']);
  }
}