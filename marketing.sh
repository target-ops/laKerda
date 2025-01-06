#!/bin/bash

# Exit on error
set -e

echo "Starting LAKERDA Marketing Page setup..."

# Variables
PROJECT_NAME="lakerda"
GITHUB_USERNAME="target-ops" # Replace with your GitHub username
REPO_NAME="lakerda" # Replace with your desired repo name

# 1. Create a Next.js App
echo "Creating Next.js app..."
npx create-next-app@latest $PROJECT_NAME --typescript --use-npm --eslint --tailwind --src-dir --no-app
cd $PROJECT_NAME

# 2. Install TailwindCSS
echo "Installing TailwindCSS..."
npm install tailwindcss postcss autoprefixer framer-motion
npx tailwindcss init -p

# 3. Configure TailwindCSS
echo "Configuring TailwindCSS..."
cat > tailwind.config.js <<EOL
/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {},
  },
  plugins: [],
};
EOL

# Update global styles
cat > src/styles/globals.css <<EOL
@tailwind base;
@tailwind components;
@tailwind utilities;
EOL

# 4. Add Marketing Components
echo "Creating marketing page components..."

# Create Hero Component
mkdir -p src/components
cat > src/components/Hero.tsx <<EOL
import { motion } from "framer-motion";

const Hero = () => (
  <section className="bg-gradient-to-r from-blue-500 via-purple-500 to-pink-500 text-white py-20">
    <div className="container mx-auto text-center">
      <motion.h1
        className="text-5xl font-bold mb-6"
        initial={{ opacity: 0, y: -50 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 1 }}
      >
        Meet LAKERDA
      </motion.h1>
      <motion.p
        className="text-lg mb-10"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.5, duration: 1 }}
      >
        The globally accessible, lightweight, and distributed Kubernetes solution.  
        Built for simplicity and scalability.
      </motion.p>
      <motion.a
        href="#features"
        className="bg-white text-blue-500 px-6 py-3 rounded-lg font-semibold shadow-lg hover:bg-gray-100 transition"
        whileHover={{ scale: 1.1 }}
      >
        Explore Features
      </motion.a>
    </div>
  </section>
);

export default Hero;
EOL

# Create Features Component
cat > src/components/Features.tsx <<EOL
const features = [
  { title: "Lightweight", description: "Runs on any machine with minimal resources." },
  { title: "Globally Accessible", description: "Exposed via ngrok for global reach." },
  { title: "Distributed", description: "Nodes across cities form a single cluster." },
  { title: "Simple Setup", description: "Scripts make deployment fast and easy." },
];

const Features = () => (
  <section id="features" className="bg-gray-50 py-20">
    <div className="container mx-auto text-center">
      <h2 className="text-3xl font-bold mb-10">Features</h2>
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        {features.map((feature, index) => (
          <div
            key={index}
            className="bg-white p-6 rounded-lg shadow-lg hover:shadow-2xl transition"
          >
            <h3 className="text-xl font-semibold mb-4">{feature.title}</h3>
            <p className="text-gray-600">{feature.description}</p>
          </div>
        ))}
      </div>
    </div>
  </section>
);

export default Features;
EOL

# 5. Create Main Page
echo "Creating main page..."
cat > src/pages/index.tsx <<EOL
import Hero from "../components/Hero";
import Features from "../components/Features";

const Home = () => (
  <>
    <Hero />
    <Features />
  </>
);

export default Home;
EOL

# 6. Set Up GitHub Pages Deployment
echo "Setting up GitHub Pages deployment..."
npm install gh-pages --save-dev

cat >> package.json <<EOL
  "homepage": "https://${GITHUB_USERNAME}.github.io/${REPO_NAME}",
  "scripts": {
    "build": "next build && next export",
    "deploy": "npm run build && gh-pages -d out"
  },
EOL

# 7. Initialize Git and Push to GitHub
echo "Initializing Git repository..."
# git init
git add .
git commit -m "Initial commit"
# git branch -M main

echo "Pushing to GitHub..."
# gh repo create $REPO_NAME --public --source=. --remote=origin
git push

# 8. Deploy to GitHub Pages
echo "Deploying to GitHub Pages..."
npm run deploy

echo "Setup complete! Your marketing page is live at: https://${GITHUB_USERNAME}.github.io/${REPO_NAME}"