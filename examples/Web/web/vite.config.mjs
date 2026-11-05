import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react({ jsxRuntime: 'classic' })],
  base: './',
  server: { host: '127.0.0.1', port: 3000 },
  // Preserve compatibility with Semantic UI's legacy CSS syntax.
  build: { outDir: 'build', cssMinify: 'esbuild' },
})
