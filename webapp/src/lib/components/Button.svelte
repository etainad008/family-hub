<script>
	export let size = 'p';
	export let background = 'secondary';
	export let color = 'text';
	export let link = null;
	export let hoverable = false;
	export let shadow = null;
    
	export let style = null;
</script>

<svelte:element
	this={link ? 'a' : 'button'}
	class="button"
	class:hoverable
	class:shadow
	style:background-color="var(--{background}, {background})"
	style:color="var(--{color}, {color})"
	style="{style}; {shadow ? `--shadow: 0 0 ${shadow} var(--${background}, ${background});` : ''}"
	href={link}
>
	<svelte:element this={size}><slot /></svelte:element>
</svelte:element>

<style>
	.button {
		--transition-duration: 200ms;

		display: inline-block;
		width: fit-content;
		padding: 0.6em 1.2em;
		border: none;
		border-radius: var(--br);
		cursor: pointer;
		transition: box-shadow var(--transition-duration) ease-in-out,
			translate var(--transition-duration) ease-in-out;
		white-space: nowrap;
		text-decoration: none;
	}

	.hoverable:hover {
		translate: 0 -0.25rem;
	}

	.shadow:hover {
		box-shadow: var(--shadow, none);
	}
</style>
