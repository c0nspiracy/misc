find $1 -type f -name "*.mp4" -o -name "*.mkv" -o -name "*.avi" | grep -v 'eaDir' | while read a; do 
  p=`echo $a |
sed "s/'/''/g"`; 
  c=`psql -d 'video_metadata' -At -c "SELECT count(*) FROM video_file WHERE path='${p}';"`; 
  if [ $c -eq 0 ]; then 
    echo $a;  
  fi; 
done;
