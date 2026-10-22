const numeroWhatsApp = "+55 47 99911-7567";
const usuarioInstagram = "conaffetto66";

export const contato = {
  whatsapp: {
    numero: numeroWhatsApp,
    url: `https://wa.me/${numeroWhatsApp.replace(/\D/g, "")}`,
  },
  instagram: {
    usuario: `@${usuarioInstagram}`,
    url: `https://www.instagram.com/${usuarioInstagram}/`,
  },
};
