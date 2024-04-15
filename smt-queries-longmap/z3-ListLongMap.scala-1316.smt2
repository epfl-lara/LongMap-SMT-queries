; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26456 () Bool)

(assert start!26456)

(declare-fun b!274437 () Bool)

(declare-fun e!175683 () Bool)

(assert (=> b!274437 (= e!175683 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13542 0))(
  ( (array!13543 (arr!6420 (Array (_ BitVec 32) (_ BitVec 64))) (size!6773 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13542)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13542 (_ BitVec 32)) Bool)

(assert (=> b!274437 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8607 0))(
  ( (Unit!8608) )
))
(declare-fun lt!136856 () Unit!8607)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!274437 (= lt!136856 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136854 () array!13542)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1577 0))(
  ( (MissingZero!1577 (index!8478 (_ BitVec 32))) (Found!1577 (index!8479 (_ BitVec 32))) (Intermediate!1577 (undefined!2389 Bool) (index!8480 (_ BitVec 32)) (x!26789 (_ BitVec 32))) (Undefined!1577) (MissingVacant!1577 (index!8481 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13542 (_ BitVec 32)) SeekEntryResult!1577)

(assert (=> b!274437 (= (seekEntryOrOpen!0 (select (arr!6420 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6420 a!3325) i!1267 k0!2581) startIndex!26) lt!136854 mask!3868))))

(declare-fun lt!136855 () Unit!8607)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13542 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8607)

(assert (=> b!274437 (= lt!136855 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4201 0))(
  ( (Nil!4198) (Cons!4197 (h!4864 (_ BitVec 64)) (t!9274 List!4201)) )
))
(declare-fun arrayNoDuplicates!0 (array!13542 (_ BitVec 32) List!4201) Bool)

(assert (=> b!274437 (arrayNoDuplicates!0 lt!136854 #b00000000000000000000000000000000 Nil!4198)))

(declare-fun lt!136857 () Unit!8607)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13542 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4201) Unit!8607)

(assert (=> b!274437 (= lt!136857 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4198))))

(declare-fun b!274438 () Bool)

(declare-fun res!138487 () Bool)

(declare-fun e!175685 () Bool)

(assert (=> b!274438 (=> (not res!138487) (not e!175685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274438 (= res!138487 (validKeyInArray!0 k0!2581))))

(declare-fun b!274439 () Bool)

(declare-fun res!138480 () Bool)

(declare-fun e!175686 () Bool)

(assert (=> b!274439 (=> (not res!138480) (not e!175686))))

(assert (=> b!274439 (= res!138480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274440 () Bool)

(assert (=> b!274440 (= e!175685 e!175686)))

(declare-fun res!138482 () Bool)

(assert (=> b!274440 (=> (not res!138482) (not e!175686))))

(declare-fun lt!136853 () SeekEntryResult!1577)

(assert (=> b!274440 (= res!138482 (or (= lt!136853 (MissingZero!1577 i!1267)) (= lt!136853 (MissingVacant!1577 i!1267))))))

(assert (=> b!274440 (= lt!136853 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!274441 () Bool)

(declare-fun res!138485 () Bool)

(assert (=> b!274441 (=> (not res!138485) (not e!175685))))

(assert (=> b!274441 (= res!138485 (and (= (size!6773 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6773 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6773 a!3325))))))

(declare-fun res!138484 () Bool)

(assert (=> start!26456 (=> (not res!138484) (not e!175685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26456 (= res!138484 (validMask!0 mask!3868))))

(assert (=> start!26456 e!175685))

(declare-fun array_inv!4392 (array!13542) Bool)

(assert (=> start!26456 (array_inv!4392 a!3325)))

(assert (=> start!26456 true))

(declare-fun b!274442 () Bool)

(assert (=> b!274442 (= e!175686 e!175683)))

(declare-fun res!138479 () Bool)

(assert (=> b!274442 (=> (not res!138479) (not e!175683))))

(assert (=> b!274442 (= res!138479 (not (= startIndex!26 i!1267)))))

(assert (=> b!274442 (= lt!136854 (array!13543 (store (arr!6420 a!3325) i!1267 k0!2581) (size!6773 a!3325)))))

(declare-fun b!274443 () Bool)

(declare-fun res!138481 () Bool)

(assert (=> b!274443 (=> (not res!138481) (not e!175685))))

(declare-fun arrayContainsKey!0 (array!13542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274443 (= res!138481 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274444 () Bool)

(declare-fun res!138486 () Bool)

(assert (=> b!274444 (=> (not res!138486) (not e!175685))))

(assert (=> b!274444 (= res!138486 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4198))))

(declare-fun b!274445 () Bool)

(declare-fun res!138483 () Bool)

(assert (=> b!274445 (=> (not res!138483) (not e!175683))))

(assert (=> b!274445 (= res!138483 (validKeyInArray!0 (select (arr!6420 a!3325) startIndex!26)))))

(assert (= (and start!26456 res!138484) b!274441))

(assert (= (and b!274441 res!138485) b!274438))

(assert (= (and b!274438 res!138487) b!274444))

(assert (= (and b!274444 res!138486) b!274443))

(assert (= (and b!274443 res!138481) b!274440))

(assert (= (and b!274440 res!138482) b!274439))

(assert (= (and b!274439 res!138480) b!274442))

(assert (= (and b!274442 res!138479) b!274445))

(assert (= (and b!274445 res!138483) b!274437))

(declare-fun m!289565 () Bool)

(assert (=> start!26456 m!289565))

(declare-fun m!289567 () Bool)

(assert (=> start!26456 m!289567))

(declare-fun m!289569 () Bool)

(assert (=> b!274444 m!289569))

(declare-fun m!289571 () Bool)

(assert (=> b!274442 m!289571))

(declare-fun m!289573 () Bool)

(assert (=> b!274440 m!289573))

(declare-fun m!289575 () Bool)

(assert (=> b!274437 m!289575))

(declare-fun m!289577 () Bool)

(assert (=> b!274437 m!289577))

(declare-fun m!289579 () Bool)

(assert (=> b!274437 m!289579))

(assert (=> b!274437 m!289577))

(assert (=> b!274437 m!289571))

(declare-fun m!289581 () Bool)

(assert (=> b!274437 m!289581))

(declare-fun m!289583 () Bool)

(assert (=> b!274437 m!289583))

(declare-fun m!289585 () Bool)

(assert (=> b!274437 m!289585))

(declare-fun m!289587 () Bool)

(assert (=> b!274437 m!289587))

(assert (=> b!274437 m!289583))

(declare-fun m!289589 () Bool)

(assert (=> b!274437 m!289589))

(declare-fun m!289591 () Bool)

(assert (=> b!274437 m!289591))

(assert (=> b!274445 m!289583))

(assert (=> b!274445 m!289583))

(declare-fun m!289593 () Bool)

(assert (=> b!274445 m!289593))

(declare-fun m!289595 () Bool)

(assert (=> b!274439 m!289595))

(declare-fun m!289597 () Bool)

(assert (=> b!274443 m!289597))

(declare-fun m!289599 () Bool)

(assert (=> b!274438 m!289599))

(check-sat (not b!274439) (not b!274437) (not b!274444) (not b!274440) (not start!26456) (not b!274443) (not b!274438) (not b!274445))
(check-sat)
