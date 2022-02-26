import { Module } from '@nestjs/common';
import { GraphQLModule } from '@nestjs/graphql';
import { PostsModule } from './components/posts/posts.module';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PbEnvModule } from '@pb-config/environments/pb-env.module';
import { PbEnv } from '@pb-config/environments/pb-env.service';

@Module({
  imports: [
    PostsModule,
    PbEnvModule,
    GraphQLModule.forRootAsync({
      inject: [PbEnv],
      useFactory: (env: PbEnv) => env.GqlModuleOptionsFactory,
    }),
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
