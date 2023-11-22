<script>
	import { createEventDispatcher } from 'svelte';

	const dispatch = createEventDispatcher();

	export let type = 'text';
	export let name = null;
	export let placeholder = null;
	export let autofocus = null;
	export let autocomplete = null;
	export let required = false;
	export let minlength = null;
	export let maxlength = null;
	export let rows = '2';

	const attributes = {
		type,
		name,
		placeholder,
		autofocus,
		autocomplete,
		required,
		minlength,
		maxlength
	};
</script>

{#if type == 'textarea'}
	<textarea class="input" {...attributes} {rows} />
{:else}
	<input class="input" {...attributes} on:focusout={() => dispatch('focusout')} />
{/if}

<style>
	.input {
		width: 100%;
		padding: var(--padding-100) var(--padding-400);
		background-color: var(--text, var(--secondary));
		border: none;
		border-radius: var(--br);
		color: var(--background, var(--text));
		font-size: var(--p);
		overflow: hidden auto;
		resize: none;
	}

	.input::placeholder {
		display: none;
	}

	.input:-webkit-autofill {
		box-shadow: inset 0 0 1rem 2rem var(--secondary);
		-webkit-text-fill-color: var(--text);
	}

	.input:-webkit-autofill {
		box-shadow: inset 0 0 1rem 2rem var(--text);
		-webkit-text-fill-color: var(--background);
	}
</style>
