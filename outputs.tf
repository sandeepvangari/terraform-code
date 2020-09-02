// Old Splat Syntax
output "public_subnets" {
  value = "${aws_subnet.public_subnet.*.id}"
}

// New Splat Syntax
output "private_subnet_ids" {
  value = [ aws_subnet.public_subnet[*].id ]
}

output "public_security_group" {
  value = "${aws_security_group.test_sg.id}"
}

output "private_security_group" {
	  value = "${aws_security_group.sg_private.id}"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet1" {
  value = "${element(aws_subnet.public_subnet.*.id, 1)}"
}

output "subnet2" {
  value = "${element(aws_subnet.public_subnet.*.id, 2)}"
}

output "private_subnet1" {
  value = "${element(aws_subnet.private_subnet.*.id, 1)}"
}

output "private_subnet2" {
  value = "${element(aws_subnet.private_subnet.*.id, 2)}"
}

// For Expression in Terraform
output "private_subnets" {
  value = [
    for instance in aws_subnet.public_subnet:
    instance.id
  ]
}
