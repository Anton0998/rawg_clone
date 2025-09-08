import apiClient from '../services/api-client'
import { useState, useEffect } from 'react'

export interface Game {
    id: number
    name: string
    background_image: string
}

interface GameResponse {
    count: number
    results: Game[]
}

export const useGames = () => {
    const [games, setGames] = useState<Game[]>([])
    const [error, setError] = useState("")

    useEffect(() => {
        apiClient
        .get<GameResponse>("/games")
        .then(res => setGames(res.data.results))
        .catch(err => {
            setError(err.message)
            console.log(err)
        })
    }, [])

    return { games, error };
}

