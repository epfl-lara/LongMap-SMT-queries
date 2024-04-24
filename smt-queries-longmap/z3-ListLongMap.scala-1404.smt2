; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27276 () Bool)

(assert start!27276)

(declare-fun b!282600 () Bool)

(declare-fun e!179389 () Bool)

(declare-fun e!179390 () Bool)

(assert (=> b!282600 (= e!179389 e!179390)))

(declare-fun res!145642 () Bool)

(assert (=> b!282600 (=> (not res!145642) (not e!179390))))

(declare-datatypes ((SeekEntryResult!1811 0))(
  ( (MissingZero!1811 (index!9414 (_ BitVec 32))) (Found!1811 (index!9415 (_ BitVec 32))) (Intermediate!1811 (undefined!2623 Bool) (index!9416 (_ BitVec 32)) (x!27737 (_ BitVec 32))) (Undefined!1811) (MissingVacant!1811 (index!9417 (_ BitVec 32))) )
))
(declare-fun lt!139669 () SeekEntryResult!1811)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282600 (= res!145642 (or (= lt!139669 (MissingZero!1811 i!1267)) (= lt!139669 (MissingVacant!1811 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((array!14093 0))(
  ( (array!14094 (arr!6688 (Array (_ BitVec 32) (_ BitVec 64))) (size!7040 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14093)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14093 (_ BitVec 32)) SeekEntryResult!1811)

(assert (=> b!282600 (= lt!139669 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282601 () Bool)

(declare-fun res!145645 () Bool)

(assert (=> b!282601 (=> (not res!145645) (not e!179389))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!282601 (= res!145645 (and (= (size!7040 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7040 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7040 a!3325))))))

(declare-fun b!282602 () Bool)

(declare-fun e!179388 () Bool)

(assert (=> b!282602 (= e!179388 (not true))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14093 (_ BitVec 32)) Bool)

(assert (=> b!282602 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8952 0))(
  ( (Unit!8953) )
))
(declare-fun lt!139670 () Unit!8952)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14093 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8952)

(assert (=> b!282602 (= lt!139670 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139668 () array!14093)

(assert (=> b!282602 (= (seekEntryOrOpen!0 (select (arr!6688 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6688 a!3325) i!1267 k0!2581) startIndex!26) lt!139668 mask!3868))))

(declare-fun lt!139671 () Unit!8952)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14093 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8952)

(assert (=> b!282602 (= lt!139671 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4409 0))(
  ( (Nil!4406) (Cons!4405 (h!5075 (_ BitVec 64)) (t!9483 List!4409)) )
))
(declare-fun arrayNoDuplicates!0 (array!14093 (_ BitVec 32) List!4409) Bool)

(assert (=> b!282602 (arrayNoDuplicates!0 lt!139668 #b00000000000000000000000000000000 Nil!4406)))

(declare-fun lt!139667 () Unit!8952)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14093 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4409) Unit!8952)

(assert (=> b!282602 (= lt!139667 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4406))))

(declare-fun b!282603 () Bool)

(declare-fun res!145644 () Bool)

(assert (=> b!282603 (=> (not res!145644) (not e!179389))))

(declare-fun arrayContainsKey!0 (array!14093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282603 (= res!145644 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282604 () Bool)

(assert (=> b!282604 (= e!179390 e!179388)))

(declare-fun res!145648 () Bool)

(assert (=> b!282604 (=> (not res!145648) (not e!179388))))

(assert (=> b!282604 (= res!145648 (not (= startIndex!26 i!1267)))))

(assert (=> b!282604 (= lt!139668 (array!14094 (store (arr!6688 a!3325) i!1267 k0!2581) (size!7040 a!3325)))))

(declare-fun b!282605 () Bool)

(declare-fun res!145650 () Bool)

(assert (=> b!282605 (=> (not res!145650) (not e!179389))))

(assert (=> b!282605 (= res!145650 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4406))))

(declare-fun res!145646 () Bool)

(assert (=> start!27276 (=> (not res!145646) (not e!179389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27276 (= res!145646 (validMask!0 mask!3868))))

(assert (=> start!27276 e!179389))

(declare-fun array_inv!4638 (array!14093) Bool)

(assert (=> start!27276 (array_inv!4638 a!3325)))

(assert (=> start!27276 true))

(declare-fun b!282599 () Bool)

(declare-fun res!145649 () Bool)

(assert (=> b!282599 (=> (not res!145649) (not e!179388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282599 (= res!145649 (validKeyInArray!0 (select (arr!6688 a!3325) startIndex!26)))))

(declare-fun b!282606 () Bool)

(declare-fun res!145643 () Bool)

(assert (=> b!282606 (=> (not res!145643) (not e!179389))))

(assert (=> b!282606 (= res!145643 (validKeyInArray!0 k0!2581))))

(declare-fun b!282607 () Bool)

(declare-fun res!145647 () Bool)

(assert (=> b!282607 (=> (not res!145647) (not e!179390))))

(assert (=> b!282607 (= res!145647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!27276 res!145646) b!282601))

(assert (= (and b!282601 res!145645) b!282606))

(assert (= (and b!282606 res!145643) b!282605))

(assert (= (and b!282605 res!145650) b!282603))

(assert (= (and b!282603 res!145644) b!282600))

(assert (= (and b!282600 res!145642) b!282607))

(assert (= (and b!282607 res!145647) b!282604))

(assert (= (and b!282604 res!145648) b!282599))

(assert (= (and b!282599 res!145649) b!282602))

(declare-fun m!297365 () Bool)

(assert (=> b!282599 m!297365))

(assert (=> b!282599 m!297365))

(declare-fun m!297367 () Bool)

(assert (=> b!282599 m!297367))

(declare-fun m!297369 () Bool)

(assert (=> b!282603 m!297369))

(declare-fun m!297371 () Bool)

(assert (=> b!282606 m!297371))

(declare-fun m!297373 () Bool)

(assert (=> start!27276 m!297373))

(declare-fun m!297375 () Bool)

(assert (=> start!27276 m!297375))

(declare-fun m!297377 () Bool)

(assert (=> b!282600 m!297377))

(declare-fun m!297379 () Bool)

(assert (=> b!282602 m!297379))

(declare-fun m!297381 () Bool)

(assert (=> b!282602 m!297381))

(declare-fun m!297383 () Bool)

(assert (=> b!282602 m!297383))

(declare-fun m!297385 () Bool)

(assert (=> b!282602 m!297385))

(assert (=> b!282602 m!297381))

(declare-fun m!297387 () Bool)

(assert (=> b!282602 m!297387))

(assert (=> b!282602 m!297365))

(declare-fun m!297389 () Bool)

(assert (=> b!282602 m!297389))

(declare-fun m!297391 () Bool)

(assert (=> b!282602 m!297391))

(declare-fun m!297393 () Bool)

(assert (=> b!282602 m!297393))

(assert (=> b!282602 m!297365))

(declare-fun m!297395 () Bool)

(assert (=> b!282602 m!297395))

(assert (=> b!282604 m!297383))

(declare-fun m!297397 () Bool)

(assert (=> b!282607 m!297397))

(declare-fun m!297399 () Bool)

(assert (=> b!282605 m!297399))

(check-sat (not b!282605) (not b!282603) (not b!282599) (not b!282606) (not b!282607) (not start!27276) (not b!282602) (not b!282600))
(check-sat)
