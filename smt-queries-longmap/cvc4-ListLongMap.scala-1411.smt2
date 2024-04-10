; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27388 () Bool)

(assert start!27388)

(declare-fun b!283458 () Bool)

(declare-fun res!146382 () Bool)

(declare-fun e!179851 () Bool)

(assert (=> b!283458 (=> (not res!146382) (not e!179851))))

(declare-datatypes ((array!14143 0))(
  ( (array!14144 (arr!6712 (Array (_ BitVec 32) (_ BitVec 64))) (size!7064 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14143)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14143 (_ BitVec 32)) Bool)

(assert (=> b!283458 (= res!146382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!283459 () Bool)

(declare-fun res!146377 () Bool)

(declare-fun e!179850 () Bool)

(assert (=> b!283459 (=> (not res!146377) (not e!179850))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!283459 (= res!146377 (validKeyInArray!0 k!2581))))

(declare-fun b!283460 () Bool)

(declare-fun res!146384 () Bool)

(assert (=> b!283460 (=> (not res!146384) (not e!179850))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!283460 (= res!146384 (and (= (size!7064 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7064 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7064 a!3325))))))

(declare-fun b!283461 () Bool)

(assert (=> b!283461 (= e!179850 e!179851)))

(declare-fun res!146381 () Bool)

(assert (=> b!283461 (=> (not res!146381) (not e!179851))))

(declare-datatypes ((SeekEntryResult!1870 0))(
  ( (MissingZero!1870 (index!9650 (_ BitVec 32))) (Found!1870 (index!9651 (_ BitVec 32))) (Intermediate!1870 (undefined!2682 Bool) (index!9652 (_ BitVec 32)) (x!27852 (_ BitVec 32))) (Undefined!1870) (MissingVacant!1870 (index!9653 (_ BitVec 32))) )
))
(declare-fun lt!140108 () SeekEntryResult!1870)

(assert (=> b!283461 (= res!146381 (or (= lt!140108 (MissingZero!1870 i!1267)) (= lt!140108 (MissingVacant!1870 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14143 (_ BitVec 32)) SeekEntryResult!1870)

(assert (=> b!283461 (= lt!140108 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!283463 () Bool)

(declare-fun res!146383 () Bool)

(assert (=> b!283463 (=> (not res!146383) (not e!179850))))

(declare-datatypes ((List!4520 0))(
  ( (Nil!4517) (Cons!4516 (h!5186 (_ BitVec 64)) (t!9602 List!4520)) )
))
(declare-fun arrayNoDuplicates!0 (array!14143 (_ BitVec 32) List!4520) Bool)

(assert (=> b!283463 (= res!146383 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4517))))

(declare-fun b!283464 () Bool)

(declare-fun e!179852 () Bool)

(assert (=> b!283464 (= e!179852 (not true))))

(assert (=> b!283464 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9024 0))(
  ( (Unit!9025) )
))
(declare-fun lt!140107 () Unit!9024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14143 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9024)

(assert (=> b!283464 (= lt!140107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!140110 () array!14143)

(assert (=> b!283464 (= (seekEntryOrOpen!0 (select (arr!6712 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6712 a!3325) i!1267 k!2581) startIndex!26) lt!140110 mask!3868))))

(declare-fun lt!140109 () Unit!9024)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14143 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9024)

(assert (=> b!283464 (= lt!140109 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!283464 (arrayNoDuplicates!0 lt!140110 #b00000000000000000000000000000000 Nil!4517)))

(declare-fun lt!140106 () Unit!9024)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14143 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4520) Unit!9024)

(assert (=> b!283464 (= lt!140106 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4517))))

(declare-fun b!283465 () Bool)

(declare-fun res!146378 () Bool)

(assert (=> b!283465 (=> (not res!146378) (not e!179852))))

(assert (=> b!283465 (= res!146378 (validKeyInArray!0 (select (arr!6712 a!3325) startIndex!26)))))

(declare-fun b!283466 () Bool)

(assert (=> b!283466 (= e!179851 e!179852)))

(declare-fun res!146380 () Bool)

(assert (=> b!283466 (=> (not res!146380) (not e!179852))))

(assert (=> b!283466 (= res!146380 (not (= startIndex!26 i!1267)))))

(assert (=> b!283466 (= lt!140110 (array!14144 (store (arr!6712 a!3325) i!1267 k!2581) (size!7064 a!3325)))))

(declare-fun b!283462 () Bool)

(declare-fun res!146379 () Bool)

(assert (=> b!283462 (=> (not res!146379) (not e!179850))))

(declare-fun arrayContainsKey!0 (array!14143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!283462 (= res!146379 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!146385 () Bool)

(assert (=> start!27388 (=> (not res!146385) (not e!179850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27388 (= res!146385 (validMask!0 mask!3868))))

(assert (=> start!27388 e!179850))

(declare-fun array_inv!4675 (array!14143) Bool)

(assert (=> start!27388 (array_inv!4675 a!3325)))

(assert (=> start!27388 true))

(assert (= (and start!27388 res!146385) b!283460))

(assert (= (and b!283460 res!146384) b!283459))

(assert (= (and b!283459 res!146377) b!283463))

(assert (= (and b!283463 res!146383) b!283462))

(assert (= (and b!283462 res!146379) b!283461))

(assert (= (and b!283461 res!146381) b!283458))

(assert (= (and b!283458 res!146382) b!283466))

(assert (= (and b!283466 res!146380) b!283465))

(assert (= (and b!283465 res!146378) b!283464))

(declare-fun m!298353 () Bool)

(assert (=> start!27388 m!298353))

(declare-fun m!298355 () Bool)

(assert (=> start!27388 m!298355))

(declare-fun m!298357 () Bool)

(assert (=> b!283458 m!298357))

(declare-fun m!298359 () Bool)

(assert (=> b!283461 m!298359))

(declare-fun m!298361 () Bool)

(assert (=> b!283465 m!298361))

(assert (=> b!283465 m!298361))

(declare-fun m!298363 () Bool)

(assert (=> b!283465 m!298363))

(declare-fun m!298365 () Bool)

(assert (=> b!283463 m!298365))

(declare-fun m!298367 () Bool)

(assert (=> b!283464 m!298367))

(declare-fun m!298369 () Bool)

(assert (=> b!283464 m!298369))

(declare-fun m!298371 () Bool)

(assert (=> b!283464 m!298371))

(declare-fun m!298373 () Bool)

(assert (=> b!283464 m!298373))

(declare-fun m!298375 () Bool)

(assert (=> b!283464 m!298375))

(assert (=> b!283464 m!298361))

(declare-fun m!298377 () Bool)

(assert (=> b!283464 m!298377))

(assert (=> b!283464 m!298371))

(declare-fun m!298379 () Bool)

(assert (=> b!283464 m!298379))

(declare-fun m!298381 () Bool)

(assert (=> b!283464 m!298381))

(assert (=> b!283464 m!298361))

(declare-fun m!298383 () Bool)

(assert (=> b!283464 m!298383))

(declare-fun m!298385 () Bool)

(assert (=> b!283462 m!298385))

(assert (=> b!283466 m!298373))

(declare-fun m!298387 () Bool)

(assert (=> b!283459 m!298387))

(push 1)

(assert (not start!27388))

