<script>
	/** @type {import('./$types').LayoutData} */
	export let data;
</script>

<header>
	<div class="top--header">
		<section>
			<div class="picture" data-per="45deg" />
			<!-- should be an img element -->
			<div class="details">
				<h4 class="name">Etai</h4>
				<p class="tasks__done"><span>1</span> out of <span>2</span> tasks done</p>
			</div>
		</section>
		<section class="icons">
			<!-- svg * 3 -->
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

	<div class="line" />
	<!-- <hr /> -->

	<form action="?/changefamily" method="POST">
		<select name="family">
			<option value="Nadler">Nadler</option>
			<option value="Mishi">Mishi</option>
		</select>
	</form>
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
		display: flex;
		align-items: center;
		gap: 2rem;
	}

	.picture {
		position: relative;
		height: 80%;
		aspect-ratio: 1/1;
		background-color: firebrick;
		border-radius: 50%;
		border: 0.25rem solid var(--background);
	}

	.picture::after {
		content: '';
		position: absolute;
		inset: 0;
		margin: auto;
		scale: 1.25;
		background-color: blue;
		z-index: -1;
		border-radius: 50%;
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
		stroke: white;
		stroke-width: 0.25rem;
		padding: 0.5rem;
		border-radius: calc(var(--br) / 2);
		cursor: pointer;
	}

	.line {
		border-top: 1px solid rgba(255, 255, 255, 0.25);
	}
</style>
