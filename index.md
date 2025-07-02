---
layout: default
title: Главная
---

<h1 align="center">samp.tools</h1>

Коллекция полезных инструментов для Samp-Rp.

<div class="card-container">
  <div class="card">
    <div class="card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
        <path d="M9 12l2 2 4-4"></path>
      </svg>
    </div>
    <h2>AdminTools</h2>
    <p>Многофункциональный инструментарий для администрации проекта Samp-Rp.</p>
    <a href="./AdminTools/" class="button">Подробнее →</a>
  </div>

  <div class="card">
    <div class="card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M21 2l-2 2m-7.61 7.61a5.5 5.5 0 1 1-7.778 7.778 5.5 5.5 0 0 1 7.777-7.777zm0 0L15.5 7.5m0 0l3 3L22 7l-3-3m-3.5 3.5L19 4"></path>
      </svg>
    </div>
    <h2>Tracers</h2>
    <p>Плагин для отображения трассеров пуль в SA:MP.</p>
    <a href="./Tracers/" class="button">Подробнее →</a>
  </div>

  <div class="card">
    <div class="card-icon">
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
        <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path>
        <polyline points="14 2 14 8 20 8"></polyline>
        <line x1="16" y1="13" x2="8" y2="13"></line>
        <line x1="16" y1="17" x2="8" y2="17"></line>
        <polyline points="10 9 9 9 8 9"></polyline>
      </svg>
    </div>
    <h2>SampDB Helper</h2>
    <p>Удобное приложение для доступа к логам фракций прямо из игры, а также многое другое.</p>
    <a href="./SampDB/" class="button">Подробнее →</a>
  </div>
</div>

<style>
:root {
  --primary: #1a73e8;
  --primary-hover: #1557b0;
  --text: #202124;
  --text-secondary: #5f6368;
  --bg: #f8f9fa;
  --card-bg: #ffffff;
  --card-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
  --card-shadow-hover: 0 8px 24px rgba(0, 0, 0, 0.12);
  --border-radius: 12px;
  --transition: all 0.3s ease;
}

body {
  margin: 0;
  padding: 0;
  font-family: 'Segoe UI', Roboto, -apple-system, sans-serif;
  color: var(--text);
  background-color: var(--bg);
  line-height: 1.6;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

.hero {
  text-align: center;
  padding: 4rem 1rem;
  margin-bottom: 2rem;
  background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
  border-radius: var(--border-radius);
  margin: 1rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
}

.hero h1 {
  font-size: 2.8rem;
  margin: 0 0 0.5rem;
  color: var(--text);
  font-weight: 700;
  background: linear-gradient(90deg, #1a73e8, #34a853);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  display: inline-block;
}

.subtitle {
  font-size: 1.25rem;
  color: var(--text-secondary);
  max-width: 700px;
  margin: 0 auto;
}

.card-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 2rem;
  padding: 2rem 1rem;
  max-width: 1200px;
  margin: 0 auto;
}

.card {
  background: var(--card-bg);
  border-radius: var(--border-radius);
  padding: 2rem;
  box-shadow: var(--card-shadow);
  transition: var(--transition);
  border: 1px solid #e0e0e0;
  display: flex;
  flex-direction: column;
  height: 100%;
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: var(--card-shadow-hover);
}

.card-icon {
  width: 60px;
  height: 60px;
  border-radius: 50%;
  background: rgba(26, 115, 232, 0.1);
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto 1.5rem;
  color: var(--primary);
}

.card h2 {
  margin: 0 0 1rem;
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--text);
}

.card p {
  color: var(--text-secondary);
  margin: 0 0 1.5rem;
  flex-grow: 1;
}

.button {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  background: var(--primary);
  color: white;
  padding: 0.75rem 1.5rem;
  border-radius: 8px;
  text-decoration: none;
  font-weight: 500;
  transition: var(--transition);
  border: none;
  cursor: pointer;
  margin-top: auto;
  width: fit-content;
  margin-left: auto;
  margin-right: auto;
}

.button:hover {
  background: var(--primary-hover);
  transform: translateY(-1px);
  box-shadow: 0 4px 12px rgba(26, 115, 232, 0.2);
}

.button svg {
  margin-left: 8px;
  transition: transform 0.2s ease;
}

.button:hover svg {
  transform: translateX(3px);
}

@media (max-width: 768px) {
  .card-container {
    grid-template-columns: 1fr;
    padding: 1rem;
  }
  
  .hero h1 {
    font-size: 2.2rem;
  }
  
  .subtitle {
    font-size: 1.1rem;
  }
}
</style>
