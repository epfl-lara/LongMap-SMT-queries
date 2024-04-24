; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26454 () Bool)

(assert start!26454)

(declare-fun b!274631 () Bool)

(declare-fun res!138597 () Bool)

(declare-fun e!175809 () Bool)

(assert (=> b!274631 (=> (not res!138597) (not e!175809))))

(declare-datatypes ((array!13550 0))(
  ( (array!13551 (arr!6424 (Array (_ BitVec 32) (_ BitVec 64))) (size!6776 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13550)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274631 (= res!138597 (and (= (size!6776 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6776 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6776 a!3325))))))

(declare-fun b!274633 () Bool)

(declare-fun res!138596 () Bool)

(assert (=> b!274633 (=> (not res!138596) (not e!175809))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274633 (= res!138596 (validKeyInArray!0 k0!2581))))

(declare-fun b!274634 () Bool)

(declare-fun res!138595 () Bool)

(declare-fun e!175808 () Bool)

(assert (=> b!274634 (=> (not res!138595) (not e!175808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13550 (_ BitVec 32)) Bool)

(assert (=> b!274634 (= res!138595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274635 () Bool)

(declare-fun res!138603 () Bool)

(declare-fun e!175811 () Bool)

(assert (=> b!274635 (=> (not res!138603) (not e!175811))))

(assert (=> b!274635 (= res!138603 (validKeyInArray!0 (select (arr!6424 a!3325) startIndex!26)))))

(declare-fun b!274636 () Bool)

(assert (=> b!274636 (= e!175811 (not true))))

(assert (=> b!274636 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8633 0))(
  ( (Unit!8634) )
))
(declare-fun lt!137094 () Unit!8633)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13550 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8633)

(assert (=> b!274636 (= lt!137094 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!137095 () array!13550)

(declare-datatypes ((SeekEntryResult!1547 0))(
  ( (MissingZero!1547 (index!8358 (_ BitVec 32))) (Found!1547 (index!8359 (_ BitVec 32))) (Intermediate!1547 (undefined!2359 Bool) (index!8360 (_ BitVec 32)) (x!26760 (_ BitVec 32))) (Undefined!1547) (MissingVacant!1547 (index!8361 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13550 (_ BitVec 32)) SeekEntryResult!1547)

(assert (=> b!274636 (= (seekEntryOrOpen!0 (select (arr!6424 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6424 a!3325) i!1267 k0!2581) startIndex!26) lt!137095 mask!3868))))

(declare-fun lt!137097 () Unit!8633)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13550 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8633)

(assert (=> b!274636 (= lt!137097 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4145 0))(
  ( (Nil!4142) (Cons!4141 (h!4808 (_ BitVec 64)) (t!9219 List!4145)) )
))
(declare-fun arrayNoDuplicates!0 (array!13550 (_ BitVec 32) List!4145) Bool)

(assert (=> b!274636 (arrayNoDuplicates!0 lt!137095 #b00000000000000000000000000000000 Nil!4142)))

(declare-fun lt!137096 () Unit!8633)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13550 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4145) Unit!8633)

(assert (=> b!274636 (= lt!137096 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4142))))

(declare-fun b!274637 () Bool)

(assert (=> b!274637 (= e!175809 e!175808)))

(declare-fun res!138599 () Bool)

(assert (=> b!274637 (=> (not res!138599) (not e!175808))))

(declare-fun lt!137093 () SeekEntryResult!1547)

(assert (=> b!274637 (= res!138599 (or (= lt!137093 (MissingZero!1547 i!1267)) (= lt!137093 (MissingVacant!1547 i!1267))))))

(assert (=> b!274637 (= lt!137093 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274638 () Bool)

(declare-fun res!138601 () Bool)

(assert (=> b!274638 (=> (not res!138601) (not e!175809))))

(assert (=> b!274638 (= res!138601 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4142))))

(declare-fun b!274639 () Bool)

(assert (=> b!274639 (= e!175808 e!175811)))

(declare-fun res!138598 () Bool)

(assert (=> b!274639 (=> (not res!138598) (not e!175811))))

(assert (=> b!274639 (= res!138598 (not (= startIndex!26 i!1267)))))

(assert (=> b!274639 (= lt!137095 (array!13551 (store (arr!6424 a!3325) i!1267 k0!2581) (size!6776 a!3325)))))

(declare-fun b!274632 () Bool)

(declare-fun res!138600 () Bool)

(assert (=> b!274632 (=> (not res!138600) (not e!175809))))

(declare-fun arrayContainsKey!0 (array!13550 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274632 (= res!138600 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138602 () Bool)

(assert (=> start!26454 (=> (not res!138602) (not e!175809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26454 (= res!138602 (validMask!0 mask!3868))))

(assert (=> start!26454 e!175809))

(declare-fun array_inv!4374 (array!13550) Bool)

(assert (=> start!26454 (array_inv!4374 a!3325)))

(assert (=> start!26454 true))

(assert (= (and start!26454 res!138602) b!274631))

(assert (= (and b!274631 res!138597) b!274633))

(assert (= (and b!274633 res!138596) b!274638))

(assert (= (and b!274638 res!138601) b!274632))

(assert (= (and b!274632 res!138600) b!274637))

(assert (= (and b!274637 res!138599) b!274634))

(assert (= (and b!274634 res!138595) b!274639))

(assert (= (and b!274639 res!138598) b!274635))

(assert (= (and b!274635 res!138603) b!274636))

(declare-fun m!290363 () Bool)

(assert (=> b!274635 m!290363))

(assert (=> b!274635 m!290363))

(declare-fun m!290365 () Bool)

(assert (=> b!274635 m!290365))

(declare-fun m!290367 () Bool)

(assert (=> b!274633 m!290367))

(declare-fun m!290369 () Bool)

(assert (=> b!274639 m!290369))

(declare-fun m!290371 () Bool)

(assert (=> start!26454 m!290371))

(declare-fun m!290373 () Bool)

(assert (=> start!26454 m!290373))

(declare-fun m!290375 () Bool)

(assert (=> b!274638 m!290375))

(declare-fun m!290377 () Bool)

(assert (=> b!274634 m!290377))

(declare-fun m!290379 () Bool)

(assert (=> b!274632 m!290379))

(declare-fun m!290381 () Bool)

(assert (=> b!274636 m!290381))

(declare-fun m!290383 () Bool)

(assert (=> b!274636 m!290383))

(assert (=> b!274636 m!290369))

(declare-fun m!290385 () Bool)

(assert (=> b!274636 m!290385))

(assert (=> b!274636 m!290363))

(declare-fun m!290387 () Bool)

(assert (=> b!274636 m!290387))

(declare-fun m!290389 () Bool)

(assert (=> b!274636 m!290389))

(declare-fun m!290391 () Bool)

(assert (=> b!274636 m!290391))

(assert (=> b!274636 m!290363))

(declare-fun m!290393 () Bool)

(assert (=> b!274636 m!290393))

(assert (=> b!274636 m!290383))

(declare-fun m!290395 () Bool)

(assert (=> b!274636 m!290395))

(declare-fun m!290397 () Bool)

(assert (=> b!274637 m!290397))

(check-sat (not start!26454) (not b!274637) (not b!274632) (not b!274638) (not b!274636) (not b!274635) (not b!274634) (not b!274633))
(check-sat)
