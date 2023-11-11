<script>
    /** @type {import('./$types').LayoutData} */
    export let data;
</script>

<header>
    <section>
        <div class="picture"></div> <!-- should be an img element -->
        <div class="details">
            <h4 class="name">Etai</h4>
            <p class="tasks__done"><span>1</span> out of <span>2</span> tasks done</p>
        </div>
    </section>
    <section class="nav--icons">
        <!-- svg * 3 -->
    </section>
</header>

<slot />