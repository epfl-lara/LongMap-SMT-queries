; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26406 () Bool)

(assert start!26406)

(declare-fun b!273947 () Bool)

(declare-fun res!137913 () Bool)

(declare-fun e!175484 () Bool)

(assert (=> b!273947 (=> (not res!137913) (not e!175484))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273947 (= res!137913 (validKeyInArray!0 k0!2581))))

(declare-fun b!273948 () Bool)

(declare-fun res!137911 () Bool)

(declare-fun e!175486 () Bool)

(assert (=> b!273948 (=> (not res!137911) (not e!175486))))

(declare-datatypes ((array!13502 0))(
  ( (array!13503 (arr!6400 (Array (_ BitVec 32) (_ BitVec 64))) (size!6752 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13502)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!273948 (= res!137911 (validKeyInArray!0 (select (arr!6400 a!3325) startIndex!26)))))

(declare-fun b!273949 () Bool)

(declare-fun e!175485 () Bool)

(assert (=> b!273949 (= e!175485 e!175486)))

(declare-fun res!137917 () Bool)

(assert (=> b!273949 (=> (not res!137917) (not e!175486))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!273949 (= res!137917 (not (= startIndex!26 i!1267)))))

(declare-fun lt!136698 () array!13502)

(assert (=> b!273949 (= lt!136698 (array!13503 (store (arr!6400 a!3325) i!1267 k0!2581) (size!6752 a!3325)))))

(declare-fun b!273950 () Bool)

(declare-fun res!137914 () Bool)

(assert (=> b!273950 (=> (not res!137914) (not e!175484))))

(declare-datatypes ((List!4121 0))(
  ( (Nil!4118) (Cons!4117 (h!4784 (_ BitVec 64)) (t!9195 List!4121)) )
))
(declare-fun arrayNoDuplicates!0 (array!13502 (_ BitVec 32) List!4121) Bool)

(assert (=> b!273950 (= res!137914 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4118))))

(declare-fun b!273951 () Bool)

(declare-fun res!137912 () Bool)

(assert (=> b!273951 (=> (not res!137912) (not e!175484))))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!273951 (= res!137912 (and (= (size!6752 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6752 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6752 a!3325))))))

(declare-fun b!273953 () Bool)

(assert (=> b!273953 (= e!175484 e!175485)))

(declare-fun res!137918 () Bool)

(assert (=> b!273953 (=> (not res!137918) (not e!175485))))

(declare-datatypes ((SeekEntryResult!1523 0))(
  ( (MissingZero!1523 (index!8262 (_ BitVec 32))) (Found!1523 (index!8263 (_ BitVec 32))) (Intermediate!1523 (undefined!2335 Bool) (index!8264 (_ BitVec 32)) (x!26672 (_ BitVec 32))) (Undefined!1523) (MissingVacant!1523 (index!8265 (_ BitVec 32))) )
))
(declare-fun lt!136700 () SeekEntryResult!1523)

(assert (=> b!273953 (= res!137918 (or (= lt!136700 (MissingZero!1523 i!1267)) (= lt!136700 (MissingVacant!1523 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13502 (_ BitVec 32)) SeekEntryResult!1523)

(assert (=> b!273953 (= lt!136700 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!273954 () Bool)

(declare-fun res!137919 () Bool)

(assert (=> b!273954 (=> (not res!137919) (not e!175485))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13502 (_ BitVec 32)) Bool)

(assert (=> b!273954 (= res!137919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273955 () Bool)

(declare-fun res!137915 () Bool)

(assert (=> b!273955 (=> (not res!137915) (not e!175484))))

(declare-fun arrayContainsKey!0 (array!13502 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273955 (= res!137915 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!137916 () Bool)

(assert (=> start!26406 (=> (not res!137916) (not e!175484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26406 (= res!137916 (validMask!0 mask!3868))))

(assert (=> start!26406 e!175484))

(declare-fun array_inv!4350 (array!13502) Bool)

(assert (=> start!26406 (array_inv!4350 a!3325)))

(assert (=> start!26406 true))

(declare-fun b!273952 () Bool)

(assert (=> b!273952 (= e!175486 (not true))))

(assert (=> b!273952 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8585 0))(
  ( (Unit!8586) )
))
(declare-fun lt!136699 () Unit!8585)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13502 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8585)

(assert (=> b!273952 (= lt!136699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!273952 (= (seekEntryOrOpen!0 (select (arr!6400 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6400 a!3325) i!1267 k0!2581) startIndex!26) lt!136698 mask!3868))))

(declare-fun lt!136701 () Unit!8585)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13502 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8585)

(assert (=> b!273952 (= lt!136701 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!273952 (arrayNoDuplicates!0 lt!136698 #b00000000000000000000000000000000 Nil!4118)))

(declare-fun lt!136697 () Unit!8585)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13502 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4121) Unit!8585)

(assert (=> b!273952 (= lt!136697 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4118))))

(assert (= (and start!26406 res!137916) b!273951))

(assert (= (and b!273951 res!137912) b!273947))

(assert (= (and b!273947 res!137913) b!273950))

(assert (= (and b!273950 res!137914) b!273955))

(assert (= (and b!273955 res!137915) b!273953))

(assert (= (and b!273953 res!137918) b!273954))

(assert (= (and b!273954 res!137919) b!273949))

(assert (= (and b!273949 res!137917) b!273948))

(assert (= (and b!273948 res!137911) b!273952))

(declare-fun m!289451 () Bool)

(assert (=> b!273948 m!289451))

(assert (=> b!273948 m!289451))

(declare-fun m!289453 () Bool)

(assert (=> b!273948 m!289453))

(declare-fun m!289455 () Bool)

(assert (=> start!26406 m!289455))

(declare-fun m!289457 () Bool)

(assert (=> start!26406 m!289457))

(declare-fun m!289459 () Bool)

(assert (=> b!273950 m!289459))

(declare-fun m!289461 () Bool)

(assert (=> b!273954 m!289461))

(declare-fun m!289463 () Bool)

(assert (=> b!273947 m!289463))

(declare-fun m!289465 () Bool)

(assert (=> b!273952 m!289465))

(declare-fun m!289467 () Bool)

(assert (=> b!273952 m!289467))

(declare-fun m!289469 () Bool)

(assert (=> b!273952 m!289469))

(declare-fun m!289471 () Bool)

(assert (=> b!273952 m!289471))

(declare-fun m!289473 () Bool)

(assert (=> b!273952 m!289473))

(assert (=> b!273952 m!289451))

(declare-fun m!289475 () Bool)

(assert (=> b!273952 m!289475))

(declare-fun m!289477 () Bool)

(assert (=> b!273952 m!289477))

(assert (=> b!273952 m!289451))

(declare-fun m!289479 () Bool)

(assert (=> b!273952 m!289479))

(assert (=> b!273952 m!289467))

(declare-fun m!289481 () Bool)

(assert (=> b!273952 m!289481))

(assert (=> b!273949 m!289469))

(declare-fun m!289483 () Bool)

(assert (=> b!273955 m!289483))

(declare-fun m!289485 () Bool)

(assert (=> b!273953 m!289485))

(check-sat (not b!273952) (not b!273950) (not b!273953) (not b!273948) (not b!273947) (not start!26406) (not b!273954) (not b!273955))
(check-sat)
