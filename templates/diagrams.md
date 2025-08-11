---
marp: true
theme: institutional
paginate: true
header: "Organización del Computador 1 - Comisión 7"
footer: "UNGS - 2025"
---

<!-- 
Plantilla para diapositivas con diagramas usando Mermaid
Organización del Computador 1 - Comisión 7 (UNGS)

Mermaid permite crear diagramas y visualizaciones usando texto y código.
Documentación: https://mermaid-js.github.io/
-->

<!-- _class: lead -->
# Diagramas en Marp
## Usando Mermaid
### Organización del Computador 1 - Comisión 7

---

# Tipos de diagramas soportados

- Diagramas de flujo
- Diagramas de secuencia
- Diagramas de clase
- Diagramas de estado
- Diagramas de Gantt
- Diagramas de relación entidad
- Diagramas de pastel
- Y más...

---

# Diagrama de flujo

```mermaid
graph TD
    A[Inicio] --> B{¿Condición?}
    B -->|Sí| C[Proceso 1]
    B -->|No| D[Proceso 2]
    C --> E[Fin]
    D --> E
```

---

# Diagrama de flujo: Ciclo de instrucción

```mermaid
graph LR
    A[Fetch] --> B[Decode]
    B --> C[Execute]
    C --> D[Store]
    D --> A
```

---

# Diagrama de secuencia

```mermaid
sequenceDiagram
    participant CPU
    participant Memory
    participant IO
    
    CPU->>Memory: Fetch Instruction
    Memory-->>CPU: Instruction
    CPU->>CPU: Decode
    CPU->>Memory: Read Data
    Memory-->>CPU: Data
    CPU->>CPU: Execute
    CPU->>Memory: Write Result
    CPU->>IO: Output
```

---

# Diagrama de clase

```mermaid
classDiagram
    class Computer {
        +CPU cpu
        +Memory memory
        +IO io
        +powerOn()
        +powerOff()
    }
    
    class CPU {
        -int registers[16]
        -int pc
        +fetch()
        +decode()
        +execute()
        +store()
    }
    
    Computer *-- CPU
    Computer *-- Memory
    Computer *-- IO
```

---

# Diagrama de estado

```mermaid
stateDiagram-v2
    [*] --> Idle
    Idle --> Fetch : Nueva instrucción
    Fetch --> Decode
    Decode --> Execute
    Execute --> Store
    Store --> Fetch : Siguiente instrucción
    Store --> Idle : Fin del programa
    Idle --> [*] : Apagado
```

---

# Diagrama de Gantt

```mermaid
gantt
    title Planificación del curso
    dateFormat  YYYY-MM-DD
    
    section Teoría
    Introducción           :a1, 2025-03-01, 7d
    Sistemas de numeración :a2, after a1, 7d
    Álgebra de Boole       :a3, after a2, 7d
    
    section Práctica
    TP1                    :b1, 2025-03-08, 14d
    TP2                    :b2, after b1, 14d
```

---

# Diagrama de pastel

```mermaid
pie title Distribución de tiempo en el curso
    "Teoría" : 40
    "Práctica" : 40
    "Evaluaciones" : 15
    "Consultas" : 5
```

---

# Consejos para usar diagramas

- Mantén los diagramas simples y enfocados
- Usa colores para destacar elementos importantes
- Agrega comentarios explicativos
- Combina diferentes tipos de diagramas según sea necesario
- Prueba los diagramas en el editor de Mermaid antes de incluirlos

---

<!-- _class: lead -->
# ¿Preguntas?