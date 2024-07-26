resource "aws_ecs_task_definition" "task" {
  family = "TSK-${var.projectName}"
  container_definitions = jsonencode([
    {
      name      = "${var.projectName}"
      essential = true,
      image     = "${aws_ecr_repository.repository.repository_url}:v1.1.0",
      command   = ["-Dsonar.search.javaAdditionalOpts=-Dnode.store.allow_mmap=false"]
      environment = [
        {
          name  = "SONAR_JDBC_URL"
          value = "jdbc:postgresql://rds-${var.projectName}/lanchonete"
        },
        {
          name  = "SONAR_JDBC_USERNAME"
          value = "${var.rdsUser}"
        },
        {
          name  = "SONAR_JDBC_PASSWORD"
          value = "${var.rdsPass}"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "${aws_cloudwatch_log_group.cloudwatch-log-group.name}"
          awslogs-region        = "${var.regionDefault}"
          awslogs-stream-prefix = "ecs"
        }
      }
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
        }
      ]
    }
  ])
  network_mode = "awsvpc"

  requires_compatibilities = ["FARGATE"]

  execution_role_arn = "arn:aws:iam::${var.AWSAccount}:role/ecsTaskExecutionRole"

  memory = "4096"
  cpu    = "2048"

  # depends_on = [aws_db_instance.rds]
}