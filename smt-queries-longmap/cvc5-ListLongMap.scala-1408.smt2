; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27300 () Bool)

(assert start!27300)

(declare-fun b!282876 () Bool)

(declare-fun res!145947 () Bool)

(declare-fun e!179508 () Bool)

(assert (=> b!282876 (=> (not res!145947) (not e!179508))))

(declare-datatypes ((array!14118 0))(
  ( (array!14119 (arr!6701 (Array (_ BitVec 32) (_ BitVec 64))) (size!7053 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14118)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282876 (= res!145947 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282877 () Bool)

(declare-fun res!145951 () Bool)

(declare-fun e!179510 () Bool)

(assert (=> b!282877 (=> (not res!145951) (not e!179510))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14118 (_ BitVec 32)) Bool)

(assert (=> b!282877 (= res!145951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!145946 () Bool)

(assert (=> start!27300 (=> (not res!145946) (not e!179508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27300 (= res!145946 (validMask!0 mask!3868))))

(assert (=> start!27300 e!179508))

(declare-fun array_inv!4664 (array!14118) Bool)

(assert (=> start!27300 (array_inv!4664 a!3325)))

(assert (=> start!27300 true))

(declare-fun b!282878 () Bool)

(declare-fun e!179507 () Bool)

(assert (=> b!282878 (= e!179510 e!179507)))

(declare-fun res!145952 () Bool)

(assert (=> b!282878 (=> (not res!145952) (not e!179507))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282878 (= res!145952 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139792 () array!14118)

(assert (=> b!282878 (= lt!139792 (array!14119 (store (arr!6701 a!3325) i!1267 k!2581) (size!7053 a!3325)))))

(declare-fun b!282879 () Bool)

(assert (=> b!282879 (= e!179507 (not (or (bvsge startIndex!26 (bvsub (size!7053 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvslt (bvsub (size!7053 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7053 a!3325) startIndex!26)))))))

(assert (=> b!282879 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9002 0))(
  ( (Unit!9003) )
))
(declare-fun lt!139788 () Unit!9002)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9002)

(assert (=> b!282879 (= lt!139788 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1859 0))(
  ( (MissingZero!1859 (index!9606 (_ BitVec 32))) (Found!1859 (index!9607 (_ BitVec 32))) (Intermediate!1859 (undefined!2671 Bool) (index!9608 (_ BitVec 32)) (x!27817 (_ BitVec 32))) (Undefined!1859) (MissingVacant!1859 (index!9609 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14118 (_ BitVec 32)) SeekEntryResult!1859)

(assert (=> b!282879 (= (seekEntryOrOpen!0 (select (arr!6701 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6701 a!3325) i!1267 k!2581) startIndex!26) lt!139792 mask!3868))))

(declare-fun lt!139789 () Unit!9002)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14118 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9002)

(assert (=> b!282879 (= lt!139789 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4509 0))(
  ( (Nil!4506) (Cons!4505 (h!5175 (_ BitVec 64)) (t!9591 List!4509)) )
))
(declare-fun arrayNoDuplicates!0 (array!14118 (_ BitVec 32) List!4509) Bool)

(assert (=> b!282879 (arrayNoDuplicates!0 lt!139792 #b00000000000000000000000000000000 Nil!4506)))

(declare-fun lt!139790 () Unit!9002)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14118 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4509) Unit!9002)

(assert (=> b!282879 (= lt!139790 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4506))))

(declare-fun b!282880 () Bool)

(declare-fun res!145950 () Bool)

(assert (=> b!282880 (=> (not res!145950) (not e!179508))))

(assert (=> b!282880 (= res!145950 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4506))))

(declare-fun b!282881 () Bool)

(declare-fun res!145949 () Bool)

(assert (=> b!282881 (=> (not res!145949) (not e!179508))))

(assert (=> b!282881 (= res!145949 (and (= (size!7053 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7053 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7053 a!3325))))))

(declare-fun b!282882 () Bool)

(assert (=> b!282882 (= e!179508 e!179510)))

(declare-fun res!145945 () Bool)

(assert (=> b!282882 (=> (not res!145945) (not e!179510))))

(declare-fun lt!139791 () SeekEntryResult!1859)

(assert (=> b!282882 (= res!145945 (or (= lt!139791 (MissingZero!1859 i!1267)) (= lt!139791 (MissingVacant!1859 i!1267))))))

(assert (=> b!282882 (= lt!139791 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282883 () Bool)

(declare-fun res!145948 () Bool)

(assert (=> b!282883 (=> (not res!145948) (not e!179508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282883 (= res!145948 (validKeyInArray!0 k!2581))))

(declare-fun b!282884 () Bool)

(declare-fun res!145953 () Bool)

(assert (=> b!282884 (=> (not res!145953) (not e!179507))))

(assert (=> b!282884 (= res!145953 (validKeyInArray!0 (select (arr!6701 a!3325) startIndex!26)))))

(assert (= (and start!27300 res!145946) b!282881))

(assert (= (and b!282881 res!145949) b!282883))

(assert (= (and b!282883 res!145948) b!282880))

(assert (= (and b!282880 res!145950) b!282876))

(assert (= (and b!282876 res!145947) b!282882))

(assert (= (and b!282882 res!145945) b!282877))

(assert (= (and b!282877 res!145951) b!282878))

(assert (= (and b!282878 res!145952) b!282884))

(assert (= (and b!282884 res!145953) b!282879))

(declare-fun m!297591 () Bool)

(assert (=> b!282880 m!297591))

(declare-fun m!297593 () Bool)

(assert (=> b!282879 m!297593))

(declare-fun m!297595 () Bool)

(assert (=> b!282879 m!297595))

(declare-fun m!297597 () Bool)

(assert (=> b!282879 m!297597))

(declare-fun m!297599 () Bool)

(assert (=> b!282879 m!297599))

(declare-fun m!297601 () Bool)

(assert (=> b!282879 m!297601))

(declare-fun m!297603 () Bool)

(assert (=> b!282879 m!297603))

(assert (=> b!282879 m!297595))

(declare-fun m!297605 () Bool)

(assert (=> b!282879 m!297605))

(declare-fun m!297607 () Bool)

(assert (=> b!282879 m!297607))

(declare-fun m!297609 () Bool)

(assert (=> b!282879 m!297609))

(assert (=> b!282879 m!297601))

(declare-fun m!297611 () Bool)

(assert (=> b!282879 m!297611))

(declare-fun m!297613 () Bool)

(assert (=> start!27300 m!297613))

(declare-fun m!297615 () Bool)

(assert (=> start!27300 m!297615))

(declare-fun m!297617 () Bool)

(assert (=> b!282882 m!297617))

(declare-fun m!297619 () Bool)

(assert (=> b!282877 m!297619))

(assert (=> b!282884 m!297601))

(assert (=> b!282884 m!297601))

(declare-fun m!297621 () Bool)

(assert (=> b!282884 m!297621))

(declare-fun m!297623 () Bool)

(assert (=> b!282876 m!297623))

(declare-fun m!297625 () Bool)

(assert (=> b!282883 m!297625))

(assert (=> b!282878 m!297597))

(push 1)

(assert (not b!282884))

(assert (not b!282879))

(assert (not b!282883))

(assert (not b!282880))

(assert (not b!282877))

(assert (not b!282882))

(assert (not start!27300))

(assert (not b!282876))

(check-sat)

(pop 1)

(push 1)

(check-sat)

