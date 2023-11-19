<script>
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
			deadline: '17:00, 05/12/23',
			isPreset: true
		},
		{
			id: 2,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!',
			deadline: '17:00, 23/10/23',
			isPreset: false
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
			<div class="tasks--controls">
				<select name="sort-by">
					<option value="name">Name</option>
					<option value="deadline">Deadline</option>
					<option value="assigner">Assigner</option>
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
				{#if !task.isPreset}
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
						<form action="?/markTaskDone" method="POST">
							<button name="done" value={task.id}>Mark as Done</button>
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
				<Input name="name" placeholder="Task name" />
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

	.tasks {
		color: var(--text);
	}

	.assign {
		color: var(--text);
	}
</style>
