<script>
    import { enhance } from '$app/forms';
	import { fly } from 'svelte/transition';
    
    /** @type {import('./$types').LayoutData} */
	export let data;
	let theme = data.theme;

	function switchTheme() {
		theme = theme == 'dark' ? 'light' : 'dark';
		document.querySelector('html').setAttribute('data-theme', theme); // change theme on root
	}

	function handleSwitchTheme() {
		switchTheme();
		return async ({ update }) => {
			await update({ reset: false });
		};
	}
</script>

<nav class="nav">
	<p><a href="/" class="nav__link">Family Hub</a></p>
	<form action="/?/changetheme" method="POST" use:enhance={handleSwitchTheme}>
		<button class="nav__theme" name="switch-theme" value={theme} title="switch theme">
			{#if theme == 'light'}
				<svg
					viewBox="0 0 24 24"
					fill="none"
					xmlns="http://www.w3.org/2000/svg"
					in:fly={{ y: '.5rem' }}
					><g stroke-linecap="round" stroke-linejoin="round" /><g id="SVGRepo_iconCarrier">
						<path
							d="M12 3V4M12 20V21M4 12H3M6.31412 6.31412L5.5 5.5M17.6859 6.31412L18.5 5.5M6.31412 17.69L5.5 18.5001M17.6859 17.69L18.5 18.5001M21 12H20M16 12C16 14.2091 14.2091 16 12 16C9.79086 16 8 14.2091 8 12C8 9.79086 9.79086 8 12 8C14.2091 8 16 9.79086 16 12Z"
							stroke-linecap="round"
							stroke-linejoin="round"
						/>
					</g>
				</svg>
			{:else if theme == 'dark'}
				<svg
					viewBox="0 0 24 24"
					fill="none"
					xmlns="http://www.w3.org/2000/svg"
					in:fly={{ y: '.5rem' }}
					><g stroke-linecap="round" stroke-linejoin="round" /><g>
						<path
							d="M13 6V3M18.5 12V7M14.5 4.5H11.5M21 9.5H16M15.5548 16.8151C16.7829 16.8151 17.9493 16.5506 19 16.0754C17.6867 18.9794 14.7642 21 11.3698 21C6.74731 21 3 17.2527 3 12.6302C3 9.23576 5.02061 6.31331 7.92462 5C7.44944 6.05072 7.18492 7.21708 7.18492 8.44523C7.18492 13.0678 10.9322 16.8151 15.5548 16.8151Z"
							stroke-linecap="round"
							stroke-linejoin="round"
						/>
					</g>
				</svg>
			{/if}
		</button>
	</form>
	<p><a href="/login" class="nav__link">Log In</a></p>
</nav>

<slot />

<style>
    @import '../index.css';
	@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800;900&display=swap');
    
    /* nav */
	.nav {
		--theme-height: 3rem;

		display: flex;
		flex-wrap: wrap;
		align-items: center;
		gap: 2rem;
		padding: var(--padding-600) var(--padding-700);
		background-color: var(--background);
	}

	.nav__link {
		text-decoration: none;
		color: var(--text);
	}

	.nav > *:nth-last-child(2) {
		margin-left: auto;
	}

	.nav__theme {
		display: flex;
		background-color: transparent;
		border: none;
	}

	.nav__theme > svg {
		width: var(--theme-height);
		stroke: var(--text);
		stroke-width: 1.5px;
		aspect-ratio: 1;
		cursor: pointer;
	}
</style>
