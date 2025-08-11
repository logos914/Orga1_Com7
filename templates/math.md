---
marp: true
theme: institutional
paginate: true
header: "Organización del Computador 1 - Comisión 7"
footer: "UNGS - 2025"
---

<!-- 
Plantilla para diapositivas con fórmulas matemáticas usando LaTeX
Organización del Computador 1 - Comisión 7 (UNGS)

Marp utiliza KaTeX para renderizar fórmulas matemáticas escritas en LaTeX.
Documentación: https://katex.org/docs/supported.html
-->

<!-- _class: lead -->
# Fórmulas Matemáticas en Marp
## Usando LaTeX
### Organización del Computador 1 - Comisión 7

---

# Sintaxis básica

En Marp, puedes incluir fórmulas matemáticas usando la sintaxis de LaTeX:

- Fórmulas en línea: `$formula$`
- Fórmulas en bloque: `$$formula$$`

---

# Fórmulas en línea

- La ley de Ohm establece que $V = I \cdot R$, donde $V$ es el voltaje, $I$ es la corriente y $R$ es la resistencia.

- La potencia se calcula como $P = V \cdot I$ o alternativamente $P = I^2 \cdot R$.

- La frecuencia y el período están relacionados por $f = \frac{1}{T}$.

---

# Fórmulas en bloque

La transformada de Fourier:

$$X(f) = \int_{-\infty}^{\infty} x(t) \cdot e^{-j2\pi ft} dt$$

La ley de Coulomb:

$$F = k \cdot \frac{q_1 \cdot q_2}{r^2}$$

---

# Sistemas de ecuaciones

$$
\begin{cases}
x + y + z = 10 \\
2x - y + z = 8 \\
x + 2y - z = 4
\end{cases}
$$

---

# Matrices

$$
A = \begin{pmatrix}
a_{11} & a_{12} & a_{13} \\
a_{21} & a_{22} & a_{23} \\
a_{31} & a_{32} & a_{33}
\end{pmatrix}
$$

$$
\begin{vmatrix}
a & b \\
c & d
\end{vmatrix} = ad - bc
$$

---

# Sumatorias y productorias

$$\sum_{i=1}^{n} i = \frac{n(n+1)}{2}$$

$$\prod_{i=1}^{n} i = n!$$

---

# Límites, derivadas e integrales

$$\lim_{x \to \infty} \frac{1}{x} = 0$$

$$\frac{d}{dx}(x^n) = nx^{n-1}$$

$$\int x^n dx = \frac{x^{n+1}}{n+1} + C, \quad n \neq -1$$

---

# Lógica y teoría de conjuntos

- Operaciones lógicas: $A \land B$, $A \lor B$, $\neg A$, $A \implies B$, $A \iff B$

- Teoría de conjuntos: $A \cup B$, $A \cap B$, $A \subset B$, $x \in A$

- Cuantificadores: $\forall x \in X$, $\exists x \in X$

---

# Sistemas numéricos

- Binario: $1010_2 = 10_{10}$
- Octal: $12_8 = 10_{10}$
- Hexadecimal: $A_{16} = 10_{10}$

Conversión:
$$1010_2 = 1 \cdot 2^3 + 0 \cdot 2^2 + 1 \cdot 2^1 + 0 \cdot 2^0 = 10_{10}$$

---

# Álgebra de Boole

Leyes de De Morgan:
$$\overline{A \cdot B} = \overline{A} + \overline{B}$$
$$\overline{A + B} = \overline{A} \cdot \overline{B}$$

Tabla de verdad para XOR:
$$
\begin{array}{|c|c|c|}
\hline
A & B & A \oplus B \\
\hline
0 & 0 & 0 \\
0 & 1 & 1 \\
1 & 0 & 1 \\
1 & 1 & 0 \\
\hline
\end{array}
$$

---

# Algoritmos y complejidad

- Complejidad temporal: $O(n)$, $O(n^2)$, $O(\log n)$, $O(n \log n)$

- Recurrencia: $T(n) = 2T(n/2) + O(n)$

- Solución: $T(n) = O(n \log n)$

---

# Consejos para usar fórmulas matemáticas

- Mantén las fórmulas simples y claras
- Explica el significado de los símbolos
- Usa colores para destacar partes importantes: $\color{red}{E=mc^2}$
- Divide fórmulas complejas en pasos
- Combina fórmulas con texto explicativo

---

<!-- _class: lead -->
# ¿Preguntas?