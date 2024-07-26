variable "projectName" {
  default = "sonarqube"
}

variable "clusterName" {
  default = "SonarQube"
}

variable "regionDefault" {
  default = "us-east-1" # example: us-east-1
}

variable "engineRds" {
  default = "postgres"
}

variable "engineRdsVersion" {
  default = "13.10"
}

variable "rdsUser" {
  default = "postgres"
}

variable "rdsPass" {
  default = "password"
}

variable "instanceClass" {
  default = "db.t3.micro"
}

variable "storageType" {
  default = "gp3"
}

variable "minStorage" {
  default = "20"
}

variable "maxStorage" {
  default = "30"
}

variable "subnet01" {
  default = "subnet-0bdfab6205e733c60" # example: subnet-abcdef1
}

variable "subnet02" {
  default = "subnet-08cdf659c92dd39d2" # example: subnet-abcdef1
}

variable "subnet03" {
  default = "subnet-0b93c5fa0dfd4f71b" # example: subnet-abcdef1
}

variable "vpcId" {
  default = "vpc-02f5c867a584ac85e" # example: vpc-abcdef1
}

variable "vpcCIDR" {
  default = "172.31.16.0/20" # example: 10.10.0.0/16
}

variable "AWSAccount" {
  default = "010438490901" # example: 123456789
}

variable "tags" {
  type = map(string)
  default = {
    App      = "sonarqube",
    Ambiente = "Desenvolvimento"
  }
}