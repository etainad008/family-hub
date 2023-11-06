<svelte:head>
	<title>Homepage | Family Hub</title>
</svelte:head>

<nav class="nav">
	<p><a href="/" class="nav__link">Family Hub</a></p>
	<p><a href="/" class="nav__link">Log In</a></p>
</nav>


<header class="hero">
    <!-- <div class="hero--family">
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
    </div> -->
    <!-- <svg xmlns="http://www.w3.org/2000/svg" width="1920" height="800" viewBox="0 0 1920 800" fill="none">
        <path d="M0 0H1920C1920 0 1920 515.126 1920 712.311C1920 712.311 1522.5 800 960 800C397.5 800 0 712.311 0 712.311V0Z" fill="#473824"/>
    </svg> -->
    <div class="hero--content">
        <h2>Lorem ipsum sit amet.</h2>
        <div class="hero--buttons">
            <button>Lorem</button>
            <button>Ipsum</button>
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
        <div id="family--mask"></div>
    </div>
</header>


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

		/* padding */
		--padding-400: 1rem;
		--padding-500: calc(var(--padding-400) * var(--font-scale));
		--padding-600: calc(var(--padding-500) * var(--font-scale));
        --padding-700: calc(var(--padding-600) * var(--font-scale));
        --padding-800: calc(var(--padding-700) * var(--font-scale));
        --padding-900: calc(var(--padding-800) * var(--font-scale));
	}

	:global(p) {
		font-size: var(--p);
	}

	:global(h1) {
		font-size: var(--h1);
		font-weight: 900;
	}

	:global(h2) {
		font-size: var(--h2);
		font-weight: 800;
	}

	:global(h3) {
		font-size: var(--h3);
		font-weight: 700;
	}

	:global(h4) {
		font-size: var(--h4);
		font-weight: 600;
	}

	:global(h5) {
		font-size: var(--h5);
		font-weight: 500;
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

	/* --------------- */

	/* nav */
	.nav {
		display: flex;
		justify-content: space-between;
		padding: var(--padding-500) var(--padding-600);
		background-color: var(--primary);
	}

	.nav__link {
		text-decoration: none;
		color: var(--background);
	}

	/* hero */
	.hero {
        display: flex;
        justify-content: space-between;
        align-items: center;
        gap: 2rem;
        background-color: var(--primary);
        padding: var(--padding-900);
	}
    
    .hero--content {
        color: var(--background);
    }

	.hero--family {
        position: relative;
        width: 100%;
        aspect-ratio: 1;
        height: fit-content;
        max-width: 28rem;
        border-radius: 50%;
        background-color: var(--background);
        /* clip-path: circle(at center); */
        overflow: hidden;
    }

    /* #family--mask {
        position: absolute;
        width: 100%;
        height: 100%;
        background-color: #110e09;
        border-radius: 50%;
    } */

    .hero--family > svg {
        position: absolute;
        stroke: black;
        stroke-width: 2.5rem;
        width: 35%;
    }

    .hero--family > svg:nth-child(1) {
        inset: -2rem;
        margin-inline: auto;
        top: auto;
    }

    .hero--family > svg:nth-child(2) {
        inset: -1rem;
        rotate: 90deg;
        right: auto;
        margin-block: auto;
    }
    
    .hero--family > svg:nth-child(3) {
        rotate: 180deg;
        inset: -2rem;
        margin-inline: auto;
        bottom: auto;
    }
    
    .hero--family > svg:nth-child(4) {
        rotate: 270deg;
        inset: -1rem;
        margin-block: auto;
        left: auto;
    }
</style>
