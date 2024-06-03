import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);

  console.log('###### App runnig at port 3000 ######');
  console.log('###### Access http://localhost:3000/home ######');
}
bootstrap();
