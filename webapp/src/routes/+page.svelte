<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

<style>
    :global(:root[data-theme='light']) {
        --text: #050406;
        --background: #fdfcfd;
        --primary: #614979;
        --secondary: #dbd2e4;
        --accent: #765893;
    }

    :global(:root[data-theme='dark']) {
        --text: #faf9fb;
        --background: #030203;
        --primary: #9e86b6;
        --secondary: #241b2d;
        --accent: #8b6ca7;
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
</style>