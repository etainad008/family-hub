<script>
	import { enhance } from '$app/forms';

	import Input from '$lib/components/Input.svelte';

	/** @type {import('./$types').PageData} */
	export let data;

	let members = [
		{
			id: 1,
			name: 'Benjamin',
			status: 'at home'
		},
		{
			id: 2,
			name: 'Mishi',
			status: 'at work'
		},
		{
			id: 3,
			name: 'Mishi',
			status: 'at work'
		},
		{
			id: 4,
			name: 'Mishi',
			status: 'at work'
		},
		{
			id: 5,
			name: 'Mishi',
			status: 'at work'
		}
	];

	let tasks = [
		{
			id: 1,
			name: 'Do Homework',
			assigner: 'me',
			description: 'Do math homework on page 82'
		},
		{
			id: 2,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!'
		},
		{
			id: 3,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!'
		},
		{
			id: 4,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!'
		},
		{
			id: 5,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!'
		},
		{
			id: 6,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!'
		},
		{
			id: 7,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!'
		},
		
	];

	let events = [
		{
			id: 1,
			name: 'Family Gathering',
			time: 'Friday, 12:15AM',
			location: 'Grandma',
			color: 'red'
		},
		{
			id: 2,
			name: 'Basketball',
			time: 'Sunday, 3:00PM',
			location: 'Basketball Field',
			color: 'yellow'
		},
		{
			id: 3,
			name: 'Basketball',
			time: 'Sunday, 3:00PM',
			location: 'Basketball Field',
			color: 'green'
		},
		{
			id: 4,
			name: 'Basketball',
			time: 'Sunday, 3:00PM',
			location: 'Basketball Field',
			color: 'blue'
		}
	];

	let setStatusForm;
	let setStatusButton;

	function preventFormReset() {
		return async ({ update }) => {
			await update({ reset: false });
		};
	}
</script>

<svelte:head>
	<title>Dashboard | Family Hub</title>
</svelte:head>

