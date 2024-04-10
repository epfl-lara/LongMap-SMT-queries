; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27240 () Bool)

(assert start!27240)

(declare-fun b!282066 () Bool)

(declare-fun e!179148 () Bool)

(declare-fun e!179147 () Bool)

(assert (=> b!282066 (= e!179148 e!179147)))

(declare-fun res!145137 () Bool)

(assert (=> b!282066 (=> (not res!145137) (not e!179147))))

(declare-datatypes ((SeekEntryResult!1829 0))(
  ( (MissingZero!1829 (index!9486 (_ BitVec 32))) (Found!1829 (index!9487 (_ BitVec 32))) (Intermediate!1829 (undefined!2641 Bool) (index!9488 (_ BitVec 32)) (x!27707 (_ BitVec 32))) (Undefined!1829) (MissingVacant!1829 (index!9489 (_ BitVec 32))) )
))
(declare-fun lt!139341 () SeekEntryResult!1829)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282066 (= res!145137 (or (= lt!139341 (MissingZero!1829 i!1267)) (= lt!139341 (MissingVacant!1829 i!1267))))))

(declare-datatypes ((array!14058 0))(
  ( (array!14059 (arr!6671 (Array (_ BitVec 32) (_ BitVec 64))) (size!7023 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14058)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14058 (_ BitVec 32)) SeekEntryResult!1829)

(assert (=> b!282066 (= lt!139341 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282067 () Bool)

(declare-fun e!179149 () Bool)

(assert (=> b!282067 (= e!179149 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14058 (_ BitVec 32)) Bool)

(assert (=> b!282067 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8942 0))(
  ( (Unit!8943) )
))
(declare-fun lt!139339 () Unit!8942)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8942)

(assert (=> b!282067 (= lt!139339 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139340 () array!14058)

(assert (=> b!282067 (= (seekEntryOrOpen!0 (select (arr!6671 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6671 a!3325) i!1267 k!2581) startIndex!26) lt!139340 mask!3868))))

(declare-fun lt!139342 () Unit!8942)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14058 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8942)

(assert (=> b!282067 (= lt!139342 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4479 0))(
  ( (Nil!4476) (Cons!4475 (h!5145 (_ BitVec 64)) (t!9561 List!4479)) )
))
(declare-fun arrayNoDuplicates!0 (array!14058 (_ BitVec 32) List!4479) Bool)

(assert (=> b!282067 (arrayNoDuplicates!0 lt!139340 #b00000000000000000000000000000000 Nil!4476)))

(declare-fun lt!139338 () Unit!8942)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14058 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4479) Unit!8942)

(assert (=> b!282067 (= lt!139338 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4476))))

(declare-fun b!282068 () Bool)

(declare-fun res!145140 () Bool)

(assert (=> b!282068 (=> (not res!145140) (not e!179148))))

(declare-fun arrayContainsKey!0 (array!14058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282068 (= res!145140 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282069 () Bool)

(declare-fun res!145136 () Bool)

(assert (=> b!282069 (=> (not res!145136) (not e!179148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282069 (= res!145136 (validKeyInArray!0 k!2581))))

(declare-fun b!282070 () Bool)

(declare-fun res!145138 () Bool)

(assert (=> b!282070 (=> (not res!145138) (not e!179148))))

(assert (=> b!282070 (= res!145138 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4476))))

(declare-fun b!282071 () Bool)

(assert (=> b!282071 (= e!179147 e!179149)))

(declare-fun res!145139 () Bool)

(assert (=> b!282071 (=> (not res!145139) (not e!179149))))

(assert (=> b!282071 (= res!145139 (not (= startIndex!26 i!1267)))))

(assert (=> b!282071 (= lt!139340 (array!14059 (store (arr!6671 a!3325) i!1267 k!2581) (size!7023 a!3325)))))

(declare-fun b!282072 () Bool)

(declare-fun res!145142 () Bool)

(assert (=> b!282072 (=> (not res!145142) (not e!179147))))

(assert (=> b!282072 (= res!145142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282073 () Bool)

(declare-fun res!145141 () Bool)

(assert (=> b!282073 (=> (not res!145141) (not e!179148))))

(assert (=> b!282073 (= res!145141 (and (= (size!7023 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7023 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7023 a!3325))))))

(declare-fun b!282074 () Bool)

(declare-fun res!145135 () Bool)

(assert (=> b!282074 (=> (not res!145135) (not e!179149))))

(assert (=> b!282074 (= res!145135 (validKeyInArray!0 (select (arr!6671 a!3325) startIndex!26)))))

(declare-fun res!145143 () Bool)

(assert (=> start!27240 (=> (not res!145143) (not e!179148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27240 (= res!145143 (validMask!0 mask!3868))))

(assert (=> start!27240 e!179148))

(declare-fun array_inv!4634 (array!14058) Bool)

(assert (=> start!27240 (array_inv!4634 a!3325)))

(assert (=> start!27240 true))

(assert (= (and start!27240 res!145143) b!282073))

(assert (= (and b!282073 res!145141) b!282069))

(assert (= (and b!282069 res!145136) b!282070))

(assert (= (and b!282070 res!145138) b!282068))

(assert (= (and b!282068 res!145140) b!282066))

(assert (= (and b!282066 res!145137) b!282072))

(assert (= (and b!282072 res!145142) b!282071))

(assert (= (and b!282071 res!145139) b!282074))

(assert (= (and b!282074 res!145135) b!282067))

(declare-fun m!296511 () Bool)

(assert (=> b!282070 m!296511))

(declare-fun m!296513 () Bool)

(assert (=> b!282069 m!296513))

(declare-fun m!296515 () Bool)

(assert (=> b!282072 m!296515))

(declare-fun m!296517 () Bool)

(assert (=> b!282066 m!296517))

(declare-fun m!296519 () Bool)

(assert (=> start!27240 m!296519))

(declare-fun m!296521 () Bool)

(assert (=> start!27240 m!296521))

(declare-fun m!296523 () Bool)

(assert (=> b!282068 m!296523))

(declare-fun m!296525 () Bool)

(assert (=> b!282074 m!296525))

(assert (=> b!282074 m!296525))

(declare-fun m!296527 () Bool)

(assert (=> b!282074 m!296527))

(declare-fun m!296529 () Bool)

(assert (=> b!282071 m!296529))

(declare-fun m!296531 () Bool)

(assert (=> b!282067 m!296531))

(declare-fun m!296533 () Bool)

(assert (=> b!282067 m!296533))

(declare-fun m!296535 () Bool)

(assert (=> b!282067 m!296535))

(assert (=> b!282067 m!296529))

(declare-fun m!296537 () Bool)

(assert (=> b!282067 m!296537))

(assert (=> b!282067 m!296525))

(declare-fun m!296539 () Bool)

(assert (=> b!282067 m!296539))

(declare-fun m!296541 () Bool)

(assert (=> b!282067 m!296541))

(assert (=> b!282067 m!296525))

(declare-fun m!296543 () Bool)

(assert (=> b!282067 m!296543))

(assert (=> b!282067 m!296535))

(declare-fun m!296545 () Bool)

(assert (=> b!282067 m!296545))

(push 1)

