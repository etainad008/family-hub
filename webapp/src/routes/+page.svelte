<script>
	import Button from '$lib/components/Button.svelte';

	import { fly } from 'svelte/transition';
</script>

<svelte:head>
	<title>Homepage | Family Hub</title>
</svelte:head>

<header class="hero" in:fly={{y: ".25rem", duration: 300}}>
	<div class="hero--content">
		<h1 class="hero__title">Lorem ipsum sit amet.</h1>
		<div class="hero--buttons">
			<Button size="h5" hoverable>See More</Button>
			<Button size="h5" background="accent" color="background" shadow="3rem" hoverable
				>Sign Up</Button
			>
		</div>
	</div>
	<div class="hero--family">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 293" fill="none">
			<path
				d="M120 162.806C159.449 162.806 191.429 130.838 191.429 91.4028C191.429 51.9681 159.449 20 120 20C80.5511 20 48.5714 51.9681 48.5714 91.4028C48.5714 130.838 80.5511 162.806 120 162.806ZM120 162.806C20 162.806 20 245.633 20 272.766H220C220 245.633 220 162.806 120 162.806Z"
			/>
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 293" fill="none">
			<path
				d="M120 162.806C159.449 162.806 191.429 130.838 191.429 91.4028C191.429 51.9681 159.449 20 120 20C80.5511 20 48.5714 51.9681 48.5714 91.4028C48.5714 130.838 80.5511 162.806 120 162.806ZM120 162.806C20 162.806 20 245.633 20 272.766H220C220 245.633 220 162.806 120 162.806Z"
			/>
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 293" fill="none">
			<path
				d="M120 162.806C159.449 162.806 191.429 130.838 191.429 91.4028C191.429 51.9681 159.449 20 120 20C80.5511 20 48.5714 51.9681 48.5714 91.4028C48.5714 130.838 80.5511 162.806 120 162.806ZM120 162.806C20 162.806 20 245.633 20 272.766H220C220 245.633 220 162.806 120 162.806Z"
			/>
		</svg>
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 293" fill="none">
			<path
				d="M120 162.806C159.449 162.806 191.429 130.838 191.429 91.4028C191.429 51.9681 159.449 20 120 20C80.5511 20 48.5714 51.9681 48.5714 91.4028C48.5714 130.838 80.5511 162.806 120 162.806ZM120 162.806C20 162.806 20 245.633 20 272.766H220C220 245.633 220 162.806 120 162.806Z"
			/>
		</svg>
	</div>
</header>

<div class="cards">
	<!-- tasks -->
	<article class="card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 160" fill="none">
			<path
				d="M43.9982 79.9978L67.9935 103.993L115.994 56.0031M8 79.9978C8.00247 45.6505 32.2673 16.0881 65.955 9.38953C99.6431 2.69105 133.371 20.722 146.514 52.4555C159.656 84.189 148.552 120.787 119.992 139.867C91.4324 158.948 53.3707 155.197 29.0846 130.909C15.5831 117.406 7.99866 99.0932 8 79.9978Z"
				stroke-linecap="round"
				stroke-linejoin="round"
			/>
		</svg>
		<h5>Set Tasks</h5>
		<p>Assign tasks to family members</p>
	</article>
	<!-- events -->
	<article class="card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 160 160" fill="none">
			<path
				d="M40 8V32M120 8V32M40.8002 144C44.5063 125.742 60.6483 112 80 112C99.352 112 115.494 125.742 119.2 144M33.6 152H126.4C135.361 152 139.842 152 143.264 150.256C146.274 148.722 148.722 146.274 150.256 143.264C152 139.842 152 135.361 152 126.4V49.6C152 40.6391 152 36.1587 150.256 32.7362C148.722 29.7255 146.274 27.2778 143.264 25.7439C139.842 24 135.361 24 126.4 24H33.6C24.6392 24 20.1587 24 16.7362 25.7439C13.7255 27.2778 11.2778 29.7255 9.74392 32.7362C8 36.1587 8 40.6391 8 49.6V126.4C8 135.361 8 139.842 9.74392 143.264C11.2778 146.274 13.7255 148.722 16.7362 150.256C20.1587 152 24.6391 152 33.6 152ZM96 72C96 80.8368 88.8368 88 80 88C71.1632 88 64 80.8368 64 72C64 63.1634 71.1632 56 80 56C88.8368 56 96 63.1634 96 72Z"
				stroke-linecap="round"
				stroke-linejoin="round"
			/>
		</svg>
		<h5>Set Events</h5>
		<p>Create events for the whole family</p>
	</article>
	<!-- more -->
	<article class="card">
		<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 205 160" fill="none">
			<path
				d="M64.7 89.3559C87.0675 89.3559 105.2 71.1438 105.2 48.678C105.2 26.2121 87.0675 8 64.7 8C42.3325 8 24.2 26.2121 24.2 48.678C24.2 71.1438 42.3325 89.3559 64.7 89.3559ZM64.7 89.3559C8 89.3559 8 136.542 8 152H121.4C121.4 136.542 121.4 89.3559 64.7 89.3559ZM154.475 105.017C171.251 105.017 184.85 91.3578 184.85 74.5085C184.85 57.6591 171.251 44 154.475 44C137.699 44 124.1 57.6591 124.1 74.5085C124.1 91.3578 137.699 105.017 154.475 105.017ZM154.475 105.017C197 105.017 197 140.407 197 152H122.345M154.475 105.017C134.82 105.017 124.25 112.577 118.565 121.853"
				stroke-linecap="round"
				stroke-linejoin="round"
			/>
		</svg>
		<h5>Set Status</h5>
		<p>Set a status to inform family members what you are up to</p>
	</article>
