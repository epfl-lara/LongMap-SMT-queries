; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27204 () Bool)

(assert start!27204)

(declare-fun b!281580 () Bool)

(declare-fun res!144652 () Bool)

(declare-fun e!178932 () Bool)

(assert (=> b!281580 (=> (not res!144652) (not e!178932))))

(declare-datatypes ((array!14022 0))(
  ( (array!14023 (arr!6653 (Array (_ BitVec 32) (_ BitVec 64))) (size!7005 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14022)

(declare-datatypes ((List!4461 0))(
  ( (Nil!4458) (Cons!4457 (h!5127 (_ BitVec 64)) (t!9543 List!4461)) )
))
(declare-fun arrayNoDuplicates!0 (array!14022 (_ BitVec 32) List!4461) Bool)

(assert (=> b!281580 (= res!144652 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4458))))

(declare-fun b!281581 () Bool)

(declare-fun e!178933 () Bool)

(assert (=> b!281581 (= e!178933 (not true))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun lt!139103 () array!14022)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1811 0))(
  ( (MissingZero!1811 (index!9414 (_ BitVec 32))) (Found!1811 (index!9415 (_ BitVec 32))) (Intermediate!1811 (undefined!2623 Bool) (index!9416 (_ BitVec 32)) (x!27641 (_ BitVec 32))) (Undefined!1811) (MissingVacant!1811 (index!9417 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14022 (_ BitVec 32)) SeekEntryResult!1811)

(assert (=> b!281581 (= (seekEntryOrOpen!0 (select (arr!6653 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6653 a!3325) i!1267 k!2581) startIndex!26) lt!139103 mask!3868))))

(declare-datatypes ((Unit!8906 0))(
  ( (Unit!8907) )
))
(declare-fun lt!139102 () Unit!8906)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14022 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8906)

(assert (=> b!281581 (= lt!139102 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!281581 (arrayNoDuplicates!0 lt!139103 #b00000000000000000000000000000000 Nil!4458)))

(declare-fun lt!139105 () Unit!8906)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14022 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4461) Unit!8906)

(assert (=> b!281581 (= lt!139105 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4458))))

(declare-fun res!144656 () Bool)

(assert (=> start!27204 (=> (not res!144656) (not e!178932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27204 (= res!144656 (validMask!0 mask!3868))))

(assert (=> start!27204 e!178932))

(declare-fun array_inv!4616 (array!14022) Bool)

(assert (=> start!27204 (array_inv!4616 a!3325)))

(assert (=> start!27204 true))

(declare-fun b!281582 () Bool)

(declare-fun res!144650 () Bool)

(assert (=> b!281582 (=> (not res!144650) (not e!178932))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!281582 (= res!144650 (validKeyInArray!0 k!2581))))

(declare-fun b!281583 () Bool)

(declare-fun res!144649 () Bool)

(assert (=> b!281583 (=> (not res!144649) (not e!178932))))

(assert (=> b!281583 (= res!144649 (and (= (size!7005 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7005 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7005 a!3325))))))

(declare-fun b!281584 () Bool)

(declare-fun res!144651 () Bool)

(assert (=> b!281584 (=> (not res!144651) (not e!178932))))

(declare-fun arrayContainsKey!0 (array!14022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!281584 (= res!144651 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!281585 () Bool)

(declare-fun res!144655 () Bool)

(declare-fun e!178931 () Bool)

(assert (=> b!281585 (=> (not res!144655) (not e!178931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14022 (_ BitVec 32)) Bool)

(assert (=> b!281585 (= res!144655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!281586 () Bool)

(assert (=> b!281586 (= e!178932 e!178931)))

(declare-fun res!144657 () Bool)

(assert (=> b!281586 (=> (not res!144657) (not e!178931))))

(declare-fun lt!139104 () SeekEntryResult!1811)

(assert (=> b!281586 (= res!144657 (or (= lt!139104 (MissingZero!1811 i!1267)) (= lt!139104 (MissingVacant!1811 i!1267))))))

(assert (=> b!281586 (= lt!139104 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!281587 () Bool)

(declare-fun res!144653 () Bool)

(assert (=> b!281587 (=> (not res!144653) (not e!178933))))

(assert (=> b!281587 (= res!144653 (validKeyInArray!0 (select (arr!6653 a!3325) startIndex!26)))))

(declare-fun b!281588 () Bool)

(assert (=> b!281588 (= e!178931 e!178933)))

(declare-fun res!144654 () Bool)

(assert (=> b!281588 (=> (not res!144654) (not e!178933))))

(assert (=> b!281588 (= res!144654 (not (= startIndex!26 i!1267)))))

(assert (=> b!281588 (= lt!139103 (array!14023 (store (arr!6653 a!3325) i!1267 k!2581) (size!7005 a!3325)))))

(assert (= (and start!27204 res!144656) b!281583))

(assert (= (and b!281583 res!144649) b!281582))

(assert (= (and b!281582 res!144650) b!281580))

(assert (= (and b!281580 res!144652) b!281584))

(assert (= (and b!281584 res!144651) b!281586))

(assert (= (and b!281586 res!144657) b!281585))

(assert (= (and b!281585 res!144655) b!281588))

(assert (= (and b!281588 res!144654) b!281587))

(assert (= (and b!281587 res!144653) b!281581))

(declare-fun m!295911 () Bool)

(assert (=> b!281586 m!295911))

(declare-fun m!295913 () Bool)

(assert (=> b!281581 m!295913))

(declare-fun m!295915 () Bool)

(assert (=> b!281581 m!295915))

(assert (=> b!281581 m!295913))

(declare-fun m!295917 () Bool)

(assert (=> b!281581 m!295917))

(declare-fun m!295919 () Bool)

(assert (=> b!281581 m!295919))

(declare-fun m!295921 () Bool)

(assert (=> b!281581 m!295921))

(declare-fun m!295923 () Bool)

(assert (=> b!281581 m!295923))

(declare-fun m!295925 () Bool)

(assert (=> b!281581 m!295925))

(assert (=> b!281581 m!295919))

(declare-fun m!295927 () Bool)

(assert (=> b!281581 m!295927))

(declare-fun m!295929 () Bool)

(assert (=> b!281585 m!295929))

(declare-fun m!295931 () Bool)

(assert (=> b!281584 m!295931))

(assert (=> b!281588 m!295915))

(declare-fun m!295933 () Bool)

(assert (=> b!281582 m!295933))

(declare-fun m!295935 () Bool)

(assert (=> b!281580 m!295935))

(declare-fun m!295937 () Bool)

(assert (=> start!27204 m!295937))

(declare-fun m!295939 () Bool)

(assert (=> start!27204 m!295939))

(assert (=> b!281587 m!295919))

(assert (=> b!281587 m!295919))

(declare-fun m!295941 () Bool)

(assert (=> b!281587 m!295941))

(push 1)

