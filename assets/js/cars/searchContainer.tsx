import React, { useState, useEffect }  from 'react'
import {
    fetchCarByFilter
} from './../utils/constants'

const SearchContainer = ({ setResults }) => {	
    const [input, setInput] = useState("")
    const [error, setError] = useState(null)

    const fetchData = (value) => {
        fetch(`${fetchCarByFilter}?make=${value}`)
            .then(res => res.json())
            .then(
                (data) => {
                    setResults(data)
                },
                (error) => {
                    setError(error)
                }
            )
    }

    const handleChange = (value) => {
        setInput(value)
        fetchData(value)
    }

    return (
        <div className="relative">
            <input
                type="text"
                placeholder="Filter by Make"
                className="w-full py-3 pl-12 pr-4 text-gray-500 border rounded-md outline-none bg-gray-50 focus:bg-white focus:border-indigo-600"
                value={input} 
                onChange={(e) => handleChange(e.target.value)}
            />
        </div>
    )
}

export default SearchContainer