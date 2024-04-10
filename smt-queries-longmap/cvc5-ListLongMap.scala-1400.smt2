; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27252 () Bool)

(assert start!27252)

(declare-fun b!282228 () Bool)

(declare-fun res!145305 () Bool)

(declare-fun e!179219 () Bool)

(assert (=> b!282228 (=> (not res!145305) (not e!179219))))

(declare-datatypes ((array!14070 0))(
  ( (array!14071 (arr!6677 (Array (_ BitVec 32) (_ BitVec 64))) (size!7029 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14070)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282228 (= res!145305 (and (= (size!7029 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7029 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7029 a!3325))))))

(declare-fun b!282229 () Bool)

(declare-fun res!145301 () Bool)

(assert (=> b!282229 (=> (not res!145301) (not e!179219))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14070 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282229 (= res!145301 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282230 () Bool)

(declare-fun res!145300 () Bool)

(assert (=> b!282230 (=> (not res!145300) (not e!179219))))

(declare-datatypes ((List!4485 0))(
  ( (Nil!4482) (Cons!4481 (h!5151 (_ BitVec 64)) (t!9567 List!4485)) )
))
(declare-fun arrayNoDuplicates!0 (array!14070 (_ BitVec 32) List!4485) Bool)

(assert (=> b!282230 (= res!145300 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4482))))

(declare-fun res!145299 () Bool)

(assert (=> start!27252 (=> (not res!145299) (not e!179219))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27252 (= res!145299 (validMask!0 mask!3868))))

(assert (=> start!27252 e!179219))

(declare-fun array_inv!4640 (array!14070) Bool)

(assert (=> start!27252 (array_inv!4640 a!3325)))

(assert (=> start!27252 true))

(declare-fun b!282231 () Bool)

(declare-fun e!179222 () Bool)

(assert (=> b!282231 (= e!179219 e!179222)))

(declare-fun res!145303 () Bool)

(assert (=> b!282231 (=> (not res!145303) (not e!179222))))

(declare-datatypes ((SeekEntryResult!1835 0))(
  ( (MissingZero!1835 (index!9510 (_ BitVec 32))) (Found!1835 (index!9511 (_ BitVec 32))) (Intermediate!1835 (undefined!2647 Bool) (index!9512 (_ BitVec 32)) (x!27729 (_ BitVec 32))) (Undefined!1835) (MissingVacant!1835 (index!9513 (_ BitVec 32))) )
))
(declare-fun lt!139431 () SeekEntryResult!1835)

(assert (=> b!282231 (= res!145303 (or (= lt!139431 (MissingZero!1835 i!1267)) (= lt!139431 (MissingVacant!1835 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14070 (_ BitVec 32)) SeekEntryResult!1835)

(assert (=> b!282231 (= lt!139431 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282232 () Bool)

(declare-fun res!145298 () Bool)

(assert (=> b!282232 (=> (not res!145298) (not e!179219))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282232 (= res!145298 (validKeyInArray!0 k!2581))))

(declare-fun b!282233 () Bool)

(declare-fun e!179220 () Bool)

(assert (=> b!282233 (= e!179222 e!179220)))

(declare-fun res!145302 () Bool)

(assert (=> b!282233 (=> (not res!145302) (not e!179220))))

(assert (=> b!282233 (= res!145302 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139432 () array!14070)

(assert (=> b!282233 (= lt!139432 (array!14071 (store (arr!6677 a!3325) i!1267 k!2581) (size!7029 a!3325)))))

(declare-fun b!282234 () Bool)

(assert (=> b!282234 (= e!179220 (not (or (bvsge startIndex!26 (bvsub (size!7029 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14070 (_ BitVec 32)) Bool)

(assert (=> b!282234 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8954 0))(
  ( (Unit!8955) )
))
(declare-fun lt!139430 () Unit!8954)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8954)

(assert (=> b!282234 (= lt!139430 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282234 (= (seekEntryOrOpen!0 (select (arr!6677 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6677 a!3325) i!1267 k!2581) startIndex!26) lt!139432 mask!3868))))

(declare-fun lt!139428 () Unit!8954)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14070 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8954)

(assert (=> b!282234 (= lt!139428 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282234 (arrayNoDuplicates!0 lt!139432 #b00000000000000000000000000000000 Nil!4482)))

(declare-fun lt!139429 () Unit!8954)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14070 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4485) Unit!8954)

(assert (=> b!282234 (= lt!139429 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4482))))

(declare-fun b!282235 () Bool)

(declare-fun res!145297 () Bool)

(assert (=> b!282235 (=> (not res!145297) (not e!179222))))

(assert (=> b!282235 (= res!145297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282236 () Bool)

(declare-fun res!145304 () Bool)

(assert (=> b!282236 (=> (not res!145304) (not e!179220))))

(assert (=> b!282236 (= res!145304 (validKeyInArray!0 (select (arr!6677 a!3325) startIndex!26)))))

(assert (= (and start!27252 res!145299) b!282228))

(assert (= (and b!282228 res!145305) b!282232))

(assert (= (and b!282232 res!145298) b!282230))

(assert (= (and b!282230 res!145300) b!282229))

(assert (= (and b!282229 res!145301) b!282231))

(assert (= (and b!282231 res!145303) b!282235))

(assert (= (and b!282235 res!145297) b!282233))

(assert (= (and b!282233 res!145302) b!282236))

(assert (= (and b!282236 res!145304) b!282234))

(declare-fun m!296727 () Bool)

(assert (=> b!282236 m!296727))

(assert (=> b!282236 m!296727))

(declare-fun m!296729 () Bool)

(assert (=> b!282236 m!296729))

(declare-fun m!296731 () Bool)

(assert (=> b!282232 m!296731))

(declare-fun m!296733 () Bool)

(assert (=> b!282230 m!296733))

(declare-fun m!296735 () Bool)

(assert (=> b!282233 m!296735))

(declare-fun m!296737 () Bool)

(assert (=> b!282235 m!296737))

(declare-fun m!296739 () Bool)

(assert (=> start!27252 m!296739))

(declare-fun m!296741 () Bool)

(assert (=> start!27252 m!296741))

(declare-fun m!296743 () Bool)

(assert (=> b!282231 m!296743))

(declare-fun m!296745 () Bool)

(assert (=> b!282234 m!296745))

(declare-fun m!296747 () Bool)

(assert (=> b!282234 m!296747))

(assert (=> b!282234 m!296735))

(declare-fun m!296749 () Bool)

(assert (=> b!282234 m!296749))

(assert (=> b!282234 m!296727))

(declare-fun m!296751 () Bool)

(assert (=> b!282234 m!296751))

(assert (=> b!282234 m!296747))

(declare-fun m!296753 () Bool)

(assert (=> b!282234 m!296753))

(declare-fun m!296755 () Bool)

(assert (=> b!282234 m!296755))

(assert (=> b!282234 m!296727))

(declare-fun m!296757 () Bool)

(assert (=> b!282234 m!296757))

(declare-fun m!296759 () Bool)

(assert (=> b!282234 m!296759))

(declare-fun m!296761 () Bool)

(assert (=> b!282229 m!296761))

(push 1)

