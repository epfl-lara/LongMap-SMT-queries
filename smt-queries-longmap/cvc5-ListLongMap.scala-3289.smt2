; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45678 () Bool)

(assert start!45678)

(declare-fun b!504217 () Bool)

(declare-fun res!305430 () Bool)

(declare-fun e!295240 () Bool)

(assert (=> b!504217 (=> (not res!305430) (not e!295240))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32434 0))(
  ( (array!32435 (arr!15597 (Array (_ BitVec 32) (_ BitVec 64))) (size!15961 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32434)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!504217 (= res!305430 (and (= (size!15961 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15961 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15961 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504218 () Bool)

(declare-fun res!305435 () Bool)

(assert (=> b!504218 (=> (not res!305435) (not e!295240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504218 (= res!305435 (validKeyInArray!0 (select (arr!15597 a!3235) j!176)))))

(declare-fun b!504219 () Bool)

(declare-fun res!305438 () Bool)

(assert (=> b!504219 (=> (not res!305438) (not e!295240))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!504219 (= res!305438 (validKeyInArray!0 k!2280))))

(declare-fun b!504220 () Bool)

(declare-fun e!295236 () Bool)

(declare-fun e!295239 () Bool)

(assert (=> b!504220 (= e!295236 e!295239)))

(declare-fun res!305434 () Bool)

(assert (=> b!504220 (=> res!305434 e!295239)))

(declare-fun lt!229528 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4064 0))(
  ( (MissingZero!4064 (index!18444 (_ BitVec 32))) (Found!4064 (index!18445 (_ BitVec 32))) (Intermediate!4064 (undefined!4876 Bool) (index!18446 (_ BitVec 32)) (x!47465 (_ BitVec 32))) (Undefined!4064) (MissingVacant!4064 (index!18447 (_ BitVec 32))) )
))
(declare-fun lt!229527 () SeekEntryResult!4064)

(assert (=> b!504220 (= res!305434 (or (bvsgt (x!47465 lt!229527) #b01111111111111111111111111111110) (bvslt lt!229528 #b00000000000000000000000000000000) (bvsge lt!229528 (size!15961 a!3235)) (bvslt (index!18446 lt!229527) #b00000000000000000000000000000000) (bvsge (index!18446 lt!229527) (size!15961 a!3235)) (not (= lt!229527 (Intermediate!4064 false (index!18446 lt!229527) (x!47465 lt!229527))))))))

(assert (=> b!504220 (= (index!18446 lt!229527) i!1204)))

(declare-datatypes ((Unit!15332 0))(
  ( (Unit!15333) )
))
(declare-fun lt!229529 () Unit!15332)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32434 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15332)

(assert (=> b!504220 (= lt!229529 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229528 #b00000000000000000000000000000000 (index!18446 lt!229527) (x!47465 lt!229527) mask!3524))))

(assert (=> b!504220 (and (or (= (select (arr!15597 a!3235) (index!18446 lt!229527)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15597 a!3235) (index!18446 lt!229527)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15597 a!3235) (index!18446 lt!229527)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15597 a!3235) (index!18446 lt!229527)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229535 () Unit!15332)

(declare-fun e!295242 () Unit!15332)

(assert (=> b!504220 (= lt!229535 e!295242)))

(declare-fun c!59675 () Bool)

(assert (=> b!504220 (= c!59675 (= (select (arr!15597 a!3235) (index!18446 lt!229527)) (select (arr!15597 a!3235) j!176)))))

(assert (=> b!504220 (and (bvslt (x!47465 lt!229527) #b01111111111111111111111111111110) (or (= (select (arr!15597 a!3235) (index!18446 lt!229527)) (select (arr!15597 a!3235) j!176)) (= (select (arr!15597 a!3235) (index!18446 lt!229527)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15597 a!3235) (index!18446 lt!229527)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504221 () Bool)

(declare-fun res!305427 () Bool)

(declare-fun e!295241 () Bool)

(assert (=> b!504221 (=> (not res!305427) (not e!295241))))

(declare-datatypes ((List!9755 0))(
  ( (Nil!9752) (Cons!9751 (h!10628 (_ BitVec 64)) (t!15983 List!9755)) )
))
(declare-fun arrayNoDuplicates!0 (array!32434 (_ BitVec 32) List!9755) Bool)

(assert (=> b!504221 (= res!305427 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9752))))

(declare-fun res!305429 () Bool)

(assert (=> start!45678 (=> (not res!305429) (not e!295240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45678 (= res!305429 (validMask!0 mask!3524))))

(assert (=> start!45678 e!295240))

(assert (=> start!45678 true))

(declare-fun array_inv!11393 (array!32434) Bool)

(assert (=> start!45678 (array_inv!11393 a!3235)))

(declare-fun b!504222 () Bool)

(declare-fun Unit!15334 () Unit!15332)

(assert (=> b!504222 (= e!295242 Unit!15334)))

(declare-fun lt!229533 () Unit!15332)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32434 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15332)

(assert (=> b!504222 (= lt!229533 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229528 #b00000000000000000000000000000000 (index!18446 lt!229527) (x!47465 lt!229527) mask!3524))))

(declare-fun lt!229530 () (_ BitVec 64))

(declare-fun lt!229534 () array!32434)

(declare-fun res!305425 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32434 (_ BitVec 32)) SeekEntryResult!4064)

(assert (=> b!504222 (= res!305425 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229528 lt!229530 lt!229534 mask!3524) (Intermediate!4064 false (index!18446 lt!229527) (x!47465 lt!229527))))))

(declare-fun e!295234 () Bool)

(assert (=> b!504222 (=> (not res!305425) (not e!295234))))

(assert (=> b!504222 e!295234))

(declare-fun b!504223 () Bool)

(assert (=> b!504223 (= e!295241 (not e!295236))))

(declare-fun res!305431 () Bool)

(assert (=> b!504223 (=> res!305431 e!295236)))

(declare-fun lt!229532 () (_ BitVec 32))

(assert (=> b!504223 (= res!305431 (= lt!229527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229532 lt!229530 lt!229534 mask!3524)))))

(assert (=> b!504223 (= lt!229527 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229528 (select (arr!15597 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504223 (= lt!229532 (toIndex!0 lt!229530 mask!3524))))

(assert (=> b!504223 (= lt!229530 (select (store (arr!15597 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!504223 (= lt!229528 (toIndex!0 (select (arr!15597 a!3235) j!176) mask!3524))))

(assert (=> b!504223 (= lt!229534 (array!32435 (store (arr!15597 a!3235) i!1204 k!2280) (size!15961 a!3235)))))

(declare-fun e!295238 () Bool)

(assert (=> b!504223 e!295238))

(declare-fun res!305433 () Bool)

(assert (=> b!504223 (=> (not res!305433) (not e!295238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32434 (_ BitVec 32)) Bool)

(assert (=> b!504223 (= res!305433 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229537 () Unit!15332)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32434 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15332)

(assert (=> b!504223 (= lt!229537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504224 () Bool)

(declare-fun res!305426 () Bool)

(assert (=> b!504224 (=> (not res!305426) (not e!295241))))

(assert (=> b!504224 (= res!305426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504225 () Bool)

(assert (=> b!504225 (= e!295239 true)))

(declare-fun lt!229536 () SeekEntryResult!4064)

(assert (=> b!504225 (= lt!229536 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229528 lt!229530 lt!229534 mask!3524))))

(declare-fun b!504226 () Bool)

(declare-fun Unit!15335 () Unit!15332)

(assert (=> b!504226 (= e!295242 Unit!15335)))

(declare-fun b!504227 () Bool)

(assert (=> b!504227 (= e!295240 e!295241)))

(declare-fun res!305432 () Bool)

(assert (=> b!504227 (=> (not res!305432) (not e!295241))))

(declare-fun lt!229531 () SeekEntryResult!4064)

(assert (=> b!504227 (= res!305432 (or (= lt!229531 (MissingZero!4064 i!1204)) (= lt!229531 (MissingVacant!4064 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32434 (_ BitVec 32)) SeekEntryResult!4064)

(assert (=> b!504227 (= lt!229531 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!504228 () Bool)

(declare-fun res!305437 () Bool)

(assert (=> b!504228 (=> res!305437 e!295239)))

(declare-fun e!295237 () Bool)

(assert (=> b!504228 (= res!305437 e!295237)))

(declare-fun res!305436 () Bool)

(assert (=> b!504228 (=> (not res!305436) (not e!295237))))

(assert (=> b!504228 (= res!305436 (bvsgt #b00000000000000000000000000000000 (x!47465 lt!229527)))))

(declare-fun b!504229 () Bool)

(assert (=> b!504229 (= e!295234 false)))

(declare-fun b!504230 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32434 (_ BitVec 32)) SeekEntryResult!4064)

(assert (=> b!504230 (= e!295237 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229528 (index!18446 lt!229527) (select (arr!15597 a!3235) j!176) a!3235 mask!3524) (Found!4064 j!176))))))

(declare-fun b!504231 () Bool)

(declare-fun res!305428 () Bool)

(assert (=> b!504231 (=> res!305428 e!295236)))

(assert (=> b!504231 (= res!305428 (or (undefined!4876 lt!229527) (not (is-Intermediate!4064 lt!229527))))))

(declare-fun b!504232 () Bool)

(declare-fun res!305424 () Bool)

(assert (=> b!504232 (=> (not res!305424) (not e!295240))))

(declare-fun arrayContainsKey!0 (array!32434 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504232 (= res!305424 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504233 () Bool)

(assert (=> b!504233 (= e!295238 (= (seekEntryOrOpen!0 (select (arr!15597 a!3235) j!176) a!3235 mask!3524) (Found!4064 j!176)))))

(assert (= (and start!45678 res!305429) b!504217))

(assert (= (and b!504217 res!305430) b!504218))

(assert (= (and b!504218 res!305435) b!504219))

(assert (= (and b!504219 res!305438) b!504232))

(assert (= (and b!504232 res!305424) b!504227))

(assert (= (and b!504227 res!305432) b!504224))

(assert (= (and b!504224 res!305426) b!504221))

(assert (= (and b!504221 res!305427) b!504223))

(assert (= (and b!504223 res!305433) b!504233))

(assert (= (and b!504223 (not res!305431)) b!504231))

(assert (= (and b!504231 (not res!305428)) b!504220))

(assert (= (and b!504220 c!59675) b!504222))

(assert (= (and b!504220 (not c!59675)) b!504226))

(assert (= (and b!504222 res!305425) b!504229))

(assert (= (and b!504220 (not res!305434)) b!504228))

(assert (= (and b!504228 res!305436) b!504230))

(assert (= (and b!504228 (not res!305437)) b!504225))

(declare-fun m!484977 () Bool)

(assert (=> b!504222 m!484977))

(declare-fun m!484979 () Bool)

(assert (=> b!504222 m!484979))

(declare-fun m!484981 () Bool)

(assert (=> b!504232 m!484981))

(declare-fun m!484983 () Bool)

(assert (=> b!504218 m!484983))

(assert (=> b!504218 m!484983))

(declare-fun m!484985 () Bool)

(assert (=> b!504218 m!484985))

(assert (=> b!504230 m!484983))

(assert (=> b!504230 m!484983))

(declare-fun m!484987 () Bool)

(assert (=> b!504230 m!484987))

(declare-fun m!484989 () Bool)

(assert (=> b!504219 m!484989))

(declare-fun m!484991 () Bool)

(assert (=> b!504227 m!484991))

(declare-fun m!484993 () Bool)

(assert (=> b!504221 m!484993))

(assert (=> b!504223 m!484983))

(declare-fun m!484995 () Bool)

(assert (=> b!504223 m!484995))

(declare-fun m!484997 () Bool)

(assert (=> b!504223 m!484997))

(declare-fun m!484999 () Bool)

(assert (=> b!504223 m!484999))

(declare-fun m!485001 () Bool)

(assert (=> b!504223 m!485001))

(declare-fun m!485003 () Bool)

(assert (=> b!504223 m!485003))

(assert (=> b!504223 m!484983))

(declare-fun m!485005 () Bool)

(assert (=> b!504223 m!485005))

(declare-fun m!485007 () Bool)

(assert (=> b!504223 m!485007))

(assert (=> b!504223 m!484983))

(declare-fun m!485009 () Bool)

(assert (=> b!504223 m!485009))

(assert (=> b!504233 m!484983))

(assert (=> b!504233 m!484983))

(declare-fun m!485011 () Bool)

(assert (=> b!504233 m!485011))

(assert (=> b!504225 m!484979))

(declare-fun m!485013 () Bool)

(assert (=> b!504220 m!485013))

(declare-fun m!485015 () Bool)

(assert (=> b!504220 m!485015))

(assert (=> b!504220 m!484983))

(declare-fun m!485017 () Bool)

(assert (=> start!45678 m!485017))

(declare-fun m!485019 () Bool)

(assert (=> start!45678 m!485019))

(declare-fun m!485021 () Bool)

(assert (=> b!504224 m!485021))

(push 1)

