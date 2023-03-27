resource "commercetools_product_type" "simpleProduct" {
  name        = "Simple Product"
  description = "A simple product"
  attribute {
    name = "size"
    label = {
      en-GB = "Size"
      nl-NL: "Grootte",
      de-DE: "Größe",
      fr-FR: "Taille",
      it-IT: "Misurare",
      es-ES: "Tamaño",
      pt-PT: "Tamanho"
    }
    required = false
    type {
      name = "text"
    }
    constraint = "None"
    searchable = true
    input_hint = "SingleLine"
  }
  attribute {
    name      = "fp_color"
    label     = { en-GB = "Color", nl-NL = "Kleur", de-DE = "Farbe", fr-FR = "Couleur", it-IT = "Colore", es-ES = "Color", pt-PT = "Cor" }
    input_tip = { en-GB = "Enter Color", nl-NL = "Voer kleur in", de-DE = "Farbe eingeben", fr-FR = "Entrer la couleur", it-IT = "Immettere il colore", es-ES = "Entrar en color", pt-PT = "Digite a cor" }
    required  = false
    type {
      name = "lenum"
      localized_value {
        key   = "black"
        label = { en-GB = "Black", nl-NL = "Zwart", de-DE = "Schwarz", fr-FR = "Noir", it-IT = "Nero", es-ES = "Negro", pt-PT = "Preto" }
      }
      localized_value {
        key   = "grey"
        label = { en-GB = "Grey", nl-NL = "Grijs", de-DE = "Grau", fr-FR = "Gris", it-IT = "Grigio", es-ES = "Gris", pt-PT = "Cinza" }
      }
      localized_value {
        key   = "beige"
        label = { en-GB = "Beige", nl-NL = "Beige", de-DE = "Beige", fr-FR = "Beige", it-IT = "Beige", es-ES = "Beige", pt-PT = "Bege" }
      }
      localized_value {
        key   = "white"
        label = { en-GB = "White", nl-NL = "Wit", de-DE = "Weiß", fr-FR = "Blanc", it-IT = "Bianco", es-ES = "Blanco", pt-PT = "Branco" }
      }
      localized_value {
        key   = "blue"
        label = { en-GB = "Blue", nl-NL = "Blauw", de-DE = "Blau", fr-FR = "Bleu", it-IT = "Blu", es-ES = "Azul", pt-PT = "Azul" }
      }
      localized_value {
        key   = "brown"
        label = { en-GB = "Brown", nl-NL = "Bruin", de-DE = "Braun", fr-FR = "Brun", it-IT = "Marrone", es-ES = "Marrón", pt-PT = "Marrom" }
      }
      localized_value {
        key   = "turquoise"
        label = { en-GB = "Turquoise", nl-NL = "Turkoois", de-DE = "Türkis", fr-FR = "Turquoise", it-IT = "Turchese", es-ES = "Turquesa", pt-PT = "Turquesa" }
      }
      localized_value {
        key   = "lightslategrey"
        label = { en-GB = "Petrol", nl-NL = "Benzine", de-DE = "Benzin", fr-FR = "Essence", it-IT = "Benzina", es-ES = "Gasolina", pt-PT = "Gasolina" }
      }
      localized_value {
        key   = "green"
        label = { en-GB = "Green", nl-NL = "Groente", de-DE = "Grün", fr-FR = "Vert", it-IT = "Verde", es-ES = "Verde", pt-PT = "Verde" }
      }
      localized_value {
        key   = "red"
        label = { en-GB = "Red", nl-NL = "Rood", de-DE = "Rot", fr-FR = "Rouge", it-IT = "Rosso", es-ES = "Rojo", pt-PT = "Vermelho" }
      }
      localized_value {
        key   = "purple"
        label = { en-GB = "Purple", nl-NL = "Paars", de-DE = "Violett", fr-FR = "Mauve", it-IT = "Porpora", es-ES = "Púrpura", pt-PT = "Roxo" }
      }
      localized_value {
        key   = "pink"
        label = { en-GB = "Pink", nl-NL = "Roze", de-DE = "Rosa", fr-FR = "Rose", it-IT = "Rosa", es-ES = "Rosa", pt-PT = "Rosa" }
      }
      localized_value {
        key   = "orange"
        label = { en-GB = "Orange", nl-NL = "Oranje", de-DE = "Orange", fr-FR = "Orange", it-IT = "Arancia", es-ES = "Naranja", pt-PT = "Laranja" }
      }
      localized_value {
        key   = "yellow"
        label = { en-GB = "Yellow", nl-NL = "Geel", de-DE = "Gelb", fr-FR = "Jaune", it-IT = "Giallo", es-ES = "Amarillo", pt-PT = "Amarelo" }
      }
      localized_value {
        key   = "olive"
        label = { en-GB = "Olive", nl-NL = "Olijf", de-DE = "Olive", fr-FR = "olive", it-IT = "Oliva", es-ES = "Aceituna", pt-PT = "Oliva" }
      }
      localized_value {
        key   = "gold"
        label = { en-GB = "Gold", nl-NL = "Goud", de-DE = "Gold", fr-FR = "Or", it-IT = "Oro", es-ES = "Oro", pt-PT = "Ouro" }
      }
      localized_value {
        key   = "silver"
        label = { en-GB = "Silver", nl-NL = "Zilver", de-DE = "Silber", fr-FR = "Argent", it-IT = "Argento", es-ES = "Plata", pt-PT = "Prata" }
      }
      localized_value {
        key   = "multicolored"
        label = { en-GB = "Multicolored", nl-NL = "Veelkleurig", de-DE = "Mehrfarbig", fr-FR = "Multicolore", it-IT = "Multicolore", es-ES = "Multicolor", pt-PT = "Multicolorido" }
      }
    }
    constraint = "None"
    searchable = true
    input_hint = "SingleLine"
  }
  key = "simple"
}
