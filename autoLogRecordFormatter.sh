cd /mnt/c/Users/Michael\ Maddy/Documents/git/AlphaKnightsTools

rename 's/\s//g' ./Logs/*.dsevents

for filename in ./Logs/*.dsevents; do
  echo "Working on file: $filename"
  echo "sed 1"
  sed -i -E 's/<TagVersion>1 <time> [0-9]+.[0-9]+ <message> /\n/g' $filename
  echo "sed 2"
  sed -i -E 's/^(.*?\n)+Starting live window mode.//g' "$filename"
  echo "sed 3"
  sed -i -E 's/\].+/},/g' "$filename"
  echo "sed 4"
  sed -i -E 's/^(?!\[).*$\n/g' "$filename"
  echo "sed 5"
  sed -i -E 's/},.+/},/g' "$filename"
  echo "sed 6"
  sed -i -E 's/\[/{/g' "$filename"
  echo "sed 7"
done

rename -f 's/dsevents/txt/g' ./Logs/*.dsevents
