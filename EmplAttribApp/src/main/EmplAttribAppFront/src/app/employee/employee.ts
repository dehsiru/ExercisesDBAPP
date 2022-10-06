import {v4 as uuidv4} from "uuid";

export interface Employee{

  id: typeof uuidv4;
  name: string;
  hasCar: boolean;
  address: string;
  birthdate: Date;
}
