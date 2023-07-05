<?php

function matrix_multi ($param1, $param2)
{
    $result = null;

    for ($i = 0; $i < count($param1); $i++) {
        for ($j = 0; $j < count($param2); $j++) {
            $result[$i][$j] = 0;

            for ($k = 0; $k < count($param1); $k++) {
                $result[$i][$j] += $param1[$i][$k] * $param2[$k][$j];
            }
        }
    }

    return $result;
}

$a = [[2,3], [4,1]];
$b = [[5,7], [6,8]];

var_dump(matrix_multi($a, $b));
