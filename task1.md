## Завдання 1 
1. Розгорнув GitLab у контейнері за інструкцією на сайті GitLab. [Посилання на сервер](http://77.68.11.254:8888/).
Можливо, для коректної роботи необхідно прописати в hosts:
`77.68.11.254    gitlab.example.com`
2. Створив групу [web-academy](http://77.68.11.254:8888/web-academy) та проект [hw02-gitlab](http://77.68.11.254:8888/web-academy/hw02-gitlab)
3. Створив кілька гілок, наприклад [2-various-colors](http://77.68.11.254:8888/web-academy/hw02-gitlab/-/tree/2-various-colors?ref_type=heads)
4. Створив кілька завдань, наприклад [#3 Color in perameters](http://77.68.11.254:8888/web-academy/hw02-gitlab/-/issues/3) На цей тикет посилається коментар у коментарі "Close #3". На цей тикет також посилається [MR](http://77.68.11.254:8888/web-academy/hw02-gitlab/-/merge_requests/3)
5. Створив ще один непублічний внутрішній репозиторій та підключив його як submodul "internal".
     - Создание submodule:

       ```
          git submodule add ssh://git@gitlab.example.com:2224/web-academy/internal.git internal
          git commit -m"submodule internal"
       ```
     - Файл .gitmodules 
       ```
       node1:> cat .gitmodules 
        [submodule "internal"]
            path = internal
            url = ssh://git@gitlab.example.com:2224/web-academy/internal.git
       ```
     - Клонування репозиторію з модулем
       ```
       git clone --recurse-submodules  ssh://git@gitlab.example.com:2224/web-academy/hw02-gitlab.git
       ```
