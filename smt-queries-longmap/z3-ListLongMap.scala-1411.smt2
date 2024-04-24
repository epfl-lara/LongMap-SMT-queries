; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27384 () Bool)

(assert start!27384)

(declare-fun b!283451 () Bool)

(declare-fun res!146352 () Bool)

(declare-fun e!179851 () Bool)

(assert (=> b!283451 (=> (not res!146352) (not e!179851))))

(declare-datatypes ((array!14138 0))(
  ( (array!14139 (arr!6709 (Array (_ BitVec 32) (_ BitVec 64))) (size!7061 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14138)

(declare-datatypes ((List!4430 0))(
  ( (Nil!4427) (Cons!4426 (h!5096 (_ BitVec 64)) (t!9504 List!4430)) )
))
(declare-fun arrayNoDuplicates!0 (array!14138 (_ BitVec 32) List!4430) Bool)

(assert (=> b!283451 (= res!146352 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4427))))

(declare-fun b!283452 () Bool)

(declare-fun res!146351 () Bool)

(assert (=> b!283452 (=> (not res!146351) (not e!179851))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283452 (= res!146351 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!283454 () Bool)

(declare-fun res!146347 () Bool)

(assert (=> b!283454 (=> (not res!146347) (not e!179851))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!283454 (= res!146347 (and (= (size!7061 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7061 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7061 a!3325))))))

(declare-fun b!283455 () Bool)

(declare-fun e!179850 () Bool)

(assert (=> b!283455 (= e!179851 e!179850)))

(declare-fun res!146344 () Bool)

(assert (=> b!283455 (=> (not res!146344) (not e!179850))))

(declare-datatypes ((SeekEntryResult!1832 0))(
  ( (MissingZero!1832 (index!9498 (_ BitVec 32))) (Found!1832 (index!9499 (_ BitVec 32))) (Intermediate!1832 (undefined!2644 Bool) (index!9500 (_ BitVec 32)) (x!27814 (_ BitVec 32))) (Undefined!1832) (MissingVacant!1832 (index!9501 (_ BitVec 32))) )
))
(declare-fun lt!140137 () SeekEntryResult!1832)

(assert (=> b!283455 (= res!146344 (or (= lt!140137 (MissingZero!1832 i!1267)) (= lt!140137 (MissingVacant!1832 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14138 (_ BitVec 32)) SeekEntryResult!1832)

(assert (=> b!283455 (= lt!140137 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!283456 () Bool)

(declare-fun res!146346 () Bool)

(assert (=> b!283456 (=> (not res!146346) (not e!179851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283456 (= res!146346 (validKeyInArray!0 k0!2581))))

(declare-fun b!283457 () Bool)

(declare-fun e!179852 () Bool)

(assert (=> b!283457 (= e!179852 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14138 (_ BitVec 32)) Bool)

(assert (=> b!283457 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8994 0))(
  ( (Unit!8995) )
))
(declare-fun lt!140139 () Unit!8994)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8994)

(assert (=> b!283457 (= lt!140139 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!140136 () array!14138)

(assert (=> b!283457 (= (seekEntryOrOpen!0 (select (arr!6709 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6709 a!3325) i!1267 k0!2581) startIndex!26) lt!140136 mask!3868))))

(declare-fun lt!140135 () Unit!8994)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14138 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8994)

(assert (=> b!283457 (= lt!140135 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!283457 (arrayNoDuplicates!0 lt!140136 #b00000000000000000000000000000000 Nil!4427)))

(declare-fun lt!140138 () Unit!8994)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14138 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4430) Unit!8994)

(assert (=> b!283457 (= lt!140138 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4427))))

(declare-fun res!146348 () Bool)

(assert (=> start!27384 (=> (not res!146348) (not e!179851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27384 (= res!146348 (validMask!0 mask!3868))))

(assert (=> start!27384 e!179851))

(declare-fun array_inv!4659 (array!14138) Bool)

(assert (=> start!27384 (array_inv!4659 a!3325)))

(assert (=> start!27384 true))

(declare-fun b!283453 () Bool)

(assert (=> b!283453 (= e!179850 e!179852)))

(declare-fun res!146345 () Bool)

(assert (=> b!283453 (=> (not res!146345) (not e!179852))))

(assert (=> b!283453 (= res!146345 (not (= startIndex!26 i!1267)))))

(assert (=> b!283453 (= lt!140136 (array!14139 (store (arr!6709 a!3325) i!1267 k0!2581) (size!7061 a!3325)))))

(declare-fun b!283458 () Bool)

(declare-fun res!146349 () Bool)

(assert (=> b!283458 (=> (not res!146349) (not e!179850))))

(assert (=> b!283458 (= res!146349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283459 () Bool)

(declare-fun res!146350 () Bool)

(assert (=> b!283459 (=> (not res!146350) (not e!179852))))

(assert (=> b!283459 (= res!146350 (validKeyInArray!0 (select (arr!6709 a!3325) startIndex!26)))))

(assert (= (and start!27384 res!146348) b!283454))

(assert (= (and b!283454 res!146347) b!283456))

(assert (= (and b!283456 res!146346) b!283451))

(assert (= (and b!283451 res!146352) b!283452))

(assert (= (and b!283452 res!146351) b!283455))

(assert (= (and b!283455 res!146344) b!283458))

(assert (= (and b!283458 res!146349) b!283453))

(assert (= (and b!283453 res!146345) b!283459))

(assert (= (and b!283459 res!146350) b!283457))

(declare-fun m!298487 () Bool)

(assert (=> b!283457 m!298487))

(declare-fun m!298489 () Bool)

(assert (=> b!283457 m!298489))

(declare-fun m!298491 () Bool)

(assert (=> b!283457 m!298491))

(assert (=> b!283457 m!298489))

(declare-fun m!298493 () Bool)

(assert (=> b!283457 m!298493))

(declare-fun m!298495 () Bool)

(assert (=> b!283457 m!298495))

(declare-fun m!298497 () Bool)

(assert (=> b!283457 m!298497))

(declare-fun m!298499 () Bool)

(assert (=> b!283457 m!298499))

(assert (=> b!283457 m!298497))

(declare-fun m!298501 () Bool)

(assert (=> b!283457 m!298501))

(declare-fun m!298503 () Bool)

(assert (=> b!283457 m!298503))

(declare-fun m!298505 () Bool)

(assert (=> b!283457 m!298505))

(assert (=> b!283459 m!298497))

(assert (=> b!283459 m!298497))

(declare-fun m!298507 () Bool)

(assert (=> b!283459 m!298507))

(declare-fun m!298509 () Bool)

(assert (=> b!283452 m!298509))

(assert (=> b!283453 m!298493))

(declare-fun m!298511 () Bool)

(assert (=> b!283451 m!298511))

(declare-fun m!298513 () Bool)

(assert (=> b!283455 m!298513))

(declare-fun m!298515 () Bool)

(assert (=> start!27384 m!298515))

(declare-fun m!298517 () Bool)

(assert (=> start!27384 m!298517))

(declare-fun m!298519 () Bool)

(assert (=> b!283456 m!298519))

(declare-fun m!298521 () Bool)

(assert (=> b!283458 m!298521))

(check-sat (not b!283457) (not start!27384) (not b!283451) (not b!283456) (not b!283452) (not b!283458) (not b!283459) (not b!283455))
(check-sat)
