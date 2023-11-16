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

	</div>
	<div class="status">

	</div>
</main>