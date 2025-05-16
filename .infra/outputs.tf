output "nginx_url" {
  description = "Acesse o servidor web pelo endereço abaixo"
  value       = "http://${aws_instance.nginx_server.public_ip}"
}

output "bucket_name" {
  value = aws_s3_bucket.codedeploy_bucket.id
}
