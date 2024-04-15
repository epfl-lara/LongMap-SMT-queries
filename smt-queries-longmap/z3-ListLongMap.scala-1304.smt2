; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26384 () Bool)

(assert start!26384)

(declare-fun b!273429 () Bool)

(declare-fun res!137474 () Bool)

(declare-fun e!175217 () Bool)

(assert (=> b!273429 (=> (not res!137474) (not e!175217))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273429 (= res!137474 (validKeyInArray!0 k0!2581))))

(declare-fun b!273430 () Bool)

(declare-fun e!175216 () Bool)

(assert (=> b!273430 (= e!175217 e!175216)))

(declare-fun res!137476 () Bool)

(assert (=> b!273430 (=> (not res!137476) (not e!175216))))

(declare-datatypes ((SeekEntryResult!1541 0))(
  ( (MissingZero!1541 (index!8334 (_ BitVec 32))) (Found!1541 (index!8335 (_ BitVec 32))) (Intermediate!1541 (undefined!2353 Bool) (index!8336 (_ BitVec 32)) (x!26657 (_ BitVec 32))) (Undefined!1541) (MissingVacant!1541 (index!8337 (_ BitVec 32))) )
))
(declare-fun lt!136280 () SeekEntryResult!1541)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273430 (= res!137476 (or (= lt!136280 (MissingZero!1541 i!1267)) (= lt!136280 (MissingVacant!1541 i!1267))))))

(declare-datatypes ((array!13470 0))(
  ( (array!13471 (arr!6384 (Array (_ BitVec 32) (_ BitVec 64))) (size!6737 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13470)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13470 (_ BitVec 32)) SeekEntryResult!1541)

(assert (=> b!273430 (= lt!136280 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!137479 () Bool)

(assert (=> start!26384 (=> (not res!137479) (not e!175217))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26384 (= res!137479 (validMask!0 mask!3868))))

(assert (=> start!26384 e!175217))

(declare-fun array_inv!4356 (array!13470) Bool)

(assert (=> start!26384 (array_inv!4356 a!3325)))

(assert (=> start!26384 true))

(declare-fun b!273431 () Bool)

(declare-fun res!137472 () Bool)

(assert (=> b!273431 (=> (not res!137472) (not e!175217))))

(declare-fun arrayContainsKey!0 (array!13470 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273431 (= res!137472 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273432 () Bool)

(declare-fun res!137478 () Bool)

(assert (=> b!273432 (=> (not res!137478) (not e!175216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13470 (_ BitVec 32)) Bool)

(assert (=> b!273432 (= res!137478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273433 () Bool)

(declare-fun e!175215 () Bool)

(assert (=> b!273433 (= e!175216 e!175215)))

(declare-fun res!137475 () Bool)

(assert (=> b!273433 (=> (not res!137475) (not e!175215))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273433 (= res!137475 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136281 () array!13470)

(assert (=> b!273433 (= lt!136281 (array!13471 (store (arr!6384 a!3325) i!1267 k0!2581) (size!6737 a!3325)))))

(declare-fun b!273434 () Bool)

(declare-fun res!137477 () Bool)

(assert (=> b!273434 (=> (not res!137477) (not e!175217))))

(declare-datatypes ((List!4165 0))(
  ( (Nil!4162) (Cons!4161 (h!4828 (_ BitVec 64)) (t!9238 List!4165)) )
))
(declare-fun arrayNoDuplicates!0 (array!13470 (_ BitVec 32) List!4165) Bool)

(assert (=> b!273434 (= res!137477 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4162))))

(declare-fun b!273435 () Bool)

(declare-fun res!137471 () Bool)

(assert (=> b!273435 (=> (not res!137471) (not e!175217))))

(assert (=> b!273435 (= res!137471 (and (= (size!6737 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6737 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6737 a!3325))))))

(declare-fun b!273436 () Bool)

(assert (=> b!273436 (= e!175215 (not true))))

(assert (=> b!273436 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8535 0))(
  ( (Unit!8536) )
))
(declare-fun lt!136279 () Unit!8535)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13470 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8535)

(assert (=> b!273436 (= lt!136279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273436 (= (seekEntryOrOpen!0 (select (arr!6384 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6384 a!3325) i!1267 k0!2581) startIndex!26) lt!136281 mask!3868))))

(declare-fun lt!136278 () Unit!8535)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13470 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8535)

(assert (=> b!273436 (= lt!136278 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273436 (arrayNoDuplicates!0 lt!136281 #b00000000000000000000000000000000 Nil!4162)))

(declare-fun lt!136277 () Unit!8535)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13470 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4165) Unit!8535)

(assert (=> b!273436 (= lt!136277 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4162))))

(declare-fun b!273437 () Bool)

(declare-fun res!137473 () Bool)

(assert (=> b!273437 (=> (not res!137473) (not e!175215))))

(assert (=> b!273437 (= res!137473 (validKeyInArray!0 (select (arr!6384 a!3325) startIndex!26)))))

(assert (= (and start!26384 res!137479) b!273435))

(assert (= (and b!273435 res!137471) b!273429))

(assert (= (and b!273429 res!137474) b!273434))

(assert (= (and b!273434 res!137477) b!273431))

(assert (= (and b!273431 res!137472) b!273430))

(assert (= (and b!273430 res!137476) b!273432))

(assert (= (and b!273432 res!137478) b!273433))

(assert (= (and b!273433 res!137475) b!273437))

(assert (= (and b!273437 res!137473) b!273436))

(declare-fun m!288221 () Bool)

(assert (=> b!273437 m!288221))

(assert (=> b!273437 m!288221))

(declare-fun m!288223 () Bool)

(assert (=> b!273437 m!288223))

(declare-fun m!288225 () Bool)

(assert (=> b!273436 m!288225))

(declare-fun m!288227 () Bool)

(assert (=> b!273436 m!288227))

(declare-fun m!288229 () Bool)

(assert (=> b!273436 m!288229))

(assert (=> b!273436 m!288227))

(declare-fun m!288231 () Bool)

(assert (=> b!273436 m!288231))

(declare-fun m!288233 () Bool)

(assert (=> b!273436 m!288233))

(assert (=> b!273436 m!288221))

(declare-fun m!288235 () Bool)

(assert (=> b!273436 m!288235))

(declare-fun m!288237 () Bool)

(assert (=> b!273436 m!288237))

(declare-fun m!288239 () Bool)

(assert (=> b!273436 m!288239))

(assert (=> b!273436 m!288221))

(declare-fun m!288241 () Bool)

(assert (=> b!273436 m!288241))

(declare-fun m!288243 () Bool)

(assert (=> start!26384 m!288243))

(declare-fun m!288245 () Bool)

(assert (=> start!26384 m!288245))

(declare-fun m!288247 () Bool)

(assert (=> b!273431 m!288247))

(assert (=> b!273433 m!288231))

(declare-fun m!288249 () Bool)

(assert (=> b!273432 m!288249))

(declare-fun m!288251 () Bool)

(assert (=> b!273429 m!288251))

(declare-fun m!288253 () Bool)

(assert (=> b!273434 m!288253))

(declare-fun m!288255 () Bool)

(assert (=> b!273430 m!288255))

(check-sat (not b!273436) (not b!273434) (not b!273432) (not b!273431) (not b!273429) (not b!273430) (not b!273437) (not start!26384))
(check-sat)
