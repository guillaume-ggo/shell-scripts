#!/bin/bash
declare -A couleurs_carte=([pic]="noir" [trefle]="noir" [careau]="rouge" [coeur]="rouge")

declare -p couleurs_carte

echo "Le pic est de couleur ${couleurs_carte['pic']}"

exit 0
