# database-design

CSC422 Database &amp; Design shared repository for course project. 

**_Group 3_**: Nate Mollica | Peter Momsen | John Padworski | Brandon Perez-Lee


### Database System Project

**_Project Domain_**: Learning Management System (LMS)

**_Project Technology_**: PlanetScale Database (MySQL compatible)







### Notes:

PlanetScale Connection String:

```shell-interactive
$ mysql -h aws.connect.psdb.cloud -u q8kxxuc39eg81vneobai \
    -ppscale_pw_<password_generated_string_blob> \
    --ssl-mode=VERIFY_IDENTITY \
    --ssl-ca=/etc/ssl/cert.pem
```