; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26436 () Bool)

(assert start!26436)

(declare-fun b!274316 () Bool)

(declare-fun res!138311 () Bool)

(declare-fun e!175651 () Bool)

(assert (=> b!274316 (=> (not res!138311) (not e!175651))))

(declare-datatypes ((array!13533 0))(
  ( (array!13534 (arr!6416 (Array (_ BitVec 32) (_ BitVec 64))) (size!6768 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13533)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!274316 (= res!138311 (and (= (size!6768 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6768 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6768 a!3325))))))

(declare-fun b!274317 () Bool)

(declare-fun res!138314 () Bool)

(assert (=> b!274317 (=> (not res!138314) (not e!175651))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274317 (= res!138314 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!274318 () Bool)

(declare-fun res!138307 () Bool)

(assert (=> b!274318 (=> (not res!138307) (not e!175651))))

(declare-datatypes ((List!4224 0))(
  ( (Nil!4221) (Cons!4220 (h!4887 (_ BitVec 64)) (t!9306 List!4224)) )
))
(declare-fun arrayNoDuplicates!0 (array!13533 (_ BitVec 32) List!4224) Bool)

(assert (=> b!274318 (= res!138307 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4221))))

(declare-fun b!274319 () Bool)

(declare-fun e!175653 () Bool)

(assert (=> b!274319 (= e!175653 true)))

(declare-fun lt!136874 () array!13533)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13533 (_ BitVec 32)) Bool)

(assert (=> b!274319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136874 mask!3868)))

(declare-datatypes ((Unit!8635 0))(
  ( (Unit!8636) )
))
(declare-fun lt!136875 () Unit!8635)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8635)

