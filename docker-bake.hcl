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
  targets = ["claude", "t3code", "herdr"]
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

target "herdr" {
  inherits = ["_common"]
  context  = "kit/herdr"
  tags     = ["${REGISTRY}:herder-${TAG}"]
}
