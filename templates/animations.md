---
marp: true
theme: matrix
paginate: true
header: "Organización del Computador 1 - Comisión 7"
footer: "UNGS - 2025"
---

<!-- 
Plantilla para diapositivas con animaciones
Organización del Computador 1 - Comisión 7 (UNGS)

Esta plantilla muestra cómo incluir animaciones básicas en las diapositivas.
-->

<!-- _class: lead -->
# Animaciones en Marp
## Efectos visuales para presentaciones
### Organización del Computador 1 - Comisión 7

---

# Tipos de animaciones en Marp

Marp soporta animaciones básicas a través de:

1. **Fragmentos**: Revelación progresiva de contenido
2. **Transiciones**: Efectos entre diapositivas
3. **CSS**: Animaciones personalizadas con CSS
4. **GIFs/Videos**: Contenido multimedia animado

---

<!-- _class: lead -->
# 1. Fragmentos
## Revelación progresiva de contenido

---

# Fragmentos con listas

<!-- Usa _fragment para revelar elementos uno por uno -->

<div class="fragments">

- Primer punto
- Segundo punto
- Tercer punto
- Cuarto punto

</div>

<style>
.fragments > * {
  opacity: 0;
}
.fragments > *:nth-child(1) {
  opacity: 1;
}
.fragments:has(> *:nth-child(1):hover) > *:nth-child(2) {
  opacity: 1;
}
.fragments:has(> *:nth-child(2):hover) > *:nth-child(3) {
  opacity: 1;
}
.fragments:has(> *:nth-child(3):hover) > *:nth-child(4) {
  opacity: 1;
}
</style>

Nota: En la presentación real, haz clic para revelar cada punto.

---

# Fragmentos con código

<div class="code-fragments">

```c
// 1. Incluir bibliotecas
#include <stdio.h>

// 2. Definir la función principal
int main() {
    // 3. Declarar variables
    int x = 10;
    
    // 4. Realizar operaciones
    printf("El valor es: %d\n", x);
    
    // 5. Retornar valor
    return 0;
}
```

</div>

<style>
.code-fragments > pre > code > .hljs-comment {
  opacity: 0;
}
.code-fragments:hover > pre > code > .hljs-comment {
  opacity: 1;
  transition: opacity 0.5s;
}
</style>

Nota: Pasa el cursor sobre el código para ver los comentarios.

---

<!-- _class: lead -->
# 2. Transiciones
## Efectos entre diapositivas

---

<!-- _class: fade -->
# Transición: Fade

Esta diapositiva aparece con un efecto de desvanecimiento.

<style>
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
section.fade {
  animation: fadeIn 1s ease-in-out;
}
</style>

---

<!-- _class: slide-in -->
# Transición: Slide In

Esta diapositiva aparece deslizándose desde la derecha.

<style>
@keyframes slideIn {
  from { transform: translateX(100%); }
  to { transform: translateX(0); }
}
section.slide-in {
  animation: slideIn 1s ease-in-out;
}
</style>

---

<!-- _class: zoom -->
# Transición: Zoom

Esta diapositiva aparece con un efecto de zoom.

<style>
@keyframes zoom {
  from { transform: scale(0.5); opacity: 0; }
  to { transform: scale(1); opacity: 1; }
}
section.zoom {
  animation: zoom 1s ease-in-out;
}
</style>

---

<!-- _class: lead -->
# 3. CSS Animations
## Animaciones personalizadas con CSS

---

# Texto con efecto de escritura

<div class="typewriter">
  <h2>Organización del Computador 1</h2>
</div>

<style>
.typewriter h2 {
  overflow: hidden;
  border-right: .15em solid var(--primary-color);
  white-space: nowrap;
  margin: 0 auto;
  letter-spacing: .15em;
  animation: 
    typing 3.5s steps(30, end),
    blink-caret .75s step-end infinite;
}

@keyframes typing {
  from { width: 0 }
  to { width: 100% }
}

@keyframes blink-caret {
  from, to { border-color: transparent }
  50% { border-color: var(--primary-color); }
}
</style>

---

# Elementos con efecto de pulso

<div class="pulse">
  <h2>¡Atención!</h2>
  <p>Este es un concepto importante</p>
</div>

<style>
.pulse {
  animation: pulse 2s infinite;
  padding: 20px;
  border-radius: 10px;
  background-color: rgba(0, 255, 0, 0.1);
  text-align: center;
}

@keyframes pulse {
  0% { transform: scale(1); }
  50% { transform: scale(1.05); }
  100% { transform: scale(1); }
}
</style>

---

# Diagrama con animación

<div class="animated-diagram">
  <div class="cpu">CPU</div>
  <div class="arrow arrow1">→</div>
  <div class="memory">Memoria</div>
  <div class="arrow arrow2">→</div>
  <div class="io">E/S</div>
</div>

<style>
.animated-diagram {
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin: 50px 0;
}

.animated-diagram > div {
  padding: 20px;
  border-radius: 10px;
}

.cpu, .memory, .io {
  background-color: rgba(0, 255, 0, 0.2);
  border: 2px solid var(--primary-color);
}

.arrow {
  font-size: 24px;
  animation: flash 1.5s infinite;
}

.arrow1 {
  animation-delay: 0s;
}

.arrow2 {
  animation-delay: 0.75s;
}

@keyframes flash {
  0%, 50%, 100% { opacity: 1; }
  25%, 75% { opacity: 0.3; }
}
</style>

---

<!-- _class: lead -->
# 4. GIFs y Videos
## Contenido multimedia animado

---

# Inclusión de GIFs

![width:500px](https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExcDd5Z3g2ZWx0NXJ1MWF0MnJ5aHJxbWJxcnVlcWx4ZWJlcWRqcnVtdyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/26tn33aiTi1jkl6H6/giphy.gif)

Los GIFs son útiles para mostrar procesos o conceptos dinámicos.

---

# Inclusión de videos

Para incluir videos, puedes usar etiquetas HTML:

```html
<video controls width="600">
  <source src="video.mp4" type="video/mp4">
  Tu navegador no soporta el elemento de video.
</video>
```

O incrustar videos de YouTube:

```html
<iframe width="560" height="315" 
  src="https://www.youtube.com/embed/VIDEO_ID" 
  frameborder="0" allowfullscreen>
</iframe>
```

---

# Consejos para usar animaciones

- Usa animaciones con propósito, no solo por decoración
- Mantén las animaciones sutiles y profesionales
- No sobrecargues la diapositiva con demasiadas animaciones
- Asegúrate de que las animaciones funcionen en el formato de exportación (PDF, HTML)
- Prueba las animaciones antes de la presentación
- Considera la accesibilidad (algunas personas pueden ser sensibles a animaciones)

---

<!-- _class: lead -->
# ¿Preguntas?