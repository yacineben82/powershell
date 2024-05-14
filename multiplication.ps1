for ($i=1; $i -le 10; $i++)
{
    
    write-host " table de multiplication de $i : " `n
    
    for ($j=1; $j -le 10; $j++)

        {
            $result = $i * $j
            write-host " $i X $j = " $result 
            
        }
    write-host " " 
}
