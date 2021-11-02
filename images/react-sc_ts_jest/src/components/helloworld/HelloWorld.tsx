import React from 'react';
import styled from 'styled-components';

const Title = styled.h1`
	font-size: 1.5em;
	text-align: center;
`;

interface HelloWorldProps {
	text: string;
}

const HelloWorld = ({ text = 'hello world' }: HelloWorldProps) => {
	return <Title>{text}</Title>;
};

export default HelloWorld;
