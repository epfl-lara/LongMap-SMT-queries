; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26172 () Bool)

(assert start!26172)

(declare-fun b!270329 () Bool)

(declare-fun e!174260 () Bool)

(declare-fun e!174257 () Bool)

(assert (=> b!270329 (= e!174260 e!174257)))

(declare-fun res!134356 () Bool)

(assert (=> b!270329 (=> (not res!134356) (not e!174257))))

(declare-datatypes ((SeekEntryResult!1442 0))(
  ( (MissingZero!1442 (index!7938 (_ BitVec 32))) (Found!1442 (index!7939 (_ BitVec 32))) (Intermediate!1442 (undefined!2254 Bool) (index!7940 (_ BitVec 32)) (x!26279 (_ BitVec 32))) (Undefined!1442) (MissingVacant!1442 (index!7941 (_ BitVec 32))) )
))
(declare-fun lt!135580 () SeekEntryResult!1442)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!270329 (= res!134356 (or (= lt!135580 (MissingZero!1442 i!1267)) (= lt!135580 (MissingVacant!1442 i!1267))))))

(declare-datatypes ((array!13269 0))(
  ( (array!13270 (arr!6284 (Array (_ BitVec 32) (_ BitVec 64))) (size!6636 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13269)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13269 (_ BitVec 32)) SeekEntryResult!1442)

(assert (=> b!270329 (= lt!135580 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270330 () Bool)

(declare-fun res!134358 () Bool)

(assert (=> b!270330 (=> (not res!134358) (not e!174260))))

(declare-datatypes ((List!4092 0))(
  ( (Nil!4089) (Cons!4088 (h!4755 (_ BitVec 64)) (t!9174 List!4092)) )
))
(declare-fun arrayNoDuplicates!0 (array!13269 (_ BitVec 32) List!4092) Bool)

(assert (=> b!270330 (= res!134358 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4089))))

(declare-fun res!134354 () Bool)

(assert (=> start!26172 (=> (not res!134354) (not e!174260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26172 (= res!134354 (validMask!0 mask!3868))))

(assert (=> start!26172 e!174260))

(declare-fun array_inv!4247 (array!13269) Bool)

(assert (=> start!26172 (array_inv!4247 a!3325)))

(assert (=> start!26172 true))

(declare-fun b!270331 () Bool)

(declare-fun res!134352 () Bool)

(assert (=> b!270331 (=> (not res!134352) (not e!174260))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!270331 (= res!134352 (and (= (size!6636 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6636 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6636 a!3325))))))

(declare-fun b!270332 () Bool)

(declare-fun e!174258 () Bool)

(assert (=> b!270332 (= e!174257 e!174258)))

(declare-fun res!134355 () Bool)

(assert (=> b!270332 (=> (not res!134355) (not e!174258))))

(assert (=> b!270332 (= res!134355 (= startIndex!26 i!1267))))

(declare-fun lt!135579 () array!13269)

(assert (=> b!270332 (= lt!135579 (array!13270 (store (arr!6284 a!3325) i!1267 k!2581) (size!6636 a!3325)))))

(declare-fun b!270333 () Bool)

(declare-fun res!134357 () Bool)

(assert (=> b!270333 (=> (not res!134357) (not e!174257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13269 (_ BitVec 32)) Bool)

(assert (=> b!270333 (= res!134357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270334 () Bool)

(declare-datatypes ((Unit!8431 0))(
  ( (Unit!8432) )
))
(declare-fun e!174259 () Unit!8431)

(declare-fun lt!135578 () Unit!8431)

(assert (=> b!270334 (= e!174259 lt!135578)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8431)

(assert (=> b!270334 (= lt!135578 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!270334 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135579 mask!3868)))

(declare-fun b!270335 () Bool)

(declare-fun res!134351 () Bool)

(assert (=> b!270335 (=> (not res!134351) (not e!174260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270335 (= res!134351 (validKeyInArray!0 k!2581))))

(declare-fun b!270336 () Bool)

(declare-fun Unit!8433 () Unit!8431)

(assert (=> b!270336 (= e!174259 Unit!8433)))

(declare-fun b!270337 () Bool)

(assert (=> b!270337 (= e!174258 (not true))))

(assert (=> b!270337 (= (seekEntryOrOpen!0 k!2581 lt!135579 mask!3868) (Found!1442 i!1267))))

(declare-fun lt!135576 () Unit!8431)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13269 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8431)

(assert (=> b!270337 (= lt!135576 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135577 () Unit!8431)

(assert (=> b!270337 (= lt!135577 e!174259)))

(declare-fun c!45540 () Bool)

(assert (=> b!270337 (= c!45540 (bvslt startIndex!26 (bvsub (size!6636 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270338 () Bool)

(declare-fun res!134353 () Bool)

(assert (=> b!270338 (=> (not res!134353) (not e!174260))))

(declare-fun arrayContainsKey!0 (array!13269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270338 (= res!134353 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26172 res!134354) b!270331))

(assert (= (and b!270331 res!134352) b!270335))

(assert (= (and b!270335 res!134351) b!270330))

(assert (= (and b!270330 res!134358) b!270338))

(assert (= (and b!270338 res!134353) b!270329))

(assert (= (and b!270329 res!134356) b!270333))

(assert (= (and b!270333 res!134357) b!270332))

(assert (= (and b!270332 res!134355) b!270337))

(assert (= (and b!270337 c!45540) b!270334))

(assert (= (and b!270337 (not c!45540)) b!270336))

(declare-fun m!285963 () Bool)

(assert (=> b!270330 m!285963))

(declare-fun m!285965 () Bool)

(assert (=> b!270329 m!285965))

(declare-fun m!285967 () Bool)

(assert (=> start!26172 m!285967))

(declare-fun m!285969 () Bool)

(assert (=> start!26172 m!285969))

(declare-fun m!285971 () Bool)

(assert (=> b!270338 m!285971))

(declare-fun m!285973 () Bool)

(assert (=> b!270334 m!285973))

(declare-fun m!285975 () Bool)

(assert (=> b!270334 m!285975))

(declare-fun m!285977 () Bool)

(assert (=> b!270335 m!285977))

(declare-fun m!285979 () Bool)

(assert (=> b!270332 m!285979))

(declare-fun m!285981 () Bool)

(assert (=> b!270333 m!285981))

(declare-fun m!285983 () Bool)

(assert (=> b!270337 m!285983))

(declare-fun m!285985 () Bool)

(assert (=> b!270337 m!285985))

(push 1)

