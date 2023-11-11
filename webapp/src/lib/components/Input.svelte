<script>
    export let type = "text";
    export let name = null;
    export let placeholder = null;
    export let autofocus = null;
    export let autocomplete = null;
    export let required = false;
    export let minlength = null;
    export let maxlength = null;

    const attributes = {
        type,
        name,
        placeholder,
        autofocus,
        autocomplete,
        required,
        minlength,
        maxlength,
    }
</script>

<input
    {...attributes}
/>

<style>
	input {
		padding: var(--padding-100) var(--padding-400);
		background-color: var(--background-color, var(--secondary));
        border: none;
		border-radius: var(--br);
		color: var(--color, var(--text));
		font-size: var(--p);
	}

    input::placeholder {
        display: none;
    }

	input:-webkit-autofill {
		box-shadow: inset 0 0 1rem 2rem var(--secondary);
		-webkit-text-fill-color: var(--text);
	}
</style>
