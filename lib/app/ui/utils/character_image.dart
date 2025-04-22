String getCharacterImage(String name) {
  switch (name.toLowerCase()) {
    case 'luke skywalker':
      return 'assets/images/luke.jpg';
    case 'c-3po':
      return 'assets/images/c-3po.jpg';
    case 'r2-d2':
      return 'assets/images/r2-d2.jpg';
    case 'darth vader':
      return 'assets/images/darth_vader.png';
    case 'leia organa':
      return 'assets/images/leia.jpg';
    case 'obi-wan kenobi':
      return 'assets/images/obi-wan.jpg';
    case 'owen lars':
      return 'assets/images/owen.png';
    case 'r5-d4':
      return 'assets/images/r5-d4.jpg';
    default:
      return 'assets/images/default.png';
  }
}
