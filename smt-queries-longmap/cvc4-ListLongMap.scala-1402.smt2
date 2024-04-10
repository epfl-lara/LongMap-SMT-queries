; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27268 () Bool)

(assert start!27268)

(declare-fun b!282444 () Bool)

(declare-fun res!145518 () Bool)

(declare-fun e!179316 () Bool)

(assert (=> b!282444 (=> (not res!145518) (not e!179316))))

(declare-datatypes ((array!14086 0))(
  ( (array!14087 (arr!6685 (Array (_ BitVec 32) (_ BitVec 64))) (size!7037 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14086)

(declare-datatypes ((List!4493 0))(
  ( (Nil!4490) (Cons!4489 (h!5159 (_ BitVec 64)) (t!9575 List!4493)) )
))
(declare-fun arrayNoDuplicates!0 (array!14086 (_ BitVec 32) List!4493) Bool)

(assert (=> b!282444 (= res!145518 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4490))))

(declare-fun b!282445 () Bool)

(declare-fun res!145519 () Bool)

(declare-fun e!179317 () Bool)

(assert (=> b!282445 (=> (not res!145519) (not e!179317))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14086 (_ BitVec 32)) Bool)

(assert (=> b!282445 (= res!145519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282446 () Bool)

(declare-fun e!179318 () Bool)

(assert (=> b!282446 (= e!179318 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282446 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8970 0))(
  ( (Unit!8971) )
))
(declare-fun lt!139550 () Unit!8970)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8970)

(assert (=> b!282446 (= lt!139550 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139549 () array!14086)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1843 0))(
  ( (MissingZero!1843 (index!9542 (_ BitVec 32))) (Found!1843 (index!9543 (_ BitVec 32))) (Intermediate!1843 (undefined!2655 Bool) (index!9544 (_ BitVec 32)) (x!27753 (_ BitVec 32))) (Undefined!1843) (MissingVacant!1843 (index!9545 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14086 (_ BitVec 32)) SeekEntryResult!1843)

(assert (=> b!282446 (= (seekEntryOrOpen!0 (select (arr!6685 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6685 a!3325) i!1267 k!2581) startIndex!26) lt!139549 mask!3868))))

(declare-fun lt!139552 () Unit!8970)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14086 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8970)

(assert (=> b!282446 (= lt!139552 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282446 (arrayNoDuplicates!0 lt!139549 #b00000000000000000000000000000000 Nil!4490)))

(declare-fun lt!139551 () Unit!8970)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14086 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4493) Unit!8970)

(assert (=> b!282446 (= lt!139551 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4490))))

(declare-fun res!145513 () Bool)

(assert (=> start!27268 (=> (not res!145513) (not e!179316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27268 (= res!145513 (validMask!0 mask!3868))))

(assert (=> start!27268 e!179316))

(declare-fun array_inv!4648 (array!14086) Bool)

(assert (=> start!27268 (array_inv!4648 a!3325)))

(assert (=> start!27268 true))

(declare-fun b!282447 () Bool)

(declare-fun res!145514 () Bool)

(assert (=> b!282447 (=> (not res!145514) (not e!179316))))

(assert (=> b!282447 (= res!145514 (and (= (size!7037 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7037 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7037 a!3325))))))

(declare-fun b!282448 () Bool)

(declare-fun res!145517 () Bool)

(assert (=> b!282448 (=> (not res!145517) (not e!179318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282448 (= res!145517 (validKeyInArray!0 (select (arr!6685 a!3325) startIndex!26)))))

(declare-fun b!282449 () Bool)

(declare-fun res!145516 () Bool)

(assert (=> b!282449 (=> (not res!145516) (not e!179316))))

(declare-fun arrayContainsKey!0 (array!14086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282449 (= res!145516 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282450 () Bool)

(declare-fun res!145521 () Bool)

(assert (=> b!282450 (=> (not res!145521) (not e!179316))))

(assert (=> b!282450 (= res!145521 (validKeyInArray!0 k!2581))))

(declare-fun b!282451 () Bool)

(assert (=> b!282451 (= e!179317 e!179318)))

(declare-fun res!145515 () Bool)

(assert (=> b!282451 (=> (not res!145515) (not e!179318))))

(assert (=> b!282451 (= res!145515 (not (= startIndex!26 i!1267)))))

(assert (=> b!282451 (= lt!139549 (array!14087 (store (arr!6685 a!3325) i!1267 k!2581) (size!7037 a!3325)))))

(declare-fun b!282452 () Bool)

(assert (=> b!282452 (= e!179316 e!179317)))

(declare-fun res!145520 () Bool)

(assert (=> b!282452 (=> (not res!145520) (not e!179317))))

(declare-fun lt!139548 () SeekEntryResult!1843)

(assert (=> b!282452 (= res!145520 (or (= lt!139548 (MissingZero!1843 i!1267)) (= lt!139548 (MissingVacant!1843 i!1267))))))

(assert (=> b!282452 (= lt!139548 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!27268 res!145513) b!282447))

(assert (= (and b!282447 res!145514) b!282450))

(assert (= (and b!282450 res!145521) b!282444))

(assert (= (and b!282444 res!145518) b!282449))

(assert (= (and b!282449 res!145516) b!282452))

(assert (= (and b!282452 res!145520) b!282445))

(assert (= (and b!282445 res!145519) b!282451))

(assert (= (and b!282451 res!145515) b!282448))

(assert (= (and b!282448 res!145517) b!282446))

(declare-fun m!297015 () Bool)

(assert (=> b!282446 m!297015))

(declare-fun m!297017 () Bool)

(assert (=> b!282446 m!297017))

(declare-fun m!297019 () Bool)

(assert (=> b!282446 m!297019))

(assert (=> b!282446 m!297017))

(declare-fun m!297021 () Bool)

(assert (=> b!282446 m!297021))

(declare-fun m!297023 () Bool)

(assert (=> b!282446 m!297023))

(declare-fun m!297025 () Bool)

(assert (=> b!282446 m!297025))

(declare-fun m!297027 () Bool)

(assert (=> b!282446 m!297027))

(declare-fun m!297029 () Bool)

(assert (=> b!282446 m!297029))

(declare-fun m!297031 () Bool)

(assert (=> b!282446 m!297031))

(assert (=> b!282446 m!297025))

(declare-fun m!297033 () Bool)

(assert (=> b!282446 m!297033))

(declare-fun m!297035 () Bool)

(assert (=> b!282444 m!297035))

(declare-fun m!297037 () Bool)

(assert (=> b!282449 m!297037))

(assert (=> b!282448 m!297025))

(assert (=> b!282448 m!297025))

(declare-fun m!297039 () Bool)

(assert (=> b!282448 m!297039))

(declare-fun m!297041 () Bool)

(assert (=> b!282450 m!297041))

(declare-fun m!297043 () Bool)

(assert (=> b!282452 m!297043))

(declare-fun m!297045 () Bool)

(assert (=> start!27268 m!297045))

(declare-fun m!297047 () Bool)

(assert (=> start!27268 m!297047))

(assert (=> b!282451 m!297019))

(declare-fun m!297049 () Bool)

(assert (=> b!282445 m!297049))

(push 1)

(assert (not b!282445))

(assert (not b!282448))

(assert (not b!282452))

(assert (not b!282450))

