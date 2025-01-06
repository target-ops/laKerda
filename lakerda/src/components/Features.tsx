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
