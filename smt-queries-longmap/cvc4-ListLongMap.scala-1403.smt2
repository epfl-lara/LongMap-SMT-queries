; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27274 () Bool)

(assert start!27274)

(declare-fun res!145595 () Bool)

(declare-fun e!179352 () Bool)

(assert (=> start!27274 (=> (not res!145595) (not e!179352))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27274 (= res!145595 (validMask!0 mask!3868))))

(assert (=> start!27274 e!179352))

(declare-datatypes ((array!14092 0))(
  ( (array!14093 (arr!6688 (Array (_ BitVec 32) (_ BitVec 64))) (size!7040 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14092)

(declare-fun array_inv!4651 (array!14092) Bool)

(assert (=> start!27274 (array_inv!4651 a!3325)))

(assert (=> start!27274 true))

(declare-fun b!282525 () Bool)

(declare-fun e!179351 () Bool)

(assert (=> b!282525 (= e!179351 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14092 (_ BitVec 32)) Bool)

(assert (=> b!282525 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8976 0))(
  ( (Unit!8977) )
))
(declare-fun lt!139595 () Unit!8976)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> b!282525 (= lt!139595 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139596 () array!14092)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1846 0))(
  ( (MissingZero!1846 (index!9554 (_ BitVec 32))) (Found!1846 (index!9555 (_ BitVec 32))) (Intermediate!1846 (undefined!2658 Bool) (index!9556 (_ BitVec 32)) (x!27764 (_ BitVec 32))) (Undefined!1846) (MissingVacant!1846 (index!9557 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14092 (_ BitVec 32)) SeekEntryResult!1846)

(assert (=> b!282525 (= (seekEntryOrOpen!0 (select (arr!6688 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6688 a!3325) i!1267 k!2581) startIndex!26) lt!139596 mask!3868))))

(declare-fun lt!139597 () Unit!8976)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14092 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8976)

(assert (=> b!282525 (= lt!139597 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4496 0))(
  ( (Nil!4493) (Cons!4492 (h!5162 (_ BitVec 64)) (t!9578 List!4496)) )
))
(declare-fun arrayNoDuplicates!0 (array!14092 (_ BitVec 32) List!4496) Bool)

(assert (=> b!282525 (arrayNoDuplicates!0 lt!139596 #b00000000000000000000000000000000 Nil!4493)))

(declare-fun lt!139594 () Unit!8976)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14092 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4496) Unit!8976)

(assert (=> b!282525 (= lt!139594 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4493))))

(declare-fun b!282526 () Bool)

(declare-fun res!145597 () Bool)

(assert (=> b!282526 (=> (not res!145597) (not e!179352))))

(declare-fun arrayContainsKey!0 (array!14092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282526 (= res!145597 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282527 () Bool)

(declare-fun e!179354 () Bool)

(assert (=> b!282527 (= e!179354 e!179351)))

(declare-fun res!145602 () Bool)

(assert (=> b!282527 (=> (not res!145602) (not e!179351))))

(assert (=> b!282527 (= res!145602 (not (= startIndex!26 i!1267)))))

(assert (=> b!282527 (= lt!139596 (array!14093 (store (arr!6688 a!3325) i!1267 k!2581) (size!7040 a!3325)))))

(declare-fun b!282528 () Bool)

(declare-fun res!145600 () Bool)

(assert (=> b!282528 (=> (not res!145600) (not e!179352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282528 (= res!145600 (validKeyInArray!0 k!2581))))

(declare-fun b!282529 () Bool)

(declare-fun res!145601 () Bool)

(assert (=> b!282529 (=> (not res!145601) (not e!179352))))

(assert (=> b!282529 (= res!145601 (and (= (size!7040 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7040 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7040 a!3325))))))

(declare-fun b!282530 () Bool)

(declare-fun res!145594 () Bool)

(assert (=> b!282530 (=> (not res!145594) (not e!179352))))

(assert (=> b!282530 (= res!145594 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4493))))

(declare-fun b!282531 () Bool)

(assert (=> b!282531 (= e!179352 e!179354)))

(declare-fun res!145596 () Bool)

(assert (=> b!282531 (=> (not res!145596) (not e!179354))))

(declare-fun lt!139593 () SeekEntryResult!1846)

(assert (=> b!282531 (= res!145596 (or (= lt!139593 (MissingZero!1846 i!1267)) (= lt!139593 (MissingVacant!1846 i!1267))))))

(assert (=> b!282531 (= lt!139593 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282532 () Bool)

(declare-fun res!145598 () Bool)

(assert (=> b!282532 (=> (not res!145598) (not e!179354))))

(assert (=> b!282532 (= res!145598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282533 () Bool)

(declare-fun res!145599 () Bool)

(assert (=> b!282533 (=> (not res!145599) (not e!179351))))

(assert (=> b!282533 (= res!145599 (validKeyInArray!0 (select (arr!6688 a!3325) startIndex!26)))))

(assert (= (and start!27274 res!145595) b!282529))

(assert (= (and b!282529 res!145601) b!282528))

(assert (= (and b!282528 res!145600) b!282530))

(assert (= (and b!282530 res!145594) b!282526))

(assert (= (and b!282526 res!145597) b!282531))

(assert (= (and b!282531 res!145596) b!282532))

(assert (= (and b!282532 res!145598) b!282527))

(assert (= (and b!282527 res!145602) b!282533))

(assert (= (and b!282533 res!145599) b!282525))

(declare-fun m!297123 () Bool)

(assert (=> b!282527 m!297123))

(declare-fun m!297125 () Bool)

(assert (=> b!282526 m!297125))

(declare-fun m!297127 () Bool)

(assert (=> b!282531 m!297127))

(declare-fun m!297129 () Bool)

(assert (=> b!282533 m!297129))

(assert (=> b!282533 m!297129))

(declare-fun m!297131 () Bool)

(assert (=> b!282533 m!297131))

(declare-fun m!297133 () Bool)

(assert (=> b!282528 m!297133))

(declare-fun m!297135 () Bool)

(assert (=> b!282525 m!297135))

(declare-fun m!297137 () Bool)

(assert (=> b!282525 m!297137))

(declare-fun m!297139 () Bool)

(assert (=> b!282525 m!297139))

(declare-fun m!297141 () Bool)

(assert (=> b!282525 m!297141))

(assert (=> b!282525 m!297137))

(assert (=> b!282525 m!297123))

(declare-fun m!297143 () Bool)

(assert (=> b!282525 m!297143))

(assert (=> b!282525 m!297129))

(declare-fun m!297145 () Bool)

(assert (=> b!282525 m!297145))

(declare-fun m!297147 () Bool)

(assert (=> b!282525 m!297147))

(assert (=> b!282525 m!297129))

(declare-fun m!297149 () Bool)

(assert (=> b!282525 m!297149))

(declare-fun m!297151 () Bool)

(assert (=> b!282530 m!297151))

(declare-fun m!297153 () Bool)

(assert (=> b!282532 m!297153))

(declare-fun m!297155 () Bool)

(assert (=> start!27274 m!297155))

(declare-fun m!297157 () Bool)

(assert (=> start!27274 m!297157))

(push 1)

