
# Steps:
#Put all files in a Folder called "Logs"
#Run the Scripts
#Get Output Text files
#Use Atom or Some Text Editor to apply ^[^\{].+\n to remove all extra things
#Copy And Pasta into Robot Code
cd /mnt/c/Users/Michael\ Maddy/Documents/git/AlphaKnightsTools

rename 's/\s//g' ./Logs/*.dsevents

for filename in ./Logs/*.dsevents; do
  echo "Working on file: $filename"
  echo "sed 1"
  sed -i -E 's/<TagVersion>1 <time> [0-9]+.[0-9]+ <message> /\n/g' $filename
  echo "sed 2"
  sed -i -E 's/^(.*?\n)+Starting live window mode.//g' $filename
  echo "sed 3"
  sed -i -E 's/\].+/},/g' $filename
  echo "sed 4"
  sed -i -E 's/},.*\n[^0-9]+\n/},\n/g' $filename
  echo "sed 5"
  sed -i -E 's/},.+/},/g' $filename
  echo "sed 6"
  sed -i -E 's/\[/{/g' $filename
  echo "sed 7"
  sed -i -E 's/^[^\{].+\n//g' $filename
done

rename -f 's/dsevents/txt/g' ./Logs/*.dsevents
