<script>
	import Button from '$lib/components/Button.svelte';
	import Input from '$lib/components/Input.svelte';

	import { fly } from 'svelte/transition';

	/** @type {import('./$types').PageData} */
	// export let data;
</script>

<svelte:head>
	<title>Login | Family Hub</title>
</svelte:head>

<main in:fly={{ y: '.25rem', duration: 300 }}>
	<form action="?/login">
		<header class="login--header">
			<h2>Login</h2>
			<div class="header--line" />
		</header>
		<div class="login--form">
			<div class="fields">
				<label>
					<h3>Username</h3>
					<input
						type="text"
						name="username"
						placeholder="username"
						autocomplete="username"
						required
					/>
				</label>
				<label>
					<h3>Password</h3>
					<input
						type="password"
						name="password"
						placeholder="password"
						autocomplete="current-password"
						required
					/>
				</label>
				<Button style="margin-top: 1.5rem">Login</Button>
			</div>
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 293" fill="none">
				<path
					d="M120 162.806C159.449 162.806 191.429 130.838 191.429 91.4028C191.429 51.9681 159.449 20 120 20C80.5511 20 48.5714 51.9681 48.5714 91.4028C48.5714 130.838 80.5511 162.806 120 162.806ZM120 162.806C20 162.806 20 245.633 20 272.766H220C220 245.633 220 162.806 120 162.806Z"
				/>
			</svg>
		</div>
	</form>
</main>

<style>
	/* login */
	main {
		display: flex;
		justify-content: center;
		align-items: center;
		padding: var(--padding-900);
	}

	form {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
		width: 50vw;
		min-width: 30rem;
		max-width: 48rem;
	}

	.login--header {
		display: flex;
		align-items: center;
		gap: 2rem;
	}

	.login--header > h2 {
		color: var(--text);
	}

	.header--line {
		flex-grow: 1;
		height: 2.5rem;
		border-radius: var(--br);
		/* background-color: var(--text); */
		background-image: linear-gradient(to left, var(--secondary), var(--primary));
	}

	.login--form {
		position: relative;
		background-color: var(--primary);
		border-radius: var(--br);
		padding: var(--padding-600) var(--padding-800) var(--padding-800);
		overflow: hidden;
	}

	.login--form > svg {
		position: absolute;
		stroke: var(--accent);
		stroke-width: 2rem;
		inset: 0;
		margin: auto;
		left: auto;
		translate: 50% 0;
		height: 104%;
	}

	.fields {
		display: flex;
		flex-direction: column;
		gap: 1.5rem;
	}

	label {
		color: var(--background);
	}

	input {
		width: 60%;
		padding: var(--padding-100) var(--padding-400);
		background-color: var(--secondary);
		border: none;
		/* border: 2px solid var(--secondary); */
		border-radius: var(--br);
		color: var(--text);
		font-size: var(--p);
	}

	input:-webkit-autofill {
		box-shadow: inset 0 0 1rem 2rem var(--secondary);
		-webkit-text-fill-color: var(--text);
	}
</style>
