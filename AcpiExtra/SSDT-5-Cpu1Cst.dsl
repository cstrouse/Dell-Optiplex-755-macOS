DefinitionBlock ("", "SSDT", 1, "APPLE", "Cpu1Cst", 0x00003000)
{
    External (PDC1)
    External (CFGD)
    External (\_PR_.CPU1, DeviceObj)
    External (\_PR_.CPU0._CST, IntObj)

    Scope (\_PR.CPU1)
    {
        Method (_CST, 0, NotSerialized)
        {
            If (LAnd (And (CFGD, 0x01000000), LNot (And (PDC1, 0x10
                ))))
            {
                Return (Package (0x02)
                {
                    0x01, 
                    Package (0x04)
                    {
                        ResourceTemplate ()
                        {
                            Register (FFixedHW, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        0x01, 
                        0x9D, 
                        0x03E8
                    }
                })
            }

            Return (\_PR.CPU0._CST)
        }
    }
}

