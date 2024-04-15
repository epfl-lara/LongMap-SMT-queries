; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26390 () Bool)

(assert start!26390)

(declare-fun b!273510 () Bool)

(declare-fun e!175251 () Bool)

(assert (=> b!273510 (= e!175251 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13476 0))(
  ( (array!13477 (arr!6387 (Array (_ BitVec 32) (_ BitVec 64))) (size!6740 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13476)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13476 (_ BitVec 32)) Bool)

(assert (=> b!273510 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8541 0))(
  ( (Unit!8542) )
))
(declare-fun lt!136326 () Unit!8541)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13476 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8541)

(assert (=> b!273510 (= lt!136326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!136322 () array!13476)

(declare-datatypes ((SeekEntryResult!1544 0))(
  ( (MissingZero!1544 (index!8346 (_ BitVec 32))) (Found!1544 (index!8347 (_ BitVec 32))) (Intermediate!1544 (undefined!2356 Bool) (index!8348 (_ BitVec 32)) (x!26668 (_ BitVec 32))) (Undefined!1544) (MissingVacant!1544 (index!8349 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13476 (_ BitVec 32)) SeekEntryResult!1544)

(assert (=> b!273510 (= (seekEntryOrOpen!0 (select (arr!6387 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6387 a!3325) i!1267 k0!2581) startIndex!26) lt!136322 mask!3868))))

(declare-fun lt!136323 () Unit!8541)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13476 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8541)

(assert (=> b!273510 (= lt!136323 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4168 0))(
  ( (Nil!4165) (Cons!4164 (h!4831 (_ BitVec 64)) (t!9241 List!4168)) )
))
(declare-fun arrayNoDuplicates!0 (array!13476 (_ BitVec 32) List!4168) Bool)

(assert (=> b!273510 (arrayNoDuplicates!0 lt!136322 #b00000000000000000000000000000000 Nil!4165)))

(declare-fun lt!136325 () Unit!8541)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4168) Unit!8541)

(assert (=> b!273510 (= lt!136325 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4165))))

(declare-fun b!273511 () Bool)

(declare-fun e!175254 () Bool)

(declare-fun e!175252 () Bool)

(assert (=> b!273511 (= e!175254 e!175252)))

(declare-fun res!137553 () Bool)

(assert (=> b!273511 (=> (not res!137553) (not e!175252))))

(declare-fun lt!136324 () SeekEntryResult!1544)

(assert (=> b!273511 (= res!137553 (or (= lt!136324 (MissingZero!1544 i!1267)) (= lt!136324 (MissingVacant!1544 i!1267))))))

(assert (=> b!273511 (= lt!136324 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273513 () Bool)

(declare-fun res!137554 () Bool)

(assert (=> b!273513 (=> (not res!137554) (not e!175254))))

(assert (=> b!273513 (= res!137554 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4165))))

(declare-fun b!273514 () Bool)

(assert (=> b!273514 (= e!175252 e!175251)))

(declare-fun res!137560 () Bool)

(assert (=> b!273514 (=> (not res!137560) (not e!175251))))

(assert (=> b!273514 (= res!137560 (not (= startIndex!26 i!1267)))))

(assert (=> b!273514 (= lt!136322 (array!13477 (store (arr!6387 a!3325) i!1267 k0!2581) (size!6740 a!3325)))))

(declare-fun b!273515 () Bool)

(declare-fun res!137557 () Bool)

(assert (=> b!273515 (=> (not res!137557) (not e!175252))))

(assert (=> b!273515 (= res!137557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273516 () Bool)

(declare-fun res!137556 () Bool)

(assert (=> b!273516 (=> (not res!137556) (not e!175251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273516 (= res!137556 (validKeyInArray!0 (select (arr!6387 a!3325) startIndex!26)))))

(declare-fun b!273517 () Bool)

(declare-fun res!137552 () Bool)

(assert (=> b!273517 (=> (not res!137552) (not e!175254))))

(assert (=> b!273517 (= res!137552 (and (= (size!6740 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6740 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6740 a!3325))))))

(declare-fun b!273518 () Bool)

(declare-fun res!137558 () Bool)

(assert (=> b!273518 (=> (not res!137558) (not e!175254))))

(declare-fun arrayContainsKey!0 (array!13476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273518 (= res!137558 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273512 () Bool)

(declare-fun res!137559 () Bool)

(assert (=> b!273512 (=> (not res!137559) (not e!175254))))

(assert (=> b!273512 (= res!137559 (validKeyInArray!0 k0!2581))))

(declare-fun res!137555 () Bool)

(assert (=> start!26390 (=> (not res!137555) (not e!175254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26390 (= res!137555 (validMask!0 mask!3868))))

(assert (=> start!26390 e!175254))

(declare-fun array_inv!4359 (array!13476) Bool)

(assert (=> start!26390 (array_inv!4359 a!3325)))

(assert (=> start!26390 true))

(assert (= (and start!26390 res!137555) b!273517))

(assert (= (and b!273517 res!137552) b!273512))

(assert (= (and b!273512 res!137559) b!273513))

(assert (= (and b!273513 res!137554) b!273518))

(assert (= (and b!273518 res!137558) b!273511))

(assert (= (and b!273511 res!137553) b!273515))

(assert (= (and b!273515 res!137557) b!273514))

(assert (= (and b!273514 res!137560) b!273516))

(assert (= (and b!273516 res!137556) b!273510))

(declare-fun m!288329 () Bool)

(assert (=> b!273512 m!288329))

(declare-fun m!288331 () Bool)

(assert (=> start!26390 m!288331))

(declare-fun m!288333 () Bool)

(assert (=> start!26390 m!288333))

(declare-fun m!288335 () Bool)

(assert (=> b!273513 m!288335))

(declare-fun m!288337 () Bool)

(assert (=> b!273515 m!288337))

(declare-fun m!288339 () Bool)

(assert (=> b!273511 m!288339))

(declare-fun m!288341 () Bool)

(assert (=> b!273514 m!288341))

(declare-fun m!288343 () Bool)

(assert (=> b!273516 m!288343))

(assert (=> b!273516 m!288343))

(declare-fun m!288345 () Bool)

(assert (=> b!273516 m!288345))

(declare-fun m!288347 () Bool)

(assert (=> b!273510 m!288347))

(declare-fun m!288349 () Bool)

(assert (=> b!273510 m!288349))

(assert (=> b!273510 m!288341))

(declare-fun m!288351 () Bool)

(assert (=> b!273510 m!288351))

(assert (=> b!273510 m!288343))

(assert (=> b!273510 m!288349))

(declare-fun m!288353 () Bool)

(assert (=> b!273510 m!288353))

(declare-fun m!288355 () Bool)

(assert (=> b!273510 m!288355))

(assert (=> b!273510 m!288343))

(declare-fun m!288357 () Bool)

(assert (=> b!273510 m!288357))

(declare-fun m!288359 () Bool)

(assert (=> b!273510 m!288359))

(declare-fun m!288361 () Bool)

(assert (=> b!273510 m!288361))

(declare-fun m!288363 () Bool)

(assert (=> b!273518 m!288363))

(check-sat (not b!273513) (not b!273518) (not b!273516) (not b!273510) (not b!273515) (not start!26390) (not b!273511) (not b!273512))
(check-sat)
