variable "REGISTRY" {
  default = "ghcr.io/skpr/sbx"
}

variable "TAG" {
  default = "latest"
}

variable "PLATFORMS" {
  default = "linux/amd64,linux/arm64"
}

group "default" {
  targets = ["claude"]
}

target "_common" {
  platforms = split(",", PLATFORMS)
}

target "claude" {
  inherits = ["_common"]
  context  = "kit/claude"
  tags     = ["${REGISTRY}:claude-${TAG}"]
}

target "t3code" {
  inherits = ["_common"]
  context  = "kit/t3code"
  tags     = ["${REGISTRY}:t3code-${TAG}"]
}
