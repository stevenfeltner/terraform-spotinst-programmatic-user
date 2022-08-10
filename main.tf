# Call Spot API to create the Spot Account
resource "null_resource" "programmatic-user" {
  triggers = {
    cmd               = "${path.module}/scripts/spot_account_aws.py"
    userName          = var.userName
    token             = local.spotinst_token
    spotinst_account  = var.spotinst_account
  }
  provisioner "local-exec" {
    command     = "python3 ${path.module}/scripts/setup.py install"
  }
  provisioner "local-exec" {
    command     = "python3 ${self.triggers.cmd} create ${self.triggers.userName}  ${self.triggers.spotinst_account} --token=${self.triggers.token}"
  }
}

# Retrieve the Spot Account ID Information
data "external" "programmatic-user-create" {
  count = local.exist == "true" ? 0 : 1
  program = [
    "python3",
    local.cmd,
    "create",
    var.userName,
    var.spotinst_account,
    "--role=${var.role}",
    "--token=${local.spotinst_token}"
  ]
}