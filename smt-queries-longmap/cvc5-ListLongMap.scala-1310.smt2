; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26418 () Bool)

(assert start!26418)

(declare-fun b!274062 () Bool)

(declare-fun res!138060 () Bool)

(declare-fun e!175532 () Bool)

(assert (=> b!274062 (=> (not res!138060) (not e!175532))))

(declare-datatypes ((array!13515 0))(
  ( (array!13516 (arr!6407 (Array (_ BitVec 32) (_ BitVec 64))) (size!6759 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13515)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274062 (= res!138060 (validKeyInArray!0 (select (arr!6407 a!3325) startIndex!26)))))

(declare-fun b!274063 () Bool)

(declare-fun res!138052 () Bool)

(declare-fun e!175535 () Bool)

(assert (=> b!274063 (=> (not res!138052) (not e!175535))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274063 (= res!138052 (and (= (size!6759 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6759 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6759 a!3325))))))

(declare-fun res!138055 () Bool)

(assert (=> start!26418 (=> (not res!138055) (not e!175535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26418 (= res!138055 (validMask!0 mask!3868))))

(assert (=> start!26418 e!175535))

(declare-fun array_inv!4370 (array!13515) Bool)

(assert (=> start!26418 (array_inv!4370 a!3325)))

(assert (=> start!26418 true))

(declare-fun b!274064 () Bool)

(declare-fun e!175533 () Bool)

(assert (=> b!274064 (= e!175535 e!175533)))

(declare-fun res!138054 () Bool)

(assert (=> b!274064 (=> (not res!138054) (not e!175533))))

(declare-datatypes ((SeekEntryResult!1565 0))(
  ( (MissingZero!1565 (index!8430 (_ BitVec 32))) (Found!1565 (index!8431 (_ BitVec 32))) (Intermediate!1565 (undefined!2377 Bool) (index!8432 (_ BitVec 32)) (x!26730 (_ BitVec 32))) (Undefined!1565) (MissingVacant!1565 (index!8433 (_ BitVec 32))) )
))
(declare-fun lt!136731 () SeekEntryResult!1565)

(assert (=> b!274064 (= res!138054 (or (= lt!136731 (MissingZero!1565 i!1267)) (= lt!136731 (MissingVacant!1565 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13515 (_ BitVec 32)) SeekEntryResult!1565)

(assert (=> b!274064 (= lt!136731 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274065 () Bool)

(declare-fun res!138058 () Bool)

(assert (=> b!274065 (=> (not res!138058) (not e!175535))))

(assert (=> b!274065 (= res!138058 (validKeyInArray!0 k!2581))))

(declare-fun b!274066 () Bool)

(declare-fun res!138057 () Bool)

(assert (=> b!274066 (=> (not res!138057) (not e!175535))))

(declare-fun arrayContainsKey!0 (array!13515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274066 (= res!138057 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274067 () Bool)

(assert (=> b!274067 (= e!175533 e!175532)))

(declare-fun res!138056 () Bool)

(assert (=> b!274067 (=> (not res!138056) (not e!175532))))

(assert (=> b!274067 (= res!138056 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136729 () array!13515)

(assert (=> b!274067 (= lt!136729 (array!13516 (store (arr!6407 a!3325) i!1267 k!2581) (size!6759 a!3325)))))

(declare-fun b!274068 () Bool)

(assert (=> b!274068 (= e!175532 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13515 (_ BitVec 32)) Bool)

(assert (=> b!274068 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8617 0))(
  ( (Unit!8618) )
))
(declare-fun lt!136730 () Unit!8617)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13515 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8617)

(assert (=> b!274068 (= lt!136730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!274068 (= (seekEntryOrOpen!0 (select (arr!6407 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6407 a!3325) i!1267 k!2581) startIndex!26) lt!136729 mask!3868))))

(declare-fun lt!136732 () Unit!8617)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13515 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8617)

(assert (=> b!274068 (= lt!136732 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4215 0))(
  ( (Nil!4212) (Cons!4211 (h!4878 (_ BitVec 64)) (t!9297 List!4215)) )
))
(declare-fun arrayNoDuplicates!0 (array!13515 (_ BitVec 32) List!4215) Bool)

(assert (=> b!274068 (arrayNoDuplicates!0 lt!136729 #b00000000000000000000000000000000 Nil!4212)))

(declare-fun lt!136728 () Unit!8617)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13515 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4215) Unit!8617)

(assert (=> b!274068 (= lt!136728 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4212))))

(declare-fun b!274069 () Bool)

(declare-fun res!138053 () Bool)

(assert (=> b!274069 (=> (not res!138053) (not e!175535))))

(assert (=> b!274069 (= res!138053 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4212))))

(declare-fun b!274070 () Bool)

(declare-fun res!138059 () Bool)

(assert (=> b!274070 (=> (not res!138059) (not e!175533))))

(assert (=> b!274070 (= res!138059 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26418 res!138055) b!274063))

(assert (= (and b!274063 res!138052) b!274065))

(assert (= (and b!274065 res!138058) b!274069))

(assert (= (and b!274069 res!138053) b!274066))

(assert (= (and b!274066 res!138057) b!274064))

(assert (= (and b!274064 res!138054) b!274070))

(assert (= (and b!274070 res!138059) b!274067))

(assert (= (and b!274067 res!138056) b!274062))

(assert (= (and b!274062 res!138060) b!274068))

(declare-fun m!289461 () Bool)

(assert (=> b!274070 m!289461))

(declare-fun m!289463 () Bool)

(assert (=> b!274064 m!289463))

(declare-fun m!289465 () Bool)

(assert (=> start!26418 m!289465))

(declare-fun m!289467 () Bool)

(assert (=> start!26418 m!289467))

(declare-fun m!289469 () Bool)

(assert (=> b!274065 m!289469))

(declare-fun m!289471 () Bool)

(assert (=> b!274069 m!289471))

(declare-fun m!289473 () Bool)

(assert (=> b!274066 m!289473))

(declare-fun m!289475 () Bool)

(assert (=> b!274067 m!289475))

(declare-fun m!289477 () Bool)

(assert (=> b!274062 m!289477))

(assert (=> b!274062 m!289477))

(declare-fun m!289479 () Bool)

(assert (=> b!274062 m!289479))

(declare-fun m!289481 () Bool)

(assert (=> b!274068 m!289481))

(declare-fun m!289483 () Bool)

(assert (=> b!274068 m!289483))

(declare-fun m!289485 () Bool)

(assert (=> b!274068 m!289485))

(declare-fun m!289487 () Bool)

(assert (=> b!274068 m!289487))

(assert (=> b!274068 m!289483))

(assert (=> b!274068 m!289475))

(declare-fun m!289489 () Bool)

(assert (=> b!274068 m!289489))

(assert (=> b!274068 m!289477))

(declare-fun m!289491 () Bool)

(assert (=> b!274068 m!289491))

(declare-fun m!289493 () Bool)

(assert (=> b!274068 m!289493))

(assert (=> b!274068 m!289477))

(declare-fun m!289495 () Bool)

(assert (=> b!274068 m!289495))

(push 1)

