# Getting Started

## Step 1: Install the Dependencies

```bash
# using npm
npm install

# OR using Yarn
yarn install
```

## Step 2: Install Pods

```bash
npx pod-install
```

## Step 3: Open the ios workspace

1. Open the `ios` directory
2. Open the `<- Project ->.xcworkspace` file

## Step 4: Validate swift packages

In the Xcode workspace, go to `File -> Packages -> Resolve Package Versions`

## Step 5: Sign the app with your Apple ID

1. In Xcode, select the project in the navigator
1. Go to `General`
1. Go to `Signing & Capabilities`
1. Select your team from the dropdown

## Step 6: Run the project

Click the play button in Xcode to run the project

NOTE: The project works on real devices only. Make sure to select a real device before running the project.

> For this test project, the results are printed on console. If you want to deal with the results, you can modify the code in `Home.jsx` file.
