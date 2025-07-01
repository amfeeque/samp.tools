---
layout: default
title: Главная
---

<h1 align="center">samp.tools</h1>

Коллекция полезных инструментов для Samp-Rp.

<div class="card-container">
  <div class="card">
    <h2>AdminTools</h2>
    <p>Многофункциональный инструментарий для администрации проекта Samp-Rp.</p>
    <a href="./AdminTools/" class="button">Перейти</a>
  </div>
  <div class="card">
    <h2>Tracers</h2>
    <p>Плагин для отображения трассеров пуль в SA:MP.</p>
    <a href="./Tracers/" class="button">Перейти</a>
  </div>
  <div class="card">
    <h2>SampDB Helper</h2>
    <p>Удобное приложение для доступа к логам фракций прямо из игры, а также многое другое.</p>
    <a href="./SampDB/" class="button">Перейти</a>
  </div>
</div>

<style>
.card-container {
  display: flex;
  flex-wrap: wrap;
  gap: 20px;
  justify-content: center;
  padding: 20px 0;
}
.card {
  border: 1px solid #e1e4e8;
  border-radius: 6px;
  padding: 20px;
  width: 300px;
  text-align: center;
  box-shadow: 0 1px 3px rgba(0,0,0,0.06);
  transition: transform 0.2s, box-shadow 0.2s;
}
.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}
.card h2 {
  margin-top: 0;
  font-weight: 600;
}
.card .button {
  display: inline-block;
  background-color: #0366d6;
  color: white;
  padding: 10px 20px;
  border-radius: 5px;
  text-decoration: none;
  margin-top: 15px;
  font-weight: 600;
  border: 1px solid rgba(27,31,35,0.15);
  transition: background-color 0.2s;
}
.card .button:hover {
    background-color: #005cc5;
}
</style>