</div>

<style>
	/* --------------- */

	/* hero */
	.hero {
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 2rem;
		background-color: var(--background);
		padding: var(--padding-900) calc(var(--padding-900) * 1.5);
		color: var(--text);
		margin-bottom: 12rem;
	}

	.hero--content {
		display: flex;
		flex-direction: column;
		gap: 2rem;
	}

	.hero--buttons {
		display: flex;
		gap: 2rem;
	}

	.hero__title {
		line-height: 6rem;
	}

	.hero--family {
		position: relative;
		width: 100%;
		aspect-ratio: 1;
		max-width: 28rem;
		min-width: 20rem;
		border-radius: 50%;
		background-color: var(--primary);
		clip-path: circle(at center);
		overflow: hidden;
	}

	.hero--family > svg {
		position: absolute;
		stroke: var(--secondary);
		stroke-width: 2.5rem;
		width: 35%;
		aspect-ratio: 1;
		inset: -2rem;
		margin: auto;
	}

	.hero--family > svg:nth-child(1) {
		top: auto;
	}

	.hero--family > svg:nth-child(2) {
		rotate: 90deg;
		right: auto;
	}

	.hero--family > svg:nth-child(3) {
		rotate: 180deg;
		bottom: auto;
	}

	.hero--family > svg:nth-child(4) {
		rotate: 270deg;
		left: auto;
	}

	/* cards */
	.cards {
		position: relative;
		display: grid;
		grid-template-columns: repeat(auto-fit, minmax(min(12rem, 100%), 1fr));
		gap: 2rem;
		justify-items: center;
		width: 75%;
		margin-inline: auto;
		margin-bottom: 20rem;
	}

	.card {
		--animation-time: 500ms;

		position: relative;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: var(--padding-900);
		aspect-ratio: 1;
		width: 100%;
		max-width: 20rem;
		background-color: var(--primary);
		border-radius: var(--br);
		color: var(--background);
		text-align: center;
	}

	.card > h5 {
		transition: opacity calc(var(--animation-time) / 4) cubic-bezier(1, 0, 0, 1);
	}

	.card:hover > h5 {
		opacity: 0;
		user-select: none;
	}

	.card > p {
		position: absolute;
		top: 110%;
		padding: var(--padding-500);
		opacity: 0;
		transition: calc(var(--animation-time) / 2) cubic-bezier(1, 0, 0, 1);
		pointer-events: none;
	}

	.card:hover > p {
		top: 35%;
		opacity: 1;
		pointer-events: initial;
	}

	.card > svg {
		position: absolute;
		width: 30%;
		aspect-ratio: 1;
		stroke: var(--secondary);
		stroke-width: 1rem;
		top: 0;
		z-index: -1;
		animation: svgHoverRev var(--animation-time) cubic-bezier(1, 0, 0, 1) forwards;
		user-select: none;
		pointer-events: none;
	}

	.card:hover > svg {
		animation: svgHover var(--animation-time) cubic-bezier(1, 0, 0, 1) forwards;
		animation-play-state: running;
	}

	@keyframes svgHover {
		49% {
			z-index: -1;
		}

		50% {
			top: -35%;
			z-index: 1;
		}

		100% {
			top: 8%;
			z-index: 1;
		}
	}

	@keyframes svgHoverRev {
		0% {
			top: 8%;
			z-index: 1;
		}

		50% {
			top: -35%;
			z-index: -1;
		}

		51% {
		}

		100% {
			top: 0;
		}
	}
</style>
