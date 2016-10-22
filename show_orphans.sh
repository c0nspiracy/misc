#!/opt/bin/bash


psql -d video_metadata -At -c "SELECT path FROM video_file; \
" | while read a; do if [ ! -f "$a" ]; then echo $a; fi; done;

