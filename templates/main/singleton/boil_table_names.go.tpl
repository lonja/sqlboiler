var TableNames = struct {
	{{range $table := .Tables}}{{if not $table.IsView -}}
	{{titleCase $table.Name}} string
	{{end}}{{end -}}
}{
	{{range $table := .Tables}}{{if not $table.IsView -}}
    {{titleCase $table.Name}}: "{{$.Schema | $.Quotes}}.{{$table.Name | $.Quotes}}",
	{{end}}{{end -}}
}
