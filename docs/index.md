---
layout: default
title: SAMP Tools
---

Добро пожаловать в документацию по инструментам для SAMP. Выберите интересующий вас инструмент для просмотра подробной документации.

## Доступные инструменты

<div class="tool-cards">
  <div class="tool-card">
    <h2><a href="AdminTools">AdminTools</a></h2>
    <p>Многофункциональный инструментарий для администрации проекта Samp-Rp</p>
    <a href="AdminTools" class="btn">Подробнее →</a>
  </div>

  <div class="tool-card">
    <h2><a href="Tracers">Tracers</a></h2>
    <p>Инструмент для отображения трассеров в игре SAMP</p>
    <a href="Tracers" class="btn">Подробнее →</a>
  </div>

  <div class="tool-card">
    <h2><a href="SampDB">SampDB</a></h2>
    <p>Система управления базой данных для SAMP</p>
    <a href="SampDB" class="btn">Подробнее →</a>
  </div>
</div>

## Поддержка

Если у вас возникли вопросы или проблемы с любым из инструментов, создайте issue в соответствующем разделе репозитория:
- [Issues AdminTools](https://github.com/amfeeque/samp.tools/issues?q=is%3Aissue+is%3Aopen+label%3AAdminTools)
- [Issues Tracers](https://github.com/amfeeque/samp.tools/issues?q=is%3Aissue+is%3Aopen+label%3ATracers)
- [Issues SampDB](https://github.com/amfeeque/samp.tools/issues?q=is%3Aissue+is%3Aopen+label%3ASampDB)

<style>
.tool-cards {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
  margin: 2rem 0;
}
.tool-card {
  border: 1px solid #e1e4e8;
  border-radius: 6px;
  padding: 1.5rem;
  transition: transform 0.2s, box-shadow 0.2s;
}
.tool-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}
.tool-card h2 {
  margin-top: 0;
  margin-bottom: 0.75rem;
  font-size: 1.5rem;
}
.tool-card h2 a {
  color: #24292e;
  text-decoration: none;
}
.tool-card p {
  color: #6a737d;
  margin-bottom: 1.25rem;
}
.btn {
  display: inline-block;
  padding: 0.5rem 1rem;
  background-color: #2ea44f;
  color: white;
  text-decoration: none;
  border-radius: 6px;
  font-weight: 500;
  transition: background-color 0.2s;
}
.btn:hover {
  background-color: #2c974b;
  text-decoration: none;
}
</style>
