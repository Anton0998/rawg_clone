import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'

// 1. import `ChakraProvider` component
import { ChakraProvider, ColorModeScript } from '@chakra-ui/react'

import theme from "./theme.ts"

// 2. Wrap ChakraProvider at the root of your app
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ChakraProvider theme={theme}>
      <ColorModeScript initialColorMode={theme.config.initialColorMode} />
      <App />
    </ChakraProvider>  
  </StrictMode>,
)
