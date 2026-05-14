-- 1. CREAZIONE DELLE TABELLE

-- Tabella Categorie
CREATE TABLE Categorie (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT UNIQUE NOT NULL
);

-- Tabella Spese (con FOREIGN KEY e CHECK)
CREATE TABLE Spese (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    importo REAL NOT NULL CHECK(importo > 0), -- <--- VINCOLO CHECK AGGIUNTO
    descrizione TEXT,
    data TEXT NOT NULL,
    categoria_id INTEGER NOT NULL,
    FOREIGN KEY(categoria_id) REFERENCES Categorie(id)
);

-- Tabella Budget (con FOREIGN KEY, UNIQUE e CHECK)
CREATE TABLE Budget (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    mese TEXT NOT NULL, 
    limite REAL NOT NULL CHECK(limite > 0), -- <--- VINCOLO CHECK AGGIUNTO
    categoria_id INTEGER NOT NULL,
    UNIQUE(mese, categoria_id),
    FOREIGN KEY(categoria_id) REFERENCES Categorie(id)
);

-- 2. DATI DI ESEMPIO
INSERT INTO Categorie (nome) VALUES ('Alimentari');
INSERT INTO Categorie (nome) VALUES ('Trasporti');
INSERT INTO Categorie (nome) VALUES ('Svago');

INSERT INTO Spese (importo, descrizione, data, categoria_id) VALUES (25.50, 'Spesa supermercato', '2026-04-15', 1);
INSERT INTO Spese (importo, descrizione, data, categoria_id) VALUES (15.00, 'Bus', '2026-04-16', 2);

INSERT INTO Budget (mese, limite, categoria_id) VALUES ('2026-04', 300.00, 1);
