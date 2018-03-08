if [ $# -eq 0 ]
then
	psql -d video_metadata -At -c "SELECT title FROM tvshow WHERE library_id IS NULL ORDER BY title ASC;"
else
	psql -d video_metadata -At <<-SQL
		SELECT tvshow.title FROM tvshow
		INNER JOIN library ON tvshow.library_id = library.id
		WHERE library.title = '$1'
		ORDER BY title ASC
	SQL
fi
