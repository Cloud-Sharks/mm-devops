package test

import (
	"testing"
	"fmt"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/stretchr/testify/assert"
)


func TestTerraformHelloWorldExample(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../deploy/dev",
	})

	// Destroys resources at the end of the test
	defer terraform.Destroy(t, terraformOptions)

	// Performs "terraform init" and "terraform apply"
	terraform.InitAndApply(t, terraformOptions)
}

