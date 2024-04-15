; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26396 () Bool)

(assert start!26396)

(declare-fun b!273591 () Bool)

(declare-fun res!137640 () Bool)

(declare-fun e!175287 () Bool)

(assert (=> b!273591 (=> (not res!137640) (not e!175287))))

(declare-datatypes ((array!13482 0))(
  ( (array!13483 (arr!6390 (Array (_ BitVec 32) (_ BitVec 64))) (size!6743 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13482)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13482 (_ BitVec 32)) Bool)

(assert (=> b!273591 (= res!137640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!137637 () Bool)

(declare-fun e!175290 () Bool)

(assert (=> start!26396 (=> (not res!137637) (not e!175290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26396 (= res!137637 (validMask!0 mask!3868))))

(assert (=> start!26396 e!175290))

(declare-fun array_inv!4362 (array!13482) Bool)

(assert (=> start!26396 (array_inv!4362 a!3325)))

(assert (=> start!26396 true))

(declare-fun b!273592 () Bool)

(assert (=> b!273592 (= e!175290 e!175287)))

(declare-fun res!137633 () Bool)

(assert (=> b!273592 (=> (not res!137633) (not e!175287))))

(declare-datatypes ((SeekEntryResult!1547 0))(
  ( (MissingZero!1547 (index!8358 (_ BitVec 32))) (Found!1547 (index!8359 (_ BitVec 32))) (Intermediate!1547 (undefined!2359 Bool) (index!8360 (_ BitVec 32)) (x!26679 (_ BitVec 32))) (Undefined!1547) (MissingVacant!1547 (index!8361 (_ BitVec 32))) )
))
(declare-fun lt!136369 () SeekEntryResult!1547)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273592 (= res!137633 (or (= lt!136369 (MissingZero!1547 i!1267)) (= lt!136369 (MissingVacant!1547 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13482 (_ BitVec 32)) SeekEntryResult!1547)

(assert (=> b!273592 (= lt!136369 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273593 () Bool)

(declare-fun e!175288 () Bool)

(assert (=> b!273593 (= e!175287 e!175288)))

(declare-fun res!137635 () Bool)

(assert (=> b!273593 (=> (not res!137635) (not e!175288))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273593 (= res!137635 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136371 () array!13482)

(assert (=> b!273593 (= lt!136371 (array!13483 (store (arr!6390 a!3325) i!1267 k0!2581) (size!6743 a!3325)))))

(declare-fun b!273594 () Bool)

(declare-fun res!137639 () Bool)

(assert (=> b!273594 (=> (not res!137639) (not e!175290))))

(declare-datatypes ((List!4171 0))(
  ( (Nil!4168) (Cons!4167 (h!4834 (_ BitVec 64)) (t!9244 List!4171)) )
))
(declare-fun arrayNoDuplicates!0 (array!13482 (_ BitVec 32) List!4171) Bool)

(assert (=> b!273594 (= res!137639 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4168))))

(declare-fun b!273595 () Bool)

(declare-fun res!137638 () Bool)

(assert (=> b!273595 (=> (not res!137638) (not e!175290))))

(declare-fun arrayContainsKey!0 (array!13482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273595 (= res!137638 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!273596 () Bool)

(declare-fun res!137636 () Bool)

(assert (=> b!273596 (=> (not res!137636) (not e!175288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273596 (= res!137636 (validKeyInArray!0 (select (arr!6390 a!3325) startIndex!26)))))

(declare-fun b!273597 () Bool)

(declare-fun res!137634 () Bool)

(assert (=> b!273597 (=> (not res!137634) (not e!175290))))

(assert (=> b!273597 (= res!137634 (and (= (size!6743 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6743 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6743 a!3325))))))

(declare-fun b!273598 () Bool)

(declare-fun res!137641 () Bool)

(assert (=> b!273598 (=> (not res!137641) (not e!175290))))

(assert (=> b!273598 (= res!137641 (validKeyInArray!0 k0!2581))))

(declare-fun b!273599 () Bool)

(assert (=> b!273599 (= e!175288 (not true))))

(assert (=> b!273599 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8547 0))(
  ( (Unit!8548) )
))
(declare-fun lt!136367 () Unit!8547)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8547)

(assert (=> b!273599 (= lt!136367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273599 (= (seekEntryOrOpen!0 (select (arr!6390 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6390 a!3325) i!1267 k0!2581) startIndex!26) lt!136371 mask!3868))))

(declare-fun lt!136368 () Unit!8547)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13482 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8547)

(assert (=> b!273599 (= lt!136368 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273599 (arrayNoDuplicates!0 lt!136371 #b00000000000000000000000000000000 Nil!4168)))

(declare-fun lt!136370 () Unit!8547)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13482 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4171) Unit!8547)

(assert (=> b!273599 (= lt!136370 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4168))))

(assert (= (and start!26396 res!137637) b!273597))

(assert (= (and b!273597 res!137634) b!273598))

(assert (= (and b!273598 res!137641) b!273594))

(assert (= (and b!273594 res!137639) b!273595))

(assert (= (and b!273595 res!137638) b!273592))

(assert (= (and b!273592 res!137633) b!273591))

(assert (= (and b!273591 res!137640) b!273593))

(assert (= (and b!273593 res!137635) b!273596))

(assert (= (and b!273596 res!137636) b!273599))

(declare-fun m!288437 () Bool)

(assert (=> b!273599 m!288437))

(declare-fun m!288439 () Bool)

(assert (=> b!273599 m!288439))

(declare-fun m!288441 () Bool)

(assert (=> b!273599 m!288441))

(declare-fun m!288443 () Bool)

(assert (=> b!273599 m!288443))

(assert (=> b!273599 m!288439))

(declare-fun m!288445 () Bool)

(assert (=> b!273599 m!288445))

(declare-fun m!288447 () Bool)

(assert (=> b!273599 m!288447))

(declare-fun m!288449 () Bool)

(assert (=> b!273599 m!288449))

(declare-fun m!288451 () Bool)

(assert (=> b!273599 m!288451))

(assert (=> b!273599 m!288447))

(declare-fun m!288453 () Bool)

(assert (=> b!273599 m!288453))

(declare-fun m!288455 () Bool)

(assert (=> b!273599 m!288455))

(assert (=> b!273596 m!288447))

(assert (=> b!273596 m!288447))

(declare-fun m!288457 () Bool)

(assert (=> b!273596 m!288457))

(declare-fun m!288459 () Bool)

(assert (=> b!273595 m!288459))

(declare-fun m!288461 () Bool)

(assert (=> b!273594 m!288461))

(declare-fun m!288463 () Bool)

(assert (=> b!273592 m!288463))

(declare-fun m!288465 () Bool)

(assert (=> start!26396 m!288465))

(declare-fun m!288467 () Bool)

(assert (=> start!26396 m!288467))

(declare-fun m!288469 () Bool)

(assert (=> b!273598 m!288469))

(declare-fun m!288471 () Bool)

(assert (=> b!273591 m!288471))

(assert (=> b!273593 m!288441))

(check-sat (not b!273599) (not b!273592) (not b!273595) (not b!273591) (not b!273596) (not start!26396) (not b!273598) (not b!273594))
(check-sat)
