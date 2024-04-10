; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26364 () Bool)

(assert start!26364)

(declare-fun b!273333 () Bool)

(declare-fun e!175211 () Bool)

(declare-fun e!175209 () Bool)

(assert (=> b!273333 (= e!175211 e!175209)))

(declare-fun res!137327 () Bool)

(assert (=> b!273333 (=> (not res!137327) (not e!175209))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273333 (= res!137327 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13461 0))(
  ( (array!13462 (arr!6380 (Array (_ BitVec 32) (_ BitVec 64))) (size!6732 (_ BitVec 32))) )
))
(declare-fun lt!136327 () array!13461)

(declare-fun a!3325 () array!13461)

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!273333 (= lt!136327 (array!13462 (store (arr!6380 a!3325) i!1267 k!2581) (size!6732 a!3325)))))

(declare-fun b!273334 () Bool)

(declare-fun res!137331 () Bool)

(declare-fun e!175210 () Bool)

(assert (=> b!273334 (=> (not res!137331) (not e!175210))))

(declare-datatypes ((List!4188 0))(
  ( (Nil!4185) (Cons!4184 (h!4851 (_ BitVec 64)) (t!9270 List!4188)) )
))
(declare-fun arrayNoDuplicates!0 (array!13461 (_ BitVec 32) List!4188) Bool)

(assert (=> b!273334 (= res!137331 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4185))))

(declare-fun b!273335 () Bool)

(assert (=> b!273335 (= e!175209 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13461 (_ BitVec 32)) Bool)

(assert (=> b!273335 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8563 0))(
  ( (Unit!8564) )
))
(declare-fun lt!136323 () Unit!8563)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> b!273335 (= lt!136323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1538 0))(
  ( (MissingZero!1538 (index!8322 (_ BitVec 32))) (Found!1538 (index!8323 (_ BitVec 32))) (Intermediate!1538 (undefined!2350 Bool) (index!8324 (_ BitVec 32)) (x!26631 (_ BitVec 32))) (Undefined!1538) (MissingVacant!1538 (index!8325 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13461 (_ BitVec 32)) SeekEntryResult!1538)

(assert (=> b!273335 (= (seekEntryOrOpen!0 (select (arr!6380 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6380 a!3325) i!1267 k!2581) startIndex!26) lt!136327 mask!3868))))

(declare-fun lt!136325 () Unit!8563)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13461 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8563)

(assert (=> b!273335 (= lt!136325 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!273335 (arrayNoDuplicates!0 lt!136327 #b00000000000000000000000000000000 Nil!4185)))

(declare-fun lt!136326 () Unit!8563)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13461 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4188) Unit!8563)

(assert (=> b!273335 (= lt!136326 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4185))))

(declare-fun b!273336 () Bool)

(declare-fun res!137328 () Bool)

(assert (=> b!273336 (=> (not res!137328) (not e!175211))))

(assert (=> b!273336 (= res!137328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273337 () Bool)

(declare-fun res!137323 () Bool)

(assert (=> b!273337 (=> (not res!137323) (not e!175210))))

(declare-fun arrayContainsKey!0 (array!13461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273337 (= res!137323 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273338 () Bool)

(assert (=> b!273338 (= e!175210 e!175211)))

(declare-fun res!137326 () Bool)

(assert (=> b!273338 (=> (not res!137326) (not e!175211))))

(declare-fun lt!136324 () SeekEntryResult!1538)

(assert (=> b!273338 (= res!137326 (or (= lt!136324 (MissingZero!1538 i!1267)) (= lt!136324 (MissingVacant!1538 i!1267))))))

(assert (=> b!273338 (= lt!136324 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!137325 () Bool)

(assert (=> start!26364 (=> (not res!137325) (not e!175210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26364 (= res!137325 (validMask!0 mask!3868))))

(assert (=> start!26364 e!175210))

(declare-fun array_inv!4343 (array!13461) Bool)

(assert (=> start!26364 (array_inv!4343 a!3325)))

(assert (=> start!26364 true))

(declare-fun b!273339 () Bool)

(declare-fun res!137330 () Bool)

(assert (=> b!273339 (=> (not res!137330) (not e!175209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273339 (= res!137330 (validKeyInArray!0 (select (arr!6380 a!3325) startIndex!26)))))

(declare-fun b!273340 () Bool)

(declare-fun res!137329 () Bool)

(assert (=> b!273340 (=> (not res!137329) (not e!175210))))

(assert (=> b!273340 (= res!137329 (validKeyInArray!0 k!2581))))

(declare-fun b!273341 () Bool)

(declare-fun res!137324 () Bool)

(assert (=> b!273341 (=> (not res!137324) (not e!175210))))

(assert (=> b!273341 (= res!137324 (and (= (size!6732 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6732 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6732 a!3325))))))

(assert (= (and start!26364 res!137325) b!273341))

(assert (= (and b!273341 res!137324) b!273340))

(assert (= (and b!273340 res!137329) b!273334))

(assert (= (and b!273334 res!137331) b!273337))

(assert (= (and b!273337 res!137323) b!273338))

(assert (= (and b!273338 res!137326) b!273336))

(assert (= (and b!273336 res!137328) b!273333))

(assert (= (and b!273333 res!137327) b!273339))

(assert (= (and b!273339 res!137330) b!273335))

(declare-fun m!288489 () Bool)

(assert (=> b!273338 m!288489))

(declare-fun m!288491 () Bool)

(assert (=> b!273339 m!288491))

(assert (=> b!273339 m!288491))

(declare-fun m!288493 () Bool)

(assert (=> b!273339 m!288493))

(declare-fun m!288495 () Bool)

(assert (=> b!273336 m!288495))

(declare-fun m!288497 () Bool)

(assert (=> b!273333 m!288497))

(declare-fun m!288499 () Bool)

(assert (=> b!273335 m!288499))

(declare-fun m!288501 () Bool)

(assert (=> b!273335 m!288501))

(declare-fun m!288503 () Bool)

(assert (=> b!273335 m!288503))

(assert (=> b!273335 m!288501))

(declare-fun m!288505 () Bool)

(assert (=> b!273335 m!288505))

(assert (=> b!273335 m!288497))

(declare-fun m!288507 () Bool)

(assert (=> b!273335 m!288507))

(assert (=> b!273335 m!288491))

(declare-fun m!288509 () Bool)

(assert (=> b!273335 m!288509))

(declare-fun m!288511 () Bool)

(assert (=> b!273335 m!288511))

(assert (=> b!273335 m!288491))

(declare-fun m!288513 () Bool)

(assert (=> b!273335 m!288513))

(declare-fun m!288515 () Bool)

(assert (=> b!273340 m!288515))

(declare-fun m!288517 () Bool)

(assert (=> start!26364 m!288517))

(declare-fun m!288519 () Bool)

(assert (=> start!26364 m!288519))

(declare-fun m!288521 () Bool)

(assert (=> b!273337 m!288521))

(declare-fun m!288523 () Bool)

(assert (=> b!273334 m!288523))

(push 1)

