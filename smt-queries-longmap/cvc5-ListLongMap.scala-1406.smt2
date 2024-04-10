; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27288 () Bool)

(assert start!27288)

(declare-fun b!282714 () Bool)

(declare-fun res!145790 () Bool)

(declare-fun e!179437 () Bool)

(assert (=> b!282714 (=> (not res!145790) (not e!179437))))

(declare-datatypes ((array!14106 0))(
  ( (array!14107 (arr!6695 (Array (_ BitVec 32) (_ BitVec 64))) (size!7047 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14106)

(declare-datatypes ((List!4503 0))(
  ( (Nil!4500) (Cons!4499 (h!5169 (_ BitVec 64)) (t!9585 List!4503)) )
))
(declare-fun arrayNoDuplicates!0 (array!14106 (_ BitVec 32) List!4503) Bool)

(assert (=> b!282714 (= res!145790 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4500))))

(declare-fun b!282715 () Bool)

(declare-fun e!179435 () Bool)

(assert (=> b!282715 (= e!179435 (not true))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14106 (_ BitVec 32)) Bool)

(assert (=> b!282715 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8990 0))(
  ( (Unit!8991) )
))
(declare-fun lt!139699 () Unit!8990)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14106 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8990)

(assert (=> b!282715 (= lt!139699 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139701 () array!14106)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1853 0))(
  ( (MissingZero!1853 (index!9582 (_ BitVec 32))) (Found!1853 (index!9583 (_ BitVec 32))) (Intermediate!1853 (undefined!2665 Bool) (index!9584 (_ BitVec 32)) (x!27795 (_ BitVec 32))) (Undefined!1853) (MissingVacant!1853 (index!9585 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14106 (_ BitVec 32)) SeekEntryResult!1853)

(assert (=> b!282715 (= (seekEntryOrOpen!0 (select (arr!6695 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6695 a!3325) i!1267 k!2581) startIndex!26) lt!139701 mask!3868))))

(declare-fun lt!139698 () Unit!8990)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14106 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8990)

(assert (=> b!282715 (= lt!139698 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282715 (arrayNoDuplicates!0 lt!139701 #b00000000000000000000000000000000 Nil!4500)))

(declare-fun lt!139702 () Unit!8990)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14106 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4503) Unit!8990)

(assert (=> b!282715 (= lt!139702 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4500))))

(declare-fun b!282716 () Bool)

(declare-fun res!145786 () Bool)

(assert (=> b!282716 (=> (not res!145786) (not e!179435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282716 (= res!145786 (validKeyInArray!0 (select (arr!6695 a!3325) startIndex!26)))))

(declare-fun b!282717 () Bool)

(declare-fun res!145785 () Bool)

(declare-fun e!179436 () Bool)

(assert (=> b!282717 (=> (not res!145785) (not e!179436))))

(assert (=> b!282717 (= res!145785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282718 () Bool)

(declare-fun res!145783 () Bool)

(assert (=> b!282718 (=> (not res!145783) (not e!179437))))

(assert (=> b!282718 (= res!145783 (validKeyInArray!0 k!2581))))

(declare-fun b!282719 () Bool)

(declare-fun res!145784 () Bool)

(assert (=> b!282719 (=> (not res!145784) (not e!179437))))

(declare-fun arrayContainsKey!0 (array!14106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282719 (= res!145784 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282720 () Bool)

(assert (=> b!282720 (= e!179437 e!179436)))

(declare-fun res!145789 () Bool)

(assert (=> b!282720 (=> (not res!145789) (not e!179436))))

(declare-fun lt!139700 () SeekEntryResult!1853)

(assert (=> b!282720 (= res!145789 (or (= lt!139700 (MissingZero!1853 i!1267)) (= lt!139700 (MissingVacant!1853 i!1267))))))

(assert (=> b!282720 (= lt!139700 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!145787 () Bool)

(assert (=> start!27288 (=> (not res!145787) (not e!179437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27288 (= res!145787 (validMask!0 mask!3868))))

(assert (=> start!27288 e!179437))

(declare-fun array_inv!4658 (array!14106) Bool)

(assert (=> start!27288 (array_inv!4658 a!3325)))

(assert (=> start!27288 true))

(declare-fun b!282721 () Bool)

(declare-fun res!145791 () Bool)

(assert (=> b!282721 (=> (not res!145791) (not e!179437))))

(assert (=> b!282721 (= res!145791 (and (= (size!7047 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7047 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7047 a!3325))))))

(declare-fun b!282722 () Bool)

(assert (=> b!282722 (= e!179436 e!179435)))

(declare-fun res!145788 () Bool)

(assert (=> b!282722 (=> (not res!145788) (not e!179435))))

(assert (=> b!282722 (= res!145788 (not (= startIndex!26 i!1267)))))

(assert (=> b!282722 (= lt!139701 (array!14107 (store (arr!6695 a!3325) i!1267 k!2581) (size!7047 a!3325)))))

(assert (= (and start!27288 res!145787) b!282721))

(assert (= (and b!282721 res!145791) b!282718))

(assert (= (and b!282718 res!145783) b!282714))

(assert (= (and b!282714 res!145790) b!282719))

(assert (= (and b!282719 res!145784) b!282720))

(assert (= (and b!282720 res!145789) b!282717))

(assert (= (and b!282717 res!145785) b!282722))

(assert (= (and b!282722 res!145788) b!282716))

(assert (= (and b!282716 res!145786) b!282715))

(declare-fun m!297375 () Bool)

(assert (=> start!27288 m!297375))

(declare-fun m!297377 () Bool)

(assert (=> start!27288 m!297377))

(declare-fun m!297379 () Bool)

(assert (=> b!282715 m!297379))

(declare-fun m!297381 () Bool)

(assert (=> b!282715 m!297381))

(declare-fun m!297383 () Bool)

(assert (=> b!282715 m!297383))

(declare-fun m!297385 () Bool)

(assert (=> b!282715 m!297385))

(declare-fun m!297387 () Bool)

(assert (=> b!282715 m!297387))

(declare-fun m!297389 () Bool)

(assert (=> b!282715 m!297389))

(declare-fun m!297391 () Bool)

(assert (=> b!282715 m!297391))

(assert (=> b!282715 m!297389))

(assert (=> b!282715 m!297381))

(declare-fun m!297393 () Bool)

(assert (=> b!282715 m!297393))

(declare-fun m!297395 () Bool)

(assert (=> b!282715 m!297395))

(declare-fun m!297397 () Bool)

(assert (=> b!282715 m!297397))

(declare-fun m!297399 () Bool)

(assert (=> b!282718 m!297399))

(declare-fun m!297401 () Bool)

(assert (=> b!282714 m!297401))

(declare-fun m!297403 () Bool)

(assert (=> b!282717 m!297403))

(assert (=> b!282716 m!297389))

(assert (=> b!282716 m!297389))

(declare-fun m!297405 () Bool)

(assert (=> b!282716 m!297405))

(declare-fun m!297407 () Bool)

(assert (=> b!282719 m!297407))

(declare-fun m!297409 () Bool)

(assert (=> b!282720 m!297409))

(assert (=> b!282722 m!297383))

(push 1)

