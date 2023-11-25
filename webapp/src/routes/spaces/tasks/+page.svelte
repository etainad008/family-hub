<script>
	import moment from 'moment';

	import { fly } from 'svelte/transition';

	import { enhance } from '$app/forms';

	import Input from '$lib/components/Input.svelte';
	import Button from '$lib/components/Button.svelte';
	import Progress from '$lib/components/Progress.svelte';

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
			name: 'Mishi bijo',
			status: 'at work'
		},
		{
			id: 4,
			name: 'Mishi hello y fsdf sdf es yes',
			status: 'at work'
		},
		{
			id: 5,
			name: 'Mishi hello y fsdf sdf es yes',
			status: 'at work'
		},
		{
			id: 6,
			name: 'Mishi hello y fsdf sdf es yes',
			status: 'at work'
		},
		{
			id: 7,
			name: 'Mishi hello y fsdf sdf es yes',
			status: 'at work'
		},
		{
			id: 8,
			name: 'sf es yes',
			status: 'at work'
		},
		{
			id: 9,
			name: 'Mishi es',
			status: 'at work'
		},
		{
			id: 10,
			name: 'sf es yes',
			status: 'at work'
		},
		{
			id: 11,
			name: 'sf es yes',
			status: 'at work'
		},
		{
			id: 811,
			name: 'sf es yes',
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
		},
		{
			id: 3,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!',
			deadline: '2015-09-08T16:02:17+03:00',
			isDone: false,
			isPreset: false
		},
		{
			id: 4,
			name: 'Clean room',
			assigner: 'mom',
			description: 'Clean the room now!!',
			deadline: '2015-09-08T16:02:17+03:00',
			isDone: false,
			isPreset: false
		},
		{
			id: 5,
			name: 'Do Homework',
			assigner: 'me',
			description: 'Do math homework on page 82',
			deadline: '2015-09-08T08:02:17+03:00',
			isDone: false,
			isPreset: false
		},
	];

	// tasks

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

	// assign

	let isAssign = true;
	let assignSteps = [
		{
			name: "preset",
			title: "Use a preset",
			subtitle: "Choose a task preset you have ready"
		},
		{
			name: "name",
			title: "Set a name",
			subtitle: "The name will be shown to other members"
		},
		{
			name: "description",
			title: "Set a description",
			subtitle: "This can be used for information such as instructions, advice, etc."
		},
		{
			name: "members",
			title: "Assign to members",
			subtitle: "The task will be assigned to these members"
		},
		{
			name: "deadline",
			title: "Set a deadline",
			subtitle: "The task needs to be done before this deadline"
		},
		{
			name: "confirmation",
			title: "Confirm your task",
			subtitle: "Check the task's information. When you are ready, click \"assign\""
		}
	]
	let currentAssignStepIndex = 0;
	$: currentAssignStep  = assignSteps[currentAssignStepIndex];

	let currentAssignData = {
		preset: "no",
		name: "",
		description: "",
		members: [],
		deadline: "",
	};

	function assignTask() {
		isAssign = true;
	}

	function endAssignTask() {
		isAssign = false;
		currentAssignData = {
			preset: "no",
			name: "",
			description: "",
			members: [],
			deadline: "",
		};
		currentAssignStepIndex = 0;
	}

	function nextAssignStep() {
		if(currentAssignStepIndex < assignSteps.length - 1) {
			currentAssignStepIndex += 1;
		}
	}

	function previousAssignStep() {
		if(currentAssignStepIndex > 0) {
			currentAssignStepIndex -= 1;
		}
	}

	function handleClickMember(id) {
		let selectedMembers = currentAssignData.members;

		console.log("hey");

		if(selectedMembers.includes(id)) {
			selectedMembers.splice(selectedMembers.indexOf(id));
		} else {
			selectedMembers.push(id);
		}
		currentAssignData = currentAssignData;
	}
</script>

<svelte:head>
	<title>Tasks | Family Hub</title>
</svelte:head>

