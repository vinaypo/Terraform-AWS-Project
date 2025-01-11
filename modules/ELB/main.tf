resource "aws_lb" "testalb" {
  name = "terraformalb"
  load_balancer_type = var.lb-type
  internal = var.Internal
  security_groups = [var.lb-sgid]
  subnets = [var.pub1-subnetid,var.pub2-subnetid]
  tags = {
    Name = var.lbname
  }
 
}

resource "aws_lb_target_group" "lbtg"{
  name = "app-tg"
  target_type = var.targettype
  protocol = "HTTP"
  port = "80"
  vpc_id = var.vpc-id

  health_check {
    path = "/"
    port = "80"
  }
  tags = {
    Name = var.tgname
  }
}

resource "aws_lb_target_group_attachment" "lb-attachment1" {
  target_group_arn = aws_lb_target_group.lbtg.arn
  target_id = var.server1-id
  port = 80
}
resource "aws_lb_target_group_attachment" "lb-attachment2" {
  target_group_arn = aws_lb_target_group.lbtg.arn
  target_id = var.server2-id
  port = 80
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.testalb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cert 
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lbtg.arn
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.testalb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    target_group_arn = aws_lb_target_group.lbtg.arn

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_route53_record" "elb_alias" {
  zone_id =  var.zone_id
  name = var.domain_name
  type = "A"
  alias {
    name = aws_lb.testalb.dns_name
    zone_id = aws_lb.testalb.zone_id
    evaluate_target_health = true
  }


}



