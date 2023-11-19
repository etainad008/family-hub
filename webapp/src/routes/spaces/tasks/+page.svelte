<script>
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
			deadline: '17:00, 05/12/23'
		},
		{
			id: 2,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!',
			deadline: '17:00, 23/10/23'
		}
	];
</script>

<svelte:head>
	<title>Tasks | Family Hub</title>
</svelte:head>

<main>
	<article class="tasks">
		<h5>Tasks</h5>
		<header>
			<div class="tasks--assigned--to">
				<button><p>assigned to me</p></button>
				<button><p>I assigned</p></button>
			</div>
			<div class="tasks--controls" style="margin-left: auto;">
				<select name="sort-by">
					<option>Name</option>
					<option>Deadline</option>
					<option>Assigner</option>
				</select>
				<label>
					<input type="checkbox" />
					done
				</label>
			</div>
		</header>
		<hr />
		<div class="tasks--list">
			{#each tasks as task (task.id)}
				<div class="task">
					<div class="task__color" />
					<div class="task--name--desc">
						<p>{task.name}</p>
						<p>{task.description}</p>
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
						<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 23 22" fill="none">
							<path
								d="M11.6541 11.0131H10.6541C10.6541 11.5654 11.1018 12.0131 11.6541 12.0131V11.0131ZM12.6541 5.03752C12.6541 4.48524 12.2064 4.03752 11.6541 4.03752C11.1018 4.03752 10.6541 4.48524 10.6541 5.03752H12.6541ZM15.2666 12.0131C15.8189 12.0131 16.2666 11.5654 16.2666 11.0131C16.2666 10.4608 15.8189 10.0131 15.2666 10.0131V12.0131ZM12.6541 11.0131V5.03752H10.6541V11.0131H12.6541ZM15.2666 10.0131H11.6541V12.0131H15.2666V10.0131ZM20.6666 11C20.6666 15.9706 16.6372 20 11.6666 20V22C17.7418 22 22.6666 17.0752 22.6666 11H20.6666ZM11.6666 20C6.69606 20 2.66663 15.9706 2.66663 11H0.666626C0.666626 17.0752 5.59149 22 11.6666 22V20ZM2.66663 11C2.66663 6.02946 6.69606 2.00003 11.6666 2.00003V2.67029e-05C5.59149 2.67029e-05 0.666626 4.92489 0.666626 11H2.66663ZM11.6666 2.00003C16.6372 2.00003 20.6666 6.02946 20.6666 11H22.6666C22.6666 4.92489 17.7418 2.67029e-05 11.6666 2.67029e-05V2.00003Z"
							/>
						</svg>
						<p>{task.deadline}</p>
					</div>
					<form action="?/markTaskDone">
						<button name="done" value={task.id}>Mark as Done</button>
					</form>
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
		gap: 8rem;
	}

	.tasks {
		color: var(--text);
	}
</style>
