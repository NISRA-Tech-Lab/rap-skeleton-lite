# RAP Skeleton Lite

## What is the RAP Skeleton Lite?

The [RAP Skeleton Lite](https://github.com/NISRA-Tech-Lab/rap-skeleton-lite) is
a reusable template and guide for creating simple HTML statistical publications.
It can be used to convert existing publications, such as Word or PDF documents,
to HTML or to create a Background Quality Report (BQR).

RAP Skeleton Lite includes two main templates:

  -   A general report template for creating simple HTML statistical
  publications; and
  -   A Background Quality Report (BQR) template for creating HTML BQRs.

Both templates include completed examples that users can explore to understand
the available features and how the reports are structured.

RAP Skeleton Lite uses R and R Markdown to create HTML outputs, with R code
written in line with the [tidyverse style guide](https://style.tidyverse.org/).

RAP Skeleton Lite is maintained as a template repository within the
[NISRA Tech Lab GitHub](https://github.com/NISRA-Tech-Lab) organisation. New
projects can be created directly from this template and cloned to a local
computer for development in RStudio.

Users updating an existing project from RAP Skeleton Lite V2 should refer to the
**Updating to V3 from RAP Skeleton Lite V2** section of this README.

<details open>
  <summary><strong>What's New in v3.0.0?</strong></summary>

#### 🧰 General review and update
RAP Skeleton Lite underwent review and any unused or out-of-date parts of the
code have been removed. The demo report also underwent accessibility testing and
any issues found have been remedied.

#### 🧪 R 4.6.1 compatibility
All packages have been updated so the RAP Skeleton Lite is fully compatible with
R version 4.6.1.

#### 🎨 Branding
The branding of the RAP Skeleton Lite has been updated to include the current
NISRA branding standards, including changes to the header colours, three-colour
separator, chart/table/map titles, footer and other elements of the Lite and BQR
reports. The RAP Skeleton Lite is now aligned with the
[nisra-branding GitHub repository](https://github.com/NISRA-Tech-Lab/nisra-branding)
which contains the source code for branding and will be used for future branding
updates.

#### 🖼 User experience and accessibility
The footer, cookie banner and other components have been refined to improve the
user experience and accessibility.

The CSS file, which controls the styling of HTML elements, has also been updated
and reorganised. Clear headings have been added throughout the file to make it
easier for users to navigate, understand and modify the styling of their
reports.

#### 📝 Improvements to content design and writing
The RAP Skeleton Lite demo report and BQR template have been rewritten using
clearer and more straightforward language. These changes follow accessible
content design principles and aim to make the information easier for a wide
range of users to read and understand.

#### 🏗️ Improvements to code formatting and readability
The existing code within the RAP Skeleton Lite has undergone maintenance to
improve consistency, readability and maintainability. The `styler` and `lintr`
packages have been used to identify formatting issues and help align the code
with the [tidyverse style guide](https://style.tidyverse.org/).

</details>

<details>
  <summary><strong>Setting up RAP Skeleton Lite</strong></summary>

It is recommended that new RAP Skeleton Lite projects are created using the RAP
Skeleton Lite template on GitHub. This creates a separate repository for your
publication that can then be cloned to your computer and opened in RStudio.

Using this approach means that version control is available from the beginning
of the project and provides a shared location for the code used to produce the
publication.

#### Before you start

Before creating a RAP Skeleton Lite project:

  1.  Install **Git for Windows** from the IT Assist Store if it is not already
  installed on your computer.
  2.  Create a GitHub account using your work email address if you do not
  already have one.
  3.  Ensure that you have access to the appropriate GitHub organisation for
  your branch or team.
  4.  Ensure that **R 4.6.1** and a recent version of RStudio are installed.
  Both are available through the IT Assist Store.

You can check your version of R by entering `version` in the RStudio Console. To
check your RStudio version, select **Help > About RStudio**.

#### Configure Git

If this is the first time you have used Git on your computer, open a Terminal
and configure your Git username and email address:

```         
git config --global http.sslVerify false
git config --global user.name "YourUsername"
git config --global user.email "firstname.lastname@nisra.gov.uk"
```

Replace the example username and email address with the details associated with
your GitHub account.

This configuration normally only needs to be completed once on each computer.

#### Create a repository from the RAP Skeleton Lite template

  1.	Open the **RAP Skeleton Lite** repository on GitHub.
  2.	Select **Use this template** button near the top-right of the repository
  page.
  3.  Select **Create a new repository**.
  4.	Select the appropriate GitHub organisation for your branch or team as the
  repository owner.
  5.	Enter an appropriate repository name for your publication, following any
  naming conventions used by your team.
  6.	Select the appropriate repository visibility.
  7.  Select **Create repository**.

GitHub will create a new repository containing the RAP Skeleton Lite files. Your
new repository is independent of the original RAP Skeleton Lite repository,
so future changes made to the RAP Skeleton Lite will not automatically be
applied to your publication. 

#### Clone the repository into RStudio

Once the new repository has been created:

  1.	On the GitHub page for your new repository, select the green **Code**
  button.
  2.  Copy the repository URL.
  3.  Open RStudio.
  4.  Select **File > New Project > Version Control > Git**.
  5.  Paste the copied URL into the **Repository URL** field.
  6.  Choose where you want the project to be stored on your computer.
  7.  Select **Create Project**.

RStudio will clone the GitHub repository to your computer and open it as a
project.

You now have:

  - a repository on GitHub containing the shared version of your publication
  code; and
  - a local copy of the repository on your computer where you can develop and
  run the publication.

Changes made locally are not automatically sent to GitHub. They must be
committed and pushed when you are ready to share them. See
**Working with Git and GitHub** later in this guide for further information.

#### Next steps

Once the repository has been cloned and opened in RStudio:

  1.  Familiarise yourself with the RAP Skeleton Lite folder structure.
  2.  Knit the `rap_skeleton_lite_demo.Rmd` demo report to check that the RAP
  Skeleton Lite is working correctly.
  3.  Use the `start_newreport.R` script to set up a new report and begin
  adapting the template for your publication.

The following sections of this guide explain each of these steps in more detail.

</details>

<details>
  <summary><strong>Contents of the RAP Skeleton Lite</strong></summary>

The following table lists the RAP Skeleton Lite contents and their purpose:

| File Path                         | Description                                                                                                                                               |
| --------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------|
| `code/rap_skeleton_lite_demo.Rmd` | Completed demo of the general HTML report, containing examples for users to explore                                                                       |
| `code/BQR_template.Rmd`           | Background Quality Report template                                                                                                                        |
| `code/start_new_report.R`         | Creates a new general HTML report from the RAP Skeleton Lite template                                                                                     |
| `code/start_new_BQR_report.R`     | Creates a new BQR from the BQR template                                                                                                                   |
| `code/config.R`                   | Main configuration and publication metadata                                                                                                               |
| `code/data_prep.R`                | Data loading and preparation                                                                                                                              |
| `code/functions/`                 | Reusable functions used to create and format the reports                                                                                                  |
| `code/meta.html`                  | HTML containing metadata that is included through the YAML of `rap_skeleton_lite_demo.Rmd` and `BQR_template.Rmd` to support search engine optimisation   |
| `code/annotation.js`              | JavaScript used to add, edit and save annotations within the reports                                                                                      |             
| `code/consent_head.html`          | Initialises Google Consent Mode v2 and Google Tag Manager before other analytics code                                                                     |
| `code/cookie_banner.html`         | Manages the NISRA cookie consent banner, stores the user's preference and updates analytics consent                                                       |
| `code/style.css`                  | CSS used to style the HTML reports and apply NISRA/departmental branding                                                                                  |
| `outputs/`                        | Location where completed HTML outputs are saved                                                                                                           |
| `.gitignore`                      | Specifies files and folders that Git should ignore and not track                                                                                          |

#### rap_skeleton_lite_demo.Rmd

A demo HTML report called `rap_skeleton_lite_demo.Rmd` is included within the
RAP Skeleton Lite project. The purpose of the demo is to:

* View, explore and interact with a demo HTML report.

* Show the file structure and set-up needed to organise and produce a simple
  HTML report. Use the demo to learn more about the
  `rap_skeleton_lite_demo.Rmd` file as well as the associated `config.R`
  file.

* Get inspiration for your own HTML report by viewing examples of elements
  that can be included and exploring the R code used to create them.

Click the link to view the
[demo HTML report](https://datavis.nisra.gov.uk/techlab/drpvze/RAP-demo-report-lite.html)
or users can view the demo HTML report by knitting the
`rap_skeleton_lite_demo.Rmd` file. Instructions for this procedure will
follow further down this document.

#### BQR_template.Rmd

A demo BQR HTML report called `BQR_template.Rmd` is included within the RAP
Skeleton Lite project. The purpose of the BQR template is to provide users with
an example structure for producing their own BQRs in line with the template and
guidance provided by NISRA Statistical Support Branch (SSB).

Click the link to view the
[BQR HTML report](https://datavis.nisra.gov.uk/techlab/drpvze/BQR_template.html)
or users can view the demo HTML report by knitting the `BQR_template.Rmd`
file. Instructions for this procedure will follow further down this document.

</details>

<details>
  <summary><strong>Getting started</strong></summary>

After setting up RAP Skeleton Lite and opening the project in RStudio, you can
either:

  -   knit and explore one of the example reports; or
  -   create your own HTML report using either the general report template or
  the BQR template.

If this is your first time using RAP Skeleton Lite, it is recommended that you
explore the relevant example before creating your own report. This will show you
what the completed HTML output can look like and demonstrate the features
available within the template.

#### Knitting the demos

RAP Skeleton Lite includes example reports that can be knitted locally to help
you explore the templates and see how the completed HTML outputs work.

##### General report demo

The `rap_skeleton_lite_demo.Rmd` file provides a completed example of the
general RAP Skeleton Lite report.

With the RAP Skeleton Lite project open in RStudio:

  1.  Open `rap_skeleton_lite_demo.Rmd` by selecting it from the **Files** pane
  in RStudio (`code/rap_skeleton_lite_demo.Rmd`).
  2.  Select **Knit** at the top of the `rap_skeleton_lite_demo.Rmd` window or
  use the keyboard shortcut `Ctrl + Shift + K`.

When knitting is complete, the demo HTML report should open in RStudio. A copy
will also be saved in the `outputs` folder.

You can use the completed demo to explore the available report elements and
review the R Markdown code used to create them.

##### BQR report

The `BQR_template.Rmd` file provides the structure and example content for
creating a Background Quality Report.

To view the BQR as a completed HTML report:

  1.  Open `BQR_template.Rmd` from the **Files** pane in RStudio
  (`code/BQR_template.Rmd`).
  2.  Select **Knit** or use the keyboard shortcut `Ctrl + Shift + K`.

When knitting is complete, the BQR HTML report should open in RStudio and a copy
will be saved in the `outputs` folder.

After exploring the relevant example, you can create your own report using
either `start_new_report.R` or `start_new_BQR_report.R`, as described in the
next section.

#### Create an HTML report with the RAP Skeleton Lite template

RAP Skeleton Lite provides separate scripts for creating a general HTML report
and a Background Quality Report:

  -   `start_new_report.R` creates a general HTML report.
  -   `start_new_BQR_report.R` creates a BQR.

##### Using the `start_new_report.R` or `start_new_BQR_report.R`
  
    1.  You can create a new HTML report by opening the `start_new_report.R`
    file or a new BQR report by opening the `start_new_BQR_report.R` file:

    2.  Press (<kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>R</kbd>) to run the code.

    3.  A prompt will appear in the Console:

<img width="100%" src="images/Screenshot_enter_title.png">

    4.  Enter the name of your new report into the console and press Enter.

<img width="100%" src="images/Screenshot_added_title.png">

Running `start_new_report.R` opens a new R Markdown document with the NISRA
header, footer and cookies already in place. You can begin adding your content
in this document on the line marked “Start adding content here” in the script.
Do not remove or modify the banner, footer or cookie code unless you understand
how these components are implemented.

Similarly, running `start_new_BQR_report.R` opens a new R Markdown document with
the NISRA BQR template already in place. You can begin adding your content in
this document under the pre-populated headers in the script. Do not remove or
modify the banner, footer or cookie code unless you understand how these
components are implemented.

You can refer to the demo reports to familiarise yourself with the structure
and components that can be used to produce your report.

Click the Knit button at the top of the script pane or press `Ctrl + Shift + K`
to produce your new HTML report. This will be automatically saved in the
`outputs` folder.

The departmental theme can be edited in the `config.R` script. Open this
script, edit the value and save the change before knitting the document.

#### Using a copy of rap_skeleton_lite_demo.Rmd

You can also use the `rap_skeleton_lite_demo.Rmd` or the `BQR_template.Rmd`
script to create a new report.

First, make a copy of the file and rename it appropriately for your report. You
can then use the demo report's content to build your report - adding, editing or
removing the examples as needed.

</details>

<details>
  <summary><strong>Working with Git and GitHub</strong></summary>

If you created your project using the RAP Skeleton Lite GitHub template, your
local RStudio project is connected to your publication repository on GitHub.

Git tracks changes made to the files within the repository, while GitHub
provides a shared location where those changes can be stored and reviewed by
other members of your team.

#### Before starting work

If other people are also working on the repository, it is good practice to pull
the latest changes from GitHub before starting work.

In RStudio, select **Pull** from the Git pane.

Alternatively, run the following command in the RStudio Terminal:

`git pull`

This retrieves changes that have been pushed to the current branch on GitHub and
integrates them into your local copy.

#### Making and reviewing changes

Work on the project normally in RStudio. Git will identify files that have been
added, modified or deleted.

You can view these changes in the **Git** pane in RStudio.

Before committing changes:

  1.  Save your files.
  2.  Review the files that Git identifies as changed.
  3.  Check that the report still runs and knits as expected.
  4.  Review the completed HTML output.

Avoid committing files containing sensitive or restricted data, passwords,
credentials or other information that should not be stored in GitHub.

#### Committing changes

Using the RStudio Git pane:

  1.  Select the files you want to include in the commit.
  2.  Select **Commit**.
  3.  Review the changes shown in the commit window.
  4.  Enter a short, meaningful commit message describing the change.
  5.  Select **Commit**.

Alternatively, changes can be committed using the RStudio Terminal:

`git add -A`
`git commit -m "Update report content"`

Use commit messages that clearly describe what has changed rather than vague
descriptions such as `"changes"` or `"update"`.

#### Push changes to GitHub

A commit initially exists only in your local repository. To send your committed
changes to GitHub, select **Push** from the Git pane in RStudio.

Alternatively, run:

`git push`

Once the push is complete, the committed changes will be available in the
corresponding branch of the GitHub repository.

#### Using branches

For substantial changes, it is recommended that you create a separate branch
rather than working directly on `main`.

Branches allow changes to be developed and tested separately from the main
version of the publication.

For example, a branch could be created for:

  -   updating publication content;
  -   changing branding or styling;
  -   adding new report sections; or
  -   upgrading to a new version of RAP Skeleton Lite.

Use a short, descriptive branch name, for example:

`update-report-content`

Once the work on the branch is complete:

  1.  Commit the changes.
  2.  Push the branch to GitHub.
  3.  Open a pull request on GitHub.
  4.  Review and test the changes.
  5.  Merge the pull request into `main` once the changes have been approved.

After the branch has been merged, switch back to `main` and pull the latest
version before beginning further work.

#### Working collaboratively

When several people work on the same publication repository:

  -   pull the latest changes before starting work;
  -   use separate branches for substantial pieces of work;
  -   make regular, meaningful commits;
  -   push your work to GitHub so that it is available to the rest of the team;
  -   use pull requests to review changes before merging them into `main`; and
  -   avoid having multiple people make substantial changes to the same files at
  the same time where possible.

If Git identifies conflicting changes to the same part of a file, these will
need to be reviewed and resolved before the changes can be merged.

#### Using Pull Requests

When several people work on a project, pull requests can be an important tool
for reviewing and implementing changes from different GitHub branches. Pull 
requests help by highlighting which parts of the code have been added to and 
modified. This makes it easier for reviewers to view the changes being made to
the codebase.

To create a pull request from a branch:

  - Click `Pull request`.
  - Then click the green button in the top right `New pull request`.
  - In the branch dropdown select your branch from the list of branches.
  - Then click the button `Create pull request`.
  
You can request specific contributors to review the changes. This helps to
streamline code review and makes it easier to identify and resolve issues before
changes are merged into `main`.

#### Working on an existing RAP Skeleton Lite project

If a publication repository already exists on GitHub, **do not create another**
**repository from the RAP Skeleton Lite template**.

Instead, clone the existing repository.

  1.  Open the existing repository on GitHub.
  2.  Select the green **Code** button and copy the repository URL.
  3.  Open RStudio.
  4.  Select **File > New Project > Version Control > Git**.
  5.  Paste the repository URL into the **Repository URL** field.
  6.  Choose where the project should be stored locally.
  7.  Select **Create Project**.

RStudio will create a local copy of the existing repository and connect it to
the same GitHub repository used by the rest of the team.

#### Keeping your project up to date

Repositories created using **Use this template** are independent of the original
RAP Skeleton Lite repository. Updates made to RAP Skeleton Lite are therefore
**not automatically applied** to publication repositories that have already been
created.

When a new version of RAP Skeleton Lite is released, follow the relevant upgrade
guidance in this README rather than creating a new publication repository.

</details>

<details>
  <summary><strong>Accessibility & Best Practices</strong></summary>

Accessibility should be considered throughout the development of an HTML report.
The RAP Skeleton Lite includes accessible features and examples, but users
should also review their own content.

- Follow a logical heading structure, for example **H1 > H2 > H3**, without
skipping heading levels.

- Provide appropriate `alt` text for images and infographics. Decorative images
should use empty alt text (`alt=""`). Avoid redundant phrases such as
`"Image of..."`.

- Use headings to identify sections and structure content rather than using
heading styles purely for visual formatting.

- Do not use bold text as a substitute for headings. Use the appropriate heading
level for headings and reserve bold or emphasised text for content that requires
additional importance or emphasis.

- Use colour combinations with sufficient contrast between text, graphical
elements and their backgrounds. Do not rely on colour alone to communicate
information.

- Use descriptive link text that explains the purpose or destination of the
link. For example, the
[NISRA Accessibility Statement](https://datavis.nisra.gov.uk/dissemination/accessibility-statement-visualisations.html)
is included in the footer of the RAP Skeleton Lite reports.
 
- Avoid using images of text where real HTML text can be used instead.

- Ensure that content follows a logical reading order. Where more complex
layouts are used, check that the reading order remains meaningful when accessed
using assistive technology.

- Use appropriate HTML landmarks to identify the main areas of the page, such as
`<main>`, `<header>`, `<nav>` and `<footer>`, where applicable. 

#### Image requirements for accessibility

Images within HTML reports should be implemented so that their content and
purpose are accessible to users of assistive technology.

-   Informative images should have concise and meaningful `alt` text that
communicates their purpose or important content.
-   Decorative images should use empty alt text: `alt=""`. This allows screen
readers to ignore images that do not add meaningful information.
-   Avoid phrases such as `"Image of"` or `"Picture of"` in alt text, as screen
readers already identify the element as an image. For example, use
`alt="Joe Bloggs"` rather than `alt="Image of Joe Bloggs"`.

Examples:

For a decorative .svg image:

``` html
<img src="../images/decorative.svg" alt="">
```

For an informative .png image:

``` html
<img src="../images/nisra-logo.png" alt="NISRA logo">
```

Both PNG and SVG images can be used accessibly when implemented correctly.
However, SVG files containing text or complex information should be carefully
tested with assistive technology. If an SVG cannot be made sufficiently
accessible, consider providing the information as HTML text or using an
alternative image format with appropriate text alternatives.

</details>

<details>
  <summary><strong>Updating to V3 from RAP Skeleton Lite V2</strong></summary>

The file structure of RAP Skeleton Lite V3 is similar to V2 and the overall
workflow remains largely unchanged. It is recommended that reports created using
V2 are updated to RAP Skeleton Lite V3.

Rather than manually adding individual V3 features to an older version of RAP
Skeleton Lite, use V3 as the new base and move your project-specific code and
content into it. This helps ensure that your project receives the latest
template, branding, accessibility and code improvements.

The steps below explain how to update an existing project while retaining its
existing Git history where applicable.

You will:

  -   download the updated RAP Skeleton Lite;
  -   move your project-specific code and content into the updated template;
  -   replace the contents of your existing project with the prepared V3
  template while retaining the existing `.git` directory where applicable;
  -   test the updated project; and
  -   commit and push the updated code if the project is stored on GitHub.

#### 1. Before You Start

 1.  If your project is stored on GitHub:
    -   Open the existing project in RStudio.
    -   Commit any outstanding changes.
    -   Push the changes to GitHub.
    -   It is recommended that you create a new branch for the update, for
    example `rap-skeleton-lite-v3-update`.

  2.  Close RStudio before replacing or moving project files.

  3.  Identify your existing project folder.
    -   If the project uses Git, this is the folder containing the hidden `.git`
    directory and usually a `.Rproj` file.
  
  4.  **⚠️ If your project uses Git, make sure hidden items are visible in**
  **File Explorer before continuing**.
      -    In File Explorer, select **View > Show > Hidden items**. The exact
      menu may vary depending on your version of Windows. Ensure this is set to 
      "Show hidden folders, files, or drives". 
      -    The `.git` directory is particularly important because it contains
      the information that connects your local repository to Git and preserves
      its existing history. **Do not delete the `.git` directory**.

#### 2. Download RAP Skeleton Lite V3

  1. Go to the RAP Skeleton Lite repository on GitHub.
  2. Download the latest V3 release as a **ZIP file** using
  **Code > Download ZIP**, or download the appropriate ZIP from the latest
  release.
  3. Extract the ZIP to a separate location on your computer for example
  `C:/Users/.../rap-skeleton-lite-3.0/`.

For the purposes of the instructions below, the extracted folder is referred to
as `rap-skeleton-lite-3.0`.

Keep this folder separate from your existing project while preparing the update.

**Note:** The Use this template workflow described earlier in this README is
recommended when creating a new RAP Skeleton Lite project. For an existing V2
project, these upgrade instructions use a separate copy of V3 so that the
existing project and its Git history can be retained.

#### 3. Add your project-specific content to RAP Skeleton Lite V3

Use the files in `rap-skeleton-lite-3.0` as the new base for your project and
transfer the project-specific content from your existing V2 project.

This may include:

-   Update the new V3 `config.R` with the configuration and publication metadata
required for your project.

-   If your report requires additional R packages that are not already included
in RAP Skeleton Lite V3, ensure that these are loaded appropriately in
`config.R` using `library()`.

-   Copy any project-specific images into the appropriate `images` folder.

-   Transfer your data loading, processing and preparation code into the new V3
`data_prep.R`. V3 uses `here()` to construct project-relative file paths. For
example:

```
source(
  here(
    "code",
    "config.R"
  )
)
```
This avoids relying on working-directory-specific paths and makes file
references more consistent throughout the project.

-   Transfer the content of your existing general report or BQR into the
appropriate V3 `.Rmd` file.

-   Copy any other project-specific scripts, functions or supporting files that
are still required.

Take care not to overwrite newer V3 template files or functions with older V2
versions unless your project contains specific custom changes that are still
required.

When this process is complete, `rap-skeleton-lite-3.0` should contain the
updated V3 template together with the content and code specific to your
publication.

#### 4. Replace the contents of your existing project

If your project is stored on GitHub, retain the existing project folder so that
its `.git` directory and Git history are preserved.

For these instructions, the existing Git-connected project folder is referred to
as `YOUR_PROJECT`.

  1.  Ensure that RStudio is closed.
  2.  Open the `YOUR_PROJECT` folder in File Explorer.
  3.  If the project uses Git, confirm that the hidden `.git` directory is
  present before deleting or replacing any files.
  4.  Delete the old RAP Skeleton Lite files and folders that are being
  replaced, but **do not delete the `.git` folder**.
  The `.Rproj.user` directory, if present, contains local RStudio project state
  rather than project source code and does not need to be retained as part of
  the migration.
  5.  Open the prepared `rap-skeleton-lite-3.0` folder from Step 3.
  6.  Copy the updated files and folders **from `rap-skeleton-lite-3.0` into**
  **`YOUR_PROJECT`**.
  7.  Rename the new `.Rproj` file within `YOUR_PROJECT` if required so that it
  uses an appropriate name for your project.

Your `YOUR_PROJECT` folder should now contain RAP Skeleton Lite V3 and your
project-specific content while retaining the existing `.git` directory and Git
history.

If your project is **not** stored in Git, you can instead use the prepared
`rap-skeleton-lite-3.0` folder as the updated version of your project and rename
or move the folder as required.

#### 5. Open and test the updated project

  1. Open the updated project using the `.Rproj` file.
  2. Ensure that you are using the required version of R for RAP Skeleton Lite
  V3. **(R version 4.6.1)**
  3. Open `config.R` and check that the required packages load correctly.
  4. Test the updated project thoroughly. Depending on your project, this should
  include:
      - sourcing `config.R` and `data_prep.R`;
      - checking that any additional project-specific scripts or functions run
      correctly;
      - knitting the general HTML report or BQR;
      - checking that data, images and other required resources are found
      correctly;
      - checking that the appropriate departmental branding is applied;
      - checking that the banner, footer and cookie functionality work
      correctly; and
      - reviewing the completed HTML output for any unexpected changes.

If packages required specifically by your publication are not installed on your
computer, install them before testing the updated report.

#### 6. Commit and push the V3 update

  1.  If your project is stored on GitHub, review the changes carefully before
  committing them.
  2.  You can use the Git pane in RStudio or the RStudio Terminal.
  3.  To stage all changes:

      - Run this command in your Terminal in RStudio `git add -A`.
      **Or**
      - Manually stage changes in your Git pane

  4. Commit the changes with a clear message, for example:

      -  Run this command in your Terminal in RStudio
      `git commit -m "Update project to RAP Skeleton Lite V3"`
       **Or**
      - Manually commit your changes through the button in RStudio and add an
      appropriate message.

  5. Push the changes to GitHub:
  
      - Run this command in your Terminal in RStudio `git push`
      **Or**
      - Manually push your changes through the button in RStudio.

  6. If the update was completed on a separate branch, open a pull request on
  GitHub and review and test the changes before merging the branch into `main`.

Once these steps are complete, your existing project will use RAP Skeleton Lite
V3 while retaining its project-specific content and, where applicable, its
existing Git history.

</details>
