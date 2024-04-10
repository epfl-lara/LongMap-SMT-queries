; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27304 () Bool)

(assert start!27304)

(declare-fun b!282930 () Bool)

(declare-fun res!146004 () Bool)

(declare-fun e!179531 () Bool)

(assert (=> b!282930 (=> (not res!146004) (not e!179531))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282930 (= res!146004 (validKeyInArray!0 k!2581))))

(declare-fun b!282931 () Bool)

(declare-fun res!146006 () Bool)

(assert (=> b!282931 (=> (not res!146006) (not e!179531))))

(declare-datatypes ((array!14122 0))(
  ( (array!14123 (arr!6703 (Array (_ BitVec 32) (_ BitVec 64))) (size!7055 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14122)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282931 (= res!146006 (and (= (size!7055 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7055 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7055 a!3325))))))

(declare-fun b!282932 () Bool)

(declare-fun e!179533 () Bool)

(assert (=> b!282932 (= e!179531 e!179533)))

(declare-fun res!146002 () Bool)

(assert (=> b!282932 (=> (not res!146002) (not e!179533))))

(declare-datatypes ((SeekEntryResult!1861 0))(
  ( (MissingZero!1861 (index!9614 (_ BitVec 32))) (Found!1861 (index!9615 (_ BitVec 32))) (Intermediate!1861 (undefined!2673 Bool) (index!9616 (_ BitVec 32)) (x!27819 (_ BitVec 32))) (Undefined!1861) (MissingVacant!1861 (index!9617 (_ BitVec 32))) )
))
(declare-fun lt!139818 () SeekEntryResult!1861)

(assert (=> b!282932 (= res!146002 (or (= lt!139818 (MissingZero!1861 i!1267)) (= lt!139818 (MissingVacant!1861 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14122 (_ BitVec 32)) SeekEntryResult!1861)

(assert (=> b!282932 (= lt!139818 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282933 () Bool)

(declare-fun res!146007 () Bool)

(assert (=> b!282933 (=> (not res!146007) (not e!179531))))

(declare-fun arrayContainsKey!0 (array!14122 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282933 (= res!146007 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282934 () Bool)

(declare-fun res!146005 () Bool)

(declare-fun e!179534 () Bool)

(assert (=> b!282934 (=> (not res!146005) (not e!179534))))

(assert (=> b!282934 (= res!146005 (validKeyInArray!0 (select (arr!6703 a!3325) startIndex!26)))))

(declare-fun res!146003 () Bool)

(assert (=> start!27304 (=> (not res!146003) (not e!179531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27304 (= res!146003 (validMask!0 mask!3868))))

(assert (=> start!27304 e!179531))

(declare-fun array_inv!4666 (array!14122) Bool)

(assert (=> start!27304 (array_inv!4666 a!3325)))

(assert (=> start!27304 true))

(declare-fun b!282935 () Bool)

(declare-fun res!145999 () Bool)

(assert (=> b!282935 (=> (not res!145999) (not e!179533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14122 (_ BitVec 32)) Bool)

(assert (=> b!282935 (= res!145999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282936 () Bool)

(assert (=> b!282936 (= e!179533 e!179534)))

(declare-fun res!146000 () Bool)

(assert (=> b!282936 (=> (not res!146000) (not e!179534))))

(assert (=> b!282936 (= res!146000 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139819 () array!14122)

(assert (=> b!282936 (= lt!139819 (array!14123 (store (arr!6703 a!3325) i!1267 k!2581) (size!7055 a!3325)))))

(declare-fun b!282937 () Bool)

(declare-fun res!146001 () Bool)

(assert (=> b!282937 (=> (not res!146001) (not e!179531))))

(declare-datatypes ((List!4511 0))(
  ( (Nil!4508) (Cons!4507 (h!5177 (_ BitVec 64)) (t!9593 List!4511)) )
))
(declare-fun arrayNoDuplicates!0 (array!14122 (_ BitVec 32) List!4511) Bool)

(assert (=> b!282937 (= res!146001 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4508))))

(declare-fun b!282938 () Bool)

(assert (=> b!282938 (= e!179534 (not (or (bvsge startIndex!26 (bvsub (size!7055 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000) (bvslt (bvsub (size!7055 a!3325) (bvadd #b00000000000000000000000000000001 startIndex!26)) (bvsub (size!7055 a!3325) startIndex!26)))))))

(assert (=> b!282938 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!9006 0))(
  ( (Unit!9007) )
))
(declare-fun lt!139821 () Unit!9006)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9006)

(assert (=> b!282938 (= lt!139821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282938 (= (seekEntryOrOpen!0 (select (arr!6703 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6703 a!3325) i!1267 k!2581) startIndex!26) lt!139819 mask!3868))))

(declare-fun lt!139820 () Unit!9006)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14122 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9006)

(assert (=> b!282938 (= lt!139820 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282938 (arrayNoDuplicates!0 lt!139819 #b00000000000000000000000000000000 Nil!4508)))

(declare-fun lt!139822 () Unit!9006)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14122 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4511) Unit!9006)

(assert (=> b!282938 (= lt!139822 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4508))))

(assert (= (and start!27304 res!146003) b!282931))

(assert (= (and b!282931 res!146006) b!282930))

(assert (= (and b!282930 res!146004) b!282937))

(assert (= (and b!282937 res!146001) b!282933))

(assert (= (and b!282933 res!146007) b!282932))

(assert (= (and b!282932 res!146002) b!282935))

(assert (= (and b!282935 res!145999) b!282936))

(assert (= (and b!282936 res!146000) b!282934))

(assert (= (and b!282934 res!146005) b!282938))

(declare-fun m!297663 () Bool)

(assert (=> b!282930 m!297663))

(declare-fun m!297665 () Bool)

(assert (=> b!282938 m!297665))

(declare-fun m!297667 () Bool)

(assert (=> b!282938 m!297667))

(assert (=> b!282938 m!297667))

(declare-fun m!297669 () Bool)

(assert (=> b!282938 m!297669))

(declare-fun m!297671 () Bool)

(assert (=> b!282938 m!297671))

(declare-fun m!297673 () Bool)

(assert (=> b!282938 m!297673))

(declare-fun m!297675 () Bool)

(assert (=> b!282938 m!297675))

(declare-fun m!297677 () Bool)

(assert (=> b!282938 m!297677))

(declare-fun m!297679 () Bool)

(assert (=> b!282938 m!297679))

(declare-fun m!297681 () Bool)

(assert (=> b!282938 m!297681))

(assert (=> b!282938 m!297675))

(declare-fun m!297683 () Bool)

(assert (=> b!282938 m!297683))

(declare-fun m!297685 () Bool)

(assert (=> b!282937 m!297685))

(declare-fun m!297687 () Bool)

(assert (=> b!282932 m!297687))

(declare-fun m!297689 () Bool)

(assert (=> b!282933 m!297689))

(declare-fun m!297691 () Bool)

(assert (=> start!27304 m!297691))

(declare-fun m!297693 () Bool)

(assert (=> start!27304 m!297693))

(assert (=> b!282934 m!297675))

(assert (=> b!282934 m!297675))

(declare-fun m!297695 () Bool)

(assert (=> b!282934 m!297695))

(declare-fun m!297697 () Bool)

(assert (=> b!282935 m!297697))

(assert (=> b!282936 m!297671))

(push 1)

(assert (not b!282933))

(assert (not b!282930))

(assert (not b!282937))

(assert (not b!282938))

(assert (not b!282935))

(assert (not start!27304))

(assert (not b!282934))

(assert (not b!282932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

