<script>
	import moment from 'moment';

	import { enhance } from '$app/forms';

	import Input from '$lib/components/Input.svelte';
	import Button from '$lib/components/Button.svelte';

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
		}
	];

	let tasks = [
		{
			id: 1,
			name: 'Do Homework',
			assigner: 'me',
			description: 'Do math homework on page 82',
			deadline: '2015-09-08T08:02:17+03:00',
			isDone: false,
			isPreset: false
		},
		{
			id: 2,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!',
			deadline: '2015-09-08T16:02:17+03:00',
			isDone: false,
			isPreset: false
		}
	];

	let tasks2 = [
		{
			id: 1,
			name: 'Do Homework',
			assigner: 'me',
			description: 'Do math homework on page 82',
			deadline: '2016s-09-08T08:02:17+03:00',
			isDone: true,
			isPreset: true
		},
		{
			id: 2,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!',
			deadline: '2015-09-08T16:02:17+03:00',
			isDone: false,
			isPreset: false
		}
	];

	let doneFilter = false;
	let iAssignedFilter = false;
	let sortByFilter = 'deadline';

	function sortByKey(arr, key) {
		let compareFn = undefined;
		let arrCopy = [...arr];

		console.log('sorting by: ' + sortByFilter);

		if (key == 'name') {
			compareFn = (a, b) => {
				return a.name.localeCompare(b.name);
			};
		} else if (key == 'deadline') {
			compareFn = (a, b) => {
				return moment(a.deadline).isBefore(b.deadline) ? -1 : 1;
			};
		} else if (key == 'assigner') {
			compareFn = (a, b) => {
				return a.assigner.localeCompare(b.assigner);
			};
		}

		return arrCopy.sort(compareFn);
	}
</script>

<svelte:head>
	<title>Tasks | Family Hub</title>
</svelte:head>

