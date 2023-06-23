bins_extension="$1"
input_directory="$2"
output_directory="$3"
out_file="$4"

# build directorys
mkdir "$output_directory"

# call checkm tree, lineage_set, analyze and qa
checkm tree "$input_directory" "$output_directory" -x "$bins_extension"
#checkm lineage_set "$output_directory" "$output_directory"/markers.txt
#checkm analyze "$output_directory"/markers.txt "$input_directory" "$output_directory" -x "$bins_extension"
#checkm qa "$output_directory"/markers.txt "$output_directory" --tab_table -f "$output_file"


echo "Done !"
