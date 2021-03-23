
resource "aws_instance" "example" {
    ami           = "ami-0533f2ba8a1995cf9"
    instance_type = "t2.micro"

    user_data = <<-EOF
            #!/usr/bin/bash
            yum install docker -y
            systemctl enable docker
            systemctl start docker
            docker run -d -p 80:80 --name dokuwiki bitnami/dokuwiki:latest
            EOF
    
    vpc_security_group_ids = [aws_security_group.example.id]
    
    depends_on = [aws_security_group.example]
}




