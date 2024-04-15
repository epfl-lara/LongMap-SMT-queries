; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27284 () Bool)

(assert start!27284)

(declare-fun b!282486 () Bool)

(declare-fun res!145613 () Bool)

(declare-fun e!179298 () Bool)

(assert (=> b!282486 (=> (not res!145613) (not e!179298))))

(declare-datatypes ((array!14091 0))(
  ( (array!14092 (arr!6687 (Array (_ BitVec 32) (_ BitVec 64))) (size!7040 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14091)

(declare-datatypes ((List!4468 0))(
  ( (Nil!4465) (Cons!4464 (h!5134 (_ BitVec 64)) (t!9541 List!4468)) )
))
(declare-fun arrayNoDuplicates!0 (array!14091 (_ BitVec 32) List!4468) Bool)

(assert (=> b!282486 (= res!145613 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4465))))

(declare-fun b!282487 () Bool)

(declare-fun res!145614 () Bool)

(assert (=> b!282487 (=> (not res!145614) (not e!179298))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282487 (= res!145614 (validKeyInArray!0 k0!2581))))

(declare-fun res!145615 () Bool)

(assert (=> start!27284 (=> (not res!145615) (not e!179298))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27284 (= res!145615 (validMask!0 mask!3868))))

(assert (=> start!27284 e!179298))

(declare-fun array_inv!4659 (array!14091) Bool)

(assert (=> start!27284 (array_inv!4659 a!3325)))

(assert (=> start!27284 true))

(declare-fun b!282488 () Bool)

(declare-fun res!145607 () Bool)

(assert (=> b!282488 (=> (not res!145607) (not e!179298))))

(declare-fun arrayContainsKey!0 (array!14091 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282488 (= res!145607 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282489 () Bool)

(declare-fun res!145612 () Bool)

(declare-fun e!179299 () Bool)

(assert (=> b!282489 (=> (not res!145612) (not e!179299))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282489 (= res!145612 (validKeyInArray!0 (select (arr!6687 a!3325) startIndex!26)))))

(declare-fun b!282490 () Bool)

(declare-fun e!179301 () Bool)

(assert (=> b!282490 (= e!179298 e!179301)))

(declare-fun res!145611 () Bool)

(assert (=> b!282490 (=> (not res!145611) (not e!179301))))

(declare-datatypes ((SeekEntryResult!1844 0))(
  ( (MissingZero!1844 (index!9546 (_ BitVec 32))) (Found!1844 (index!9547 (_ BitVec 32))) (Intermediate!1844 (undefined!2656 Bool) (index!9548 (_ BitVec 32)) (x!27777 (_ BitVec 32))) (Undefined!1844) (MissingVacant!1844 (index!9549 (_ BitVec 32))) )
))
(declare-fun lt!139473 () SeekEntryResult!1844)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282490 (= res!145611 (or (= lt!139473 (MissingZero!1844 i!1267)) (= lt!139473 (MissingVacant!1844 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14091 (_ BitVec 32)) SeekEntryResult!1844)

(assert (=> b!282490 (= lt!139473 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282491 () Bool)

(assert (=> b!282491 (= e!179301 e!179299)))

(declare-fun res!145608 () Bool)

(assert (=> b!282491 (=> (not res!145608) (not e!179299))))

(assert (=> b!282491 (= res!145608 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139475 () array!14091)

(assert (=> b!282491 (= lt!139475 (array!14092 (store (arr!6687 a!3325) i!1267 k0!2581) (size!7040 a!3325)))))

(declare-fun b!282492 () Bool)

(declare-fun res!145609 () Bool)

(assert (=> b!282492 (=> (not res!145609) (not e!179298))))

(assert (=> b!282492 (= res!145609 (and (= (size!7040 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7040 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7040 a!3325))))))

(declare-fun b!282493 () Bool)

(declare-fun res!145610 () Bool)

(assert (=> b!282493 (=> (not res!145610) (not e!179301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14091 (_ BitVec 32)) Bool)

(assert (=> b!282493 (= res!145610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282494 () Bool)

(assert (=> b!282494 (= e!179299 (not true))))

(assert (=> b!282494 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8934 0))(
  ( (Unit!8935) )
))
(declare-fun lt!139474 () Unit!8934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8934)

(assert (=> b!282494 (= lt!139474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282494 (= (seekEntryOrOpen!0 (select (arr!6687 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6687 a!3325) i!1267 k0!2581) startIndex!26) lt!139475 mask!3868))))

(declare-fun lt!139476 () Unit!8934)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14091 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8934)

(assert (=> b!282494 (= lt!139476 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282494 (arrayNoDuplicates!0 lt!139475 #b00000000000000000000000000000000 Nil!4465)))

(declare-fun lt!139472 () Unit!8934)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14091 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4468) Unit!8934)

(assert (=> b!282494 (= lt!139472 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4465))))

(assert (= (and start!27284 res!145615) b!282492))

(assert (= (and b!282492 res!145609) b!282487))

(assert (= (and b!282487 res!145614) b!282486))

(assert (= (and b!282486 res!145613) b!282488))

(assert (= (and b!282488 res!145607) b!282490))

(assert (= (and b!282490 res!145611) b!282493))

(assert (= (and b!282493 res!145610) b!282491))

(assert (= (and b!282491 res!145608) b!282489))

(assert (= (and b!282489 res!145612) b!282494))

(declare-fun m!296675 () Bool)

(assert (=> b!282494 m!296675))

(declare-fun m!296677 () Bool)

(assert (=> b!282494 m!296677))

(declare-fun m!296679 () Bool)

(assert (=> b!282494 m!296679))

(declare-fun m!296681 () Bool)

(assert (=> b!282494 m!296681))

(declare-fun m!296683 () Bool)

(assert (=> b!282494 m!296683))

(declare-fun m!296685 () Bool)

(assert (=> b!282494 m!296685))

(declare-fun m!296687 () Bool)

(assert (=> b!282494 m!296687))

(declare-fun m!296689 () Bool)

(assert (=> b!282494 m!296689))

(assert (=> b!282494 m!296677))

(declare-fun m!296691 () Bool)

(assert (=> b!282494 m!296691))

(assert (=> b!282494 m!296685))

(declare-fun m!296693 () Bool)

(assert (=> b!282494 m!296693))

(declare-fun m!296695 () Bool)

(assert (=> start!27284 m!296695))

(declare-fun m!296697 () Bool)

(assert (=> start!27284 m!296697))

(assert (=> b!282491 m!296679))

(declare-fun m!296699 () Bool)

(assert (=> b!282488 m!296699))

(declare-fun m!296701 () Bool)

(assert (=> b!282493 m!296701))

(declare-fun m!296703 () Bool)

(assert (=> b!282486 m!296703))

(assert (=> b!282489 m!296685))

(assert (=> b!282489 m!296685))

(declare-fun m!296705 () Bool)

(assert (=> b!282489 m!296705))

(declare-fun m!296707 () Bool)

(assert (=> b!282490 m!296707))

(declare-fun m!296709 () Bool)

(assert (=> b!282487 m!296709))

(check-sat (not b!282493) (not b!282490) (not start!27284) (not b!282489) (not b!282488) (not b!282486) (not b!282494) (not b!282487))
(check-sat)