(assert (=> b!274319 (= lt!136875 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun res!138309 () Bool)

(assert (=> start!26436 (=> (not res!138309) (not e!175651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26436 (= res!138309 (validMask!0 mask!3868))))

(assert (=> start!26436 e!175651))

(declare-fun array_inv!4379 (array!13533) Bool)

(assert (=> start!26436 (array_inv!4379 a!3325)))

(assert (=> start!26436 true))

(declare-fun b!274320 () Bool)

(declare-fun e!175654 () Bool)

(declare-fun e!175655 () Bool)

(assert (=> b!274320 (= e!175654 e!175655)))

(declare-fun res!138310 () Bool)

(assert (=> b!274320 (=> (not res!138310) (not e!175655))))

(assert (=> b!274320 (= res!138310 (not (= startIndex!26 i!1267)))))

(assert (=> b!274320 (= lt!136874 (array!13534 (store (arr!6416 a!3325) i!1267 k!2581) (size!6768 a!3325)))))

(declare-fun b!274321 () Bool)

(assert (=> b!274321 (= e!175655 (not e!175653))))

(declare-fun res!138313 () Bool)

(assert (=> b!274321 (=> res!138313 e!175653)))

(assert (=> b!274321 (= res!138313 (or (bvsge startIndex!26 (bvsub (size!6768 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274321 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-fun lt!136877 () Unit!8635)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8635)

(assert (=> b!274321 (= lt!136877 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-datatypes ((SeekEntryResult!1574 0))(
  ( (MissingZero!1574 (index!8466 (_ BitVec 32))) (Found!1574 (index!8467 (_ BitVec 32))) (Intermediate!1574 (undefined!2386 Bool) (index!8468 (_ BitVec 32)) (x!26763 (_ BitVec 32))) (Undefined!1574) (MissingVacant!1574 (index!8469 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13533 (_ BitVec 32)) SeekEntryResult!1574)

(assert (=> b!274321 (= (seekEntryOrOpen!0 (select (arr!6416 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6416 a!3325) i!1267 k!2581) startIndex!26) lt!136874 mask!3868))))

(declare-fun lt!136878 () Unit!8635)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13533 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8635)

(assert (=> b!274321 (= lt!136878 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!274321 (arrayNoDuplicates!0 lt!136874 #b00000000000000000000000000000000 Nil!4221)))

(declare-fun lt!136876 () Unit!8635)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13533 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4224) Unit!8635)

(assert (=> b!274321 (= lt!136876 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4221))))

(declare-fun b!274322 () Bool)

(declare-fun res!138308 () Bool)

(assert (=> b!274322 (=> (not res!138308) (not e!175655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274322 (= res!138308 (validKeyInArray!0 (select (arr!6416 a!3325) startIndex!26)))))

(declare-fun b!274323 () Bool)

(declare-fun res!138312 () Bool)

(assert (=> b!274323 (=> (not res!138312) (not e!175654))))

(assert (=> b!274323 (= res!138312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274324 () Bool)

(declare-fun res!138315 () Bool)

(assert (=> b!274324 (=> (not res!138315) (not e!175651))))

(assert (=> b!274324 (= res!138315 (validKeyInArray!0 k!2581))))

(declare-fun b!274325 () Bool)

(assert (=> b!274325 (= e!175651 e!175654)))

(declare-fun res!138306 () Bool)

(assert (=> b!274325 (=> (not res!138306) (not e!175654))))

(declare-fun lt!136879 () SeekEntryResult!1574)

(assert (=> b!274325 (= res!138306 (or (= lt!136879 (MissingZero!1574 i!1267)) (= lt!136879 (MissingVacant!1574 i!1267))))))

(assert (=> b!274325 (= lt!136879 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26436 res!138309) b!274316))

(assert (= (and b!274316 res!138311) b!274324))

(assert (= (and b!274324 res!138315) b!274318))

(assert (= (and b!274318 res!138307) b!274317))

(assert (= (and b!274317 res!138314) b!274325))

(assert (= (and b!274325 res!138306) b!274323))

(assert (= (and b!274323 res!138312) b!274320))

(assert (= (and b!274320 res!138310) b!274322))

(assert (= (and b!274322 res!138308) b!274321))

(assert (= (and b!274321 (not res!138313)) b!274319))

(declare-fun m!289797 () Bool)

(assert (=> b!274319 m!289797))

(declare-fun m!289799 () Bool)

(assert (=> b!274319 m!289799))

(declare-fun m!289801 () Bool)

(assert (=> b!274318 m!289801))

(declare-fun m!289803 () Bool)

(assert (=> b!274325 m!289803))

(declare-fun m!289805 () Bool)

(assert (=> b!274321 m!289805))

(declare-fun m!289807 () Bool)

(assert (=> b!274321 m!289807))

(declare-fun m!289809 () Bool)

(assert (=> b!274321 m!289809))

(declare-fun m!289811 () Bool)

(assert (=> b!274321 m!289811))

(declare-fun m!289813 () Bool)

(assert (=> b!274321 m!289813))

(declare-fun m!289815 () Bool)

(assert (=> b!274321 m!289815))

(declare-fun m!289817 () Bool)

(assert (=> b!274321 m!289817))

(assert (=> b!274321 m!289815))

(declare-fun m!289819 () Bool)

(assert (=> b!274321 m!289819))

(assert (=> b!274321 m!289809))

(declare-fun m!289821 () Bool)

(assert (=> b!274321 m!289821))

(declare-fun m!289823 () Bool)

(assert (=> b!274321 m!289823))

(declare-fun m!289825 () Bool)

(assert (=> b!274323 m!289825))

(declare-fun m!289827 () Bool)

(assert (=> start!26436 m!289827))

(declare-fun m!289829 () Bool)

(assert (=> start!26436 m!289829))

(declare-fun m!289831 () Bool)

(assert (=> b!274317 m!289831))

(assert (=> b!274320 m!289811))

(assert (=> b!274322 m!289815))

(assert (=> b!274322 m!289815))

(declare-fun m!289833 () Bool)

(assert (=> b!274322 m!289833))

(declare-fun m!289835 () Bool)

(assert (=> b!274324 m!289835))

(push 1)

