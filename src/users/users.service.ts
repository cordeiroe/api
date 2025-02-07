import { ConflictException, Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { PrismaService } from 'src/database/prisma.service';
import { hash } from 'bcryptjs';
import { Prisma } from '@prisma/client';

@Injectable()
export class UsersService {
  constructor(private readonly prismaService: PrismaService) {}

  async create(createUserDto: CreateUserDto) {
    const { name, email, password } = createUserDto;

    const isEmailAlreadyInUse = await this.prismaService.user.findUnique({
      where: { email }
    });

    if (!isEmailAlreadyInUse) {
      const hashPass = await hash(password, 12);

      const user = await this.prismaService.user.create({
        data: {
          name,
          email,
          password: hashPass,
          categories: {
            createMany: {
              data: [
                // Income
                { descCategory: 'Salário', icon: 'salary', type: 'INCOME' },
                {
                  descCategory: 'Freelance',
                  icon: 'freelance',
                  type: 'INCOME'
                },
                { descCategory: 'Outro', icon: 'other', type: 'INCOME' },
                // Expense
                { descCategory: 'Casa', icon: 'home', type: 'EXPENSE' },
                { descCategory: 'Alimentação', icon: 'food', type: 'EXPENSE' },
                {
                  descCategory: 'Educação',
                  icon: 'education',
                  type: 'EXPENSE'
                },
                { descCategory: 'Lazer', icon: 'fun', type: 'EXPENSE' },
                { descCategory: 'Mercado', icon: 'grocery', type: 'EXPENSE' },
                { descCategory: 'Roupas', icon: 'clothes', type: 'EXPENSE' },
                {
                  descCategory: 'Transporte',
                  icon: 'transport',
                  type: 'EXPENSE'
                },
                { descCategory: 'Viagem', icon: 'travel', type: 'EXPENSE' },
                { descCategory: 'Outro', icon: 'other', type: 'EXPENSE' }
              ]
            }
          }
        }
      });
      return { message: 'Usuário criado!', name: user.name, email: user.email };
    }

    throw new ConflictException('Email já está em uso.');
  }
}
