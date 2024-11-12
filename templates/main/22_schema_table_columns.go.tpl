{{- $alias := .Aliases.Table .Table.Name -}}
{{- $orig_tbl_name := .Table.Name -}}

// {{$alias.UpSingular}}SchemaTable is the table in the schema
var {{$alias.UpSingular}}SchemaTableColumns = struct {
	{{range $column := .Table.Columns -}}
	{{- $colAlias := $alias.Column $column.Name -}}
	{{$colAlias}} string
	{{end -}}
}{
	{{range $column := .Table.Columns -}}
	{{- $colAlias := $alias.Column $column.Name -}}
	{{$colAlias}}: "{{$.Schema | $.Quotes}}.{{$orig_tbl_name | $.Quotes}}.{{$column.Name | $.Quotes}}",
	{{end -}}
}
