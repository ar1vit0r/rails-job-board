admin = User.create!(
  email: "admin@example.com",
  password: "password",
  role: "admin"
)

companies = Company.create!([
  { name: "Acme Corp", website: "https://acme.example.com", description: "Building the future of widgets." },
  { name: "TechStartup", website: "https://techstartup.example.com", description: "AI-powered productivity tools." },
  { name: "RemoteFirst Inc", website: "https://remotefirst.example.com", description: "100% remote company since day one." }
])

Job.create!([
  { title: "Senior Rails Developer", description: "We need an experienced Rails developer to lead our backend team. You'll work on scaling our API and mentoring junior developers.", location: "San Francisco, CA", remote: false, salary_min: 120000, salary_max: 160000, company: companies[0] },
  { title: "Full Stack Engineer", description: "Join our team building the next generation of productivity tools. Experience with React and Rails required.", location: "Remote", remote: true, salary_min: 100000, salary_max: 140000, company: companies[1] },
  { title: "Junior Developer", description: "Great opportunity for someone starting their career. We provide mentorship and a supportive environment.", location: "Austin, TX", remote: false, salary_min: 60000, salary_max: 80000, company: companies[0] },
  { title: "DevOps Engineer", description: "Manage and improve our CI/CD pipelines, Kubernetes clusters, and monitoring infrastructure.", location: "Remote", remote: true, salary_min: 110000, salary_max: 150000, company: companies[2] },
  { title: "Product Manager", description: "Lead product strategy for our core platform. Work closely with engineering and design teams.", location: "New York, NY", remote: false, salary_min: 100000, salary_max: 130000, company: companies[1] }
])

puts "Seeded admin (admin@example.com / password), #{Company.count} companies, #{Job.count} jobs"
