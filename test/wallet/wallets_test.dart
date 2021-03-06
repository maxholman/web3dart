import 'package:test/test.dart';
import 'package:web3dart/web3dart.dart';

void main() {

  group("Loading and unlocking wallets", () {
    test("with pbkdf2", () {
      var wallet = Wallet.fromJson(testWallets[0], password);

      expect(wallet.credentials.address.hexNo0x, equals(resultAddress));
    });

    test("with scrypt", () {
      var wallet = Wallet.fromJson(testWallets[0], password);

      expect(wallet.credentials.address.hexNo0x, equals(resultAddress));
    });
  
    test("with wrong password", () {
      expect(() => Wallet.fromJson(testWallets[0], password.toUpperCase()), throwsArgumentError);
    });
  });

}

// Test vectors taken from https://github.com/ethereum/wiki/wiki/Web3-Secret-Storage-Definition
List<String> testWallets = [
  """ 
{
    "crypto" : {
        "cipher" : "aes-128-ctr",
        "cipherparams" : {
            "iv" : "6087dab2f9fdbbfaddc31a909735c1e6"
        },
        "ciphertext" : "5318b4d5bcd28de64ee5559e671353e16f075ecae9f99c7a79a38af5f869aa46",
        "kdf" : "pbkdf2",
        "kdfparams" : {
            "c" : 262144,
            "dklen" : 32,
            "prf" : "hmac-sha256",
            "salt" : "ae3cd4e7013836a3df6bd7241b12db061dbe2c6785853cce422d148a624ce0bd"
        },
        "mac" : "517ead924a9d0dc3124507e3393d175ce3ff7c1e96529c6c555ce9e51205e9b2"
    },
    "id" : "3198bc9c-6672-5ab3-d995-4942343ae5b6",
    "version" : 3
}
  """,
  """
{
    "crypto" : {
        "cipher" : "aes-128-ctr",
        "cipherparams" : {
            "iv" : "83dbcc02d8ccb40e466191a123791e0e"
        },
        "ciphertext" : "d172bf743a674da9cdad04534d56926ef8358534d458fffccd4e6ad2fbde479c",
        "kdf" : "scrypt",
        "kdfparams" : {
            "dklen" : 32,
            "n" : 262144,
            "r" : 1,
            "p" : 8,
            "salt" : "ab0c7876052600dd703518d6fc3fe8984592145b591fc8fb5c6d43190334ba19"
        },
        "mac" : "2103ac29920d71da29f15d75b4a16dbe95cfd7ff8faea1056c33131d846e3097"
    },
    "id" : "3198bc9c-6672-5ab3-d995-4942343ae5b6",
    "version" : 3
}
  """
];

String resultAddress = "008aeeda4d805471df9b2a5b0f38a0c3bcba786b";
String password = "testpassword";