<main>
	<article class="tasks">
		<h5>Tasks to Finish</h5>
		<div class="tasks--new">
			<button title="Add new task">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="none">
					<path
						d="M10 2V10V18M18 10H2"
						stroke-linecap="round"
						stroke-linejoin="round"
						fill="blue"
					/>
				</svg>
			</button>
			<p>Add a new task</p>
		</div>
		<hr />
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
	</article>
	<article class="events">
		<h5>Upcoming Events</h5>
		<hr />
		<div class="events--list">
			{#each events as event (event.id)}
				<div class="event">
					<div class="event__color {event.color}" />
					<p class="event__name">{event.name}</p>
					<div class="event--time">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 18" fill="none">
							<path
								d="M9 5V9H12.5M17 9C17 13.4183 13.4183 17 9 17C4.58172 17 1 13.4183 1 9C1 4.58172 4.58172 1 9 1C13.4183 1 17 4.58172 17 9Z"
								stroke-linecap="round"
							/>
						</svg>
						<p>{event.time}</p>
					</div>
					<div class="event--location">
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 20" fill="none">
							<path
								d="M8.33337 19C4.83337 15.4 1.33337 12.1764 1.33337 8.2C1.33337 4.22355 4.46737 1 8.33337 1C12.1994 1 15.3334 4.22355 15.3334 8.2C15.3334 12.1764 11.8334 15.4 8.33337 19Z"
								stroke-linecap="round"
								stroke-linejoin="round"
							/>
							<path
								d="M8.33337 11C6.67647 11 5.33337 9.6569 5.33337 8C5.33337 6.34315 6.67647 5 8.33337 5C9.99027 5 11.3334 6.34315 11.3334 8C11.3334 9.6569 9.99027 11 8.33337 11Z"
								stroke-linecap="round"
								stroke-linejoin="round"
							/>
						</svg>
						<p>{event.location}</p>
					</div>
					<button>Accept</button>
				</div>
			{/each}
		</div>
	</article>
	<article class="statuses">
		<h5>Statuses</h5>
		<form
			class="statuses--set"
			method="POST"
			action="?/setStatus"
			bind:this={setStatusForm}
			use:enhance={preventFormReset}
		>
			<img
				src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HLuY60jzx5puuKjbqmWRRwHaEK%26pid%3DApi&f=1&ipt=81902346e97e5047450710dbf2dc44a617d314d0fed95f8335f2349afb971699&ipo=images"
				alt="my profile"
			/>
			<Input name="status" placeholder="My status..." on:focusout={() => setStatusButton.click()} />
			<button bind:this={setStatusButton} />
			<!-- this button is invisible -->
		</form>
		<hr />
		<div class="statuses--list">
			{#each members as member (member.id)}
				<div class="status">
					<img
						class="status__image"
						src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.8QRdhC_5aU7Z-uedJmXDowHaHa%26pid%3DApi&f=1&ipt=3d5250e2bac8fa86b82b4318f5945815fd1bfa072c0af5880d01d6da6d9b4664&ipo=images"
						alt=""
					/>
					<p class="status__name">{member.name}</p>
					<p class="status__status">{member.status}</p>
				</div>
			{/each}
		</div>
	</article>
</main>

<style>
	main {
		display: flex;
		justify-content: space-between;
		padding-inline: var(--padding-900);
		gap: 6rem;
		max-height: 34rem;
		overflow: hidden;
		-webkit-mask-image: linear-gradient(black 97.5%, transparent);
		mask-image: linear-gradient(black 97.5%, transparent);
	}

	/* tasks */
	.tasks {
		display: flex;
		flex-direction: column;
		gap: var(--padding-400);
		color: var(--text);
	}

	.tasks--new {
		display: flex;
		align-items: center;
		gap: 0.75rem;
		white-space: nowrap;
	}

	.tasks--new > button {
		min-width: 2.5em;
		padding: 0.5em;
		background-color: transparent;
		border: 0.25em solid var(--accent);
		border-radius: var(--br);
		cursor: pointer;
	}

	.tasks--new > button > svg {
		stroke: var(--text);
		stroke-width: 0.25em;
	}

	.tasks--list {
		direction: rtl;
		overflow: hidden auto;
	}

	.tasks--list::-webkit-scrollbar {
		width: 0.5em;
	}

	.tasks--list::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}

	.task {
		direction: ltr;
		display: flex;
		gap: 1.5rem;
		align-items: center;
		padding: var(--padding-200) 0 var(--padding-200) var(--padding-400);
		padding-right: 0;
	}

	.task--details {
		flex-grow: 1;
		display: grid;
		grid-template-areas:
			'name assigner'
			'desc desc';
		gap: 0.25em 0.5em;
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
		max-width: 28ch;
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
		width: 0.75rem;
		stroke: white;
		stroke-width: 0.25em;
	}

	/* events */
	.events {
		display: flex;
		flex-direction: column;
		gap: var(--padding-400);
		color: var(--text);
		flex-grow: 1;
	}

	.events--list {
		overflow: hidden auto;
	}

	.events--list::-webkit-scrollbar {
		width: 0.5em;
	}

	.events--list::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}

	.event {
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: center;
		flex-wrap: wrap;
		gap: var(--padding-400);
		padding: var(--padding-500);
	}

	.event p {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.event__color {
		position: absolute;
		left: 0;
		width: 0.5rem;
		height: 80%;
	}

	.event--time {
		display: flex;
		gap: var(--padding-300);
	}

	.event--location {
		display: flex;
		gap: var(--padding-300);
	}

	.event button {
		padding: var(--padding-100) var(--padding-400);
		border-radius: var(--br);
		border: none;
		color: white;
		background-image: linear-gradient(to bottom, var(--primary), var(--accent));
		cursor: pointer;
	}

	.event svg {
		width: 1rem;
		aspect-ratio: 1;
		stroke: var(--text);
		stroke-width: 2px;
	}

	/* event colors */
	.red {
		background-image: linear-gradient(to bottom, #ff392e, #ff9994);
	}

	.green {
		background-image: linear-gradient(to bottom, #4ed34e, #a0e7a0);
	}

	.blue {
		background-image: linear-gradient(to bottom, #8eafbc, #cedde2);
		/* background-image: linear-gradient(to bottom, var(--accent), var(--primary)); */
	}

	.yellow {
		background-image: linear-gradient(to bottom, #fcfc64, #fefec8);
	}

	/* statuses */
	.statuses {
		display: flex;
		flex-direction: column;
		gap: var(--padding-400);
		color: var(--text);
	}

	.statuses--list {
		display: flex;
		flex-direction: column;
		gap: 1.5rem;
		padding: var(--padding-400);
		overflow: hidden auto;
	}

	.statuses--list::-webkit-scrollbar {
		width: 0.5em;
	}

	.statuses--list::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}

	.statuses--set {
		display: flex;
		align-items: center;
		gap: var(--padding-400);
	}

	.statuses--set > button {
		display: none;
	}

	.statuses--set > img {
		width: 4rem;
		aspect-ratio: 1;
		border-radius: 50%;
		object-fit: cover;
	}

	.status {
		display: grid;
		grid-template-columns: 3rem 1fr;
		gap: var(--padding-100) var(--padding-300);
	}

	.status__image {
		grid-row: span 2;
		aspect-ratio: 1;
		border-radius: 50%;
		object-fit: cover;
	}

	.status__name {
		grid-column: 2;
	}

	.status__status { /* Shush I know */
		width: fit-content;
		font-size: var(--fs-300);
		background-image: linear-gradient(to right, var(--accent), var(--accent));
		border-radius: 0 100vw 100vw 0;
		padding-inline: var(--padding-100) var(--padding-400);
		color: white;
	}
</style>
