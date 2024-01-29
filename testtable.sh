export TYPE_SPEED=100
export DEMO_PROMPT="${GREEN}➜ ${CYAN}\W ${COLOR_RESET}"
TEMP_DIR="upgrade-example"
PROMPT_TIMEOUT=5

function startupTime() {
  echo "$(sed -nE 's/.* in ([0-9]+\.[0-9]+) seconds.*/\1/p' < $1)"
}

# Display a message with a header
function displayMessage() {
  echo "#### $1"
  echo ""
}

function statsSoFarTable {
  displayMessage "Comparison of memory usage and startup times"
  echo ""

  # Headers
  printf "%-40s %-30s %-20s %-10s %s\n" "Configuration" "Startup Time (seconds)" "Faster" "(MB) Used" "(MB) Savings"
  echo "--------------------------------------------------------------------------------------------------------------------"

  # Spring Boot 2.6 with Java 8
  #STARTUP1=$(sed -nE 's/.* in ([0-9]+\.[0-9]+) seconds.*/\1/p' < java8with2.6.log)
  #STARTUP1=$(grep -o 'Started HelloSpringApplication in .*' < java8with2.6.log)
  MEM1=$(cat java8with2.6.log2)
  START1=$(startupTime 'java8with2.6.log')
  printf "%-40s %-30s %-20s %-10s %s\n" "Spring Boot 2.6 with Java 8" "$START1" "-" "$MEM1" "-"

  # Spring Boot 3.2 with Java 21
  #STARTUP2=$(grep -o 'Started HelloSpringApplication in .*' < java21with3.2.log)
  MEM2=$(cat java21with3.2.log2)
  PERC2=$(bc <<< "scale=2; 100 - ${MEM2}/${MEM1}*100")
  START2=$(startupTime 'java21with3.2.log')
  PERCSTART2=$(bc <<< "scale=2; 100 - ${START2}/${START1}*100")
  printf "%-40s %-30s %-20s %-10s %s \n" "Spring Boot 3.2 with Java 21" "$START2" "$PERCSTART2%" "$MEM2" "$PERC2%"

  echo "--------------------------------------------------------------------------------------------------------------------"
}

# Prepare the working directory
function init {
  cd "$TEMP_DIR" || exit
}

function statsSoFarTableNative {
  displayMessage "Comparison of memory usage and startup times"
  echo ""

  # Headers
  printf "%-40s %-30s %-20s %-10s %s\n" "Configuration" "Startup Time (seconds)" "Faster" "(MB) Used" "(MB) Savings"
  echo "--------------------------------------------------------------------------------------------------------------------"

  # Spring Boot 2.6 with Java 8
  #STARTUP1=$(sed -nE 's/.* in ([0-9]+\.[0-9]+) seconds.*/\1/p' < java8with2.7.log)
  #STARTUP1=$(grep -o 'Started HelloSpringApplication in .*' < java8with2.7.log)
  MEM1=$(cat java8with2.7.log2)
  START1=$(startupTime 'java8with2.7.log')
  printf "%-40s %-30s %-20s %-10s %s\n" "Spring Boot 2.6 with Java 8" "$START1" "-" "$MEM1" "-"

  # Spring Boot 3.2 with Java 21
  #STARTUP2=$(grep -o 'Started HelloSpringApplication in .*' < java21with3.2.log)
  MEM2=$(cat java21with3.2.log2)
  PERC2=$(bc <<< "scale=2; 100 - ${MEM2}/${MEM1}*100")
  START2=$(startupTime 'java21with3.2.log')
  PERCSTART2=$(bc <<< "scale=2; 100 - ${START2}/${START1}*100")
  printf "%-40s %-30s %-20s %-10s %s \n" "Spring Boot 3.2 with Java 21" "$START2" "$PERCSTART2%" "$MEM2" "$PERC2%"

  # Spring Boot 3.2 with AOT processing, native image
  #STARTUP3=$(grep -o 'Started HelloSpringApplication in .*' < nativeWith3.2.log)
  MEM3=$(cat nativeWith3.2.log2)
  PERC3=$(bc <<< "scale=2; 100 - ${MEM3}/${MEM1}*100")
  START3=$(startupTime 'nativeWith3.2.log')
  PERCSTART3=$(bc <<< "scale=2; 100 - ${START3}/${START1}*100")
  printf "%-35s %-25s %-15s %s \n" "Spring Boot 3.2 with AOT, native" "$START3" "$PERCSTART2%" "$MEM3" "$PERC3%"


  echo "--------------------------------------------------------------------------------------------------------------------"
}


init
statsSoFarTableNative
