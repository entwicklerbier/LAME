LAME :snail:
====

Leave A MessagE - A simple location based messenger Service.

Description
------
Google Maps Style interface: Drop Pin -> Leave Message 

Needs user account with image -> image gets displayed with message

workers -> message stats (most viewed message in region, ...), cleanup

Technology
------
- Application Stack:
    - Rails/Unicorn/Nginx
- Database
    - PostgreSQL/PostGIS
        - http://postgis.net
        - https://github.com/rgeo/activerecord-postgis-adapter

- Worker
    - Redis/Sidekiq
        - http://sidekiq.org

- File Storage
    - Ceph
        - http://ceph.com/docs/master/radosgw/s3/ruby/

Models
------
```
+-----------+
| User      |
|-----------|
| email     |
| password  |
| name      |
| image     |
| messages  |
+-----------+

+-----------+
| Message   |
|-----------|
| content   |
| location  |
| name      |
| image     |
| timestamp |
| user      |
+-----------+

+-----------+
| MsgView   |
|-----------|
| message   |
| user      |
| timestamp |
+-----------+
```
