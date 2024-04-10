; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27258 () Bool)

(assert start!27258)

(declare-fun b!282309 () Bool)

(declare-fun res!145383 () Bool)

(declare-fun e!179256 () Bool)

(assert (=> b!282309 (=> (not res!145383) (not e!179256))))

(declare-datatypes ((array!14076 0))(
  ( (array!14077 (arr!6680 (Array (_ BitVec 32) (_ BitVec 64))) (size!7032 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14076)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282309 (= res!145383 (validKeyInArray!0 (select (arr!6680 a!3325) startIndex!26)))))

(declare-fun b!282310 () Bool)

(declare-fun res!145379 () Bool)

(declare-fun e!179258 () Bool)

(assert (=> b!282310 (=> (not res!145379) (not e!179258))))

(declare-fun k!2581 () (_ BitVec 64))

(assert (=> b!282310 (= res!145379 (validKeyInArray!0 k!2581))))

(declare-fun res!145382 () Bool)

(assert (=> start!27258 (=> (not res!145382) (not e!179258))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27258 (= res!145382 (validMask!0 mask!3868))))

(assert (=> start!27258 e!179258))

(declare-fun array_inv!4643 (array!14076) Bool)

(assert (=> start!27258 (array_inv!4643 a!3325)))

(assert (=> start!27258 true))

(declare-fun b!282311 () Bool)

(declare-fun res!145378 () Bool)

(assert (=> b!282311 (=> (not res!145378) (not e!179258))))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282311 (= res!145378 (and (= (size!7032 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7032 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7032 a!3325))))))

(declare-fun b!282312 () Bool)

(declare-fun res!145380 () Bool)

(assert (=> b!282312 (=> (not res!145380) (not e!179258))))

(declare-datatypes ((List!4488 0))(
  ( (Nil!4485) (Cons!4484 (h!5154 (_ BitVec 64)) (t!9570 List!4488)) )
))
(declare-fun arrayNoDuplicates!0 (array!14076 (_ BitVec 32) List!4488) Bool)

(assert (=> b!282312 (= res!145380 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4485))))

(declare-fun b!282313 () Bool)

(declare-fun e!179255 () Bool)

(assert (=> b!282313 (= e!179255 e!179256)))

(declare-fun res!145384 () Bool)

(assert (=> b!282313 (=> (not res!145384) (not e!179256))))

(assert (=> b!282313 (= res!145384 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139475 () array!14076)

(assert (=> b!282313 (= lt!139475 (array!14077 (store (arr!6680 a!3325) i!1267 k!2581) (size!7032 a!3325)))))

(declare-fun b!282314 () Bool)

(assert (=> b!282314 (= e!179258 e!179255)))

(declare-fun res!145381 () Bool)

(assert (=> b!282314 (=> (not res!145381) (not e!179255))))

(declare-datatypes ((SeekEntryResult!1838 0))(
  ( (MissingZero!1838 (index!9522 (_ BitVec 32))) (Found!1838 (index!9523 (_ BitVec 32))) (Intermediate!1838 (undefined!2650 Bool) (index!9524 (_ BitVec 32)) (x!27740 (_ BitVec 32))) (Undefined!1838) (MissingVacant!1838 (index!9525 (_ BitVec 32))) )
))
(declare-fun lt!139473 () SeekEntryResult!1838)

(assert (=> b!282314 (= res!145381 (or (= lt!139473 (MissingZero!1838 i!1267)) (= lt!139473 (MissingVacant!1838 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14076 (_ BitVec 32)) SeekEntryResult!1838)

(assert (=> b!282314 (= lt!139473 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282315 () Bool)

(assert (=> b!282315 (= e!179256 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14076 (_ BitVec 32)) Bool)

(assert (=> b!282315 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8960 0))(
  ( (Unit!8961) )
))
(declare-fun lt!139474 () Unit!8960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14076 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8960)

(assert (=> b!282315 (= lt!139474 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282315 (= (seekEntryOrOpen!0 (select (arr!6680 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6680 a!3325) i!1267 k!2581) startIndex!26) lt!139475 mask!3868))))

(declare-fun lt!139476 () Unit!8960)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14076 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8960)

(assert (=> b!282315 (= lt!139476 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282315 (arrayNoDuplicates!0 lt!139475 #b00000000000000000000000000000000 Nil!4485)))

(declare-fun lt!139477 () Unit!8960)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14076 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4488) Unit!8960)

(assert (=> b!282315 (= lt!139477 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4485))))

(declare-fun b!282316 () Bool)

(declare-fun res!145385 () Bool)

(assert (=> b!282316 (=> (not res!145385) (not e!179255))))

(assert (=> b!282316 (= res!145385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282317 () Bool)

(declare-fun res!145386 () Bool)

(assert (=> b!282317 (=> (not res!145386) (not e!179258))))

(declare-fun arrayContainsKey!0 (array!14076 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282317 (= res!145386 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27258 res!145382) b!282311))

(assert (= (and b!282311 res!145378) b!282310))

(assert (= (and b!282310 res!145379) b!282312))

(assert (= (and b!282312 res!145380) b!282317))

(assert (= (and b!282317 res!145386) b!282314))

(assert (= (and b!282314 res!145381) b!282316))

(assert (= (and b!282316 res!145385) b!282313))

(assert (= (and b!282313 res!145384) b!282309))

(assert (= (and b!282309 res!145383) b!282315))

(declare-fun m!296835 () Bool)

(assert (=> b!282312 m!296835))

(declare-fun m!296837 () Bool)

(assert (=> b!282310 m!296837))

(declare-fun m!296839 () Bool)

(assert (=> start!27258 m!296839))

(declare-fun m!296841 () Bool)

(assert (=> start!27258 m!296841))

(declare-fun m!296843 () Bool)

(assert (=> b!282314 m!296843))

(declare-fun m!296845 () Bool)

(assert (=> b!282317 m!296845))

(declare-fun m!296847 () Bool)

(assert (=> b!282309 m!296847))

(assert (=> b!282309 m!296847))

(declare-fun m!296849 () Bool)

(assert (=> b!282309 m!296849))

(declare-fun m!296851 () Bool)

(assert (=> b!282313 m!296851))

(declare-fun m!296853 () Bool)

(assert (=> b!282315 m!296853))

(declare-fun m!296855 () Bool)

(assert (=> b!282315 m!296855))

(assert (=> b!282315 m!296851))

(declare-fun m!296857 () Bool)

(assert (=> b!282315 m!296857))

(assert (=> b!282315 m!296847))

(declare-fun m!296859 () Bool)

(assert (=> b!282315 m!296859))

(declare-fun m!296861 () Bool)

(assert (=> b!282315 m!296861))

(assert (=> b!282315 m!296847))

(declare-fun m!296863 () Bool)

(assert (=> b!282315 m!296863))

(declare-fun m!296865 () Bool)

(assert (=> b!282315 m!296865))

(assert (=> b!282315 m!296855))

(declare-fun m!296867 () Bool)

(assert (=> b!282315 m!296867))

(declare-fun m!296869 () Bool)

(assert (=> b!282316 m!296869))

(push 1)

