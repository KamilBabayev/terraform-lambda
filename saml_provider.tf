resource "aws_iam_saml_provider" "sso_percona_com" {
  name                   = "sso.percona.com"
  saml_metadata_document = file("dag.xml")
}
