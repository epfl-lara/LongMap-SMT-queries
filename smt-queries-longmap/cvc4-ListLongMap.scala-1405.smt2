; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27286 () Bool)

(assert start!27286)

(declare-fun b!282687 () Bool)

(declare-fun res!145760 () Bool)

(declare-fun e!179425 () Bool)

(assert (=> b!282687 (=> (not res!145760) (not e!179425))))

(declare-datatypes ((array!14104 0))(
  ( (array!14105 (arr!6694 (Array (_ BitVec 32) (_ BitVec 64))) (size!7046 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14104)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282687 (= res!145760 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282688 () Bool)

(declare-fun res!145761 () Bool)

(declare-fun e!179426 () Bool)

(assert (=> b!282688 (=> (not res!145761) (not e!179426))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282688 (= res!145761 (validKeyInArray!0 (select (arr!6694 a!3325) startIndex!26)))))

(declare-fun b!282689 () Bool)

(declare-fun res!145763 () Bool)

(declare-fun e!179424 () Bool)

(assert (=> b!282689 (=> (not res!145763) (not e!179424))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14104 (_ BitVec 32)) Bool)

(assert (=> b!282689 (= res!145763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282691 () Bool)

(assert (=> b!282691 (= e!179426 (not true))))

(assert (=> b!282691 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8988 0))(
  ( (Unit!8989) )
))
(declare-fun lt!139684 () Unit!8988)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14104 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> b!282691 (= lt!139684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!139683 () array!14104)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1852 0))(
  ( (MissingZero!1852 (index!9578 (_ BitVec 32))) (Found!1852 (index!9579 (_ BitVec 32))) (Intermediate!1852 (undefined!2664 Bool) (index!9580 (_ BitVec 32)) (x!27786 (_ BitVec 32))) (Undefined!1852) (MissingVacant!1852 (index!9581 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14104 (_ BitVec 32)) SeekEntryResult!1852)

(assert (=> b!282691 (= (seekEntryOrOpen!0 (select (arr!6694 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6694 a!3325) i!1267 k!2581) startIndex!26) lt!139683 mask!3868))))

(declare-fun lt!139686 () Unit!8988)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14104 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8988)

(assert (=> b!282691 (= lt!139686 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4502 0))(
  ( (Nil!4499) (Cons!4498 (h!5168 (_ BitVec 64)) (t!9584 List!4502)) )
))
(declare-fun arrayNoDuplicates!0 (array!14104 (_ BitVec 32) List!4502) Bool)

(assert (=> b!282691 (arrayNoDuplicates!0 lt!139683 #b00000000000000000000000000000000 Nil!4499)))

(declare-fun lt!139685 () Unit!8988)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14104 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4502) Unit!8988)

(assert (=> b!282691 (= lt!139685 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4499))))

(declare-fun b!282692 () Bool)

(declare-fun res!145762 () Bool)

(assert (=> b!282692 (=> (not res!145762) (not e!179425))))

(assert (=> b!282692 (= res!145762 (and (= (size!7046 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7046 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7046 a!3325))))))

(declare-fun b!282693 () Bool)

(assert (=> b!282693 (= e!179425 e!179424)))

(declare-fun res!145764 () Bool)

(assert (=> b!282693 (=> (not res!145764) (not e!179424))))

(declare-fun lt!139687 () SeekEntryResult!1852)

(assert (=> b!282693 (= res!145764 (or (= lt!139687 (MissingZero!1852 i!1267)) (= lt!139687 (MissingVacant!1852 i!1267))))))

(assert (=> b!282693 (= lt!139687 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282694 () Bool)

(declare-fun res!145759 () Bool)

(assert (=> b!282694 (=> (not res!145759) (not e!179425))))

(assert (=> b!282694 (= res!145759 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4499))))

(declare-fun b!282695 () Bool)

(declare-fun res!145757 () Bool)

(assert (=> b!282695 (=> (not res!145757) (not e!179425))))

(assert (=> b!282695 (= res!145757 (validKeyInArray!0 k!2581))))

(declare-fun res!145758 () Bool)

(assert (=> start!27286 (=> (not res!145758) (not e!179425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27286 (= res!145758 (validMask!0 mask!3868))))

(assert (=> start!27286 e!179425))

(declare-fun array_inv!4657 (array!14104) Bool)

(assert (=> start!27286 (array_inv!4657 a!3325)))

(assert (=> start!27286 true))

(declare-fun b!282690 () Bool)

(assert (=> b!282690 (= e!179424 e!179426)))

(declare-fun res!145756 () Bool)

(assert (=> b!282690 (=> (not res!145756) (not e!179426))))

(assert (=> b!282690 (= res!145756 (not (= startIndex!26 i!1267)))))

(assert (=> b!282690 (= lt!139683 (array!14105 (store (arr!6694 a!3325) i!1267 k!2581) (size!7046 a!3325)))))

(assert (= (and start!27286 res!145758) b!282692))

(assert (= (and b!282692 res!145762) b!282695))

(assert (= (and b!282695 res!145757) b!282694))

(assert (= (and b!282694 res!145759) b!282687))

(assert (= (and b!282687 res!145760) b!282693))

(assert (= (and b!282693 res!145764) b!282689))

(assert (= (and b!282689 res!145763) b!282690))

(assert (= (and b!282690 res!145756) b!282688))

(assert (= (and b!282688 res!145761) b!282691))

(declare-fun m!297339 () Bool)

(assert (=> b!282693 m!297339))

(declare-fun m!297341 () Bool)

(assert (=> b!282690 m!297341))

(declare-fun m!297343 () Bool)

(assert (=> b!282691 m!297343))

(declare-fun m!297345 () Bool)

(assert (=> b!282691 m!297345))

(declare-fun m!297347 () Bool)

(assert (=> b!282691 m!297347))

(declare-fun m!297349 () Bool)

(assert (=> b!282691 m!297349))

(declare-fun m!297351 () Bool)

(assert (=> b!282691 m!297351))

(assert (=> b!282691 m!297345))

(declare-fun m!297353 () Bool)

(assert (=> b!282691 m!297353))

(declare-fun m!297355 () Bool)

(assert (=> b!282691 m!297355))

(assert (=> b!282691 m!297349))

(declare-fun m!297357 () Bool)

(assert (=> b!282691 m!297357))

(declare-fun m!297359 () Bool)

(assert (=> b!282691 m!297359))

(assert (=> b!282691 m!297341))

(declare-fun m!297361 () Bool)

(assert (=> b!282689 m!297361))

(declare-fun m!297363 () Bool)

(assert (=> start!27286 m!297363))

(declare-fun m!297365 () Bool)

(assert (=> start!27286 m!297365))

(assert (=> b!282688 m!297349))

(assert (=> b!282688 m!297349))

(declare-fun m!297367 () Bool)

(assert (=> b!282688 m!297367))

(declare-fun m!297369 () Bool)

(assert (=> b!282695 m!297369))

(declare-fun m!297371 () Bool)

(assert (=> b!282694 m!297371))

(declare-fun m!297373 () Bool)

(assert (=> b!282687 m!297373))

(push 1)

(assert (not b!282694))

(assert (not b!282689))

(assert (not b!282688))

(assert (not start!27286))

(assert (not b!282695))

(assert (not b!282691))

(assert (not b!282687))

