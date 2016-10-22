#!/opt/bin/bash


psql -d video_metadata -c "SELECT path FROM video_file v INNER JOIN mapper m ON v.mapper_id=m.id AND m.type='tvshow_episode' LEFT OUTER JOIN tvshow_episode e ON e.mapper_id=m.id WHERE e.mapper_id IS NULL; \
" | sed "1,2d; :a; \$d; N; 3,4ba; P; D" | while read a; do 
  echo $a;
  #/var/packages/VideoStation/target/bin/synovideoindex -t videometa -a "$a"; 
  synoindex -d "$a";
  synoindex -a "$a";
done;

