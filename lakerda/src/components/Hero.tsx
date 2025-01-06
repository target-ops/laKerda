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
