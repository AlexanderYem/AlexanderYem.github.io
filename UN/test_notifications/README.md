Для тестирования уведомлений в UN News App.

1. Устанавливаем в приложении адрес для главного фида https://alexanderyem.github.io/UN/test_notifications/test_rss.xml
2. Включаем уведомление в приложении (колокольчик в IOS)
3. Для отправки уведомления вызываем http://unnews-196804.appspot.com/pull?feed=https://alexanderyem.github.io/UN/test_notifications/test_rss.xml
4. Меняем test_rss.xml - добавляем новые записи/удаляем и т.д.  Для перенесенных записей использовал _hidden_rss.xml
5. "В корне" даем команду git add --all && git commit -m "--" && git push -u origin master
5. Повторяем 3-6

