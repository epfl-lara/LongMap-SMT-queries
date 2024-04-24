; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27228 () Bool)

(assert start!27228)

(declare-fun b!281951 () Bool)

(declare-fun res!144996 () Bool)

(declare-fun e!179100 () Bool)

(assert (=> b!281951 (=> (not res!144996) (not e!179100))))

(declare-datatypes ((array!14045 0))(
  ( (array!14046 (arr!6664 (Array (_ BitVec 32) (_ BitVec 64))) (size!7016 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14045)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!281951 (= res!144996 (and (= (size!7016 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7016 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7016 a!3325))))))

(declare-fun res!144994 () Bool)

(assert (=> start!27228 (=> (not res!144994) (not e!179100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27228 (= res!144994 (validMask!0 mask!3868))))

(assert (=> start!27228 e!179100))

(declare-fun array_inv!4614 (array!14045) Bool)

(assert (=> start!27228 (array_inv!4614 a!3325)))

(assert (=> start!27228 true))

(declare-fun b!281952 () Bool)

(declare-fun res!145000 () Bool)

(assert (=> b!281952 (=> (not res!145000) (not e!179100))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281952 (= res!145000 (validKeyInArray!0 k0!2581))))

(declare-fun b!281953 () Bool)

(declare-fun e!179099 () Bool)

(declare-fun e!179102 () Bool)

(assert (=> b!281953 (= e!179099 e!179102)))

(declare-fun res!144998 () Bool)

(assert (=> b!281953 (=> (not res!144998) (not e!179102))))

(assert (=> b!281953 (= res!144998 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139310 () array!14045)

(assert (=> b!281953 (= lt!139310 (array!14046 (store (arr!6664 a!3325) i!1267 k0!2581) (size!7016 a!3325)))))

(declare-fun b!281954 () Bool)

(declare-fun res!145002 () Bool)

(assert (=> b!281954 (=> (not res!145002) (not e!179100))))

(declare-datatypes ((List!4385 0))(
  ( (Nil!4382) (Cons!4381 (h!5051 (_ BitVec 64)) (t!9459 List!4385)) )
))
(declare-fun arrayNoDuplicates!0 (array!14045 (_ BitVec 32) List!4385) Bool)

(assert (=> b!281954 (= res!145002 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4382))))

(declare-fun b!281955 () Bool)

(assert (=> b!281955 (= e!179100 e!179099)))

(declare-fun res!144995 () Bool)

(assert (=> b!281955 (=> (not res!144995) (not e!179099))))

(declare-datatypes ((SeekEntryResult!1787 0))(
  ( (MissingZero!1787 (index!9318 (_ BitVec 32))) (Found!1787 (index!9319 (_ BitVec 32))) (Intermediate!1787 (undefined!2599 Bool) (index!9320 (_ BitVec 32)) (x!27649 (_ BitVec 32))) (Undefined!1787) (MissingVacant!1787 (index!9321 (_ BitVec 32))) )
))
(declare-fun lt!139311 () SeekEntryResult!1787)

(assert (=> b!281955 (= res!144995 (or (= lt!139311 (MissingZero!1787 i!1267)) (= lt!139311 (MissingVacant!1787 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14045 (_ BitVec 32)) SeekEntryResult!1787)

(assert (=> b!281955 (= lt!139311 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!281956 () Bool)

(assert (=> b!281956 (= e!179102 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14045 (_ BitVec 32)) Bool)

(assert (=> b!281956 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8904 0))(
  ( (Unit!8905) )
))
(declare-fun lt!139307 () Unit!8904)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14045 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8904)

(assert (=> b!281956 (= lt!139307 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!281956 (= (seekEntryOrOpen!0 (select (arr!6664 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6664 a!3325) i!1267 k0!2581) startIndex!26) lt!139310 mask!3868))))

(declare-fun lt!139308 () Unit!8904)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14045 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8904)

(assert (=> b!281956 (= lt!139308 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!281956 (arrayNoDuplicates!0 lt!139310 #b00000000000000000000000000000000 Nil!4382)))

(declare-fun lt!139309 () Unit!8904)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14045 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4385) Unit!8904)

(assert (=> b!281956 (= lt!139309 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4382))))

(declare-fun b!281957 () Bool)

(declare-fun res!144999 () Bool)

(assert (=> b!281957 (=> (not res!144999) (not e!179102))))

(assert (=> b!281957 (= res!144999 (validKeyInArray!0 (select (arr!6664 a!3325) startIndex!26)))))

(declare-fun b!281958 () Bool)

(declare-fun res!145001 () Bool)

(assert (=> b!281958 (=> (not res!145001) (not e!179100))))

(declare-fun arrayContainsKey!0 (array!14045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281958 (= res!145001 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281959 () Bool)

(declare-fun res!144997 () Bool)

(assert (=> b!281959 (=> (not res!144997) (not e!179099))))

(assert (=> b!281959 (= res!144997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27228 res!144994) b!281951))

(assert (= (and b!281951 res!144996) b!281952))

(assert (= (and b!281952 res!145000) b!281954))

(assert (= (and b!281954 res!145002) b!281958))

(assert (= (and b!281958 res!145001) b!281955))

(assert (= (and b!281955 res!144995) b!281959))

(assert (= (and b!281959 res!144997) b!281953))

(assert (= (and b!281953 res!144998) b!281957))

(assert (= (and b!281957 res!144999) b!281956))

(declare-fun m!296501 () Bool)

(assert (=> b!281956 m!296501))

(declare-fun m!296503 () Bool)

(assert (=> b!281956 m!296503))

(assert (=> b!281956 m!296503))

(declare-fun m!296505 () Bool)

(assert (=> b!281956 m!296505))

(declare-fun m!296507 () Bool)

(assert (=> b!281956 m!296507))

(declare-fun m!296509 () Bool)

(assert (=> b!281956 m!296509))

(declare-fun m!296511 () Bool)

(assert (=> b!281956 m!296511))

(declare-fun m!296513 () Bool)

(assert (=> b!281956 m!296513))

(declare-fun m!296515 () Bool)

(assert (=> b!281956 m!296515))

(assert (=> b!281956 m!296511))

(declare-fun m!296517 () Bool)

(assert (=> b!281956 m!296517))

(declare-fun m!296519 () Bool)

(assert (=> b!281956 m!296519))

(declare-fun m!296521 () Bool)

(assert (=> b!281954 m!296521))

(assert (=> b!281957 m!296511))

(assert (=> b!281957 m!296511))

(declare-fun m!296523 () Bool)

(assert (=> b!281957 m!296523))

(declare-fun m!296525 () Bool)

(assert (=> b!281955 m!296525))

(declare-fun m!296527 () Bool)

(assert (=> b!281959 m!296527))

(declare-fun m!296529 () Bool)

(assert (=> b!281952 m!296529))

(declare-fun m!296531 () Bool)

(assert (=> b!281958 m!296531))

(assert (=> b!281953 m!296507))

(declare-fun m!296533 () Bool)

(assert (=> start!27228 m!296533))

(declare-fun m!296535 () Bool)

(assert (=> start!27228 m!296535))

(check-sat (not start!27228) (not b!281957) (not b!281952) (not b!281956) (not b!281959) (not b!281954) (not b!281958) (not b!281955))
(check-sat)
