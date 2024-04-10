; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27232 () Bool)

(assert start!27232)

(declare-fun b!281958 () Bool)

(declare-fun e!179102 () Bool)

(assert (=> b!281958 (= e!179102 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-datatypes ((array!14050 0))(
  ( (array!14051 (arr!6667 (Array (_ BitVec 32) (_ BitVec 64))) (size!7019 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14050)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14050 (_ BitVec 32)) Bool)

(assert (=> b!281958 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8934 0))(
  ( (Unit!8935) )
))
(declare-fun lt!139279 () Unit!8934)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8934)

(assert (=> b!281958 (= lt!139279 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun lt!139278 () array!14050)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1825 0))(
  ( (MissingZero!1825 (index!9470 (_ BitVec 32))) (Found!1825 (index!9471 (_ BitVec 32))) (Intermediate!1825 (undefined!2637 Bool) (index!9472 (_ BitVec 32)) (x!27687 (_ BitVec 32))) (Undefined!1825) (MissingVacant!1825 (index!9473 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14050 (_ BitVec 32)) SeekEntryResult!1825)

(assert (=> b!281958 (= (seekEntryOrOpen!0 (select (arr!6667 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6667 a!3325) i!1267 k!2581) startIndex!26) lt!139278 mask!3868))))

(declare-fun lt!139280 () Unit!8934)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14050 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8934)

(assert (=> b!281958 (= lt!139280 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4475 0))(
  ( (Nil!4472) (Cons!4471 (h!5141 (_ BitVec 64)) (t!9557 List!4475)) )
))
(declare-fun arrayNoDuplicates!0 (array!14050 (_ BitVec 32) List!4475) Bool)

(assert (=> b!281958 (arrayNoDuplicates!0 lt!139278 #b00000000000000000000000000000000 Nil!4472)))

(declare-fun lt!139281 () Unit!8934)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14050 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4475) Unit!8934)

(assert (=> b!281958 (= lt!139281 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4472))))

(declare-fun b!281959 () Bool)

(declare-fun res!145030 () Bool)

(declare-fun e!179100 () Bool)

(assert (=> b!281959 (=> (not res!145030) (not e!179100))))

(assert (=> b!281959 (= res!145030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!145028 () Bool)

(declare-fun e!179101 () Bool)

(assert (=> start!27232 (=> (not res!145028) (not e!179101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27232 (= res!145028 (validMask!0 mask!3868))))

(assert (=> start!27232 e!179101))

(declare-fun array_inv!4630 (array!14050) Bool)

(assert (=> start!27232 (array_inv!4630 a!3325)))

(assert (=> start!27232 true))

(declare-fun b!281960 () Bool)

(declare-fun res!145035 () Bool)

(assert (=> b!281960 (=> (not res!145035) (not e!179102))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281960 (= res!145035 (validKeyInArray!0 (select (arr!6667 a!3325) startIndex!26)))))

(declare-fun b!281961 () Bool)

(declare-fun res!145032 () Bool)

(assert (=> b!281961 (=> (not res!145032) (not e!179101))))

(declare-fun arrayContainsKey!0 (array!14050 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281961 (= res!145032 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281962 () Bool)

(declare-fun res!145033 () Bool)

(assert (=> b!281962 (=> (not res!145033) (not e!179101))))

(assert (=> b!281962 (= res!145033 (validKeyInArray!0 k!2581))))

(declare-fun b!281963 () Bool)

(declare-fun res!145031 () Bool)

(assert (=> b!281963 (=> (not res!145031) (not e!179101))))

(assert (=> b!281963 (= res!145031 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4472))))

(declare-fun b!281964 () Bool)

(assert (=> b!281964 (= e!179101 e!179100)))

(declare-fun res!145034 () Bool)

(assert (=> b!281964 (=> (not res!145034) (not e!179100))))

(declare-fun lt!139282 () SeekEntryResult!1825)

(assert (=> b!281964 (= res!145034 (or (= lt!139282 (MissingZero!1825 i!1267)) (= lt!139282 (MissingVacant!1825 i!1267))))))

(assert (=> b!281964 (= lt!139282 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281965 () Bool)

(assert (=> b!281965 (= e!179100 e!179102)))

(declare-fun res!145029 () Bool)

(assert (=> b!281965 (=> (not res!145029) (not e!179102))))

(assert (=> b!281965 (= res!145029 (not (= startIndex!26 i!1267)))))

(assert (=> b!281965 (= lt!139278 (array!14051 (store (arr!6667 a!3325) i!1267 k!2581) (size!7019 a!3325)))))

(declare-fun b!281966 () Bool)

(declare-fun res!145027 () Bool)

(assert (=> b!281966 (=> (not res!145027) (not e!179101))))

(assert (=> b!281966 (= res!145027 (and (= (size!7019 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7019 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7019 a!3325))))))

(assert (= (and start!27232 res!145028) b!281966))

(assert (= (and b!281966 res!145027) b!281962))

(assert (= (and b!281962 res!145033) b!281963))

(assert (= (and b!281963 res!145031) b!281961))

(assert (= (and b!281961 res!145032) b!281964))

(assert (= (and b!281964 res!145034) b!281959))

(assert (= (and b!281959 res!145030) b!281965))

(assert (= (and b!281965 res!145029) b!281960))

(assert (= (and b!281960 res!145035) b!281958))

(declare-fun m!296367 () Bool)

(assert (=> b!281960 m!296367))

(assert (=> b!281960 m!296367))

(declare-fun m!296369 () Bool)

(assert (=> b!281960 m!296369))

(declare-fun m!296371 () Bool)

(assert (=> b!281963 m!296371))

(declare-fun m!296373 () Bool)

(assert (=> b!281965 m!296373))

(declare-fun m!296375 () Bool)

(assert (=> b!281958 m!296375))

(declare-fun m!296377 () Bool)

(assert (=> b!281958 m!296377))

(declare-fun m!296379 () Bool)

(assert (=> b!281958 m!296379))

(assert (=> b!281958 m!296367))

(declare-fun m!296381 () Bool)

(assert (=> b!281958 m!296381))

(assert (=> b!281958 m!296377))

(declare-fun m!296383 () Bool)

(assert (=> b!281958 m!296383))

(declare-fun m!296385 () Bool)

(assert (=> b!281958 m!296385))

(assert (=> b!281958 m!296367))

(declare-fun m!296387 () Bool)

(assert (=> b!281958 m!296387))

(assert (=> b!281958 m!296373))

(declare-fun m!296389 () Bool)

(assert (=> b!281958 m!296389))

(declare-fun m!296391 () Bool)

(assert (=> b!281964 m!296391))

(declare-fun m!296393 () Bool)

(assert (=> start!27232 m!296393))

(declare-fun m!296395 () Bool)

(assert (=> start!27232 m!296395))

(declare-fun m!296397 () Bool)

(assert (=> b!281961 m!296397))

(declare-fun m!296399 () Bool)

(assert (=> b!281962 m!296399))

(declare-fun m!296401 () Bool)

(assert (=> b!281959 m!296401))

(push 1)

(assert (not b!281958))

