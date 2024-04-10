; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26182 () Bool)

(assert start!26182)

(declare-fun b!270479 () Bool)

(declare-fun res!134477 () Bool)

(declare-fun e!174334 () Bool)

(assert (=> b!270479 (=> (not res!134477) (not e!174334))))

(declare-datatypes ((array!13279 0))(
  ( (array!13280 (arr!6289 (Array (_ BitVec 32) (_ BitVec 64))) (size!6641 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13279)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13279 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!270479 (= res!134477 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!134473 () Bool)

(assert (=> start!26182 (=> (not res!134473) (not e!174334))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26182 (= res!134473 (validMask!0 mask!3868))))

(assert (=> start!26182 e!174334))

(declare-fun array_inv!4252 (array!13279) Bool)

(assert (=> start!26182 (array_inv!4252 a!3325)))

(assert (=> start!26182 true))

(declare-fun b!270480 () Bool)

(declare-datatypes ((Unit!8446 0))(
  ( (Unit!8447) )
))
(declare-fun e!174333 () Unit!8446)

(declare-fun lt!135653 () Unit!8446)

(assert (=> b!270480 (= e!174333 lt!135653)))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8446)

(assert (=> b!270480 (= lt!135653 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun lt!135652 () array!13279)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13279 (_ BitVec 32)) Bool)

(assert (=> b!270480 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!135652 mask!3868)))

(declare-fun b!270481 () Bool)

(declare-fun e!174331 () Bool)

(declare-fun e!174332 () Bool)

(assert (=> b!270481 (= e!174331 e!174332)))

(declare-fun res!134478 () Bool)

(assert (=> b!270481 (=> (not res!134478) (not e!174332))))

(assert (=> b!270481 (= res!134478 (= startIndex!26 i!1267))))

(assert (=> b!270481 (= lt!135652 (array!13280 (store (arr!6289 a!3325) i!1267 k!2581) (size!6641 a!3325)))))

(declare-fun b!270482 () Bool)

(declare-fun res!134476 () Bool)

(assert (=> b!270482 (=> (not res!134476) (not e!174334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!270482 (= res!134476 (validKeyInArray!0 k!2581))))

(declare-fun b!270483 () Bool)

(assert (=> b!270483 (= e!174332 (not (bvsle startIndex!26 (size!6641 a!3325))))))

(declare-datatypes ((SeekEntryResult!1447 0))(
  ( (MissingZero!1447 (index!7958 (_ BitVec 32))) (Found!1447 (index!7959 (_ BitVec 32))) (Intermediate!1447 (undefined!2259 Bool) (index!7960 (_ BitVec 32)) (x!26292 (_ BitVec 32))) (Undefined!1447) (MissingVacant!1447 (index!7961 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13279 (_ BitVec 32)) SeekEntryResult!1447)

(assert (=> b!270483 (= (seekEntryOrOpen!0 k!2581 lt!135652 mask!3868) (Found!1447 i!1267))))

(declare-fun lt!135655 () Unit!8446)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFinds!0 (array!13279 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!8446)

(assert (=> b!270483 (= lt!135655 (lemmaPutValidKeyAtRightPlaceThenFinds!0 a!3325 i!1267 k!2581 mask!3868))))

(declare-fun lt!135654 () Unit!8446)

(assert (=> b!270483 (= lt!135654 e!174333)))

(declare-fun c!45555 () Bool)

(assert (=> b!270483 (= c!45555 (bvslt startIndex!26 (bvsub (size!6641 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!270484 () Bool)

(assert (=> b!270484 (= e!174334 e!174331)))

(declare-fun res!134474 () Bool)

(assert (=> b!270484 (=> (not res!134474) (not e!174331))))

(declare-fun lt!135651 () SeekEntryResult!1447)

(assert (=> b!270484 (= res!134474 (or (= lt!135651 (MissingZero!1447 i!1267)) (= lt!135651 (MissingVacant!1447 i!1267))))))

(assert (=> b!270484 (= lt!135651 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!270485 () Bool)

(declare-fun res!134475 () Bool)

(assert (=> b!270485 (=> (not res!134475) (not e!174334))))

(assert (=> b!270485 (= res!134475 (and (= (size!6641 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6641 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6641 a!3325))))))

(declare-fun b!270486 () Bool)

(declare-fun res!134471 () Bool)

(assert (=> b!270486 (=> (not res!134471) (not e!174331))))

(assert (=> b!270486 (= res!134471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!270487 () Bool)

(declare-fun Unit!8448 () Unit!8446)

(assert (=> b!270487 (= e!174333 Unit!8448)))

(declare-fun b!270488 () Bool)

(declare-fun res!134472 () Bool)

(assert (=> b!270488 (=> (not res!134472) (not e!174334))))

(declare-datatypes ((List!4097 0))(
  ( (Nil!4094) (Cons!4093 (h!4760 (_ BitVec 64)) (t!9179 List!4097)) )
))
(declare-fun arrayNoDuplicates!0 (array!13279 (_ BitVec 32) List!4097) Bool)

(assert (=> b!270488 (= res!134472 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4094))))

(assert (= (and start!26182 res!134473) b!270485))

(assert (= (and b!270485 res!134475) b!270482))

(assert (= (and b!270482 res!134476) b!270488))

(assert (= (and b!270488 res!134472) b!270479))

(assert (= (and b!270479 res!134477) b!270484))

(assert (= (and b!270484 res!134474) b!270486))

(assert (= (and b!270486 res!134471) b!270481))

(assert (= (and b!270481 res!134478) b!270483))

(assert (= (and b!270483 c!45555) b!270480))

(assert (= (and b!270483 (not c!45555)) b!270487))

(declare-fun m!286083 () Bool)

(assert (=> b!270479 m!286083))

(declare-fun m!286085 () Bool)

(assert (=> b!270483 m!286085))

(declare-fun m!286087 () Bool)

(assert (=> b!270483 m!286087))

(declare-fun m!286089 () Bool)

(assert (=> b!270484 m!286089))

(declare-fun m!286091 () Bool)

(assert (=> b!270482 m!286091))

(declare-fun m!286093 () Bool)

(assert (=> start!26182 m!286093))

(declare-fun m!286095 () Bool)

(assert (=> start!26182 m!286095))

(declare-fun m!286097 () Bool)

(assert (=> b!270480 m!286097))

(declare-fun m!286099 () Bool)

(assert (=> b!270480 m!286099))

(declare-fun m!286101 () Bool)

(assert (=> b!270488 m!286101))

(declare-fun m!286103 () Bool)

(assert (=> b!270481 m!286103))

(declare-fun m!286105 () Bool)

(assert (=> b!270486 m!286105))

(push 1)

(assert (not b!270484))

(assert (not b!270480))

(assert (not b!270488))

(assert (not b!270486))

(assert (not start!26182))

(assert (not b!270479))

(assert (not b!270482))

(assert (not b!270483))

(check-sat)

(pop 1)

(push 1)

(check-sat)

