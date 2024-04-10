; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27280 () Bool)

(assert start!27280)

(declare-fun b!282606 () Bool)

(declare-fun res!145679 () Bool)

(declare-fun e!179389 () Bool)

(assert (=> b!282606 (=> (not res!145679) (not e!179389))))

(declare-datatypes ((array!14098 0))(
  ( (array!14099 (arr!6691 (Array (_ BitVec 32) (_ BitVec 64))) (size!7043 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14098)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282606 (= res!145679 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!145675 () Bool)

(assert (=> start!27280 (=> (not res!145675) (not e!179389))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27280 (= res!145675 (validMask!0 mask!3868))))

(assert (=> start!27280 e!179389))

(declare-fun array_inv!4654 (array!14098) Bool)

(assert (=> start!27280 (array_inv!4654 a!3325)))

(assert (=> start!27280 true))

(declare-fun b!282607 () Bool)

(declare-fun res!145681 () Bool)

(declare-fun e!179388 () Bool)

(assert (=> b!282607 (=> (not res!145681) (not e!179388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14098 (_ BitVec 32)) Bool)

(assert (=> b!282607 (= res!145681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282608 () Bool)

(declare-fun e!179387 () Bool)

(assert (=> b!282608 (= e!179388 e!179387)))

(declare-fun res!145677 () Bool)

(assert (=> b!282608 (=> (not res!145677) (not e!179387))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!282608 (= res!145677 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139639 () array!14098)

(assert (=> b!282608 (= lt!139639 (array!14099 (store (arr!6691 a!3325) i!1267 k!2581) (size!7043 a!3325)))))

(declare-fun b!282609 () Bool)

(declare-fun res!145676 () Bool)

(assert (=> b!282609 (=> (not res!145676) (not e!179389))))

(declare-datatypes ((List!4499 0))(
  ( (Nil!4496) (Cons!4495 (h!5165 (_ BitVec 64)) (t!9581 List!4499)) )
))
(declare-fun arrayNoDuplicates!0 (array!14098 (_ BitVec 32) List!4499) Bool)

(assert (=> b!282609 (= res!145676 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4496))))

(declare-fun b!282610 () Bool)

(assert (=> b!282610 (= e!179387 (not true))))

(assert (=> b!282610 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8982 0))(
  ( (Unit!8983) )
))
(declare-fun lt!139638 () Unit!8982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8982)

(assert (=> b!282610 (= lt!139638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1849 0))(
  ( (MissingZero!1849 (index!9566 (_ BitVec 32))) (Found!1849 (index!9567 (_ BitVec 32))) (Intermediate!1849 (undefined!2661 Bool) (index!9568 (_ BitVec 32)) (x!27775 (_ BitVec 32))) (Undefined!1849) (MissingVacant!1849 (index!9569 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14098 (_ BitVec 32)) SeekEntryResult!1849)

(assert (=> b!282610 (= (seekEntryOrOpen!0 (select (arr!6691 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6691 a!3325) i!1267 k!2581) startIndex!26) lt!139639 mask!3868))))

(declare-fun lt!139640 () Unit!8982)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14098 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8982)

(assert (=> b!282610 (= lt!139640 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282610 (arrayNoDuplicates!0 lt!139639 #b00000000000000000000000000000000 Nil!4496)))

(declare-fun lt!139642 () Unit!8982)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14098 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4499) Unit!8982)

(assert (=> b!282610 (= lt!139642 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4496))))

(declare-fun b!282611 () Bool)

(declare-fun res!145680 () Bool)

(assert (=> b!282611 (=> (not res!145680) (not e!179389))))

(assert (=> b!282611 (= res!145680 (and (= (size!7043 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7043 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7043 a!3325))))))

(declare-fun b!282612 () Bool)

(assert (=> b!282612 (= e!179389 e!179388)))

(declare-fun res!145683 () Bool)

(assert (=> b!282612 (=> (not res!145683) (not e!179388))))

(declare-fun lt!139641 () SeekEntryResult!1849)

(assert (=> b!282612 (= res!145683 (or (= lt!139641 (MissingZero!1849 i!1267)) (= lt!139641 (MissingVacant!1849 i!1267))))))

(assert (=> b!282612 (= lt!139641 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282613 () Bool)

(declare-fun res!145682 () Bool)

(assert (=> b!282613 (=> (not res!145682) (not e!179389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282613 (= res!145682 (validKeyInArray!0 k!2581))))

(declare-fun b!282614 () Bool)

(declare-fun res!145678 () Bool)

(assert (=> b!282614 (=> (not res!145678) (not e!179387))))

(assert (=> b!282614 (= res!145678 (validKeyInArray!0 (select (arr!6691 a!3325) startIndex!26)))))

(assert (= (and start!27280 res!145675) b!282611))

(assert (= (and b!282611 res!145680) b!282613))

(assert (= (and b!282613 res!145682) b!282609))

(assert (= (and b!282609 res!145676) b!282606))

(assert (= (and b!282606 res!145679) b!282612))

(assert (= (and b!282612 res!145683) b!282607))

(assert (= (and b!282607 res!145681) b!282608))

(assert (= (and b!282608 res!145677) b!282614))

(assert (= (and b!282614 res!145678) b!282610))

(declare-fun m!297231 () Bool)

(assert (=> b!282606 m!297231))

(declare-fun m!297233 () Bool)

(assert (=> b!282614 m!297233))

(assert (=> b!282614 m!297233))

(declare-fun m!297235 () Bool)

(assert (=> b!282614 m!297235))

(declare-fun m!297237 () Bool)

(assert (=> b!282608 m!297237))

(declare-fun m!297239 () Bool)

(assert (=> b!282612 m!297239))

(declare-fun m!297241 () Bool)

(assert (=> b!282610 m!297241))

(declare-fun m!297243 () Bool)

(assert (=> b!282610 m!297243))

(declare-fun m!297245 () Bool)

(assert (=> b!282610 m!297245))

(assert (=> b!282610 m!297243))

(assert (=> b!282610 m!297237))

(declare-fun m!297247 () Bool)

(assert (=> b!282610 m!297247))

(declare-fun m!297249 () Bool)

(assert (=> b!282610 m!297249))

(assert (=> b!282610 m!297233))

(declare-fun m!297251 () Bool)

(assert (=> b!282610 m!297251))

(declare-fun m!297253 () Bool)

(assert (=> b!282610 m!297253))

(assert (=> b!282610 m!297233))

(declare-fun m!297255 () Bool)

(assert (=> b!282610 m!297255))

(declare-fun m!297257 () Bool)

(assert (=> start!27280 m!297257))

(declare-fun m!297259 () Bool)

(assert (=> start!27280 m!297259))

(declare-fun m!297261 () Bool)

(assert (=> b!282609 m!297261))

(declare-fun m!297263 () Bool)

(assert (=> b!282607 m!297263))

(declare-fun m!297265 () Bool)

(assert (=> b!282613 m!297265))

(push 1)

