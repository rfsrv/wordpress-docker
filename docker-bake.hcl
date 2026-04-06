variable "REGISTRY" {
  default = "ghcr.io/rfsrv"
}

variable "PHPREDIS_VERSION" {
  default = "6.0.2"
}

# ── groups ────────────────────────────────────────────────────────────────────

group "default" {
  targets = ["apache-83", "apache-82", "fpm-alpine-83"]
}

group "apache" {
  targets = ["apache-83", "apache-82"]
}

group "fpm-alpine" {
  targets = ["fpm-alpine-83"]
}

# ── apache ────────────────────────────────────────────────────────────────────

target "apache-83" {
  dockerfile = "8.3/apache/Dockerfile"
  args = {
    PHPREDIS_VERSION = PHPREDIS_VERSION
  }
  tags = [
    "${REGISTRY}/wordpress:8.3-apache",
    "${REGISTRY}/wordpress:apache",
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

target "apache-82" {
  dockerfile = "8.2/apache/Dockerfile"
  args = {
    PHPREDIS_VERSION = PHPREDIS_VERSION
  }
  tags = [
    "${REGISTRY}/wordpress:8.2-apache",
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

# ── fpm-alpine ────────────────────────────────────────────────────────────────

target "fpm-alpine-83" {
  dockerfile = "8.3/fpm-alpine/Dockerfile"
  args = {
    PHPREDIS_VERSION = PHPREDIS_VERSION
  }
  tags = [
    "${REGISTRY}/wordpress:8.3-fpm-alpine",
    "${REGISTRY}/wordpress:fpm-alpine",
  ]
  platforms = ["linux/amd64", "linux/arm64"]
}

