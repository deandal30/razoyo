import React, { useState, useEffect }  from 'react'
import SearchContainer from "./searchContainer"
import CarContainer from "./carContainer"
interface MainProps {
    name: string;
}
const Main: React.FC<MainProps> = (props: MainProps) => {	
    const [results, setResults] = useState([]);
    
    return (
        <div className="App">
            <SearchContainer setResults={setResults}/>
            <CarContainer {...{results, setResults}}/>
        </div>
    )
}

export default Main;