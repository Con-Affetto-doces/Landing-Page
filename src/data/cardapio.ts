export interface Produto {
  nome: string;
  nota?: string;
}

export const biscoitos: Produto[] = [
  { nome: "Baunilha" },
  { nome: "Canela" },
  { nome: "Chocolate" },
  { nome: "Especiarias com glacê" },
  { nome: "Melado" },
  { nome: "Melado com chocolate" },
];

export const pipocas: Produto[] = [
  { nome: "Leite Ninho" },
  { nome: "Chocolate" },
];