<main>
	{#if !isAssign}
		<article class="tasks" in:fly={{y: ".5rem", duration: 300}}>
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
			<button class="tasks--new" title="Add new task"
				on:click={assignTask}
			>
			<div class="tasks--new--plus">
				<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="none">
					<path
						d="M10 2V10V18M18 10H2"
						stroke-linecap="round"
						stroke-linejoin="round"
						fill="blue"
					/>
				</svg>
			</div>
				<p>Assign a new task</p>
			</button>
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
	{:else if isAssign}
		<article class="assign">
			<button
				class="assign__return"
				on:click={endAssignTask}
			>
				return to tasks
			</button>
			{#key currentAssignStep}
				<h4 in:fly={{y: "1rem", duration: 300, delay: 30}}>{currentAssignStep.title}</h4>
				<p in:fly={{y: "1rem", duration: 600, delay: 60}}>{currentAssignStep.subtitle}</p>
			{/key}
			<div class="assign--step {currentAssignStep.name}">
				{#if currentAssignStep.name == "preset"}
					<select name="preset" bind:value={currentAssignData.preset} in:fly={{x: "-1rem", duration: 300}}>
						<option value="no">no preset</option>
						{#each tasks as task (task.id)}
							{#if task.isPreset}
								<option>{task.name}</option>
							{/if}
						{/each}
					</select>
				{:else if currentAssignStep.name == "name"}
					<input type="text" placeholder="name" bind:value={currentAssignData.name} in:fly={{x: "-1rem", duration: 300}} />
				{:else if currentAssignStep.name == "description"}
					<textarea rows="3" cols="24" placeholder="description" bind:value={currentAssignData.description} in:fly={{x: "-1rem", duration: 300}} />
				{:else if currentAssignStep.name == "members"}
					<ul in:fly={{x: "-1rem", duration: 300}}>
						{#each members as member, index (member.id)}
							<li in:fly={{x: "-1rem", duration: 600, delay: 5000 }}>
								<button class:selected={currentAssignData.members.includes(member.id)} on:click={() => {
									let selectedMembers = currentAssignData.members;

									if(selectedMembers.includes(member.id)) {
										selectedMembers.splice(selectedMembers.indexOf(member.id), 1);
									} else {
										selectedMembers.push(member.id);
									}
									currentAssignData = currentAssignData;
								}}>
									<img
										src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HLuY60jzx5puuKjbqmWRRwHaEK%26pid%3DApi&f=1&ipt=81902346e97e5047450710dbf2dc44a617d314d0fed95f8335f2349afb971699&ipo=images"
										alt={member.name}
									/>
									<p>{member.name}</p>
								</button>
							</li>
						{/each}
					</ul>
				{:else if currentAssignStep.name == "deadline"}
				d
				{:else if currentAssignStep.name == "confirmation"}
				f
				{/if}
			</div>
			<div class="assign--buttons">
				<button
					class="assign__back"
					on:click={previousAssignStep}
					disabled={currentAssignStepIndex == 0}
				>
					go back
				</button>
				<!-- <div class="assign--progress">
					<p>{currentAssignStepIndex+1}</p>
					<Progress type="bar" value={currentAssignStepIndex+1} maxValue={assignSteps.length}></Progress>
					<p>{assignSteps.length}</p>
				</div> -->
				<button
					class="assign__next"
					on:click={nextAssignStep}
					disabled={
						// no selected members
						(assignSteps[currentAssignStepIndex].name == "name" && currentAssignData.name.length < 1)
						||
						// no selected members
						(assignSteps[currentAssignStepIndex].name == "members" && currentAssignData.members.length  < 1)
					}
				>
					{currentAssignStepIndex == assignSteps.length-1 ? "confirm" : "assign"}
				</button>

			</div>
		</article>
		<!-- <form action="?/assignTask" method="POST" class="assign">
			<h5>Assign a new task</h5>
			<label>
				use preset
				<select name="preset" class="assign__preset">
					<option value="no">no preset</option>
					{#each tasks as task (task.id)}
						{#if task.isPreset}
							<option value={task.id}>{task.name}</option>
						{/if}
					{/each}
				</select>
			</label>
			<hr />
			<div class="assign--fields">
				<div class="assign--name">
					<Input name="name" placeholder="Task name" autocomplete="off" />
				</div>
				<div class="assign--description">
					<p>Description</p>
					<Input type="textarea" name="description" placeholder="Task description" />
				</div>
				<div class="assign--assign--to">
					<p>Assign to</p>
					<div class="assign--members">
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
				</div>
				<div class="assign--deadline">
					<p>Set deadline</p>
					<div class="deadline--datetime">

						<Input type="datetime-local" />
					</div>
				</div>
				<div class="assign--buttons">
					<button type="button" name="save-as-preset">
						Save as preset
					</button>
					<button name="assign">
						Assign
					</button>
				</div>
			</div>
		</form> -->
	{/if}
</main>

<style>
	main {
		display: flex;
		justify-content: center;
		padding-inline: var(--padding-900);
		gap: 8rem;
		height: 34rem;
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
		cursor: pointer;
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

	.tasks--new {
		display: flex;
		align-items: center;
		gap: 0.75rem;
		width: fit-content;
		background-color: transparent;
		border: none;
		color: inherit;
		white-space: nowrap;
		cursor: pointer;
	}

	.tasks--new--plus {
		min-width: 2.5em;
		padding: 0.5em;
		background-color: transparent;
		border: 0.25em solid var(--accent);
		border-radius: var(--br);
	}

	.tasks--new--plus > svg {
		stroke: var(--text);
		stroke-width: 0.25em;
	}

	.tasks--list {
		margin-left: var(--padding-400);
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
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: center;
		flex-wrap: wrap;
		gap: var(--padding-400);
		padding: var(--padding-500);
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

	/* .assign {
		display: flex;
		flex-direction: column;
		gap: var(--padding-400);
		flex-grow: 1;
		color: var(--text);
	}

	.assign__preset {
		background-color: var(--background);
		border: none;
		color: var(--text);
		cursor: pointer;
		padding-right: var(--padding-400);
	}

	.assign--fields {
		display: flex;
		flex-direction: column;
		gap: var(--padding-400);
		padding-inline: var(--padding-400);
		overflow: hidden auto;
	}

	.assign--fields::-webkit-scrollbar {
		width: 0.5em;
	}

	.assign--fields::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}

	.assign--name {
		width: 32ch;
	}

	.assign--description {
		display: flex;
		flex-direction: column;
		gap: var(--padding-200);
		width: 48ch;
	}

	.assign--assign--to {
		display: flex;
		flex-direction: column;
		gap: var(--padding-200);
	}
	
	.assign--members {
		direction: rtl;
		display: flex;
		flex-direction: column;
		gap: var(--padding-200);
		max-height: 8rem;
		overflow: hidden auto;
		padding-left: var(--padding-200);
	}

	.assign--members::-webkit-scrollbar {
		width: 0.5em;
	}

	.assign--members::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}

	.assign--member {
		direction: ltr;
		display: flex;
		align-items: center;
		gap: var(--padding-200);
		padding: var(--padding-100);
		font-size: var(--fs-200);
		border-radius: 100vw;
		border: 2px solid var(--accent);
	}

	.assign--member > img {
		width: 3rem;
		aspect-ratio: 1/1;
		object-fit: cover;
		border-radius: 50%;
	}

	.assign--deadline {
		display: flex;
		flex-direction: column;
		gap: var(--padding-200);
	}

	.deadline--datetime {
		display: flex;
		gap: var(--padding-400);
	}

	.deadline--datetime::-webkit-datetime-edit-text {
		font-size: var(--fs-300);
	}

	.assign--buttons {
		display: flex;
		justify-content: space-between;
	}

	.assign--buttons > button {
		padding: var(--padding-100) var(--padding-400);
		border-radius: var(--br);
		border: none;
		color: white;
		background-image: linear-gradient(to bottom, var(--primary), var(--accent));
		cursor: pointer;
	} */


	/* ----------------------- */

	.assign {
		position: relative;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		gap: var(--padding-200);
		width: 100%;
		color: var(--text);
	}

	.assign__return {
		position: absolute;
		top: 0;
		left: 0;
		padding: var(--padding-100) var(--padding-400);
		border-radius: var(--br);
		border: none;
		color: white;
		background-image: linear-gradient(to bottom, var(--primary), var(--accent));
		cursor: pointer;
	}

	.assign--progress {
		display: flex;
		gap: var(--padding-400);
		width: 24rem;
	}

	.assign--step {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-grow: .75;
		width: 50%;
		font-size: var(--fs-500);
	}

	.assign--step.preset > select {
		background-color: transparent;
		color: var(--text);
		padding-right: var(--padding-400);
		border: none;
		border-bottom: 2px solid var(--accent);
		outline: none;
		cursor: pointer;
	}

	.assign--step.name > input {
		background-color: var(--text);
		color: var(--background);
		border: none;
		border-radius: 100vw;
		padding: var(--padding-100) var(--padding-400);
	}

	.assign--step.description > textarea {
		padding: var(--padding-100) var(--padding-400);
		background-color: var(--text);
		border: none;
		border-radius: var(--br);
		color: var(--background);
		resize: none;
	}

	.assign--step.description > textarea::-webkit-scrollbar {
		width: 0.5em;
	}

	.assign--step.description > textarea::-webkit-scrollbar-thumb {
		background-color: var(--accent);
		border-radius: 100vw;
	}

	.assign--step.members > ul {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: var(--padding-400);
		overflow: hidden scroll;
		list-style: none;
		flex-grow: 1;
		max-height: 16rem;
		font-size: initial;
	}

	.assign--step.members > ul::-webkit-scrollbar {
		width: 0.5em;
	}

	.assign--step.members > ul::-webkit-scrollbar-thumb {
		background-image: linear-gradient(to bottom, var(--accent), var(--text));
		background-color: var(--text);
		border-radius: 100vw;
	}
	
	.assign--step.members > ul > li button {
		position: relative;
		display: flex;
		gap: var(--padding-400);
		align-items: center;
		padding: var(--padding-200);
		padding-right: var(--padding-900);
		background-color: transparent;
		border-radius: 100vw;
		border: 2px solid transparent;
		cursor: pointer;
	}

	.assign--step.members > ul > li button:hover {
		text-decoration: underline 2px var(--accent);
	}
	
	.assign--step.members > ul > li > button.selected {
		border-color: var(--accent);
	}

	.assign--step.members > ul > li img {
		width: 4rem;
		aspect-ratio: 1/1;
		object-fit: cover;
		border-radius: 50%;
	}

	.assign--step.members > ul > li button > * {
		pointer-events: none;
	}

	.assign--buttons {
		display: flex;
		align-items: center;
		gap: var(--padding-900);
		margin-top: auto;
		margin-bottom: var(--padding-400);
	}

	.assign--buttons > button {
		padding: var(--padding-100) var(--padding-400);
		border-radius: var(--br);
		border: none;
		color: white;
		background-image: linear-gradient(to bottom, var(--primary), var(--accent));
		cursor: pointer;
	}

	.assign--buttons > button:disabled {
		filter: saturate(0);
		cursor: initial;
	}
</style>