<main>
	<article class="tasks">
		<h5>Tasks</h5>
		<header>
			<div class="tasks--assigned--to">
				<button class:selected={!iAssignedFilter} on:click={() => (iAssignedFilter = false)}>
					<p>assigned to me</p>
				</button>
				<button class:selected={iAssignedFilter} on:click={() => (iAssignedFilter = true)}>
					<p>I assigned</p>
				</button>
			</div>
			<div class="tasks--controls">
				<label class="tasks--sort--by">
					sort by
					<select
						name="sort-by"
						bind:value={sortByFilter}
						on:change={sortByKey(tasks, sortByFilter)}
					>
						<option value="name">name</option>
						<option value="deadline">deadline</option>
						<option value="assigner">assigner</option>
					</select>
				</label>
				<label class="tasks--done">
					<input type="checkbox" name="done" bind:checked={doneFilter} />
					done
				</label>
			</div>
		</header>
		<hr />
		<div class="tasks--list">
			{#each sortByKey(tasks, sortByFilter) as task (task.id)}
				{#if !task.isPreset && task.isDone == doneFilter}
					<div class="task">
						<div class="task__color" />
						<div>
							<p class="task__name">{task.name}</p>
							<p class="task__description">{task.description}</p>
						</div>
						<div class="task--assigner">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 19 22" fill="none">
								<path
									d="M9.33331 12.2995C12.4892 12.2995 15.0476 9.77 15.0476 6.64974C15.0476 3.52949 12.4892 1.00003 9.33331 1.00003C6.1774 1.00003 3.61903 3.52949 3.61903 6.64974C3.61903 9.77 6.1774 12.2995 9.33331 12.2995ZM9.33331 12.2995C1.33331 12.2995 1.33331 18.8531 1.33331 21H17.3333C17.3333 18.8531 17.3333 12.2995 9.33331 12.2995Z"
								/>
							</svg>
							<p>{task.assigner}</p>
						</div>
						<div class="task--deadline">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 18 18" fill="none">
								<path
									d="M9 5V9H12.5M17 9C17 13.4183 13.4183 17 9 17C4.58172 17 1 13.4183 1 9C1 4.58172 4.58172 1 9 1C13.4183 1 17 4.58172 17 9Z"
									stroke-linecap="round"
								/>
							</svg>
							<p>{moment(task.deadline).format('ddd, MMM Do YYYY - h:mm A')}</p>
						</div>
						<form
							action="?/markTaskDone"
							method="POST"
							use:enhance={({ formData }) => {
								formData.append('taskId', task.id);
							}}
						>
							<button name="done" value={task.id}>
								Mark as {task.isDone ? 'undone' : 'done'}
							</button>
						</form>
					</div>
				{/if}
			{/each}
		</div>
	</article>
	<article class="assign">
		<h5>Assign a new task</h5>
		<hr />
		<form action="?/assignTask" method="POST">
			<div>
				<Input name="name" placeholder="Task name" autocomplete="off" />
				<select name="preset">
					{#each tasks as task (task.id)}
						{#if task.isPreset}
							<option value={task.id}>{task.name}</option>
						{/if}
					{/each}
				</select>
			</div>
			<div class="assign--description">
				<p>Description</p>
				<Input type="textarea" name="description" placeholder="Task description" />
			</div>
			<div class="assign--assign--to">
				<p>Assign to</p>
				{#each members as member (member.id)}
					<div class="assign--member">
						<img
							src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HLuY60jzx5puuKjbqmWRRwHaEK%26pid%3DApi&f=1&ipt=81902346e97e5047450710dbf2dc44a617d314d0fed95f8335f2349afb971699&ipo=images"
							alt={member.name}
						/>
						<p>{member.name}</p>
					</div>
				{/each}
			</div>
			<div class="assign--deadline">
				<p>Set deadline</p>
				<div class="deadline--time">
					<!-- <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 22" fill="none">
						<path
							d="M11.6541 11.0131H10.6541C10.6541 11.5654 11.1018 12.0131 11.6541 12.0131V11.0131ZM12.6541 5.03752C12.6541 4.48524 12.2064 4.03752 11.6541 4.03752C11.1018 4.03752 10.6541 4.48524 10.6541 5.03752H12.6541ZM15.2666 12.0131C15.8189 12.0131 16.2666 11.5654 16.2666 11.0131C16.2666 10.4608 15.8189 10.0131 15.2666 10.0131V12.0131ZM12.6541 11.0131V5.03752H10.6541V11.0131H12.6541ZM15.2666 10.0131H11.6541V12.0131H15.2666V10.0131ZM20.6666 11C20.6666 15.9706 16.6372 20 11.6666 20V22C17.7418 22 22.6666 17.0752 22.6666 11H20.6666ZM11.6666 20C6.69606 20 2.66663 15.9706 2.66663 11H0.666626C0.666626 17.0752 5.59149 22 11.6666 22V20ZM2.66663 11C2.66663 6.02946 6.69606 2.00003 11.6666 2.00003V2.67029e-05C5.59149 2.67029e-05 0.666626 4.92489 0.666626 11H2.66663ZM11.6666 2.00003C16.6372 2.00003 20.6666 6.02946 20.6666 11H22.6666C22.6666 4.92489 17.7418 2.67029e-05 11.6666 2.67029e-05V2.00003Z"
						/>
					</svg> -->
					<Input type="time" name="hour" />
				</div>
				<div class="deadline--date">
					<!-- <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 14 14" fill="none">
						<path
							d="M1 5.00003H13M10.3333 7.66763L3.66667 7.6667M5.88887 10.3337L3.66667 10.3334M3.66667 1.00003V2.33336M10.3333 1.00003V2.33336M3.13333 13H10.8667C11.6134 13 11.9868 13 12.272 12.8547C12.5229 12.7269 12.7269 12.5229 12.8547 12.272C13 11.9868 13 11.6134 13 10.8667V4.4667C13 3.71996 13 3.34659 12.8547 3.06138C12.7269 2.81049 12.5229 2.60652 12.272 2.47869C11.9868 2.33336 11.6134 2.33336 10.8667 2.33336H3.13333C2.3866 2.33336 2.01323 2.33336 1.72801 2.47869C1.47713 2.60652 1.27315 2.81049 1.14533 3.06138C1 3.34659 1 3.71996 1 4.4667V10.8667C1 11.6134 1 11.9868 1.14533 12.272C1.27315 12.5229 1.47713 12.7269 1.72801 12.8547C2.01323 13 2.38659 13 3.13333 13Z"
							stroke-linecap="round"
							stroke-linejoin="round"
						/>
					</svg> -->
					<Input type="date" />
				</div>
			</div>
			<div class="assign--buttons">
				<Button type="button" name="save-as-preset">Save as preset</Button>
				<Button>Create</Button>
			</div>
		</form>
	</article>
</main>

<style>
	main {
		display: flex;
		justify-content: space-between;
		padding-inline: var(--padding-900);
		gap: 8rem;
	}

	/* tasks */

	.tasks {
		display: flex;
		flex-direction: column;
		gap: var(--padding-400);
		width: 100%;
		color: var(--text);
	}

	.tasks > header {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: var(--padding-700);
	}

	.tasks--assigned--to {
		display: flex;
		flex-wrap: wrap;
		gap: 0 var(--padding-400);
		white-space: nowrap;
	}

	.tasks--assigned--to > button {
		background-color: transparent;
		border: none;
		padding-block: var(--padding-100);
		cursor: pointer;
		color: inherit;
	}

	.tasks--assigned--to > button.selected {
		color: var(--accent);
	}

	.tasks--controls {
		display: flex;
		flex-wrap: wrap;
		gap: var(--padding-300) var(--padding-400);
	}

	.tasks--sort--by select {
		background-color: var(--background);
		border: none;
		color: var(--text);
	}

	.tasks--done {
		cursor: pointer;
	}

	.tasks--done input[type='checkbox'] {
		appearance: none;
		width: 1rem;
		aspect-ratio: 1/1;
		background-color: transparent;
		border: solid 2px var(--accent);
		vertical-align: middle;
		cursor: pointer;
	}

	.tasks--done input[type='checkbox']:checked {
		background-color: var(--accent);
	}

	.tasks--list {
		margin-left: var(--padding-400);
	}

	.task {
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: center;
		flex-wrap: wrap;
		gap: var(--padding-400);
		padding: var(--padding-500);
		padding-right: 0;
	}

	.task p {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.task svg {
		position: relative;
		width: 1rem;
		aspect-ratio: 1;
		stroke: var(--text);
		stroke-width: 2px;
	}

	.task__color {
		position: absolute;
		left: 0;
		width: 0.5rem;
		height: 80%;
		background-image: linear-gradient(to bottom, var(--accent), var(--primary));
	}

	.task__name {
		max-width: 24ch;
		font-weight: 500;
	}

	.task__description {
		max-width: 32ch;
		font-size: var(--fs-300);
	}

	.task--assigner {
		display: flex;
		gap: var(--padding-300);
	}

	.task--deadline {
		display: flex;
		gap: var(--padding-300);
	}

	.task button {
		padding: var(--padding-100) var(--padding-400);
		border-radius: var(--br);
		border: none;
		color: white;
		background-image: linear-gradient(to bottom, var(--primary), var(--accent));
		cursor: pointer;
	}

	/* assign */

	.assign {
		color: var(--text);
	}
</style>
