$file=$args[0]
structurizr export -workspace $file -format plantuml -output $file\..\..\artifacts
# https://github.com/structurizr/cli/blob/master/docs/export.md
# https://structurizr.org/#rendering