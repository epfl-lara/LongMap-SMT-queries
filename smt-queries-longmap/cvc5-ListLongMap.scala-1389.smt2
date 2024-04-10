; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27186 () Bool)

(assert start!27186)

(declare-fun b!281337 () Bool)

(declare-fun res!144406 () Bool)

(declare-fun e!178841 () Bool)

(assert (=> b!281337 (=> (not res!144406) (not e!178841))))

(declare-datatypes ((array!14004 0))(
  ( (array!14005 (arr!6644 (Array (_ BitVec 32) (_ BitVec 64))) (size!6996 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14004)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14004 (_ BitVec 32)) Bool)

(assert (=> b!281337 (= res!144406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!144410 () Bool)

(declare-fun e!178839 () Bool)

(assert (=> start!27186 (=> (not res!144410) (not e!178839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27186 (= res!144410 (validMask!0 mask!3868))))

(assert (=> start!27186 e!178839))

(declare-fun array_inv!4607 (array!14004) Bool)

(assert (=> start!27186 (array_inv!4607 a!3325)))

(assert (=> start!27186 true))

(declare-fun b!281338 () Bool)

(assert (=> b!281338 (= e!178839 e!178841)))

(declare-fun res!144412 () Bool)

(assert (=> b!281338 (=> (not res!144412) (not e!178841))))

(declare-datatypes ((SeekEntryResult!1802 0))(
  ( (MissingZero!1802 (index!9378 (_ BitVec 32))) (Found!1802 (index!9379 (_ BitVec 32))) (Intermediate!1802 (undefined!2614 Bool) (index!9380 (_ BitVec 32)) (x!27608 (_ BitVec 32))) (Undefined!1802) (MissingVacant!1802 (index!9381 (_ BitVec 32))) )
))
(declare-fun lt!139027 () SeekEntryResult!1802)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!281338 (= res!144412 (or (= lt!139027 (MissingZero!1802 i!1267)) (= lt!139027 (MissingVacant!1802 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14004 (_ BitVec 32)) SeekEntryResult!1802)

(assert (=> b!281338 (= lt!139027 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281339 () Bool)

(declare-fun res!144409 () Bool)

(assert (=> b!281339 (=> (not res!144409) (not e!178839))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!281339 (= res!144409 (and (= (size!6996 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6996 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6996 a!3325))))))

(declare-fun b!281340 () Bool)

(assert (=> b!281340 (= e!178841 (not true))))

(declare-datatypes ((List!4452 0))(
  ( (Nil!4449) (Cons!4448 (h!5118 (_ BitVec 64)) (t!9534 List!4452)) )
))
(declare-fun arrayNoDuplicates!0 (array!14004 (_ BitVec 32) List!4452) Bool)

(assert (=> b!281340 (arrayNoDuplicates!0 (array!14005 (store (arr!6644 a!3325) i!1267 k!2581) (size!6996 a!3325)) #b00000000000000000000000000000000 Nil!4449)))

(declare-datatypes ((Unit!8888 0))(
  ( (Unit!8889) )
))
(declare-fun lt!139026 () Unit!8888)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14004 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4452) Unit!8888)

(assert (=> b!281340 (= lt!139026 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4449))))

(declare-fun b!281341 () Bool)

(declare-fun res!144408 () Bool)

(assert (=> b!281341 (=> (not res!144408) (not e!178841))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281341 (= res!144408 (validKeyInArray!0 (select (arr!6644 a!3325) startIndex!26)))))

(declare-fun b!281342 () Bool)

(declare-fun res!144411 () Bool)

(assert (=> b!281342 (=> (not res!144411) (not e!178839))))

(assert (=> b!281342 (= res!144411 (validKeyInArray!0 k!2581))))

(declare-fun b!281343 () Bool)

(declare-fun res!144414 () Bool)

(assert (=> b!281343 (=> (not res!144414) (not e!178839))))

(assert (=> b!281343 (= res!144414 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4449))))

(declare-fun b!281344 () Bool)

(declare-fun res!144413 () Bool)

(assert (=> b!281344 (=> (not res!144413) (not e!178841))))

(assert (=> b!281344 (= res!144413 (not (= startIndex!26 i!1267)))))

(declare-fun b!281345 () Bool)

(declare-fun res!144407 () Bool)

(assert (=> b!281345 (=> (not res!144407) (not e!178839))))

(declare-fun arrayContainsKey!0 (array!14004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281345 (= res!144407 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!27186 res!144410) b!281339))

(assert (= (and b!281339 res!144409) b!281342))

(assert (= (and b!281342 res!144411) b!281343))

(assert (= (and b!281343 res!144414) b!281345))

(assert (= (and b!281345 res!144407) b!281338))

(assert (= (and b!281338 res!144412) b!281337))

(assert (= (and b!281337 res!144406) b!281344))

(assert (= (and b!281344 res!144413) b!281341))

(assert (= (and b!281341 res!144408) b!281340))

(declare-fun m!295671 () Bool)

(assert (=> b!281345 m!295671))

(declare-fun m!295673 () Bool)

(assert (=> start!27186 m!295673))

(declare-fun m!295675 () Bool)

(assert (=> start!27186 m!295675))

(declare-fun m!295677 () Bool)

(assert (=> b!281337 m!295677))

(declare-fun m!295679 () Bool)

(assert (=> b!281343 m!295679))

(declare-fun m!295681 () Bool)

(assert (=> b!281341 m!295681))

(assert (=> b!281341 m!295681))

(declare-fun m!295683 () Bool)

(assert (=> b!281341 m!295683))

(declare-fun m!295685 () Bool)

(assert (=> b!281338 m!295685))

(declare-fun m!295687 () Bool)

(assert (=> b!281340 m!295687))

(declare-fun m!295689 () Bool)

(assert (=> b!281340 m!295689))

(declare-fun m!295691 () Bool)

(assert (=> b!281340 m!295691))

(declare-fun m!295693 () Bool)

(assert (=> b!281342 m!295693))

(push 1)

