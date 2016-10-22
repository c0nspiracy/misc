#!/opt/bin/bash

psql -d video_metadata -At -c "SELECT path FROM video_file v INNER JOIN mapper m ON v.mapper_id=m.id AND m.type='movie' LEFT OUTER JOIN movie e ON m.id=e.mapper_id WHERE e.mapper_id IS NULL;"
