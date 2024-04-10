; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26366 () Bool)

(assert start!26366)

(declare-fun b!273360 () Bool)

(declare-fun e!175221 () Bool)

(declare-fun e!175220 () Bool)

(assert (=> b!273360 (= e!175221 e!175220)))

(declare-fun res!137357 () Bool)

(assert (=> b!273360 (=> (not res!137357) (not e!175220))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273360 (= res!137357 (not (= startIndex!26 i!1267)))))

(declare-datatypes ((array!13463 0))(
  ( (array!13464 (arr!6381 (Array (_ BitVec 32) (_ BitVec 64))) (size!6733 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13463)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun lt!136339 () array!13463)

(assert (=> b!273360 (= lt!136339 (array!13464 (store (arr!6381 a!3325) i!1267 k0!2581) (size!6733 a!3325)))))

(declare-fun b!273361 () Bool)

(declare-fun res!137354 () Bool)

(declare-fun e!175223 () Bool)

(assert (=> b!273361 (=> (not res!137354) (not e!175223))))

(declare-fun arrayContainsKey!0 (array!13463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273361 (= res!137354 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273362 () Bool)

(assert (=> b!273362 (= e!175220 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13463 (_ BitVec 32)) Bool)

(assert (=> b!273362 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8565 0))(
  ( (Unit!8566) )
))
(declare-fun lt!136340 () Unit!8565)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13463 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8565)

(assert (=> b!273362 (= lt!136340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1539 0))(
  ( (MissingZero!1539 (index!8326 (_ BitVec 32))) (Found!1539 (index!8327 (_ BitVec 32))) (Intermediate!1539 (undefined!2351 Bool) (index!8328 (_ BitVec 32)) (x!26632 (_ BitVec 32))) (Undefined!1539) (MissingVacant!1539 (index!8329 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13463 (_ BitVec 32)) SeekEntryResult!1539)

(assert (=> b!273362 (= (seekEntryOrOpen!0 (select (arr!6381 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6381 a!3325) i!1267 k0!2581) startIndex!26) lt!136339 mask!3868))))

(declare-fun lt!136341 () Unit!8565)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13463 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8565)

(assert (=> b!273362 (= lt!136341 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4189 0))(
  ( (Nil!4186) (Cons!4185 (h!4852 (_ BitVec 64)) (t!9271 List!4189)) )
))
(declare-fun arrayNoDuplicates!0 (array!13463 (_ BitVec 32) List!4189) Bool)

(assert (=> b!273362 (arrayNoDuplicates!0 lt!136339 #b00000000000000000000000000000000 Nil!4186)))

(declare-fun lt!136342 () Unit!8565)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13463 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4189) Unit!8565)

(assert (=> b!273362 (= lt!136342 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4186))))

(declare-fun b!273363 () Bool)

(assert (=> b!273363 (= e!175223 e!175221)))

(declare-fun res!137350 () Bool)

(assert (=> b!273363 (=> (not res!137350) (not e!175221))))

(declare-fun lt!136338 () SeekEntryResult!1539)

(assert (=> b!273363 (= res!137350 (or (= lt!136338 (MissingZero!1539 i!1267)) (= lt!136338 (MissingVacant!1539 i!1267))))))

(assert (=> b!273363 (= lt!136338 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273364 () Bool)

(declare-fun res!137352 () Bool)

(assert (=> b!273364 (=> (not res!137352) (not e!175221))))

(assert (=> b!273364 (= res!137352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273365 () Bool)

(declare-fun res!137358 () Bool)

(assert (=> b!273365 (=> (not res!137358) (not e!175223))))

(assert (=> b!273365 (= res!137358 (and (= (size!6733 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6733 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6733 a!3325))))))

(declare-fun b!273366 () Bool)

(declare-fun res!137356 () Bool)

(assert (=> b!273366 (=> (not res!137356) (not e!175223))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273366 (= res!137356 (validKeyInArray!0 k0!2581))))

(declare-fun res!137353 () Bool)

(assert (=> start!26366 (=> (not res!137353) (not e!175223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26366 (= res!137353 (validMask!0 mask!3868))))

(assert (=> start!26366 e!175223))

(declare-fun array_inv!4344 (array!13463) Bool)

(assert (=> start!26366 (array_inv!4344 a!3325)))

(assert (=> start!26366 true))

(declare-fun b!273367 () Bool)

(declare-fun res!137355 () Bool)

(assert (=> b!273367 (=> (not res!137355) (not e!175220))))

(assert (=> b!273367 (= res!137355 (validKeyInArray!0 (select (arr!6381 a!3325) startIndex!26)))))

(declare-fun b!273368 () Bool)

(declare-fun res!137351 () Bool)

(assert (=> b!273368 (=> (not res!137351) (not e!175223))))

(assert (=> b!273368 (= res!137351 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4186))))

(assert (= (and start!26366 res!137353) b!273365))

(assert (= (and b!273365 res!137358) b!273366))

(assert (= (and b!273366 res!137356) b!273368))

(assert (= (and b!273368 res!137351) b!273361))

(assert (= (and b!273361 res!137354) b!273363))

(assert (= (and b!273363 res!137350) b!273364))

(assert (= (and b!273364 res!137352) b!273360))

(assert (= (and b!273360 res!137357) b!273367))

(assert (= (and b!273367 res!137355) b!273362))

(declare-fun m!288525 () Bool)

(assert (=> b!273366 m!288525))

(declare-fun m!288527 () Bool)

(assert (=> b!273362 m!288527))

(declare-fun m!288529 () Bool)

(assert (=> b!273362 m!288529))

(declare-fun m!288531 () Bool)

(assert (=> b!273362 m!288531))

(declare-fun m!288533 () Bool)

(assert (=> b!273362 m!288533))

(declare-fun m!288535 () Bool)

(assert (=> b!273362 m!288535))

(declare-fun m!288537 () Bool)

(assert (=> b!273362 m!288537))

(declare-fun m!288539 () Bool)

(assert (=> b!273362 m!288539))

(assert (=> b!273362 m!288535))

(declare-fun m!288541 () Bool)

(assert (=> b!273362 m!288541))

(assert (=> b!273362 m!288529))

(declare-fun m!288543 () Bool)

(assert (=> b!273362 m!288543))

(declare-fun m!288545 () Bool)

(assert (=> b!273362 m!288545))

(declare-fun m!288547 () Bool)

(assert (=> b!273361 m!288547))

(declare-fun m!288549 () Bool)

(assert (=> b!273364 m!288549))

(declare-fun m!288551 () Bool)

(assert (=> b!273368 m!288551))

(assert (=> b!273360 m!288531))

(declare-fun m!288553 () Bool)

(assert (=> start!26366 m!288553))

(declare-fun m!288555 () Bool)

(assert (=> start!26366 m!288555))

(declare-fun m!288557 () Bool)

(assert (=> b!273363 m!288557))

(assert (=> b!273367 m!288535))

(assert (=> b!273367 m!288535))

(declare-fun m!288559 () Bool)

(assert (=> b!273367 m!288559))

(check-sat (not start!26366) (not b!273364) (not b!273368) (not b!273366) (not b!273361) (not b!273367) (not b!273363) (not b!273362))
(check-sat)
