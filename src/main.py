from simulation.theoretical_model import TheoreticalModel
from simulation.computational_model import ComputationalModel
from simulation.environment import SimulationEnvironment

def main():
    # Step 1: Initialize the Theoretical Model
    theoretical_model = TheoreticalModel(atom_type="Hydrogen")

    # Step 2: Initialize the Computational Model with the Theoretical Model
    computational_model = ComputationalModel(theoretical_model)

    # Step 3: Set up the Simulation Environment
    environment = SimulationEnvironment()
    environment.add_component("Electron Detector", {})  # Adding a detector as an example component

    # Step 4: Configure Simulation Parameters
    parameters = {"energy_level": 1}
    environment.set_parameters(parameters)

    # Step 5: Run the Simulation
    environment.run_simulation(computational_model)

    # Step 6: Collect and Analyze Data
    data = environment.collect_data()
    print("Collected Data:", data)

    # Displaying final environment and model information
    environment.display_environment_info()
    computational_model.display_algorithm_info()

if __name__ == "__main__":
    main()
