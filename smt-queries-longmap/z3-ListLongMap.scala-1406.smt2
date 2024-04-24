; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27288 () Bool)

(assert start!27288)

(declare-fun b!282761 () Bool)

(declare-fun res!145806 () Bool)

(declare-fun e!179459 () Bool)

(assert (=> b!282761 (=> (not res!145806) (not e!179459))))

(declare-datatypes ((array!14105 0))(
  ( (array!14106 (arr!6694 (Array (_ BitVec 32) (_ BitVec 64))) (size!7046 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14105)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282761 (= res!145806 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282762 () Bool)

(declare-fun res!145810 () Bool)

(declare-fun e!179461 () Bool)

(assert (=> b!282762 (=> (not res!145810) (not e!179461))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14105 (_ BitVec 32)) Bool)

(assert (=> b!282762 (= res!145810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282763 () Bool)

(declare-fun e!179462 () Bool)

(assert (=> b!282763 (= e!179461 e!179462)))

(declare-fun res!145809 () Bool)

(assert (=> b!282763 (=> (not res!145809) (not e!179462))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282763 (= res!145809 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139757 () array!14105)

(assert (=> b!282763 (= lt!139757 (array!14106 (store (arr!6694 a!3325) i!1267 k0!2581) (size!7046 a!3325)))))

(declare-fun b!282765 () Bool)

(assert (=> b!282765 (= e!179459 e!179461)))

(declare-fun res!145812 () Bool)

(assert (=> b!282765 (=> (not res!145812) (not e!179461))))

(declare-datatypes ((SeekEntryResult!1817 0))(
  ( (MissingZero!1817 (index!9438 (_ BitVec 32))) (Found!1817 (index!9439 (_ BitVec 32))) (Intermediate!1817 (undefined!2629 Bool) (index!9440 (_ BitVec 32)) (x!27759 (_ BitVec 32))) (Undefined!1817) (MissingVacant!1817 (index!9441 (_ BitVec 32))) )
))
(declare-fun lt!139761 () SeekEntryResult!1817)

(assert (=> b!282765 (= res!145812 (or (= lt!139761 (MissingZero!1817 i!1267)) (= lt!139761 (MissingVacant!1817 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14105 (_ BitVec 32)) SeekEntryResult!1817)

(assert (=> b!282765 (= lt!139761 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!282766 () Bool)

(declare-fun res!145805 () Bool)

(assert (=> b!282766 (=> (not res!145805) (not e!179459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282766 (= res!145805 (validKeyInArray!0 k0!2581))))

(declare-fun b!282767 () Bool)

(declare-fun res!145804 () Bool)

(assert (=> b!282767 (=> (not res!145804) (not e!179462))))

(assert (=> b!282767 (= res!145804 (validKeyInArray!0 (select (arr!6694 a!3325) startIndex!26)))))

(declare-fun res!145807 () Bool)

(assert (=> start!27288 (=> (not res!145807) (not e!179459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27288 (= res!145807 (validMask!0 mask!3868))))

(assert (=> start!27288 e!179459))

(declare-fun array_inv!4644 (array!14105) Bool)

(assert (=> start!27288 (array_inv!4644 a!3325)))

(assert (=> start!27288 true))

(declare-fun b!282764 () Bool)

(declare-fun res!145808 () Bool)

(assert (=> b!282764 (=> (not res!145808) (not e!179459))))

(declare-datatypes ((List!4415 0))(
  ( (Nil!4412) (Cons!4411 (h!5081 (_ BitVec 64)) (t!9489 List!4415)) )
))
(declare-fun arrayNoDuplicates!0 (array!14105 (_ BitVec 32) List!4415) Bool)

(assert (=> b!282764 (= res!145808 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4412))))

(declare-fun b!282768 () Bool)

(declare-fun res!145811 () Bool)

(assert (=> b!282768 (=> (not res!145811) (not e!179459))))

(assert (=> b!282768 (= res!145811 (and (= (size!7046 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7046 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7046 a!3325))))))

(declare-fun b!282769 () Bool)

(assert (=> b!282769 (= e!179462 (not true))))

(assert (=> b!282769 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8964 0))(
  ( (Unit!8965) )
))
(declare-fun lt!139760 () Unit!8964)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282769 (= lt!139760 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282769 (= (seekEntryOrOpen!0 (select (arr!6694 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6694 a!3325) i!1267 k0!2581) startIndex!26) lt!139757 mask!3868))))

(declare-fun lt!139758 () Unit!8964)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14105 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8964)

(assert (=> b!282769 (= lt!139758 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k0!2581 startIndex!26 mask!3868))))

(assert (=> b!282769 (arrayNoDuplicates!0 lt!139757 #b00000000000000000000000000000000 Nil!4412)))

(declare-fun lt!139759 () Unit!8964)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14105 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4415) Unit!8964)

(assert (=> b!282769 (= lt!139759 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k0!2581 i!1267 #b00000000000000000000000000000000 Nil!4412))))

(assert (= (and start!27288 res!145807) b!282768))

(assert (= (and b!282768 res!145811) b!282766))

(assert (= (and b!282766 res!145805) b!282764))

(assert (= (and b!282764 res!145808) b!282761))

(assert (= (and b!282761 res!145806) b!282765))

(assert (= (and b!282765 res!145812) b!282762))

(assert (= (and b!282762 res!145810) b!282763))

(assert (= (and b!282763 res!145809) b!282767))

(assert (= (and b!282767 res!145804) b!282769))

(declare-fun m!297581 () Bool)

(assert (=> b!282765 m!297581))

(declare-fun m!297583 () Bool)

(assert (=> b!282763 m!297583))

(declare-fun m!297585 () Bool)

(assert (=> b!282764 m!297585))

(declare-fun m!297587 () Bool)

(assert (=> b!282769 m!297587))

(declare-fun m!297589 () Bool)

(assert (=> b!282769 m!297589))

(declare-fun m!297591 () Bool)

(assert (=> b!282769 m!297591))

(assert (=> b!282769 m!297589))

(assert (=> b!282769 m!297583))

(declare-fun m!297593 () Bool)

(assert (=> b!282769 m!297593))

(declare-fun m!297595 () Bool)

(assert (=> b!282769 m!297595))

(declare-fun m!297597 () Bool)

(assert (=> b!282769 m!297597))

(declare-fun m!297599 () Bool)

(assert (=> b!282769 m!297599))

(declare-fun m!297601 () Bool)

(assert (=> b!282769 m!297601))

(assert (=> b!282769 m!297595))

(declare-fun m!297603 () Bool)

(assert (=> b!282769 m!297603))

(assert (=> b!282767 m!297595))

(assert (=> b!282767 m!297595))

(declare-fun m!297605 () Bool)

(assert (=> b!282767 m!297605))

(declare-fun m!297607 () Bool)

(assert (=> b!282762 m!297607))

(declare-fun m!297609 () Bool)

(assert (=> b!282761 m!297609))

(declare-fun m!297611 () Bool)

(assert (=> b!282766 m!297611))

(declare-fun m!297613 () Bool)

(assert (=> start!27288 m!297613))

(declare-fun m!297615 () Bool)

(assert (=> start!27288 m!297615))

(check-sat (not b!282762) (not b!282764) (not start!27288) (not b!282765) (not b!282761) (not b!282767) (not b!282766) (not b!282769))
(check-sat)
