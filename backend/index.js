import express, { Router } from "express";

function getArrayRand(array) {
  return array[Math.floor(Math.random() * array.length)];
}

function randDigit(length = 1) {
  let str = "";
  for (let i = 0; i < length; i++) {
    str += Math.floor(Math.random() * 9);
  }
  return str;
}

const app = express();
const banking = Router();

const bank_list = [
  {
    name: "Volksbank",
    bic: "VBOEATWWVBG",
  },
  {
    name: "Raiffaisen",
    bic: "RZBAATWW",
  },
  {
    name: "ErsteBank",
    bic: "GIBAATWWXXX",
  },
  {
    name: "Visa",
    bic: "VISAUS62XXX",
  },
];
const country_codes = ["AT", "DE", "CH", "LU"];

banking.get("/", (req, res) => {
  res.status(200).send("Here you can find banking informaiton.");
});

banking.get("/random", (req, res) => {
  let country_code = getArrayRand(country_codes);

  let card_num = "";
  let bank = getArrayRand(bank_list);
  for (let i = 0; i < 16; i++) {
    card_num += randDigit();
    if (i > 0 && (i + 1) % 4 == 0) {
      card_num += " ";
    }
  }

  let iban = country_code + randDigit(2) + " ";
  let iban_legnth = Math.random() * (32 - 18) + 18;

  for (let i = 0; i < iban_legnth; i++) {
    iban += randDigit();
    if (i > 0 && (i + 1) % 4 == 0) {
      iban += " ";
    }
  }

  let expiration =
    Math.floor(Math.random() * 11) +
    1 +
    "/" +
    (Math.floor(Math.random() * 8) + 20);

  res.status(200).json({
    cardNum: card_num,
    iban: iban,
    bank: bank,
    expiration: expiration,
  });
});

app.use("/banking", banking);

app.listen(8080, () => {
  console.log("Listening on port 8080.");
});
