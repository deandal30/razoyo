import React, { useState, useEffect }  from 'react'
import {
    getAllCars,
    fetchCarById,
	loremipsum
} from './../utils/constants'

const CarContainer = ({results, setResults}) => {
    const [error, setError] = useState(null)
	const [id, setId] = useState(null)
	const [open, setOpen] = useState(false)
	const [currentCar, setCurrentCar]= useState ({
		year: "",
		make: "",
		model: "",
		price: "",
		mpg: "",
		seats: "",
		img_url: ""
	})
	
    useEffect(() => {
        fetch(getAllCars)
            .then(res => res.json())
            .then(
                (data) => {
					setResults(data)
                },
                (error) => {
                    setError(error)
                }
            )
      }, [])
    
	openCarDetailsState = (e) => {
		console.log(results)
		let carId = e.target.value
		setId(carId);

		fetch(`${fetchCarById}?id=${carId}`)
		.then(res => res.json())
		.then(
				(data) => {
						setOpen(true)
						setCurrentCar({
							year: data.year,
							make: data.make,
							model: data.model,
							price: data.price,
							mpg: data.mpg,
							seats: data.seats,
							img_url: data.img_url
						})
				},
				(error) => {
						setError(error)
				}
		)
	}

	closeCarAccordion = () => {
		setOpen(false)
	}

	let displayData = 
		results.map((car, index) => 
			<div key={`${car.year}-${car.model}`}> 
				<h2 id={`accordion-flush-heading-${index + 1}`}>
					<button type="button" className="flex items-center justify-between w-full py-5 font-medium text-left text-gray-500 border-b border-gray-200 dark:border-gray-700 dark:text-gray-400" 
						data-accordion-target={`#accordion-flush-body-${index + 1}`}
						aria-expanded="true" 
						aria-controls={`accordion-flush-body-${index + 1}`}
						onClick={open && car.id == id ? closeCarAccordion : openCarDetailsState} value={car.id}>
						<span>{`${car.make} ${car.model} ${car.year}`}</span>

						<svg data-accordion-icon 
							className={`w-3 h-3 ${open && car.id == id ? '' : 'rotate-180'} shrink-0`}  
							aria-hidden="true" xmlns="http://www.w3.org/2000/svg" 
							fill="none" 
							viewBox="0 0 10 6">
							<path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
						</svg>
					</button>
				</h2>
				<div id={`accordion-flush-body-${index + 1}`}
					className={`${open && car.id == id ? '' : 'hidden'}`} 
					aria-labelledby={`accordion-flush-heading-${index + 1}`} >
					<div className="bg-white rounded-xl shadow-md overflow-hidden md:max-w-2xl">
						<div className="md:flex">
							<div className="md:shrink-0">
							<img className="h-auto max-w-xs" src={`${car.id == id ? currentCar.img_url : ''}`} alt="Modern building architecture"/>
							</div>
							<div className="p-8">
							<div className="uppercase tracking-wide text-sm text-indigo-500 font-semibold">MPG: {`${car.id == id ? currentCar.mpg : ''}`}</div>
							<div className="uppercase tracking-wide text-sm text-indigo-500 font-semibold">Seats: {`${car.id == id ? currentCar.seats : ''}`}</div>
							<div className="uppercase tracking-wide text-sm text-indigo-500 font-semibold">Price: {`${car.id == id ? currentCar.price : ''}`}</div>
							<a href="#" className="block mt-1 text-lg leading-tight font-medium text-black hover:underline">All new {`${car.year} - ${car.make} ${car.model}`}</a>
							<p className="mt-2 text-slate-500">{ loremipsum }</p>
							</div>
						</div>
					</div> 
				</div> 
			</div>						
			)

    return (
		<div>
			<div className="flex w-full"> 
				<div id="accordion-flush" className="w-full" data-accordion="collapse" data-active-classNamees="bg-white dark:bg-gray-900 text-gray-900 dark:text-white" data-inactive-classNamees="text-gray-500 dark:text-gray-400">
					{displayData}
				</div>
			</div>
		</div>
    )
}

export default CarContainer;