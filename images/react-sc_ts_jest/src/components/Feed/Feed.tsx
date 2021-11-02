import React, { useState, useEffect } from 'react';
import fetchData from '../../util/fetchData';

interface FeedProps {
	endpoint: string;
	feedTitle: any;
}

interface Post {
	userId: number;
	id: number;
	title: string;
	body: string;
}

export default function Feed({ endpoint, feedTitle }: FeedProps) {
	const [feedItem, setFeedItem] = useState([]);

	useEffect(() => {
		(async function iife() {
			let data: Post[] = await fetchData(endpoint);
			setFeedItem(data);
		})();
	}, []);

	return (
		<div>
			{feedTitle}
			<div>
				{feedItem.map((item: Post) => (
					<article>
						<h3 key={item.title}>{item.title}</h3>
						<p>{item.body}</p>
					</article>
				))}
			</div>
		</div>
	);
}
