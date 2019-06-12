clc, clear

stMain = [];
stSec = [];



function [ stMain, stSec ] = addToQueue(stMain, stSec)
    key  = input('Enter the element to be added to queue: ');
    stMain = [stMain(1,1:end), key];
end

function [ stMain, stSec ] = removeFromQueue(stMain, stSec)
    size()
end

function [] = mainFunction()
end

