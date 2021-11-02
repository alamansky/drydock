export default async function fetchData<T>(endpoint: string): Promise<T> {
	let res = await fetch(endpoint);
	let parsed = await res.json();
	return parsed;
}
