<script>
	// import { Input } from "$lib/components/Input.svelte";
	
	/** @type {import('./$types').PageData} */
	export let data;

	let members = [
		{
			id: 1,
			name: "Benjamin",
			status: "at home",
		},
		{
			id: 2,
			name: "Mishi",
			status: "at work",
		}
	]

	let tasks = [
		{
			id: 1,
			name: "Do Homework",
			assigner: "me",
			description: "Do math homework on page 82",
		},
		{
			id: 2,
			name: "Clean room",
			assigner: "mom",
			description: "Clean the room now!!",
		}
	];

	let events = [
		{
			id: 1,
			name: "Family Gathering",
			time: "Friday, 12:15AM",
			location: "Grandma",
			color: "red",
		},
		{
			id: 2,
			name: "Basketball",
			time: "Sunday, 3:00PM",
			location: "Basketball Field",
			color: "blue",
		}
	];
</script>

<svelte:head>
	<title>Dashboard | Family Hub</title>
</svelte:head>

<main>
	<div class="tasks">
		<h5>Tasks to Finish</h5>
		<div class="tasks--new">
			<button title="Add new task">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="none">
					<path d="M10 2V10V18M18 10H2" stroke-linecap="round" stroke-linejoin="round" fill="blue" />
				</svg>
			</button>
			<p>Add a new task</p>
		</div>
		<hr>
		<div class="tasks--list">
			{#each tasks as task (task.id)}
				<div class="task">
					<div class="task--details">
						<p class="task__name">{task.name}</p>
						<p class="task__assigner">{task.assigner}</p>
						<p class="task__description">{task.description}</p>
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
	<div class="statuses">
		<h5>Statuses</h5>
		<form class="statuses--set" method="POST" action="?/setStatus">
			<img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.8QRdhC_5aU7Z-uedJmXDowHaHa%26pid%3DApi&f=1&ipt=3d5250e2bac8fa86b82b4318f5945815fd1bfa072c0af5880d01d6da6d9b4664&ipo=images" alt="" />
			<!-- <Input placeholder="My status..."></Input> -->
		</form>
		<hr>
		<div class="statuses--list">
			{#each members as member (member.id)}
				<div class="status">
					<img class="status__image" src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.8QRdhC_5aU7Z-uedJmXDowHaHa%26pid%3DApi&f=1&ipt=3d5250e2bac8fa86b82b4318f5945815fd1bfa072c0af5880d01d6da6d9b4664&ipo=images" alt="" />
					<p class="status__name">{member.name}</p>
					<p class="status__status">{member.status}</p>
				</div>
			{/each}
		</div>
	</div>
</main>

<style>
	main {
		display: flex;
		justify-content: space-between;
		padding-inline: var(--padding-900);
		gap:  4rem;
	}

	/* tasks */
	.tasks {
		display: flex;
		flex-direction: column;
		gap: 1rem;
		color: var(--text);
	}

	.tasks--new {
		display: flex;
		align-items: center;
		gap: .75rem;
		white-space: nowrap;
	}

	.tasks--new > button {
		min-width: 2.5em;
		padding: .5em;
		background-color: transparent;
		border: .25em solid var(--accent);
		border-radius: var(--br);
		cursor: pointer;
	}

	.tasks--new > button > svg {
		stroke: var(--text);
		stroke-width: .25em;
	}

	.tasks--list {
		max-height: 16rem;
		overflow: hidden auto;
	}

	.tasks--list::-webkit-scrollbar {
		width: .5em;
	}
	
	.tasks--list::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}

	.task {
		display: flex;
		gap: 1.5rem;
		align-items: center;
		padding: var(--padding-300);
		padding-right: var(--padding-500);
	}

	.task--details {
		flex-grow: 1;
		display: grid;
		grid-template-areas: "name assigner"
							 "desc desc";
		gap: .25em .5em;
	}
	
	.task__name {
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	
	.task__assigner {
		color: var(--accent);
		font-size: var(--fs-300);
		justify-self: end;
	}
	
	.task__description {
		max-width: 20ch;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
		font-size: var(--fs-300);
		grid-area: desc;
	}

	.task > button {
		min-height: 2rem;
		aspect-ratio: 1;
		display: flex;
		align-items: center;
		justify-content: center;
		background-color: var(--accent);
		border: none;
		border-radius: var(--sbr);
		cursor: pointer;
	}

	.task > button > svg {
		width: .75rem;
		stroke: white;
		stroke-width: .25em;
	}

	/* events */
	.events {
		display: flex;
		flex-direction: column;
		gap: 1rem;
		color: var(--text);
	}

	.events--list {
		display: flex;
		flex-direction: column;
	}

	.event {
		display: grid;
		grid-auto-flow: column;
		grid-template-columns: 2% repeat(4, 1fr);
		white-space: nowrap;
	}


	/* statuses */
	.statuses {
		display: flex;
		flex-direction: column;
		gap: 1rem;
		color: var(--text);
	}

	.statuses--list {
		display: flex;
		flex-direction: column;
	}

	.statuses--set > img {
		width: 4rem;
	}

	.status__image {
		width: 3rem;
	}
</style>