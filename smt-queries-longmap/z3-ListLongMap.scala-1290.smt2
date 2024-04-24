; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26298 () Bool)

(assert start!26298)

(declare-fun b!272489 () Bool)

(declare-fun res!136460 () Bool)

(declare-fun e!174881 () Bool)

(assert (=> b!272489 (=> (not res!136460) (not e!174881))))

(declare-datatypes ((array!13394 0))(
  ( (array!13395 (arr!6346 (Array (_ BitVec 32) (_ BitVec 64))) (size!6698 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13394)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13394 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!272489 (= res!136460 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!272490 () Bool)

(declare-fun res!136456 () Bool)

(declare-fun e!174879 () Bool)

(assert (=> b!272490 (=> (not res!136456) (not e!174879))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13394 (_ BitVec 32)) Bool)

(assert (=> b!272490 (= res!136456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!136457 () Bool)

(assert (=> start!26298 (=> (not res!136457) (not e!174881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26298 (= res!136457 (validMask!0 mask!3868))))

(assert (=> start!26298 e!174881))

(declare-fun array_inv!4296 (array!13394) Bool)

(assert (=> start!26298 (array_inv!4296 a!3325)))

(assert (=> start!26298 true))

(declare-fun b!272491 () Bool)

(declare-fun res!136453 () Bool)

(assert (=> b!272491 (=> (not res!136453) (not e!174881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!272491 (= res!136453 (validKeyInArray!0 k0!2581))))

(declare-fun b!272492 () Bool)

(assert (=> b!272492 (= e!174879 (not true))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((List!4067 0))(
  ( (Nil!4064) (Cons!4063 (h!4730 (_ BitVec 64)) (t!9141 List!4067)) )
))
(declare-fun arrayNoDuplicates!0 (array!13394 (_ BitVec 32) List!4067) Bool)

(assert (=> b!272492 (arrayNoDuplicates!0 (array!13395 (store (arr!6346 a!3325) i!1267 k0!2581) (size!6698 a!3325)) #b00000000000000000000000000000000 Nil!4064)))

(declare-datatypes ((Unit!8477 0))(
  ( (Unit!8478) )
))
(declare-fun lt!136061 () Unit!8477)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13394 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4067) Unit!8477)

(assert (=> b!272492 (= lt!136061 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4064))))

(declare-fun b!272493 () Bool)

(declare-fun res!136455 () Bool)

(assert (=> b!272493 (=> (not res!136455) (not e!174881))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!272493 (= res!136455 (and (= (size!6698 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6698 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6698 a!3325))))))

(declare-fun b!272494 () Bool)

(declare-fun res!136458 () Bool)

(assert (=> b!272494 (=> (not res!136458) (not e!174879))))

(assert (=> b!272494 (= res!136458 (not (= startIndex!26 i!1267)))))

(declare-fun b!272495 () Bool)

(declare-fun res!136459 () Bool)

(assert (=> b!272495 (=> (not res!136459) (not e!174881))))

(assert (=> b!272495 (= res!136459 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4064))))

(declare-fun b!272496 () Bool)

(assert (=> b!272496 (= e!174881 e!174879)))

(declare-fun res!136454 () Bool)

(assert (=> b!272496 (=> (not res!136454) (not e!174879))))

(declare-datatypes ((SeekEntryResult!1469 0))(
  ( (MissingZero!1469 (index!8046 (_ BitVec 32))) (Found!1469 (index!8047 (_ BitVec 32))) (Intermediate!1469 (undefined!2281 Bool) (index!8048 (_ BitVec 32)) (x!26474 (_ BitVec 32))) (Undefined!1469) (MissingVacant!1469 (index!8049 (_ BitVec 32))) )
))
(declare-fun lt!136062 () SeekEntryResult!1469)

(assert (=> b!272496 (= res!136454 (or (= lt!136062 (MissingZero!1469 i!1267)) (= lt!136062 (MissingVacant!1469 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13394 (_ BitVec 32)) SeekEntryResult!1469)

(assert (=> b!272496 (= lt!136062 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!272497 () Bool)

(declare-fun res!136461 () Bool)

(assert (=> b!272497 (=> (not res!136461) (not e!174879))))

(assert (=> b!272497 (= res!136461 (validKeyInArray!0 (select (arr!6346 a!3325) startIndex!26)))))

(assert (= (and start!26298 res!136457) b!272493))

(assert (= (and b!272493 res!136455) b!272491))

(assert (= (and b!272491 res!136453) b!272495))

(assert (= (and b!272495 res!136459) b!272489))

(assert (= (and b!272489 res!136460) b!272496))

(assert (= (and b!272496 res!136454) b!272490))

(assert (= (and b!272490 res!136456) b!272494))

(assert (= (and b!272494 res!136458) b!272497))

(assert (= (and b!272497 res!136461) b!272492))

(declare-fun m!287747 () Bool)

(assert (=> b!272489 m!287747))

(declare-fun m!287749 () Bool)

(assert (=> b!272496 m!287749))

(declare-fun m!287751 () Bool)

(assert (=> b!272492 m!287751))

(declare-fun m!287753 () Bool)

(assert (=> b!272492 m!287753))

(declare-fun m!287755 () Bool)

(assert (=> b!272492 m!287755))

(declare-fun m!287757 () Bool)

(assert (=> b!272495 m!287757))

(declare-fun m!287759 () Bool)

(assert (=> b!272491 m!287759))

(declare-fun m!287761 () Bool)

(assert (=> b!272490 m!287761))

(declare-fun m!287763 () Bool)

(assert (=> start!26298 m!287763))

(declare-fun m!287765 () Bool)

(assert (=> start!26298 m!287765))

(declare-fun m!287767 () Bool)

(assert (=> b!272497 m!287767))

(assert (=> b!272497 m!287767))

(declare-fun m!287769 () Bool)

(assert (=> b!272497 m!287769))

(check-sat (not b!272492) (not start!26298) (not b!272491) (not b!272495) (not b!272496) (not b!272490) (not b!272497) (not b!272489))
(check-sat)
