import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { GqlModuleOptions } from '@nestjs/graphql';
import path from 'path';

@Injectable()
export class PbEnv {
  constructor(private configService: ConfigService) {}

  isProduction(): boolean {
    return this.configService.get('NODE_ENV') === 'production';
  }

  get service() {
    return this.configService;
  }

  get NodeENv(): string {
    return this.configService.get('NODE_ENV');
  }

  get Port(): number {
    return this.configService.get('PORT');
  }

  get DatabaseURL(): string {
    return this.configService.get('DATABASE_URL');
  }

  get GqlModuleOptionsFactory(): GqlModuleOptions {
    const devOptions: GqlModuleOptions = {
      autoSchemaFile: path.join(process.cwd(), 'src/schema.gql'),
      sortSchema: true,
      debug: true,
      playground: true,
    };

    const prdOptions: GqlModuleOptions = {
      autoSchemaFile: true,
      debug: false,
      playground: false,
    };
    if (this.isProduction()) {
      return prdOptions;
    } else {
      return devOptions;
    }
  }
}
