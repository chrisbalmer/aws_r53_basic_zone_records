resource "aws_route53_record" "root" {
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = ["${var.root_ip}"]
}

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["${var.domain_name}"]
}

resource "aws_route53_record" "autodiscover" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "autodiscover.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["autodiscover.outlook.com."]
}

resource "aws_route53_record" "lyncdiscover" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "lyncdiscover.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["webdir.online.lync.com."]
}

resource "aws_route53_record" "msoid" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "msoid.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["clientconfig.microsoftonline-p.net."]
}

resource "aws_route53_record" "sip" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "sip.${var.domain_name}"
  type    = "CNAME"
  ttl     = "300"
  records = ["sipdir.online.lync.com."]
}

resource "aws_route53_record" "root_txt" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "TXT"
  ttl     = "300"
  records = ["v=spf1 include:spf.protection.outlook.com -all"]
}

resource "aws_route53_record" "root_mx" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "${var.domain_name}"
  type    = "MX"
  ttl     = "300"
  records = "${var.mx_records}"
}

resource "aws_route53_record" "_sipfederationtls_tcp" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "_sipfederationtls._tcp.${var.domain_name}"
  type    = "SRV"
  ttl     = "3600"
  records = ["100 1 5061 sipfed.online.lync.com"]
}

resource "aws_route53_record" "_sip_tls" {
  count = "${var.mx_records[0] != "" ? 1 : 0}"
  zone_id = "${var.zone_id}"
  name    = "_sip._tls.${var.domain_name}"
  type    = "SRV"
  ttl     = "3600"
  records = ["100 1 443 sipdir.online.lync.com"]
}