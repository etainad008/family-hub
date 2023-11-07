/** @type {import('@sveltejs/kit').Handle} */
export async function handle({ event, resolve }) {
    const theme = event.cookies.get('theme');
    
    if(theme) {
        return await resolve(event, {
            transformPageChunk: ({ html }) => 
                html.replace('data-theme=""', `data-theme="${theme}"`)
        })
    }
	const response = await resolve(event);
	return response;
}
