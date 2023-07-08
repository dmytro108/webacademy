## Завдання 2
Створив проект [large_obj_lfs](http://77.68.11.254:8888/web-academy/large_obj_lfs). GitLab налаштований для роботи з LFS.
Далі на локальній машині 
- встановив розширення lfs,
- клонував репозитарій,
- ініціалізував для роботи з lfs,
- налаштував відстеження великих файлів з розширенням .bin,
- створив коміт з великим файлом і відправив на сервер
```
git clone http://gitlab.example.com:8888/web-academy/large_obj_lfs.git
cd large_obj_lfs/
git lfs install
git lfs track "*.bin"
git add .
git commit -am"tracking .bin files in lfs"
curl http://ipv4.download.thinkbroadband.com/50MB.zip -o m50.bin
git add .
git commit -am"file 50MB added"
git push origin main
du -d2 ./
0       ./.git/branches
80      ./.git/hooks
4       ./.git/info
12      ./.git/refs
32      ./.git/objects
16      ./.git/logs
51204   ./.git/lfs
51372   ./.git
102584  ./
```
