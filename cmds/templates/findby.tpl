{{- $tableName := .TableName -}}
// {{makeGoColName $tableName}}FindBy retrieves a single record with the specified column values.
func {{makeGoColName $tableName}}FindBy(db *sqlx.DB, columns map[string]interface{}) (*{{makeGoColName $tableName}}, error) {
  if id == 0 {
    return nil, errors.New("model: no id provided for {{$tableName}} select")
  }
  {{$varName := makeGoVarName $tableName}}
  var {{$varName}} *{{makeGoColName $tableName}}
  err := db.Select(&{{$varName}}, fmt.Sprintf(`SELECT {{makeSelectParamNames $tableName .TableData}} WHERE %s=$1`, column), value)

  if err != nil {
    return nil, fmt.Errorf("models: unable to select from {{$tableName}}: %s", err)
  }

  return {{$varName}}, nil
}