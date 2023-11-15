<script>
    export let type="bar";
    export let maxValue = 1;
    export let value = 0;

    let progress = value / maxValue;
</script>

<div class={type} style:--progress={progress}></div>

<style>
    .bar {
        position: relative;
        width: 100%;
        height: 1rem;
        border-radius: 100vw;
        overflow: hidden;
    }
    
    .bar::after {
        content: "";
        position: absolute;
        inset: 0;
        margin: auto;
        width: calc(var(--progress) * 100%);
        right: auto;
        background-image: linear-gradient(to right, var(--primary), var(--accent));
    }

    .circle {
        position: relative;
        width: 100%;
        aspect-ratio: 1/1;
        border-radius: 50%;
        background-image: conic-gradient(
            transparent 0 calc(1turn - var(--progress) * 1turn),
            var(--accent) calc(1turn - var(--progress) * 1turn),
            var(--primary));
    }

    .circle::after {
        content: "";
        position: absolute;
        inset: 10%;
        margin: auto;
        background-color: var(--background);
        border-radius: 50%;
    }
</style>