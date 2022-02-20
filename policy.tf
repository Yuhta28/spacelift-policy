resource "spacelift_stack" "policy-tutorial" {
  name       = "policy-tutorial"
  repository = "mini-mini-Iac_terraform"
  branch     = "master"
}

# This example assumes that you have Rego policies in a separate
# folder called "policies".
resource "spacelift_policy" "example-policy" {
  name = "Example policy"
  body = file("${path.module}/policies/deny.rego")
  type = "TERRAFORM_PLAN"
}

resource "spacelift_policy_attachment" "example-attachment" {
  stack_id  = spacelift_stack.policy-tutorial.id
  policy_id = spacelift_policy.example-policy.id
}