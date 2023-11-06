<svelte:head>
    <title>Homepage | Family Hub</title>
</svelte:head>

<h1>Hey</h1>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700;800;900&display=swap');

    :global(:root) {
        font-family: 'Poppins', sans-serif;
        --font-scale: 1.333;
        
        /* text sizes */
        --p: 1.5rem;
        --h5: calc(var(--p) * var(--font-scale));
        --h4: calc(var(--h5) * var(--font-scale));
        --h3: calc(var(--h4) * var(--font-scale));
        --h2: calc(var(--h3) * var(--font-scale));
        --h1: calc(var(--h2) * var(--font-scale));
    }

    :global(p) {
        font-size: var(--p);
    }

    :global(h1)  {
        font-size: var(--h1);
    }

    :global(h2)  {
        font-size: var(--h2);
    }

    :global(h3)  {
        font-size: var(--h3);
    }

    :global(h4)  {
        font-size: var(--h4);
    }

    :global(h5)  {
        font-size: var(--h5);
    }

	:global(:root[data-theme='light']) {
        --text: #221b11;
        --background: #f6f3ee;
        --primary: #473824;
        --secondary: #ddcfbb;
        --accent: #886c44;
    }

    :global(:root[data-theme='dark']) {
        --text: #eee7dd;
        --background: #110e09;
        --primary: #dbccb8;
        --secondary: #443622;
        --accent: #bb9f77;
    }

	:global(*, *::before, *::after) {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		font: inherit;
	}

	:global(html) {
		color-scheme: dark light;
	}

	:global(img, picture, svg, video) {
		display: block;
		max-width: 100%;
	}

    :global(body) {
        background-color: var(--background);
        color: var(--text);
    }
</style>
