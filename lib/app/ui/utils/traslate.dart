String translateGender(String gender) {
  switch (gender.toLowerCase()) {
    case 'male':
      return 'Masculino';
    case 'female':
      return 'Femenino';
    case 'n/a':
    case 'none':
      return 'No aplica';
    case 'hermaphrodite':
      return 'Hermafrodita';
    default:
      return gender;
  }
}

String translateSkinColor(String color) {
  switch (color.toLowerCase()) {
    case 'fair':
      return 'Clara';
    case 'light':
      return 'Pálida';
    case 'gold':
      return 'Dorada';
    case 'white':
      return 'Blanca';
    case 'white, blue':
      return 'Blanca, Azul';
    case 'white, red':
      return 'Blanca, Roja';
    case 'green':
      return 'Verde';
    case 'blue':
      return 'Azul';
    case 'red':
      return 'Roja';
    case 'black':
      return 'Negra';
    case 'brown':
      return 'Marrón';
    case 'dark':
      return 'Oscura';
    default:
      return color;
  }
}
