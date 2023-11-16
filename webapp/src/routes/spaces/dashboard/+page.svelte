<script>
	/** @type {import('./$types').PageData} */
	export let data;

	let tasks = [
		{
			id: 1,
			name: "Do Homework",
			creator: "me",
			description: "Do math home work on page 82"
		},
		{
			id: 2,
			name: "Clean room",
			creator: "mom",
			description: "Clean the room now!!"
		}
	];

	let events = [
		{
			id: 1,
			name: "Family Gathering",
			time: "Friday, 12:15AM",
			location: "Grandma"
		},
		{
			id: 2,
			name: "Basketball",
			time: "Sunday, 3:00PM",
			location: "Basketball Field"
		}
	]
</script>

<main>
	<div class="tasks">
		<h5>Tasks to Finish</h5>
		<div class="new--task">
			<button title="add new task">+</button>
			<p>Add a new task</p>
		</div>
		<hr>
		<div class="tasks--list">
			{#each tasks as task (task.id)}
				<div class="task">
					<div class="task--detail">
						<p>{task.name}</p>
						<p>{task.creator}</p>
						<p>{task.description}</p>
					</div>
					<button title="Set task as done">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 12" fill="none">
							<path d="M2 5.99997L5.99943 10L14 2" stroke-linecap="round" stroke-linejoin="round" />
						</svg>
					</button>
				</div>
			{/each}
		</div>
	</div>
	<div class="events">
		<h5>Upcoming Events</h5>
		<hr>
		<div class="events--list">
			{#each events as event (event.id)}
				<div class="event">
					<div class="event__color"></div>
					<p>{event.name}</p>
					<div class="event--time">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 18" fill="none">
							<path d="M10 4C10 3.44772 9.55229 3 9 3C8.44771 3 8 3.44772 8 4V9V10H9H12C12.5523 10 13 9.55229 13 9C13 8.44771 12.5523 8 12 8H10V4ZM17 9C17 13.4183 13.4183 17 9 17C4.58172 17 1 13.4183 1 9C1 4.58172 4.58172 1 9 1C13.4183 1 17 4.58172 17 9Z" stroke-linecap="round" />
						</svg>
					</div>
					<div class="event--location">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 20" fill="none">
							<path d="M8.33337 19C4.83337 15.4 1.33337 12.1764 1.33337 8.2C1.33337 4.22355 4.46737 1 8.33337 1C12.1994 1 15.3334 4.22355 15.3334 8.2C15.3334 12.1764 11.8334 15.4 8.33337 19Z" stroke-linecap="round" stroke-linejoin="round" />
							<path d="M8.33337 11C6.67647 11 5.33337 9.6569 5.33337 8C5.33337 6.34315 6.67647 5 8.33337 5C9.99027 5 11.3334 6.34315 11.3334 8C11.3334 9.6569 9.99027 11 8.33337 11Z" stroke-linecap="round" stroke-linejoin="round" />
						</svg>
					</div>
					<div class="event--buttons">
						<button class="accept">Accept</button>
						<button class="decline">Decline</button>
					</div>
				</div>
			{/each}
		</div>
	</div>
	<div class="status">

	</div>
</main>