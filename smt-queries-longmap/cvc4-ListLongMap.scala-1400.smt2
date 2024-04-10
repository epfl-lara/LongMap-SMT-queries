; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27256 () Bool)

(assert start!27256)

(declare-fun b!282282 () Bool)

(declare-fun res!145353 () Bool)

(declare-fun e!179246 () Bool)

(assert (=> b!282282 (=> (not res!145353) (not e!179246))))

(declare-datatypes ((array!14074 0))(
  ( (array!14075 (arr!6679 (Array (_ BitVec 32) (_ BitVec 64))) (size!7031 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14074)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!282282 (= res!145353 (and (= (size!7031 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7031 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7031 a!3325))))))

(declare-fun b!282283 () Bool)

(declare-fun res!145357 () Bool)

(assert (=> b!282283 (=> (not res!145357) (not e!179246))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!282283 (= res!145357 (validKeyInArray!0 k!2581))))

(declare-fun b!282284 () Bool)

(declare-fun res!145359 () Bool)

(assert (=> b!282284 (=> (not res!145359) (not e!179246))))

(declare-datatypes ((List!4487 0))(
  ( (Nil!4484) (Cons!4483 (h!5153 (_ BitVec 64)) (t!9569 List!4487)) )
))
(declare-fun arrayNoDuplicates!0 (array!14074 (_ BitVec 32) List!4487) Bool)

(assert (=> b!282284 (= res!145359 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4484))))

(declare-fun b!282286 () Bool)

(declare-fun res!145351 () Bool)

(assert (=> b!282286 (=> (not res!145351) (not e!179246))))

(declare-fun arrayContainsKey!0 (array!14074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!282286 (= res!145351 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!282287 () Bool)

(declare-fun e!179243 () Bool)

(assert (=> b!282287 (= e!179246 e!179243)))

(declare-fun res!145356 () Bool)

(assert (=> b!282287 (=> (not res!145356) (not e!179243))))

(declare-datatypes ((SeekEntryResult!1837 0))(
  ( (MissingZero!1837 (index!9518 (_ BitVec 32))) (Found!1837 (index!9519 (_ BitVec 32))) (Intermediate!1837 (undefined!2649 Bool) (index!9520 (_ BitVec 32)) (x!27731 (_ BitVec 32))) (Undefined!1837) (MissingVacant!1837 (index!9521 (_ BitVec 32))) )
))
(declare-fun lt!139458 () SeekEntryResult!1837)

(assert (=> b!282287 (= res!145356 (or (= lt!139458 (MissingZero!1837 i!1267)) (= lt!139458 (MissingVacant!1837 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14074 (_ BitVec 32)) SeekEntryResult!1837)

(assert (=> b!282287 (= lt!139458 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!282288 () Bool)

(declare-fun e!179244 () Bool)

(assert (=> b!282288 (= e!179243 e!179244)))

(declare-fun res!145352 () Bool)

(assert (=> b!282288 (=> (not res!145352) (not e!179244))))

(assert (=> b!282288 (= res!145352 (not (= startIndex!26 i!1267)))))

(declare-fun lt!139460 () array!14074)

(assert (=> b!282288 (= lt!139460 (array!14075 (store (arr!6679 a!3325) i!1267 k!2581) (size!7031 a!3325)))))

(declare-fun b!282289 () Bool)

(declare-fun res!145355 () Bool)

(assert (=> b!282289 (=> (not res!145355) (not e!179243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14074 (_ BitVec 32)) Bool)

(assert (=> b!282289 (= res!145355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!282290 () Bool)

(assert (=> b!282290 (= e!179244 (not (or (bvsge startIndex!26 (bvsub (size!7031 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000))))))

(assert (=> b!282290 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8958 0))(
  ( (Unit!8959) )
))
(declare-fun lt!139459 () Unit!8958)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!14074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282290 (= lt!139459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(assert (=> b!282290 (= (seekEntryOrOpen!0 (select (arr!6679 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6679 a!3325) i!1267 k!2581) startIndex!26) lt!139460 mask!3868))))

(declare-fun lt!139461 () Unit!8958)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!14074 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8958)

(assert (=> b!282290 (= lt!139461 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(assert (=> b!282290 (arrayNoDuplicates!0 lt!139460 #b00000000000000000000000000000000 Nil!4484)))

(declare-fun lt!139462 () Unit!8958)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!14074 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4487) Unit!8958)

(assert (=> b!282290 (= lt!139462 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4484))))

(declare-fun res!145358 () Bool)

(assert (=> start!27256 (=> (not res!145358) (not e!179246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27256 (= res!145358 (validMask!0 mask!3868))))

(assert (=> start!27256 e!179246))

(declare-fun array_inv!4642 (array!14074) Bool)

(assert (=> start!27256 (array_inv!4642 a!3325)))

(assert (=> start!27256 true))

(declare-fun b!282285 () Bool)

(declare-fun res!145354 () Bool)

(assert (=> b!282285 (=> (not res!145354) (not e!179244))))

(assert (=> b!282285 (= res!145354 (validKeyInArray!0 (select (arr!6679 a!3325) startIndex!26)))))

(assert (= (and start!27256 res!145358) b!282282))

(assert (= (and b!282282 res!145353) b!282283))

(assert (= (and b!282283 res!145357) b!282284))

(assert (= (and b!282284 res!145359) b!282286))

(assert (= (and b!282286 res!145351) b!282287))

(assert (= (and b!282287 res!145356) b!282289))

(assert (= (and b!282289 res!145355) b!282288))

(assert (= (and b!282288 res!145352) b!282285))

(assert (= (and b!282285 res!145354) b!282290))

(declare-fun m!296799 () Bool)

(assert (=> b!282287 m!296799))

(declare-fun m!296801 () Bool)

(assert (=> start!27256 m!296801))

(declare-fun m!296803 () Bool)

(assert (=> start!27256 m!296803))

(declare-fun m!296805 () Bool)

(assert (=> b!282284 m!296805))

(declare-fun m!296807 () Bool)

(assert (=> b!282286 m!296807))

(declare-fun m!296809 () Bool)

(assert (=> b!282285 m!296809))

(assert (=> b!282285 m!296809))

(declare-fun m!296811 () Bool)

(assert (=> b!282285 m!296811))

(declare-fun m!296813 () Bool)

(assert (=> b!282290 m!296813))

(declare-fun m!296815 () Bool)

(assert (=> b!282290 m!296815))

(assert (=> b!282290 m!296815))

(declare-fun m!296817 () Bool)

(assert (=> b!282290 m!296817))

(declare-fun m!296819 () Bool)

(assert (=> b!282290 m!296819))

(declare-fun m!296821 () Bool)

(assert (=> b!282290 m!296821))

(declare-fun m!296823 () Bool)

(assert (=> b!282290 m!296823))

(declare-fun m!296825 () Bool)

(assert (=> b!282290 m!296825))

(assert (=> b!282290 m!296809))

(declare-fun m!296827 () Bool)

(assert (=> b!282290 m!296827))

(declare-fun m!296829 () Bool)

(assert (=> b!282290 m!296829))

(assert (=> b!282290 m!296809))

(declare-fun m!296831 () Bool)

(assert (=> b!282289 m!296831))

(declare-fun m!296833 () Bool)

(assert (=> b!282283 m!296833))

(assert (=> b!282288 m!296819))

(push 1)

