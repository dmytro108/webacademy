## Task 3
1. Розгорнув контейнери GitLab та MinIO за допомогою docker compose. [YAML файл](/docker-compose.yaml) описує контейнер Gitlab з підтримкою LFS та сховище об'єктів. 
2. Для ініціалізації об'єктного сховища - створення необхідного бакета gitlab-lfs у minio, використовується контейнер із minio CLI.
3. Після комміту видно, що файл був відправлений в об'єктне сховище:
```
node1:> du -d3 -h /srv/minio_lfs/data/
0       /srv/minio_lfs/data/.minio.sys/tmp/.trash
0       /srv/minio_lfs/data/.minio.sys/tmp
0       /srv/minio_lfs/data/.minio.sys/multipart/151ed8c0749ff3044deb22f19f841d2120c7fb1cde75f83efb84d5a4ff6d8eb2
0       /srv/minio_lfs/data/.minio.sys/multipart/601fa930cebf1cc9f83045afbe1321baab7d0be7cb9ad8d13f918bfbb5109873
0       /srv/minio_lfs/data/.minio.sys/multipart/da8ca01d955cbafda8efc91bf7956a361673fc36df1570daf5ab62cfcd7b73c4
0       /srv/minio_lfs/data/.minio.sys/multipart/a93fef42c32164ac28489d589c76a178bd255a5a11cbf604e767f601ea4192b4
0       /srv/minio_lfs/data/.minio.sys/multipart
8.0K    /srv/minio_lfs/data/.minio.sys/buckets/gitlab-lfs
4.0K    /srv/minio_lfs/data/.minio.sys/buckets/.usage-cache.bin
4.0K    /srv/minio_lfs/data/.minio.sys/buckets/.bloomcycle.bin
4.0K    /srv/minio_lfs/data/.minio.sys/buckets/.usage.json
20K     /srv/minio_lfs/data/.minio.sys/buckets
12K     /srv/minio_lfs/data/.minio.sys/config/config.json
4.0K    /srv/minio_lfs/data/.minio.sys/config/iam
16K     /srv/minio_lfs/data/.minio.sys/config
4.0K    /srv/minio_lfs/data/.minio.sys/pool.bin
44K     /srv/minio_lfs/data/.minio.sys
51M     /srv/minio_lfs/data/gitlab-lfs/10/7c
51M     /srv/minio_lfs/data/gitlab-lfs/10
51M     /srv/minio_lfs/data/gitlab-lfs/1c/11
51M     /srv/minio_lfs/data/gitlab-lfs/1c
101M    /srv/minio_lfs/data/gitlab-lfs
101M    /srv/minio_lfs/data/
```
