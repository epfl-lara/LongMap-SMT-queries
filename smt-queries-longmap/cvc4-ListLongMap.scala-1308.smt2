; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26410 () Bool)

(assert start!26410)

(declare-fun b!273954 () Bool)

(declare-fun e!175486 () Bool)

(assert (=> b!273954 (= e!175486 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!13507 0))(
  ( (array!13508 (arr!6403 (Array (_ BitVec 32) (_ BitVec 64))) (size!6755 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13507)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13507 (_ BitVec 32)) Bool)

(assert (=> b!273954 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8609 0))(
  ( (Unit!8610) )
))
(declare-fun lt!136668 () Unit!8609)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13507 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!273954 (= lt!136668 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136669 () array!13507)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun k!2581 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1561 0))(
  ( (MissingZero!1561 (index!8414 (_ BitVec 32))) (Found!1561 (index!8415 (_ BitVec 32))) (Intermediate!1561 (undefined!2373 Bool) (index!8416 (_ BitVec 32)) (x!26710 (_ BitVec 32))) (Undefined!1561) (MissingVacant!1561 (index!8417 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13507 (_ BitVec 32)) SeekEntryResult!1561)

(assert (=> b!273954 (= (seekEntryOrOpen!0 (select (arr!6403 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6403 a!3325) i!1267 k!2581) startIndex!26) lt!136669 mask!3868))))

(declare-fun lt!136672 () Unit!8609)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13507 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8609)

(assert (=> b!273954 (= lt!136672 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4211 0))(
  ( (Nil!4208) (Cons!4207 (h!4874 (_ BitVec 64)) (t!9293 List!4211)) )
))
(declare-fun arrayNoDuplicates!0 (array!13507 (_ BitVec 32) List!4211) Bool)

(assert (=> b!273954 (arrayNoDuplicates!0 lt!136669 #b00000000000000000000000000000000 Nil!4208)))

(declare-fun lt!136670 () Unit!8609)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4211) Unit!8609)

(assert (=> b!273954 (= lt!136670 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4208))))

(declare-fun b!273955 () Bool)

(declare-fun res!137944 () Bool)

(declare-fun e!175484 () Bool)

(assert (=> b!273955 (=> (not res!137944) (not e!175484))))

(assert (=> b!273955 (= res!137944 (and (= (size!6755 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6755 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6755 a!3325))))))

(declare-fun b!273956 () Bool)

(declare-fun res!137947 () Bool)

(declare-fun e!175487 () Bool)

(assert (=> b!273956 (=> (not res!137947) (not e!175487))))

(assert (=> b!273956 (= res!137947 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!273957 () Bool)

(declare-fun res!137950 () Bool)

(assert (=> b!273957 (=> (not res!137950) (not e!175486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!273957 (= res!137950 (validKeyInArray!0 (select (arr!6403 a!3325) startIndex!26)))))

(declare-fun b!273958 () Bool)

(assert (=> b!273958 (= e!175487 e!175486)))

(declare-fun res!137945 () Bool)

(assert (=> b!273958 (=> (not res!137945) (not e!175486))))

(assert (=> b!273958 (= res!137945 (not (= startIndex!26 i!1267)))))

(assert (=> b!273958 (= lt!136669 (array!13508 (store (arr!6403 a!3325) i!1267 k!2581) (size!6755 a!3325)))))

(declare-fun res!137946 () Bool)

(assert (=> start!26410 (=> (not res!137946) (not e!175484))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26410 (= res!137946 (validMask!0 mask!3868))))

(assert (=> start!26410 e!175484))

(declare-fun array_inv!4366 (array!13507) Bool)

(assert (=> start!26410 (array_inv!4366 a!3325)))

(assert (=> start!26410 true))

(declare-fun b!273959 () Bool)

(assert (=> b!273959 (= e!175484 e!175487)))

(declare-fun res!137948 () Bool)

(assert (=> b!273959 (=> (not res!137948) (not e!175487))))

(declare-fun lt!136671 () SeekEntryResult!1561)

(assert (=> b!273959 (= res!137948 (or (= lt!136671 (MissingZero!1561 i!1267)) (= lt!136671 (MissingVacant!1561 i!1267))))))

(assert (=> b!273959 (= lt!136671 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!273960 () Bool)

(declare-fun res!137951 () Bool)

(assert (=> b!273960 (=> (not res!137951) (not e!175484))))

(assert (=> b!273960 (= res!137951 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4208))))

(declare-fun b!273961 () Bool)

(declare-fun res!137952 () Bool)

(assert (=> b!273961 (=> (not res!137952) (not e!175484))))

(assert (=> b!273961 (= res!137952 (validKeyInArray!0 k!2581))))

(declare-fun b!273962 () Bool)

(declare-fun res!137949 () Bool)

(assert (=> b!273962 (=> (not res!137949) (not e!175484))))

(declare-fun arrayContainsKey!0 (array!13507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!273962 (= res!137949 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26410 res!137946) b!273955))

(assert (= (and b!273955 res!137944) b!273961))

(assert (= (and b!273961 res!137952) b!273960))

(assert (= (and b!273960 res!137951) b!273962))

(assert (= (and b!273962 res!137949) b!273959))

(assert (= (and b!273959 res!137948) b!273956))

(assert (= (and b!273956 res!137947) b!273958))

(assert (= (and b!273958 res!137945) b!273957))

(assert (= (and b!273957 res!137950) b!273954))

(declare-fun m!289317 () Bool)

(assert (=> b!273954 m!289317))

(declare-fun m!289319 () Bool)

(assert (=> b!273954 m!289319))

(declare-fun m!289321 () Bool)

(assert (=> b!273954 m!289321))

(declare-fun m!289323 () Bool)

(assert (=> b!273954 m!289323))

(declare-fun m!289325 () Bool)

(assert (=> b!273954 m!289325))

(declare-fun m!289327 () Bool)

(assert (=> b!273954 m!289327))

(declare-fun m!289329 () Bool)

(assert (=> b!273954 m!289329))

(declare-fun m!289331 () Bool)

(assert (=> b!273954 m!289331))

(assert (=> b!273954 m!289327))

(declare-fun m!289333 () Bool)

(assert (=> b!273954 m!289333))

(assert (=> b!273954 m!289321))

(declare-fun m!289335 () Bool)

(assert (=> b!273954 m!289335))

(declare-fun m!289337 () Bool)

(assert (=> b!273956 m!289337))

(declare-fun m!289339 () Bool)

(assert (=> b!273962 m!289339))

(declare-fun m!289341 () Bool)

(assert (=> b!273959 m!289341))

(declare-fun m!289343 () Bool)

(assert (=> b!273960 m!289343))

(declare-fun m!289345 () Bool)

(assert (=> b!273961 m!289345))

(declare-fun m!289347 () Bool)

(assert (=> start!26410 m!289347))

(declare-fun m!289349 () Bool)

(assert (=> start!26410 m!289349))

(assert (=> b!273957 m!289327))

(assert (=> b!273957 m!289327))

(declare-fun m!289351 () Bool)

(assert (=> b!273957 m!289351))

(assert (=> b!273958 m!289323))

(push 1)

