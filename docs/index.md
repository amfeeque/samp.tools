---
layout: home
---

# SAMP Tools

Добро пожаловать в документацию по инструментам для SAMP. Выберите интересующий вас инструмент для просмотра подробной документации.

## Доступные инструменты

{% for tool in site.pages %}
  {% if tool.url != '/' and tool.url != '/404.html' %}
  <div class="tool-card">
    <h2><a href="{{ tool.url | relative_url }}">{{ tool.title }}</a></h2>
    {% if tool.description %}
      <p>{{ tool.description }}</p>
    {% endif %}
    <a href="{{ tool.url | relative_url }}" class="btn">Подробнее →</a>
  </div>
  {% endif %}
{% endfor %}

## Поддержка

Если у вас возникли вопросы или проблемы с любым из инструментов, создайте issue в соответствующем разделе репозитория:
- [Issues AdminTools](https://github.com/amfeeque/samp.tools/issues?q=is%3Aissue+is%3Aopen+label%3AAdminTools)
- [Issues Tracers](https://github.com/amfeeque/samp.tools/issues?q=is%3Aissue+is%3Aopen+label%3ATracers)
- [Issues SampDB](https://github.com/amfeeque/samp.tools/issues?q=is%3Aissue+is%3Aopen+label%3ASampDB)

<style>
.tool-card {
  border: 1px solid #e1e4e8;
  border-radius: 6px;
  padding: 16px;
  margin-bottom: 16px;
}
.tool-card h2 {
  margin-top: 0;
}
.btn {
  display: inline-block;
  padding: 6px 12px;
  background-color: #2ea44f;
  color: white;
  text-decoration: none;
  border-radius: 6px;
  font-weight: 500;
}
.btn:hover {
  background-color: #2c974b;
}
</style>
