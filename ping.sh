#!/bin/bash

# Vérifie si l'argument (nom du fichier) est fourni
if [ $# -ne 1 ]; then
  echo "Usage: $0 fichier_ips.txt"
  exit 1
fi

# Vérifie si le fichier existe
if [ ! -f "$1" ]; then
  echo "Le fichier $1 n'existe pas."
  exit 1
fi

# Boucle pour lire chaque ligne du fichier
while read -r ip; do
  # Effectuer un ping sur l'adresse IP en envoyant 1 paquet, et attendre 1 seconde pour la réponse
  if ping -c 1 -W 1 "$ip" >/dev/null 2>&1; then
    # Si le ping est réussi, afficher un message
    echo "$ip est joignable."
  else
    # Si le ping a échoué, afficher un message
    echo "$ip n'est pas joignable."
  fi
done <"$1"
