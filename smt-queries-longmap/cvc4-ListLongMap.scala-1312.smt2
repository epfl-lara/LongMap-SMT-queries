; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26434 () Bool)

(assert start!26434)

(declare-fun b!274286 () Bool)

(declare-fun res!138285 () Bool)

(declare-fun e!175636 () Bool)

(assert (=> b!274286 (=> (not res!138285) (not e!175636))))

(declare-datatypes ((array!13531 0))(
  ( (array!13532 (arr!6415 (Array (_ BitVec 32) (_ BitVec 64))) (size!6767 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13531)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274286 (= res!138285 (validKeyInArray!0 (select (arr!6415 a!3325) startIndex!26)))))

(declare-fun b!274287 () Bool)

(declare-fun e!175638 () Bool)

(declare-fun e!175640 () Bool)

(assert (=> b!274287 (= e!175638 e!175640)))

(declare-fun res!138277 () Bool)

(assert (=> b!274287 (=> (not res!138277) (not e!175640))))

(declare-datatypes ((SeekEntryResult!1573 0))(
  ( (MissingZero!1573 (index!8462 (_ BitVec 32))) (Found!1573 (index!8463 (_ BitVec 32))) (Intermediate!1573 (undefined!2385 Bool) (index!8464 (_ BitVec 32)) (x!26754 (_ BitVec 32))) (Undefined!1573) (MissingVacant!1573 (index!8465 (_ BitVec 32))) )
))
(declare-fun lt!136856 () SeekEntryResult!1573)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!274287 (= res!138277 (or (= lt!136856 (MissingZero!1573 i!1267)) (= lt!136856 (MissingVacant!1573 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13531 (_ BitVec 32)) SeekEntryResult!1573)

(assert (=> b!274287 (= lt!136856 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274288 () Bool)

(declare-fun res!138282 () Bool)

(assert (=> b!274288 (=> (not res!138282) (not e!175640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13531 (_ BitVec 32)) Bool)

(assert (=> b!274288 (= res!138282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274289 () Bool)

(declare-fun res!138281 () Bool)

(assert (=> b!274289 (=> (not res!138281) (not e!175638))))

(assert (=> b!274289 (= res!138281 (and (= (size!6767 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6767 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6767 a!3325))))))

(declare-fun res!138278 () Bool)

(assert (=> start!26434 (=> (not res!138278) (not e!175638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26434 (= res!138278 (validMask!0 mask!3868))))

(assert (=> start!26434 e!175638))

(declare-fun array_inv!4378 (array!13531) Bool)

(assert (=> start!26434 (array_inv!4378 a!3325)))

(assert (=> start!26434 true))

(declare-fun b!274290 () Bool)

(declare-fun e!175637 () Bool)

(assert (=> b!274290 (= e!175636 (not e!175637))))

(declare-fun res!138280 () Bool)

(assert (=> b!274290 (=> res!138280 e!175637)))

(assert (=> b!274290 (= res!138280 (or (bvsge startIndex!26 (bvsub (size!6767 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274290 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8633 0))(
  ( (Unit!8634) )
))
(declare-fun lt!136859 () Unit!8633)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8633)

(assert (=> b!274290 (= lt!136859 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136861 () array!13531)

(assert (=> b!274290 (= (seekEntryOrOpen!0 (select (arr!6415 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6415 a!3325) i!1267 k!2581) startIndex!26) lt!136861 mask!3868))))

(declare-fun lt!136857 () Unit!8633)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13531 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8633)

(assert (=> b!274290 (= lt!136857 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4223 0))(
  ( (Nil!4220) (Cons!4219 (h!4886 (_ BitVec 64)) (t!9305 List!4223)) )
))
(declare-fun arrayNoDuplicates!0 (array!13531 (_ BitVec 32) List!4223) Bool)

(assert (=> b!274290 (arrayNoDuplicates!0 lt!136861 #b00000000000000000000000000000000 Nil!4220)))

(declare-fun lt!136860 () Unit!8633)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13531 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4223) Unit!8633)

(assert (=> b!274290 (= lt!136860 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4220))))

(declare-fun b!274291 () Bool)

(declare-fun res!138276 () Bool)

(assert (=> b!274291 (=> (not res!138276) (not e!175638))))

(assert (=> b!274291 (= res!138276 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4220))))

(declare-fun b!274292 () Bool)

(assert (=> b!274292 (= e!175637 true)))

(assert (=> b!274292 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136861 mask!3868)))

(declare-fun lt!136858 () Unit!8633)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13531 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8633)

(assert (=> b!274292 (= lt!136858 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274293 () Bool)

(declare-fun res!138279 () Bool)

(assert (=> b!274293 (=> (not res!138279) (not e!175638))))

(declare-fun arrayContainsKey!0 (array!13531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274293 (= res!138279 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274294 () Bool)

(declare-fun res!138284 () Bool)

(assert (=> b!274294 (=> (not res!138284) (not e!175638))))

(assert (=> b!274294 (= res!138284 (validKeyInArray!0 k!2581))))

(declare-fun b!274295 () Bool)

(assert (=> b!274295 (= e!175640 e!175636)))

(declare-fun res!138283 () Bool)

(assert (=> b!274295 (=> (not res!138283) (not e!175636))))

(assert (=> b!274295 (= res!138283 (not (= startIndex!26 i!1267)))))

(assert (=> b!274295 (= lt!136861 (array!13532 (store (arr!6415 a!3325) i!1267 k!2581) (size!6767 a!3325)))))

(assert (= (and start!26434 res!138278) b!274289))

(assert (= (and b!274289 res!138281) b!274294))

(assert (= (and b!274294 res!138284) b!274291))

(assert (= (and b!274291 res!138276) b!274293))

(assert (= (and b!274293 res!138279) b!274287))

(assert (= (and b!274287 res!138277) b!274288))

(assert (= (and b!274288 res!138282) b!274295))

(assert (= (and b!274295 res!138283) b!274286))

(assert (= (and b!274286 res!138285) b!274290))

(assert (= (and b!274290 (not res!138280)) b!274292))

(declare-fun m!289757 () Bool)

(assert (=> b!274288 m!289757))

(declare-fun m!289759 () Bool)

(assert (=> b!274287 m!289759))

(declare-fun m!289761 () Bool)

(assert (=> b!274291 m!289761))

(declare-fun m!289763 () Bool)

(assert (=> b!274286 m!289763))

(assert (=> b!274286 m!289763))

(declare-fun m!289765 () Bool)

(assert (=> b!274286 m!289765))

(declare-fun m!289767 () Bool)

(assert (=> b!274295 m!289767))

(declare-fun m!289769 () Bool)

(assert (=> b!274292 m!289769))

(declare-fun m!289771 () Bool)

(assert (=> b!274292 m!289771))

(declare-fun m!289773 () Bool)

(assert (=> b!274290 m!289773))

(declare-fun m!289775 () Bool)

(assert (=> b!274290 m!289775))

(declare-fun m!289777 () Bool)

(assert (=> b!274290 m!289777))

(assert (=> b!274290 m!289775))

(assert (=> b!274290 m!289767))

(declare-fun m!289779 () Bool)

(assert (=> b!274290 m!289779))

(declare-fun m!289781 () Bool)

(assert (=> b!274290 m!289781))

(assert (=> b!274290 m!289763))

(declare-fun m!289783 () Bool)

(assert (=> b!274290 m!289783))

(declare-fun m!289785 () Bool)

(assert (=> b!274290 m!289785))

(assert (=> b!274290 m!289763))

(declare-fun m!289787 () Bool)

(assert (=> b!274290 m!289787))

(declare-fun m!289789 () Bool)

(assert (=> b!274294 m!289789))

(declare-fun m!289791 () Bool)

(assert (=> start!26434 m!289791))

(declare-fun m!289793 () Bool)

(assert (=> start!26434 m!289793))

(declare-fun m!289795 () Bool)

(assert (=> b!274293 m!289795))

(push 1)

