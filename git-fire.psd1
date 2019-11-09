﻿#
# Module manifest for module 'git-fire'
#
# Generated by: Berrysoft
#
# Generated on: 2019/11/9
#

@{

    # Version number of this module.
    ModuleVersion     = '1.0.0'

    # Script module or binary module file associated with this manifest.
    RootModule        = 'git-fire.psm1'

    # ID used to uniquely identify this module
    GUID              = '3c5c771b-7eee-4480-90e5-2f9060aedbf5'

    # Company or vendor of this module
    CompanyName       = 'Unknown'

    # Author of this module
    Author            = 'Berrysoft'

    # Copyright statement for this module
    Copyright         = '(c) 2019 Berrysoft. All rights reserved.'

    # Description of the functionality provided by this module
    Description       = 'In case of fire, save your work.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.0'

    # List of all files packaged with this module
    FileList          = @()

    # Cmdlets to export from this module
    CmdletsToExport   = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module
    AliasesToExport   = '*'

    # Functions to export from this module
    FunctionsToExport = @('Set-FireBranch')

    # Private data to pass to the module specified in RootModule. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags       = @('git')

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/Berrysoft/git-fire/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/Berrysoft/git-fire'

        } # End of PSData hashtable

    } # End of PrivateData hashtable

}
