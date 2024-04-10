; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27238 () Bool)

(assert start!27238)

(declare-fun b!282039 () Bool)

(declare-fun res!145108 () Bool)

(declare-fun e!179136 () Bool)

(assert (=> b!282039 (=> (not res!145108) (not e!179136))))

(declare-datatypes ((array!14056 0))(
  ( (array!14057 (arr!6670 (Array (_ BitVec 32) (_ BitVec 64))) (size!7022 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14056)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282039 (= res!145108 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282040 () Bool)

(declare-fun res!145116 () Bool)

(declare-fun e!179138 () Bool)

(assert (=> b!282040 (=> (not res!145116) (not e!179138))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14056 (_ BitVec 32)) Bool)

(assert (=> b!282040 (= res!145116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282041 () Bool)

(declare-fun e!179135 () Bool)

(assert (=> b!282041 (= e!179135 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282041 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8940 0))(
  ( (Unit!8941) )
))
(declare-fun lt!139327 () Unit!8940)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8940)

(assert (=> b!282041 (= lt!139327 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139324 () array!14056)

(declare-datatypes ((SeekEntryResult!1828 0))(
  ( (MissingZero!1828 (index!9482 (_ BitVec 32))) (Found!1828 (index!9483 (_ BitVec 32))) (Intermediate!1828 (undefined!2640 Bool) (index!9484 (_ BitVec 32)) (x!27698 (_ BitVec 32))) (Undefined!1828) (MissingVacant!1828 (index!9485 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14056 (_ BitVec 32)) SeekEntryResult!1828)

(assert (=> b!282041 (= (seekEntryOrOpen!0 (select (arr!6670 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6670 a!3325) i!1267 k!2581) startIndex!26) lt!139324 mask!3868))))

(declare-fun lt!139326 () Unit!8940)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14056 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8940)

(assert (=> b!282041 (= lt!139326 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4478 0))(
  ( (Nil!4475) (Cons!4474 (h!5144 (_ BitVec 64)) (t!9560 List!4478)) )
))
(declare-fun arrayNoDuplicates!0 (array!14056 (_ BitVec 32) List!4478) Bool)

(assert (=> b!282041 (arrayNoDuplicates!0 lt!139324 #b00000000000000000000000000000000 Nil!4475)))

(declare-fun lt!139323 () Unit!8940)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14056 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4478) Unit!8940)

(assert (=> b!282041 (= lt!139323 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4475))))

(declare-fun b!282042 () Bool)

(declare-fun res!145110 () Bool)

(assert (=> b!282042 (=> (not res!145110) (not e!179136))))

(assert (=> b!282042 (= res!145110 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4475))))

(declare-fun res!145115 () Bool)

(assert (=> start!27238 (=> (not res!145115) (not e!179136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27238 (= res!145115 (validMask!0 mask!3868))))

(assert (=> start!27238 e!179136))

(declare-fun array_inv!4633 (array!14056) Bool)

(assert (=> start!27238 (array_inv!4633 a!3325)))

(assert (=> start!27238 true))

(declare-fun b!282043 () Bool)

(assert (=> b!282043 (= e!179138 e!179135)))

(declare-fun res!145114 () Bool)

(assert (=> b!282043 (=> (not res!145114) (not e!179135))))

(assert (=> b!282043 (= res!145114 (not (= startIndex!26 i!1267)))))

(assert (=> b!282043 (= lt!139324 (array!14057 (store (arr!6670 a!3325) i!1267 k!2581) (size!7022 a!3325)))))

(declare-fun b!282044 () Bool)

(declare-fun res!145109 () Bool)

(assert (=> b!282044 (=> (not res!145109) (not e!179136))))

(assert (=> b!282044 (= res!145109 (and (= (size!7022 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7022 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7022 a!3325))))))

(declare-fun b!282045 () Bool)

(declare-fun res!145111 () Bool)

(assert (=> b!282045 (=> (not res!145111) (not e!179135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282045 (= res!145111 (validKeyInArray!0 (select (arr!6670 a!3325) startIndex!26)))))

(declare-fun b!282046 () Bool)

(assert (=> b!282046 (= e!179136 e!179138)))

(declare-fun res!145113 () Bool)

(assert (=> b!282046 (=> (not res!145113) (not e!179138))))

(declare-fun lt!139325 () SeekEntryResult!1828)

(assert (=> b!282046 (= res!145113 (or (= lt!139325 (MissingZero!1828 i!1267)) (= lt!139325 (MissingVacant!1828 i!1267))))))

(assert (=> b!282046 (= lt!139325 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282047 () Bool)

(declare-fun res!145112 () Bool)

(assert (=> b!282047 (=> (not res!145112) (not e!179136))))

(assert (=> b!282047 (= res!145112 (validKeyInArray!0 k!2581))))

(assert (= (and start!27238 res!145115) b!282044))

(assert (= (and b!282044 res!145109) b!282047))

(assert (= (and b!282047 res!145112) b!282042))

(assert (= (and b!282042 res!145110) b!282039))

(assert (= (and b!282039 res!145108) b!282046))

(assert (= (and b!282046 res!145113) b!282040))

(assert (= (and b!282040 res!145116) b!282043))

(assert (= (and b!282043 res!145114) b!282045))

(assert (= (and b!282045 res!145111) b!282041))

(declare-fun m!296475 () Bool)

(assert (=> b!282045 m!296475))

(assert (=> b!282045 m!296475))

(declare-fun m!296477 () Bool)

(assert (=> b!282045 m!296477))

(declare-fun m!296479 () Bool)

(assert (=> b!282043 m!296479))

(declare-fun m!296481 () Bool)

(assert (=> b!282042 m!296481))

(declare-fun m!296483 () Bool)

(assert (=> b!282040 m!296483))

(declare-fun m!296485 () Bool)

(assert (=> b!282047 m!296485))

(declare-fun m!296487 () Bool)

(assert (=> b!282041 m!296487))

(declare-fun m!296489 () Bool)

(assert (=> b!282041 m!296489))

(assert (=> b!282041 m!296479))

(assert (=> b!282041 m!296475))

(declare-fun m!296491 () Bool)

(assert (=> b!282041 m!296491))

(declare-fun m!296493 () Bool)

(assert (=> b!282041 m!296493))

(assert (=> b!282041 m!296475))

(declare-fun m!296495 () Bool)

(assert (=> b!282041 m!296495))

(assert (=> b!282041 m!296489))

(declare-fun m!296497 () Bool)

(assert (=> b!282041 m!296497))

(declare-fun m!296499 () Bool)

(assert (=> b!282041 m!296499))

(declare-fun m!296501 () Bool)

(assert (=> b!282041 m!296501))

(declare-fun m!296503 () Bool)

(assert (=> b!282039 m!296503))

(declare-fun m!296505 () Bool)

(assert (=> start!27238 m!296505))

(declare-fun m!296507 () Bool)

(assert (=> start!27238 m!296507))

(declare-fun m!296509 () Bool)

(assert (=> b!282046 m!296509))

(push 1)

