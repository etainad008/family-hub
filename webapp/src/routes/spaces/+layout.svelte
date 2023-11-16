<script>
	import Progress from '$lib/components/Progress.svelte';

	/** @type {import('./$types').LayoutData} */
	export let data;

	let family;
</script>

<header>
	<div class="top--header">
		<section class="account">
			<div class="account--picture">
				<Progress type="circle" maxValue={4} value={4} />
				<img
					src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.8QRdhC_5aU7Z-uedJmXDowHaHa%26pid%3DApi&f=1&ipt=3d5250e2bac8fa86b82b4318f5945815fd1bfa072c0af5880d01d6da6d9b4664&ipo=images"
					alt="pfp"
				/>
			</div>
			<article class="account--details">
				<h5 class="name">Etai</h5>
				<p class="tasks__done"><span>1</span> out of <span>2</span> tasks done</p>
			</article>
		</section>
		<section class="icons">
			<!-- dashboard -->
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 35" fill="none">
				<path d="M2 2H11.9623V33H2V2Z" stroke-linejoin="round" />
				<path d="M18 15.4528H34V33H18V15.4528Z" stroke-linejoin="round" />
				<path d="M18 2H34V9.60377H18V2Z" stroke-linejoin="round" />
			</svg>
			<!-- tasks -->
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 35" fill="none">
				<path
					d="M9.99959 17.4995L15.3319 22.6652L25.9988 12.334M2 17.4995C2.00055 10.1053 7.39273 3.74119 14.8789 2.29914C22.3651 0.857101 29.8603 4.73876 32.7808 11.5703C35.7014 18.4018 33.2338 26.2804 26.8872 30.3881C20.5405 34.4958 12.0824 33.6883 6.68548 28.4596C3.68513 25.5526 1.9997 21.6103 2 17.4995Z"
					stroke-linecap="round"
					stroke-linejoin="round"
				/>
			</svg>
			<!-- events -->
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 36 35" fill="none">
				<path
					d="M9.11111 2V7.16667M26.8889 2V7.16667M9.28892 31.2778C10.1125 27.3473 13.6996 24.3889 18 24.3889C22.3004 24.3889 25.8875 27.3473 26.7111 31.2778M7.68889 33H28.3111C30.3024 33 31.2981 33 32.0587 32.6246C32.7276 32.2944 33.2716 31.7674 33.6124 31.1193C34 30.3826 34 29.4179 34 27.4889V10.9556C34 9.02648 34 8.06195 33.6124 7.32515C33.2716 6.67702 32.7276 6.15009 32.0587 5.81987C31.2981 5.44444 30.3024 5.44444 28.3111 5.44444H7.68889C5.6976 5.44444 4.70194 5.44444 3.94137 5.81987C3.27234 6.15009 2.72841 6.67702 2.38754 7.32515C2 8.06195 2 9.02648 2 10.9556V27.4889C2 29.4179 2 30.3826 2.38754 31.1193C2.72841 31.7674 3.27234 32.2944 3.94137 32.6246C4.70194 33 5.69758 33 7.68889 33ZM21.5556 15.7778C21.5556 17.6801 19.9637 19.2222 18 19.2222C16.0363 19.2222 14.4444 17.6801 14.4444 15.7778C14.4444 13.8755 16.0363 12.3333 18 12.3333C19.9637 12.3333 21.5556 13.8755 21.5556 15.7778Z"
					stroke-linecap="round"
					stroke-linejoin="round"
				/>
			</svg>
		</section>
	</div>

	<hr />

	<div class="family">
		<label for="family"><h4>{family}</h4></label>
		<select name="family" id="family" bind:value={family}>
			<option>Nadler</option>
			<option>Mishi</option>
			<option>Rubinstein</option>
		</select>
	</div>
</header>

<slot />

<style>
	@import '../../index.css';

	header {
		display: flex;
		flex-direction: column;
		gap: 1.25rem;
		padding: 0 var(--padding-900) var(--padding-600);
	}

	.top--header {
		display: flex;
		justify-content: space-between;
	}

	.top--header > section:first-child {
		/* Account detail */
		display: flex;
		align-items: center;
		gap: 1rem;
	}

	.account--picture {
		position: relative;
		display: grid;
		grid-template-areas: 'stack';
		height: 100%;
		aspect-ratio: 1/1;
		border-radius: 50%;
	}

	.account--picture > * {
		grid-area: stack;
	}

	.account--picture > img {
		position: absolute;
		border-radius: 50%;
		inset: 0;
		margin: auto;
		width: 80%;
	}

	.account--details {
		padding-block: 0.5rem;
		color: var(--text);
	}

	.tasks__done {
		white-space: nowrap;
	}

	.tasks__done > span {
		font-weight: 700;
	}

	.icons {
		display: flex;
		align-items: center;
		gap: 0.5rem;
	}

	.icons > * {
		width: 3rem;
		stroke: var(--text);
		stroke-width: 0.25rem;
		padding: 0.5rem;
		border-radius: calc(var(--br) / 2);
		cursor: pointer;
	}

	.icons > *:first-child {
		/* background-image: linear-gradient(to bottom, var(--secondary), var(--accent)); */
		background-color: var(--accent);
	}

	hr {
		border: none;
		border-top: 1px solid var(--text);
		opacity: 0.25;
	}

	/* family */
	#family {
		position: relative;
		width: 100%;
		/* padding: var(--padding-300); */
		font-size: var(--fs-400);
		border: none;
		opacity: 0;
		cursor: pointer;
	}

	#family > option {
		background-color: var(--text);
		/* background-color: blue; */
		margin-left: 16px;
		color: var(--background);
	}

	.family {
		position: relative;
		display: grid;
		grid-template-areas: 'stack';
		justify-items: center;
		width: fit-content;
		margin-left: 2rem;
		color: var(--text);
	}

	.family > * {
		grid-area: stack;
	}

	.family::after {
		content: '';
		position: absolute;
		inset: auto 0 0.5em 0;
		height: 0.25em;
em;
		color: var(--text);
	}

	.family > * {
		grid-area: stack;
	}

	.family::after {
		content: "";
		position: absolute;
		inset: auto 0 .5em 0 ;
		height: .25em;
		background-image: linear-gradient(to right, var(--accent), var(--primary));
		transition: transform 150ms cubic-bezier(1, 0, 0, 1);
		transform-origin: left;
		transform: scaleX(0);
		z-index: -1;
	}

	.family:hover::after {
		transform: scaleX(1);
	}
</style>
