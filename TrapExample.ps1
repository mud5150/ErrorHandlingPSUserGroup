# trap 
# {
#     "This was some other type of exception"
# }
# [System.Net.WebException] 


&{
    trap
    {
        "TRAP"
        # $_.GetType()
        Continue
        # Break
    }
        &{
            "one"
            "two"
            1/$null
            "three"
            "four"
        }
    "OUTERBLOCK"
}

