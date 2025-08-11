---
marp: true
theme: matrix
paginate: true
header: "Organización del Computador 1 - Comisión 7"
footer: "UNGS - 2025"
---

<!-- 
Plantilla para diapositivas con bloques de código
Organización del Computador 1 - Comisión 7 (UNGS)

Esta plantilla muestra cómo incluir código con resaltado de sintaxis
en diferentes lenguajes de programación.
-->

<!-- _class: lead -->
# Código en Marp
## Resaltado de sintaxis
### Organización del Computador 1 - Comisión 7

---

# Bloques de código

Marp soporta resaltado de sintaxis para múltiples lenguajes:

- C/C++
- Assembly (NASM, MIPS, ARM, etc.)
- Python
- Java
- JavaScript
- HTML/CSS
- Y muchos más...

---

# Código en C

```c
#include <stdio.h>

/**
 * Función principal del programa
 */
int main() {
    // Declaración de variables
    int a = 10;
    int b = 20;
    int suma;
    
    // Realizar operación
    suma = a + b;
    
    // Mostrar resultado
    printf("La suma de %d y %d es: %d\n", a, b, suma);
    
    return 0;
}
```

---

# Código Assembly (NASM x86)

```nasm
section .data
    mensaje db 'Hola, mundo!', 0xA
    longitud equ $ - mensaje

section .text
    global _start

_start:
    ; Escribir el mensaje
    mov eax, 4          ; syscall: sys_write
    mov ebx, 1          ; descriptor de archivo: stdout
    mov ecx, mensaje    ; puntero al mensaje
    mov edx, longitud   ; longitud del mensaje
    int 0x80            ; llamada al sistema

    ; Salir del programa
    mov eax, 1          ; syscall: sys_exit
    xor ebx, ebx        ; código de salida: 0
    int 0x80            ; llamada al sistema
```

---

# Código MIPS Assembly

```mips
.data
mensaje:    .asciiz "Hola, mundo!\n"

.text
.globl main
main:
    # Imprimir mensaje
    li $v0, 4           # Código de servicio para imprimir cadena
    la $a0, mensaje     # Cargar dirección del mensaje
    syscall

    # Salir del programa
    li $v0, 10          # Código de servicio para salir
    syscall
```

---

# Código Python

```python
def calcular_factorial(n):
    """
    Calcula el factorial de un número n.
    
    Args:
        n (int): El número para calcular su factorial
        
    Returns:
        int: El factorial de n
    """
    if n == 0 or n == 1:
        return 1
    else:
        return n * calcular_factorial(n - 1)

# Ejemplo de uso
numero = 5
resultado = calcular_factorial(numero)
print(f"El factorial de {numero} es: {resultado}")
```

---

# Código Java

```java
/**
 * Clase que implementa un contador simple
 */
public class Contador {
    private int valor;
    
    /**
     * Constructor por defecto
     */
    public Contador() {
        this.valor = 0;
    }
    
    /**
     * Incrementa el contador en 1
     */
    public void incrementar() {
        this.valor++;
    }
    
    /**
     * Obtiene el valor actual del contador
     * @return El valor actual
     */
    public int getValor() {
        return this.valor;
    }
    
    public static void main(String[] args) {
        Contador c = new Contador();
        c.incrementar();
        System.out.println("Valor: " + c.getValor());
    }
}
```

---

# Resaltado de líneas específicas

```c {5-7}
#include <stdio.h>

int main() {
    // Estas líneas están resaltadas
    int a = 10;
    int b = 20;
    int suma = a + b;
    
    printf("Suma: %d\n", suma);
    return 0;
}
```

---

# Código en línea

También puedes incluir código en línea como `printf("Hola")` dentro de un párrafo de texto normal.

Variables como `int contador = 0;` o funciones como `void inicializar()` se pueden destacar fácilmente.

---

# Consejos para presentar código

- Mantén los ejemplos de código concisos y relevantes
- Resalta las líneas importantes
- Usa comentarios para explicar el código
- Considera usar un tamaño de fuente más grande para mejor legibilidad
- Divide el código complejo en múltiples diapositivas
- Usa el tema Matrix para código (¡se ve genial!)

---

<!-- _class: lead -->
# ¿Preguntas?