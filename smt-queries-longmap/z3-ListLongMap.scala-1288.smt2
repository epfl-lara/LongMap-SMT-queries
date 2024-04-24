; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26286 () Bool)

(assert start!26286)

(declare-fun b!272327 () Bool)

(declare-fun e!174827 () Bool)

(declare-fun e!174825 () Bool)

(assert (=> b!272327 (= e!174827 e!174825)))

(declare-fun res!136299 () Bool)

(assert (=> b!272327 (=> (not res!136299) (not e!174825))))

(declare-datatypes ((SeekEntryResult!1463 0))(
  ( (MissingZero!1463 (index!8022 (_ BitVec 32))) (Found!1463 (index!8023 (_ BitVec 32))) (Intermediate!1463 (undefined!2275 Bool) (index!8024 (_ BitVec 32)) (x!26452 (_ BitVec 32))) (Undefined!1463) (MissingVacant!1463 (index!8025 (_ BitVec 32))) )
))
(declare-fun lt!136025 () SeekEntryResult!1463)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!272327 (= res!136299 (or (= lt!136025 (MissingZero!1463 i!1267)) (= lt!136025 (MissingVacant!1463 i!1267))))))

(declare-datatypes ((array!13382 0))(
  ( (array!13383 (arr!6340 (Array (_ BitVec 32) (_ BitVec 64))) (size!6692 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13382)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13382 (_ BitVec 32)) SeekEntryResult!1463)

(assert (=> b!272327 (= lt!136025 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272328 () Bool)

(declare-fun res!136295 () Bool)

(assert (=> b!272328 (=> (not res!136295) (not e!174827))))

(declare-fun arrayContainsKey!0 (array!13382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272328 (= res!136295 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun res!136296 () Bool)

(assert (=> start!26286 (=> (not res!136296) (not e!174827))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26286 (= res!136296 (validMask!0 mask!3868))))

(assert (=> start!26286 e!174827))

(declare-fun array_inv!4290 (array!13382) Bool)

(assert (=> start!26286 (array_inv!4290 a!3325)))

(assert (=> start!26286 true))

(declare-fun b!272329 () Bool)

(declare-fun res!136291 () Bool)

(assert (=> b!272329 (=> (not res!136291) (not e!174827))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272329 (= res!136291 (and (= (size!6692 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6692 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6692 a!3325))))))

(declare-fun b!272330 () Bool)

(declare-fun res!136294 () Bool)

(assert (=> b!272330 (=> (not res!136294) (not e!174827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272330 (= res!136294 (validKeyInArray!0 k0!2581))))

(declare-fun b!272331 () Bool)

(declare-fun res!136297 () Bool)

(assert (=> b!272331 (=> (not res!136297) (not e!174825))))

(assert (=> b!272331 (= res!136297 (not (= startIndex!26 i!1267)))))

(declare-fun b!272332 () Bool)

(declare-fun res!136292 () Bool)

(assert (=> b!272332 (=> (not res!136292) (not e!174825))))

(assert (=> b!272332 (= res!136292 (validKeyInArray!0 (select (arr!6340 a!3325) startIndex!26)))))

(declare-fun b!272333 () Bool)

(declare-fun res!136293 () Bool)

(assert (=> b!272333 (=> (not res!136293) (not e!174827))))

(declare-datatypes ((List!4061 0))(
  ( (Nil!4058) (Cons!4057 (h!4724 (_ BitVec 64)) (t!9135 List!4061)) )
))
(declare-fun arrayNoDuplicates!0 (array!13382 (_ BitVec 32) List!4061) Bool)

(assert (=> b!272333 (= res!136293 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4058))))

(declare-fun b!272334 () Bool)

(assert (=> b!272334 (= e!174825 (not true))))

(assert (=> b!272334 (arrayNoDuplicates!0 (array!13383 (store (arr!6340 a!3325) i!1267 k0!2581) (size!6692 a!3325)) #b00000000000000000000000000000000 Nil!4058)))

(declare-datatypes ((Unit!8465 0))(
  ( (Unit!8466) )
))
(declare-fun lt!136026 () Unit!8465)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13382 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4061) Unit!8465)

(assert (=> b!272334 (= lt!136026 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4058))))

(declare-fun b!272335 () Bool)

(declare-fun res!136298 () Bool)

(assert (=> b!272335 (=> (not res!136298) (not e!174825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13382 (_ BitVec 32)) Bool)

(assert (=> b!272335 (= res!136298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26286 res!136296) b!272329))

(assert (= (and b!272329 res!136291) b!272330))

(assert (= (and b!272330 res!136294) b!272333))

(assert (= (and b!272333 res!136293) b!272328))

(assert (= (and b!272328 res!136295) b!272327))

(assert (= (and b!272327 res!136299) b!272335))

(assert (= (and b!272335 res!136298) b!272331))

(assert (= (and b!272331 res!136297) b!272332))

(assert (= (and b!272332 res!136292) b!272334))

(declare-fun m!287603 () Bool)

(assert (=> b!272334 m!287603))

(declare-fun m!287605 () Bool)

(assert (=> b!272334 m!287605))

(declare-fun m!287607 () Bool)

(assert (=> b!272334 m!287607))

(declare-fun m!287609 () Bool)

(assert (=> b!272327 m!287609))

(declare-fun m!287611 () Bool)

(assert (=> b!272330 m!287611))

(declare-fun m!287613 () Bool)

(assert (=> b!272333 m!287613))

(declare-fun m!287615 () Bool)

(assert (=> b!272335 m!287615))

(declare-fun m!287617 () Bool)

(assert (=> b!272328 m!287617))

(declare-fun m!287619 () Bool)

(assert (=> start!26286 m!287619))

(declare-fun m!287621 () Bool)

(assert (=> start!26286 m!287621))

(declare-fun m!287623 () Bool)

(assert (=> b!272332 m!287623))

(assert (=> b!272332 m!287623))

(declare-fun m!287625 () Bool)

(assert (=> b!272332 m!287625))

(check-sat (not b!272332) (not b!272330) (not b!272328) (not b!272327) (not b!272335) (not start!26286) (not b!272333) (not b!272334))
(check-sat)
