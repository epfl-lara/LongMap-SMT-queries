; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26186 () Bool)

(assert start!26186)

(declare-fun b!270368 () Bool)

(declare-fun e!174242 () Bool)

(assert (=> b!270368 (= e!174242 false)))

(declare-fun lt!135479 () Bool)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-datatypes ((List!4066 0))(
  ( (Nil!4063) (Cons!4062 (h!4729 (_ BitVec 64)) (t!9139 List!4066)) )
))
(declare-fun contains!1904 (List!4066 (_ BitVec 64)) Bool)

(assert (=> b!270368 (= lt!135479 (contains!1904 Nil!4063 k0!2581))))

(declare-fun res!134415 () Bool)

(declare-fun e!174241 () Bool)

(assert (=> start!26186 (=> (not res!134415) (not e!174241))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26186 (= res!134415 (validMask!0 mask!3868))))

(assert (=> start!26186 e!174241))

(declare-datatypes ((array!13272 0))(
  ( (array!13273 (arr!6285 (Array (_ BitVec 32) (_ BitVec 64))) (size!6638 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13272)

(declare-fun array_inv!4257 (array!13272) Bool)

(assert (=> start!26186 (array_inv!4257 a!3325)))

(assert (=> start!26186 true))

(declare-fun b!270369 () Bool)

(declare-fun res!134412 () Bool)

(assert (=> b!270369 (=> (not res!134412) (not e!174241))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270369 (= res!134412 (and (= (size!6638 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6638 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6638 a!3325))))))

(declare-fun b!270370 () Bool)

(declare-fun res!134420 () Bool)

(assert (=> b!270370 (=> (not res!134420) (not e!174242))))

(assert (=> b!270370 (= res!134420 (not (= startIndex!26 i!1267)))))

(declare-fun b!270371 () Bool)

(declare-fun res!134421 () Bool)

(assert (=> b!270371 (=> (not res!134421) (not e!174242))))

(assert (=> b!270371 (= res!134421 (and (bvslt (size!6638 a!3325) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6638 a!3325))))))

(declare-fun b!270372 () Bool)

(declare-fun res!134414 () Bool)

(assert (=> b!270372 (=> (not res!134414) (not e!174242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13272 (_ BitVec 32)) Bool)

(assert (=> b!270372 (= res!134414 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270373 () Bool)

(declare-fun res!134411 () Bool)

(assert (=> b!270373 (=> (not res!134411) (not e!174242))))

(declare-fun noDuplicate!118 (List!4066) Bool)

(assert (=> b!270373 (= res!134411 (noDuplicate!118 Nil!4063))))

(declare-fun b!270374 () Bool)

(declare-fun res!134419 () Bool)

(assert (=> b!270374 (=> (not res!134419) (not e!174241))))

(declare-fun arrayNoDuplicates!0 (array!13272 (_ BitVec 32) List!4066) Bool)

(assert (=> b!270374 (= res!134419 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4063))))

(declare-fun b!270375 () Bool)

(declare-fun res!134413 () Bool)

(assert (=> b!270375 (=> (not res!134413) (not e!174241))))

(declare-fun arrayContainsKey!0 (array!13272 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270375 (= res!134413 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270376 () Bool)

(declare-fun res!134422 () Bool)

(assert (=> b!270376 (=> (not res!134422) (not e!174242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270376 (= res!134422 (validKeyInArray!0 (select (arr!6285 a!3325) startIndex!26)))))

(declare-fun b!270377 () Bool)

(declare-fun res!134416 () Bool)

(assert (=> b!270377 (=> (not res!134416) (not e!174241))))

(assert (=> b!270377 (= res!134416 (validKeyInArray!0 k0!2581))))

(declare-fun b!270378 () Bool)

(declare-fun res!134410 () Bool)

(assert (=> b!270378 (=> (not res!134410) (not e!174242))))

(assert (=> b!270378 (= res!134410 (not (contains!1904 Nil!4063 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270379 () Bool)

(declare-fun res!134417 () Bool)

(assert (=> b!270379 (=> (not res!134417) (not e!174242))))

(assert (=> b!270379 (= res!134417 (not (contains!1904 Nil!4063 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!270380 () Bool)

(assert (=> b!270380 (= e!174241 e!174242)))

(declare-fun res!134418 () Bool)

(assert (=> b!270380 (=> (not res!134418) (not e!174242))))

(declare-datatypes ((SeekEntryResult!1442 0))(
  ( (MissingZero!1442 (index!7938 (_ BitVec 32))) (Found!1442 (index!7939 (_ BitVec 32))) (Intermediate!1442 (undefined!2254 Bool) (index!7940 (_ BitVec 32)) (x!26294 (_ BitVec 32))) (Undefined!1442) (MissingVacant!1442 (index!7941 (_ BitVec 32))) )
))
(declare-fun lt!135480 () SeekEntryResult!1442)

(assert (=> b!270380 (= res!134418 (or (= lt!135480 (MissingZero!1442 i!1267)) (= lt!135480 (MissingVacant!1442 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13272 (_ BitVec 32)) SeekEntryResult!1442)

(assert (=> b!270380 (= lt!135480 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(assert (= (and start!26186 res!134415) b!270369))

(assert (= (and b!270369 res!134412) b!270377))

(assert (= (and b!270377 res!134416) b!270374))

(assert (= (and b!270374 res!134419) b!270375))

(assert (= (and b!270375 res!134413) b!270380))

(assert (= (and b!270380 res!134418) b!270372))

(assert (= (and b!270372 res!134414) b!270370))

(assert (= (and b!270370 res!134420) b!270376))

(assert (= (and b!270376 res!134422) b!270371))

(assert (= (and b!270371 res!134421) b!270373))

(assert (= (and b!270373 res!134411) b!270379))

(assert (= (and b!270379 res!134417) b!270378))

(assert (= (and b!270378 res!134410) b!270368))

(declare-fun m!285515 () Bool)

(assert (=> b!270380 m!285515))

(declare-fun m!285517 () Bool)

(assert (=> b!270372 m!285517))

(declare-fun m!285519 () Bool)

(assert (=> b!270379 m!285519))

(declare-fun m!285521 () Bool)

(assert (=> b!270373 m!285521))

(declare-fun m!285523 () Bool)

(assert (=> b!270374 m!285523))

(declare-fun m!285525 () Bool)

(assert (=> b!270377 m!285525))

(declare-fun m!285527 () Bool)

(assert (=> start!26186 m!285527))

(declare-fun m!285529 () Bool)

(assert (=> start!26186 m!285529))

(declare-fun m!285531 () Bool)

(assert (=> b!270378 m!285531))

(declare-fun m!285533 () Bool)

(assert (=> b!270375 m!285533))

(declare-fun m!285535 () Bool)

(assert (=> b!270376 m!285535))

(assert (=> b!270376 m!285535))

(declare-fun m!285537 () Bool)

(assert (=> b!270376 m!285537))

(declare-fun m!285539 () Bool)

(assert (=> b!270368 m!285539))

(check-sat (not b!270376) (not b!270379) (not b!270374) (not b!270368) (not start!26186) (not b!270372) (not b!270377) (not b!270378) (not b!270375) (not b!270380) (not b!270373))
(check-sat)
