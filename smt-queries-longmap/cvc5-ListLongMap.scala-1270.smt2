; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26184 () Bool)

(assert start!26184)

(declare-fun b!270333 () Bool)

(declare-datatypes ((Unit!8400 0))(
  ( (Unit!8401) )
))
(declare-fun e!174233 () Unit!8400)

(declare-fun Unit!8402 () Unit!8400)

(assert (=> b!270333 (= e!174233 Unit!8402)))

(declare-fun b!270334 () Bool)

(declare-fun res!134383 () Bool)

(declare-fun e!174231 () Bool)

(assert (=> b!270334 (=> (not res!134383) (not e!174231))))

(declare-datatypes ((array!13270 0))(
  ( (array!13271 (arr!6284 (Array (_ BitVec 32) (_ BitVec 64))) (size!6637 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13270)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13270 (_ BitVec 32)) Bool)

(assert (=> b!270334 (= res!134383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270335 () Bool)

(declare-fun lt!135473 () Unit!8400)

(assert (=> b!270335 (= e!174233 lt!135473)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13270 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8400)

(assert (=> b!270335 (= lt!135473 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135471 () array!13270)

(assert (=> b!270335 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135471 mask!3868)))

(declare-fun b!270336 () Bool)

(declare-fun res!134379 () Bool)

(declare-fun e!174232 () Bool)

(assert (=> b!270336 (=> (not res!134379) (not e!174232))))

(declare-datatypes ((List!4065 0))(
  ( (Nil!4062) (Cons!4061 (h!4728 (_ BitVec 64)) (t!9138 List!4065)) )
))
(declare-fun arrayNoDuplicates!0 (array!13270 (_ BitVec 32) List!4065) Bool)

(assert (=> b!270336 (= res!134379 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4062))))

(declare-fun b!270337 () Bool)

(declare-fun e!174234 () Bool)

(assert (=> b!270337 (= e!174234 (not (bvsle startIndex!26 (size!6637 a!3325))))))

(declare-datatypes ((SeekEntryResult!1441 0))(
  ( (MissingZero!1441 (index!7934 (_ BitVec 32))) (Found!1441 (index!7935 (_ BitVec 32))) (Intermediate!1441 (undefined!2253 Bool) (index!7936 (_ BitVec 32)) (x!26285 (_ BitVec 32))) (Undefined!1441) (MissingVacant!1441 (index!7937 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13270 (_ BitVec 32)) SeekEntryResult!1441)

(assert (=> b!270337 (= (seekEntryOrOpen!0 k!2581 lt!135471 mask!3868) (Found!1441 i!1267))))

(declare-fun lt!135470 () Unit!8400)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13270 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8400)

(assert (=> b!270337 (= lt!135470 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135472 () Unit!8400)

(assert (=> b!270337 (= lt!135472 e!174233)))

(declare-fun c!45529 () Bool)

(assert (=> b!270337 (= c!45529 (bvslt startIndex!26 (bvsub (size!6637 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270338 () Bool)

(declare-fun res!134377 () Bool)

(assert (=> b!270338 (=> (not res!134377) (not e!174232))))

(declare-fun arrayContainsKey!0 (array!13270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270338 (= res!134377 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!270339 () Bool)

(assert (=> b!270339 (= e!174231 e!174234)))

(declare-fun res!134382 () Bool)

(assert (=> b!270339 (=> (not res!134382) (not e!174234))))

(assert (=> b!270339 (= res!134382 (= startIndex!26 i!1267))))

(assert (=> b!270339 (= lt!135471 (array!13271 (store (arr!6284 a!3325) i!1267 k!2581) (size!6637 a!3325)))))

(declare-fun b!270332 () Bool)

(declare-fun res!134378 () Bool)

(assert (=> b!270332 (=> (not res!134378) (not e!174232))))

(assert (=> b!270332 (= res!134378 (and (= (size!6637 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6637 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6637 a!3325))))))

(declare-fun res!134381 () Bool)

(assert (=> start!26184 (=> (not res!134381) (not e!174232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26184 (= res!134381 (validMask!0 mask!3868))))

(assert (=> start!26184 e!174232))

(declare-fun array_inv!4256 (array!13270) Bool)

(assert (=> start!26184 (array_inv!4256 a!3325)))

(assert (=> start!26184 true))

(declare-fun b!270340 () Bool)

(declare-fun res!134376 () Bool)

(assert (=> b!270340 (=> (not res!134376) (not e!174232))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270340 (= res!134376 (validKeyInArray!0 k!2581))))

(declare-fun b!270341 () Bool)

(assert (=> b!270341 (= e!174232 e!174231)))

(declare-fun res!134380 () Bool)

(assert (=> b!270341 (=> (not res!134380) (not e!174231))))

(declare-fun lt!135474 () SeekEntryResult!1441)

(assert (=> b!270341 (= res!134380 (or (= lt!135474 (MissingZero!1441 i!1267)) (= lt!135474 (MissingVacant!1441 i!1267))))))

(assert (=> b!270341 (= lt!135474 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26184 res!134381) b!270332))

(assert (= (and b!270332 res!134378) b!270340))

(assert (= (and b!270340 res!134376) b!270336))

(assert (= (and b!270336 res!134379) b!270338))

(assert (= (and b!270338 res!134377) b!270341))

(assert (= (and b!270341 res!134380) b!270334))

(assert (= (and b!270334 res!134383) b!270339))

(assert (= (and b!270339 res!134382) b!270337))

(assert (= (and b!270337 c!45529) b!270335))

(assert (= (and b!270337 (not c!45529)) b!270333))

(declare-fun m!285491 () Bool)

(assert (=> b!270340 m!285491))

(declare-fun m!285493 () Bool)

(assert (=> b!270336 m!285493))

(declare-fun m!285495 () Bool)

(assert (=> b!270335 m!285495))

(declare-fun m!285497 () Bool)

(assert (=> b!270335 m!285497))

(declare-fun m!285499 () Bool)

(assert (=> b!270339 m!285499))

(declare-fun m!285501 () Bool)

(assert (=> b!270334 m!285501))

(declare-fun m!285503 () Bool)

(assert (=> b!270338 m!285503))

(declare-fun m!285505 () Bool)

(assert (=> b!270337 m!285505))

(declare-fun m!285507 () Bool)

(assert (=> b!270337 m!285507))

(declare-fun m!285509 () Bool)

(assert (=> start!26184 m!285509))

(declare-fun m!285511 () Bool)

(assert (=> start!26184 m!285511))

(declare-fun m!285513 () Bool)

(assert (=> b!270341 m!285513))

(push 1)

(assert (not start!26184))

(assert (not b!270338))

(assert (not b!270340))

(assert (not b!270337))

(assert (not b!270336))

(assert (not b!270335))

(assert (not b!270334))

(assert (not b!270341))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

