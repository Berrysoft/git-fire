function Get-CurrentBranch {
    return [System.IO.Path]::GetFileName("$(git symbolic-ref HEAD)")
}

function Get-CurrentEpoch {
    return [System.DateTimeOffset]::Now.ToUnixTimeSeconds()
}

function Get-UserEmail {
    return git config user.email
}

function Get-NewBranchName {
    return "fire-$(Get-CurrentBranch)-$(Get-UserEmail)-$(Get-CurrentEpoch)"
}

function Set-FireBranch {
    <#
    .SYNOPSIS
    git-fire
    git-fire -m "FIRE!!!"
    .DESCRIPTION
    Create a new branch, commit and push.
    .PARAMETER message
    The commit message. The default message is "Fire! Branch <Your current branch>."
    .INPUTS
    System.String. The commit message, or nothing.
    .OUTPUTS
    System.Object. The direction for when to leave the building.
    .LINK
    Here is the link to the git plugin:
    https://github.com/qw3rtman/git-fire
    #>
    param(
        [Parameter(valueFromPipeline = $true)][String] $m
    )

    $initial_branch = Get-CurrentBranch

    git checkout -b "$(Get-NewBranchName)"

    Set-Location "$(git rev-parse --show-toplevel)"

    git add -A

    if ($m -eq $null) {
        $m = "Fire! Branch $(Get-CurrentBranch)."
    }

    git commit -m "$($m)" --no-verify

    foreach ($remote in $(git remote)) {
        git push --no-verify --set-upstream "$($remote)" "$(Get-CurrentBranch)"
    }

    if (![System.String]::IsNullOrEmpty("$(git stash list)")) {
        foreach ($sha in "$(git rev-list -g stash)") {
            git push --no-verify origin "$($sha)":refs/heads/"$($initial_branch)"-stash-"$($sha)"
        }
    }

    Write-Output "`n`nLeave building!"
}

New-Alias -Name git-fire -Value Set-FireBranch

Export-ModuleMember -Function Set-FireBranch -Alias git-fire
