# Ready2Use Analyzers
There are excellent code analyzers available for .NET through the Rosilyn platform. 😃 But finding them, and selecting their rules, is not a very fun task! 😕

A well configured and opinionated [ruleset files](https://docs.microsoft.com/en-us/visualstudio/code-quality/using-rule-sets-to-group-code-analysis-rules?view=vs-2017#rule-set-format) from a curated selection of Roslyn diagnostic analyzers.

## The included analyzers

These preset configurations contains **637** analyses rules of:

* [StyleCop](https://github.com/DotNetAnalyzers/StyleCopAnalyzers)
* [FxCop](https://github.com/dotnet/roslyn-analyzers)
* [Code Cracker](https://github.com/code-cracker/code-cracker)
* [Roslynator](https://github.com/JosefPihrt/Roslynator)

## Getting Started
1. Install the packages below to the projects do you wish to analyze **(usually all)** on your solution:

```
dotnet add package StyleCop.Analyzers
dotnet add package Microsoft.CodeAnalysis.FxCopAnalyzers
dotnet add package CodeCracker.CSharp
dotnet add package Roslynator.Analyzers
```
2. Clone this repo and copy the `Analyzers` folder to your root solution folder.

```
git clone https://github.com/maiconheck/ready2use-analyzers.git
or
git clone git@github.com:maiconheck/ready2use-analyzers.git
```

3. For each project that do you have installed the packages, edit the `.csproj` file and add the line below accordingly the project kind:

>For **distribution libraries projects**, or any project that you want to get the most analyzes (including documentation ones)
use the **All.ruleset**:

On **PropertyGroup** section add:
```XML
<CodeAnalysisRuleSet>..\Analyzers\All.ruleset</CodeAnalysisRuleSet>
```

>For **most projects** use the **Default.ruleset**. This ruleset include all rules of the **All.ruleset** except the documentation ones:

On **PropertyGroup** section add:
```XML
<CodeAnalysisRuleSet>..\Analyzers\Default.ruleset</CodeAnalysisRuleSet>
```

>For **unit and integration tests** use the **Test.ruleset**. This ruleset include all rules of the **Default.ruleset** except some rules about naming and explicit type declaration (like `MakeLocalVariableConstWhenItIsPossibleAnalyzer` and `AlwaysUseVarAnalyzer`):

On **PropertyGroup** section add:
```XML
<CodeAnalysisRuleSet>..\Analyzers\Test.ruleset</CodeAnalysisRuleSet>
```

4. Clean and build the solution:
```
dotnet clean
dotnet build
```

5. Fix the warnings and have a much better code! 😃
Do not worry if you receive too many warnings. There are **637** validations! Correct them step by step. I suggest organizing them into groups and fixing one group at a time.

>👌 Feel free to disable rules that don't apply to your context or project.

## 💡 Important tips
* I suggest that after you fix the warnings, you change the action level to `Error` (e.g. <Rule Id="CC0018 "Action=**"Error"** />).
That way, you make sure that the rules are respected, because otherwise the projects will not compile!
Keep them at Warning level (eg, <Rule Id="CC0018 "Action=**"Warning"** />) besides not guarantee this, usually makes Warnings increase, and will be harder to fix when you have several of them. An alternative is add `TreatWarningsAsErrors` property to each .csproj file:
```XML
<PropertyGroup>    
    <TreatWarningsAsErrors>true</TreatWarningsAsErrors>
</PropertyGroup>
```

* Consider exceptions to rules. There are specific cases where some rules will not apply. In that case, do not disable them, instead [suppress the message](https://docs.microsoft.com/pt-br/visualstudio/code-quality/in-source-suppression-overview?view=vs-2017#global-suppression-file). Example using a [global suppression file](https://github.com/maiconheck/shared-kernel/blob/master/src/SharedKernel/GlobalSuppressions.cs).