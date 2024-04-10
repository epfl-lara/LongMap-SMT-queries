; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26174 () Bool)

(assert start!26174)

(declare-fun b!270359 () Bool)

(declare-fun res!134381 () Bool)

(declare-fun e!174274 () Bool)

(assert (=> b!270359 (=> (not res!134381) (not e!174274))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270359 (= res!134381 (validKeyInArray!0 k0!2581))))

(declare-fun b!270360 () Bool)

(declare-fun res!134382 () Bool)

(assert (=> b!270360 (=> (not res!134382) (not e!174274))))

(declare-datatypes ((array!13271 0))(
  ( (array!13272 (arr!6285 (Array (_ BitVec 32) (_ BitVec 64))) (size!6637 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13271)

(declare-fun arrayContainsKey!0 (array!13271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270360 (= res!134382 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270362 () Bool)

(declare-fun e!174275 () Bool)

(assert (=> b!270362 (= e!174275 (not true))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun lt!135594 () array!13271)

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1443 0))(
  ( (MissingZero!1443 (index!7942 (_ BitVec 32))) (Found!1443 (index!7943 (_ BitVec 32))) (Intermediate!1443 (undefined!2255 Bool) (index!7944 (_ BitVec 32)) (x!26280 (_ BitVec 32))) (Undefined!1443) (MissingVacant!1443 (index!7945 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13271 (_ BitVec 32)) SeekEntryResult!1443)

(assert (=> b!270362 (= (seekEntryOrOpen!0 k0!2581 lt!135594 mask!3868) (Found!1443 i!1267))))

(declare-datatypes ((Unit!8434 0))(
  ( (Unit!8435) )
))
(declare-fun lt!135593 () Unit!8434)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8434)

(assert (=> b!270362 (= lt!135593 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k0!2581 mask!3868))))

(declare-fun lt!135592 () Unit!8434)

(declare-fun e!174273 () Unit!8434)

(assert (=> b!270362 (= lt!135592 e!174273)))

(declare-fun c!45543 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270362 (= c!45543 (bvslt startIndex!26 (bvsub (size!6637 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270363 () Bool)

(declare-fun res!134377 () Bool)

(assert (=> b!270363 (=> (not res!134377) (not e!174274))))

(declare-datatypes ((List!4093 0))(
  ( (Nil!4090) (Cons!4089 (h!4756 (_ BitVec 64)) (t!9175 List!4093)) )
))
(declare-fun arrayNoDuplicates!0 (array!13271 (_ BitVec 32) List!4093) Bool)

(assert (=> b!270363 (= res!134377 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4090))))

(declare-fun b!270364 () Bool)

(declare-fun lt!135595 () Unit!8434)

(assert (=> b!270364 (= e!174273 lt!135595)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13271 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8434)

(assert (=> b!270364 (= lt!135595 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13271 (_ BitVec 32)) Bool)

(assert (=> b!270364 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135594 mask!3868)))

(declare-fun b!270365 () Bool)

(declare-fun e!174272 () Bool)

(assert (=> b!270365 (= e!174274 e!174272)))

(declare-fun res!134379 () Bool)

(assert (=> b!270365 (=> (not res!134379) (not e!174272))))

(declare-fun lt!135591 () SeekEntryResult!1443)

(assert (=> b!270365 (= res!134379 (or (= lt!135591 (MissingZero!1443 i!1267)) (= lt!135591 (MissingVacant!1443 i!1267))))))

(assert (=> b!270365 (= lt!135591 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun res!134375 () Bool)

(assert (=> start!26174 (=> (not res!134375) (not e!174274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26174 (= res!134375 (validMask!0 mask!3868))))

(assert (=> start!26174 e!174274))

(declare-fun array_inv!4248 (array!13271) Bool)

(assert (=> start!26174 (array_inv!4248 a!3325)))

(assert (=> start!26174 true))

(declare-fun b!270361 () Bool)

(assert (=> b!270361 (= e!174272 e!174275)))

(declare-fun res!134378 () Bool)

(assert (=> b!270361 (=> (not res!134378) (not e!174275))))

(assert (=> b!270361 (= res!134378 (= startIndex!26 i!1267))))

(assert (=> b!270361 (= lt!135594 (array!13272 (store (arr!6285 a!3325) i!1267 k0!2581) (size!6637 a!3325)))))

(declare-fun b!270366 () Bool)

(declare-fun res!134376 () Bool)

(assert (=> b!270366 (=> (not res!134376) (not e!174272))))

(assert (=> b!270366 (= res!134376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270367 () Bool)

(declare-fun res!134380 () Bool)

(assert (=> b!270367 (=> (not res!134380) (not e!174274))))

(assert (=> b!270367 (= res!134380 (and (= (size!6637 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6637 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6637 a!3325))))))

(declare-fun b!270368 () Bool)

(declare-fun Unit!8436 () Unit!8434)

(assert (=> b!270368 (= e!174273 Unit!8436)))

(assert (= (and start!26174 res!134375) b!270367))

(assert (= (and b!270367 res!134380) b!270359))

(assert (= (and b!270359 res!134381) b!270363))

(assert (= (and b!270363 res!134377) b!270360))

(assert (= (and b!270360 res!134382) b!270365))

(assert (= (and b!270365 res!134379) b!270366))

(assert (= (and b!270366 res!134376) b!270361))

(assert (= (and b!270361 res!134378) b!270362))

(assert (= (and b!270362 c!45543) b!270364))

(assert (= (and b!270362 (not c!45543)) b!270368))

(declare-fun m!285987 () Bool)

(assert (=> b!270361 m!285987))

(declare-fun m!285989 () Bool)

(assert (=> b!270364 m!285989))

(declare-fun m!285991 () Bool)

(assert (=> b!270364 m!285991))

(declare-fun m!285993 () Bool)

(assert (=> b!270366 m!285993))

(declare-fun m!285995 () Bool)

(assert (=> b!270362 m!285995))

(declare-fun m!285997 () Bool)

(assert (=> b!270362 m!285997))

(declare-fun m!285999 () Bool)

(assert (=> b!270363 m!285999))

(declare-fun m!286001 () Bool)

(assert (=> b!270360 m!286001))

(declare-fun m!286003 () Bool)

(assert (=> b!270359 m!286003))

(declare-fun m!286005 () Bool)

(assert (=> start!26174 m!286005))

(declare-fun m!286007 () Bool)

(assert (=> start!26174 m!286007))

(declare-fun m!286009 () Bool)

(assert (=> b!270365 m!286009))

(check-sat (not b!270365) (not b!270360) (not b!270364) (not b!270359) (not start!26174) (not b!270362) (not b!270366) (not b!270363))
(check-sat)
