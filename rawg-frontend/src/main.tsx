import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.tsx'

// 1. import `ChakraProvider` component
import { ChakraProvider } from '@chakra-ui/react'

// 2. Wrap ChakraProvider at the root of your app
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <ChakraProvider>
      <App />
    </ChakraProvider>  
  </StrictMode>,
)
