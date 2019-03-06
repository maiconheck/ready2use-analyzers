# Ready2Use Analyzers
There are excellent code analyzers available for .NET through the Rosilyn platform. 😃 But finding them, and selecting their rules, is not a very fun task! 😕

A well configured and opinionated [rulesets files](https://docs.microsoft.com/en-us/visualstudio/code-quality/using-rule-sets-to-group-code-analysis-rules?view=vs-2017#rule-set-format) from a curated selection of Roslyn diagnostic analyzers.

## The included validators

These preset configurations contains **637** validation rules of:

* [StyleCop Analyzers](https://github.com/DotNetAnalyzers/StyleCopAnalyzers)

* [Roslyn Analyzers](https://github.com/dotnet/roslyn-analyzers)

* [Code Cracker Analyzers](https://github.com/code-cracker/code-cracker)

* [Roslynator Analyzers](https://github.com/JosefPihrt/Roslynator)

## Getting Started
1. Install the packages below to the projects do you wish to analyze **(usually all)** on your solution:

```
dotnet add package StyleCop.Analyzers
dotnet add package Microsoft.CodeAnalysis.FxCopAnalyzers
dotnet add package codecracker.CSharp
dotnet add package Roslynator.Analyzers
```

2. On the root solution folder create a new folder named `Analyzers` and put these `.ruleset` files inside there:

* [Default.ruleset](https://raw.githubusercontent.com/maiconheck/ready2use-analyzers/master/Analyzers/Default.ruleset)
* [Test.ruleset](https://raw.githubusercontent.com/maiconheck/ready2use-analyzers/master/Analyzers/Test.ruleset)
* [Lib.ruleset](https://raw.githubusercontent.com/maiconheck/ready2use-analyzers/master/Analyzers/Lib.ruleset)

3. For each project that do you have installed the packages, edit the `.csproj` file and add the lines below:

On **PropertyGroup** section
```XML
<PropertyGroup>    
    <CodeAnalysisRuleSet>..\Analyzers\Default.ruleset</CodeAnalysisRuleSet>
</PropertyGroup>
```
>For **Test Projects** use Test.ruleset file instead of Default.ruleset file.
Some rules are not applicable to test projects, so the Test.ruleset file have less active rules, like `MakeLocalVariableConstWhenItIsPossibleAnalyzer` and `AlwaysUseVarAnalyzer`.

>For **Distributed Library** use Lib.ruleset file instead of Default.ruleset file.
This file includes documenting rules that are specially important when you distribute your library to others.

4. Clean and build the solution:
```
dotnet clean
dotnet build
```

5. Fix the warnings and have a much better code! 😃
Do not worry if you receive too many warnings. There are **637** validations! Correct them step by step. I suggest organizing them into groups and fixing one group at a time.

>👌 Feel free to disable rules that don't apply to your context or project.

## 💡 Important tips
* I suggest that after you fix the warnings, you change the criticality level to `Error` (e.g. <Rule Id="CC0018 "Action=**"Error"** />).
That way, you make sure that the rules are respected, becouse otherwise the projects will not compile!
Keep them at Warning level (eg, <Rule Id="CC0018 "Action=**"Warning"** />) besides not guarantee this, usually makes Warnings increase, and will be harder to fix when you have several of them.

* Consider exceptions to rules. There are specific cases where some rules will not apply. In that case, do not disable them, instead [suppress the message](https://docs.microsoft.com/pt-br/visualstudio/code-quality/in-source-suppression-overview?view=vs-2017#global-suppression-file)

Example using a [global suppression file (a.k.a. `GlobalSuppressions.cs`)](https://github.com/maiconheck/shared-kernel/blob/master/src/SharedKernel/GlobalSuppressions.cs)