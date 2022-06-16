#!/bin/sh


dnf install httpd


systemctl enable httpd
systemctl restart httpd