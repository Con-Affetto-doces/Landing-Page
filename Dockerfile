FROM node:24.22.0-bookworm-slim AS build

WORKDIR /app
ENV ASTRO_TELEMETRY_DISABLED=1

COPY package.json package-lock.json ./
RUN npm ci --no-fund --no-audit

COPY astro.config.mjs tsconfig.json ./
COPY src ./src
COPY public ./public
RUN npm run build && npm prune --omit=dev --no-fund --no-audit

FROM node:24.22.0-bookworm-slim AS runtime

WORKDIR /app
ENV NODE_ENV=production \
    ASTRO_TELEMETRY_DISABLED=1 \
    HOST=0.0.0.0 \
    PORT=4321

COPY --from=build --chown=node:node /app/package.json /app/package-lock.json ./
COPY --from=build --chown=node:node /app/node_modules ./node_modules
COPY --from=build --chown=node:node /app/dist ./dist

USER node
EXPOSE 4321

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD ["node", "-e", "fetch('http://127.0.0.1:' + process.env.PORT + '/').then((response) => process.exit(response.ok ? 0 : 1)).catch(() => process.exit(1))"]

CMD ["node", "./dist/server/entry.mjs"]
