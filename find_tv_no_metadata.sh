#!/opt/bin/bash

psql -d video_metadata -At -c "SELECT path FROM video_file v INNER JOIN mapper m ON v.mapper_id=m.id AND m.type='tvshow_episode' LEFT OUTER JOIN tvshow_episode e ON m.id=e.mapper_id WHERE e.mapper_id IS NULL;"
