resource "aws_iam_instance_profile" "bastion_ro" {
  name = "${var.network_name}-ec2-ro"
  role = "${aws_iam_role.bastion_ro.name}"
}

resource "aws_iam_policy" "bastion_ro" {
  name   = "${var.network_name}-ec2-ro"
  path   = "/"
  policy = "${file("${path.module}/policy.json")}"
}

resource "aws_iam_role_policy_attachment" "bastion_ro" {
  role       = "${aws_iam_role.bastion_ro.name}"
  policy_arn = "${aws_iam_policy.bastion_ro.arn}"
}

resource "aws_iam_role" "bastion_ro" {
  name = "${var.network_name}-ec2-ro"
  path = "/"

  assume_role_policy = "${file("${path.module}/role.json")}"
}
