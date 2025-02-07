import { Controller, Post, Body, Get } from '@nestjs/common'
import { UsersService } from './users.service'
import { CreateUserDto } from './dto/create-user.dto'

@Controller('/users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('createUser')
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto)
  }

  @Get('userByEmail')
  findByEmail(@Body() email: string) {
    return this.usersService.findByEmail(email)
  }

  @Get('allUsers')
  findAll() {
    return this.usersService.getAllUsers()
  }
}
