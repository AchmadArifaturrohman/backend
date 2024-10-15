const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const ROLE = [
  {
    id: 1,
    role: "SUPERADMIN",
    created_by: "Super Duper Admin",
  },
  {
    id: 2,
    role: "ADMIN",
    created_by: "Super Duper Admin",
  },
  {
    id: 3,
    role: "USER",
    created_by: "Super Duper Admin",
  },
];

async function roleSeed() {
  await prisma.roles.deleteMany();
  return await prisma.roles.createMany({
    data: ROLE,
  });
}

module.exports = roleSeed;
