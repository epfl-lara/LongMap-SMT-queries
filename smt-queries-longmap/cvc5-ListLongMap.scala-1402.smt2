; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27264 () Bool)

(assert start!27264)

(declare-fun res!145464 () Bool)

(declare-fun e!179293 () Bool)

(assert (=> start!27264 (=> (not res!145464) (not e!179293))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27264 (= res!145464 (validMask!0 mask!3868))))

(assert (=> start!27264 e!179293))

(declare-datatypes ((array!14082 0))(
  ( (array!14083 (arr!6683 (Array (_ BitVec 32) (_ BitVec 64))) (size!7035 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14082)

(declare-fun array_inv!4646 (array!14082) Bool)

(assert (=> start!27264 (array_inv!4646 a!3325)))

(assert (=> start!27264 true))

(declare-fun b!282390 () Bool)

(declare-fun res!145460 () Bool)

(assert (=> b!282390 (=> (not res!145460) (not e!179293))))

(declare-datatypes ((List!4491 0))(
  ( (Nil!4488) (Cons!4487 (h!5157 (_ BitVec 64)) (t!9573 List!4491)) )
))
(declare-fun arrayNoDuplicates!0 (array!14082 (_ BitVec 32) List!4491) Bool)

(assert (=> b!282390 (= res!145460 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4488))))

(declare-fun b!282391 () Bool)

(declare-fun res!145462 () Bool)

(declare-fun e!179292 () Bool)

(assert (=> b!282391 (=> (not res!145462) (not e!179292))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282391 (= res!145462 (validKeyInArray!0 (select (arr!6683 a!3325) startIndex!26)))))

(declare-fun b!282392 () Bool)

(declare-fun e!179294 () Bool)

(assert (=> b!282392 (= e!179293 e!179294)))

(declare-fun res!145461 () Bool)

(assert (=> b!282392 (=> (not res!145461) (not e!179294))))

(declare-datatypes ((SeekEntryResult!1841 0))(
  ( (MissingZero!1841 (index!9534 (_ BitVec 32))) (Found!1841 (index!9535 (_ BitVec 32))) (Intermediate!1841 (undefined!2653 Bool) (index!9536 (_ BitVec 32)) (x!27751 (_ BitVec 32))) (Undefined!1841) (MissingVacant!1841 (index!9537 (_ BitVec 32))) )
))
(declare-fun lt!139522 () SeekEntryResult!1841)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282392 (= res!145461 (or (= lt!139522 (MissingZero!1841 i!1267)) (= lt!139522 (MissingVacant!1841 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14082 (_ BitVec 32)) SeekEntryResult!1841)

(assert (=> b!282392 (= lt!139522 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282393 () Bool)

(assert (=> b!282393 (= e!179292 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14082 (_ BitVec 32)) Bool)

(assert (=> b!282393 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8966 0))(
  ( (Unit!8967) )
))
(declare-fun lt!139520 () Unit!8966)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8966)

(assert (=> b!282393 (= lt!139520 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139519 () array!14082)

(assert (=> b!282393 (= (seekEntryOrOpen!0 (select (arr!6683 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6683 a!3325) i!1267 k!2581) startIndex!26) lt!139519 mask!3868))))

(declare-fun lt!139521 () Unit!8966)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14082 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8966)

(assert (=> b!282393 (= lt!139521 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282393 (arrayNoDuplicates!0 lt!139519 #b00000000000000000000000000000000 Nil!4488)))

(declare-fun lt!139518 () Unit!8966)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14082 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4491) Unit!8966)

(assert (=> b!282393 (= lt!139518 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4488))))

(declare-fun b!282394 () Bool)

(declare-fun res!145463 () Bool)

(assert (=> b!282394 (=> (not res!145463) (not e!179294))))

(assert (=> b!282394 (= res!145463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282395 () Bool)

(declare-fun res!145466 () Bool)

(assert (=> b!282395 (=> (not res!145466) (not e!179293))))

(assert (=> b!282395 (= res!145466 (and (= (size!7035 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7035 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7035 a!3325))))))

(declare-fun b!282396 () Bool)

(declare-fun res!145459 () Bool)

(assert (=> b!282396 (=> (not res!145459) (not e!179293))))

(assert (=> b!282396 (= res!145459 (validKeyInArray!0 k!2581))))

(declare-fun b!282397 () Bool)

(declare-fun res!145465 () Bool)

(assert (=> b!282397 (=> (not res!145465) (not e!179293))))

(declare-fun arrayContainsKey!0 (array!14082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282397 (= res!145465 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282398 () Bool)

(assert (=> b!282398 (= e!179294 e!179292)))

(declare-fun res!145467 () Bool)

(assert (=> b!282398 (=> (not res!145467) (not e!179292))))

(assert (=> b!282398 (= res!145467 (not (= startIndex!26 i!1267)))))

(assert (=> b!282398 (= lt!139519 (array!14083 (store (arr!6683 a!3325) i!1267 k!2581) (size!7035 a!3325)))))

(assert (= (and start!27264 res!145464) b!282395))

(assert (= (and b!282395 res!145466) b!282396))

(assert (= (and b!282396 res!145459) b!282390))

(assert (= (and b!282390 res!145460) b!282397))

(assert (= (and b!282397 res!145465) b!282392))

(assert (= (and b!282392 res!145461) b!282394))

(assert (= (and b!282394 res!145463) b!282398))

(assert (= (and b!282398 res!145467) b!282391))

(assert (= (and b!282391 res!145462) b!282393))

(declare-fun m!296943 () Bool)

(assert (=> b!282396 m!296943))

(declare-fun m!296945 () Bool)

(assert (=> start!27264 m!296945))

(declare-fun m!296947 () Bool)

(assert (=> start!27264 m!296947))

(declare-fun m!296949 () Bool)

(assert (=> b!282394 m!296949))

(declare-fun m!296951 () Bool)

(assert (=> b!282392 m!296951))

(declare-fun m!296953 () Bool)

(assert (=> b!282398 m!296953))

(declare-fun m!296955 () Bool)

(assert (=> b!282390 m!296955))

(declare-fun m!296957 () Bool)

(assert (=> b!282397 m!296957))

(declare-fun m!296959 () Bool)

(assert (=> b!282393 m!296959))

(declare-fun m!296961 () Bool)

(assert (=> b!282393 m!296961))

(declare-fun m!296963 () Bool)

(assert (=> b!282393 m!296963))

(assert (=> b!282393 m!296953))

(declare-fun m!296965 () Bool)

(assert (=> b!282393 m!296965))

(assert (=> b!282393 m!296961))

(declare-fun m!296967 () Bool)

(assert (=> b!282393 m!296967))

(declare-fun m!296969 () Bool)

(assert (=> b!282393 m!296969))

(declare-fun m!296971 () Bool)

(assert (=> b!282393 m!296971))

(declare-fun m!296973 () Bool)

(assert (=> b!282393 m!296973))

(assert (=> b!282393 m!296969))

(declare-fun m!296975 () Bool)

(assert (=> b!282393 m!296975))

(assert (=> b!282391 m!296969))

(assert (=> b!282391 m!296969))

(declare-fun m!296977 () Bool)

(assert (=> b!282391 m!296977))

(push 1)

