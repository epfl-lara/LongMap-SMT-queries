; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26292 () Bool)

(assert start!26292)

(declare-fun b!272408 () Bool)

(declare-fun res!136380 () Bool)

(declare-fun e!174854 () Bool)

(assert (=> b!272408 (=> (not res!136380) (not e!174854))))

(declare-datatypes ((array!13388 0))(
  ( (array!13389 (arr!6343 (Array (_ BitVec 32) (_ BitVec 64))) (size!6695 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13388)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13388 (_ BitVec 32)) Bool)

(assert (=> b!272408 (= res!136380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!272409 () Bool)

(declare-fun res!136378 () Bool)

(assert (=> b!272409 (=> (not res!136378) (not e!174854))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272409 (= res!136378 (validKeyInArray!0 (select (arr!6343 a!3325) startIndex!26)))))

(declare-fun b!272410 () Bool)

(declare-fun res!136377 () Bool)

(declare-fun e!174852 () Bool)

(assert (=> b!272410 (=> (not res!136377) (not e!174852))))

(declare-datatypes ((List!4064 0))(
  ( (Nil!4061) (Cons!4060 (h!4727 (_ BitVec 64)) (t!9138 List!4064)) )
))
(declare-fun arrayNoDuplicates!0 (array!13388 (_ BitVec 32) List!4064) Bool)

(assert (=> b!272410 (= res!136377 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4061))))

(declare-fun b!272411 () Bool)

(assert (=> b!272411 (= e!174852 e!174854)))

(declare-fun res!136379 () Bool)

(assert (=> b!272411 (=> (not res!136379) (not e!174854))))

(declare-datatypes ((SeekEntryResult!1466 0))(
  ( (MissingZero!1466 (index!8034 (_ BitVec 32))) (Found!1466 (index!8035 (_ BitVec 32))) (Intermediate!1466 (undefined!2278 Bool) (index!8036 (_ BitVec 32)) (x!26463 (_ BitVec 32))) (Undefined!1466) (MissingVacant!1466 (index!8037 (_ BitVec 32))) )
))
(declare-fun lt!136044 () SeekEntryResult!1466)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272411 (= res!136379 (or (= lt!136044 (MissingZero!1466 i!1267)) (= lt!136044 (MissingVacant!1466 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13388 (_ BitVec 32)) SeekEntryResult!1466)

(assert (=> b!272411 (= lt!136044 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272412 () Bool)

(declare-fun res!136372 () Bool)

(assert (=> b!272412 (=> (not res!136372) (not e!174854))))

(assert (=> b!272412 (= res!136372 (not (= startIndex!26 i!1267)))))

(declare-fun b!272413 () Bool)

(declare-fun res!136373 () Bool)

(assert (=> b!272413 (=> (not res!136373) (not e!174852))))

(assert (=> b!272413 (= res!136373 (validKeyInArray!0 k0!2581))))

(declare-fun b!272414 () Bool)

(assert (=> b!272414 (= e!174854 (not true))))

(assert (=> b!272414 (arrayNoDuplicates!0 (array!13389 (store (arr!6343 a!3325) i!1267 k0!2581) (size!6695 a!3325)) #b00000000000000000000000000000000 Nil!4061)))

(declare-datatypes ((Unit!8471 0))(
  ( (Unit!8472) )
))
(declare-fun lt!136043 () Unit!8471)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13388 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4064) Unit!8471)

(assert (=> b!272414 (= lt!136043 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4061))))

(declare-fun b!272415 () Bool)

(declare-fun res!136374 () Bool)

(assert (=> b!272415 (=> (not res!136374) (not e!174852))))

(declare-fun arrayContainsKey!0 (array!13388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272415 (= res!136374 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272416 () Bool)

(declare-fun res!136376 () Bool)

(assert (=> b!272416 (=> (not res!136376) (not e!174852))))

(assert (=> b!272416 (= res!136376 (and (= (size!6695 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6695 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6695 a!3325))))))

(declare-fun res!136375 () Bool)

(assert (=> start!26292 (=> (not res!136375) (not e!174852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26292 (= res!136375 (validMask!0 mask!3868))))

(assert (=> start!26292 e!174852))

(declare-fun array_inv!4293 (array!13388) Bool)

(assert (=> start!26292 (array_inv!4293 a!3325)))

(assert (=> start!26292 true))

(assert (= (and start!26292 res!136375) b!272416))

(assert (= (and b!272416 res!136376) b!272413))

(assert (= (and b!272413 res!136373) b!272410))

(assert (= (and b!272410 res!136377) b!272415))

(assert (= (and b!272415 res!136374) b!272411))

(assert (= (and b!272411 res!136379) b!272408))

(assert (= (and b!272408 res!136380) b!272412))

(assert (= (and b!272412 res!136372) b!272409))

(assert (= (and b!272409 res!136378) b!272414))

(declare-fun m!287675 () Bool)

(assert (=> b!272408 m!287675))

(declare-fun m!287677 () Bool)

(assert (=> start!26292 m!287677))

(declare-fun m!287679 () Bool)

(assert (=> start!26292 m!287679))

(declare-fun m!287681 () Bool)

(assert (=> b!272415 m!287681))

(declare-fun m!287683 () Bool)

(assert (=> b!272414 m!287683))

(declare-fun m!287685 () Bool)

(assert (=> b!272414 m!287685))

(declare-fun m!287687 () Bool)

(assert (=> b!272414 m!287687))

(declare-fun m!287689 () Bool)

(assert (=> b!272409 m!287689))

(assert (=> b!272409 m!287689))

(declare-fun m!287691 () Bool)

(assert (=> b!272409 m!287691))

(declare-fun m!287693 () Bool)

(assert (=> b!272413 m!287693))

(declare-fun m!287695 () Bool)

(assert (=> b!272411 m!287695))

(declare-fun m!287697 () Bool)

(assert (=> b!272410 m!287697))

(check-sat (not b!272410) (not start!26292) (not b!272413) (not b!272409) (not b!272408) (not b!272414) (not b!272415) (not b!272411))
(check-sat)
