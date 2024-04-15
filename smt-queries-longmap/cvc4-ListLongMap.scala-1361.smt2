; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26728 () Bool)

(assert start!26728)

(declare-fun b!277421 () Bool)

(declare-fun res!141352 () Bool)

(declare-fun e!177002 () Bool)

(assert (=> b!277421 (=> (not res!141352) (not e!177002))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!277421 (= res!141352 (= startIndex!26 i!1267))))

(declare-fun res!141350 () Bool)

(declare-fun e!177000 () Bool)

(assert (=> start!26728 (=> (not res!141350) (not e!177000))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26728 (= res!141350 (validMask!0 mask!3868))))

(assert (=> start!26728 e!177000))

(declare-datatypes ((array!13814 0))(
  ( (array!13815 (arr!6556 (Array (_ BitVec 32) (_ BitVec 64))) (size!6909 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13814)

(declare-fun array_inv!4528 (array!13814) Bool)

(assert (=> start!26728 (array_inv!4528 a!3325)))

(assert (=> start!26728 true))

(declare-fun b!277422 () Bool)

(declare-fun res!141347 () Bool)

(assert (=> b!277422 (=> (not res!141347) (not e!177000))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277422 (= res!141347 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277423 () Bool)

(declare-fun res!141349 () Bool)

(assert (=> b!277423 (=> (not res!141349) (not e!177002))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13814 (_ BitVec 32)) Bool)

(assert (=> b!277423 (= res!141349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277424 () Bool)

(declare-datatypes ((Unit!8712 0))(
  ( (Unit!8713) )
))
(declare-fun e!177001 () Unit!8712)

(declare-fun lt!137794 () Unit!8712)

(assert (=> b!277424 (= e!177001 lt!137794)))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13814 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8712)

(assert (=> b!277424 (= lt!137794 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277424 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13815 (store (arr!6556 a!3325) i!1267 k!2581) (size!6909 a!3325)) mask!3868)))

(declare-fun b!277425 () Bool)

(declare-fun res!141346 () Bool)

(assert (=> b!277425 (=> (not res!141346) (not e!177000))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277425 (= res!141346 (validKeyInArray!0 k!2581))))

(declare-fun b!277426 () Bool)

(declare-fun res!141345 () Bool)

(assert (=> b!277426 (=> (not res!141345) (not e!177000))))

(assert (=> b!277426 (= res!141345 (and (= (size!6909 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6909 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6909 a!3325))))))

(declare-fun b!277427 () Bool)

(assert (=> b!277427 (= e!177000 e!177002)))

(declare-fun res!141348 () Bool)

(assert (=> b!277427 (=> (not res!141348) (not e!177002))))

(declare-datatypes ((SeekEntryResult!1713 0))(
  ( (MissingZero!1713 (index!9022 (_ BitVec 32))) (Found!1713 (index!9023 (_ BitVec 32))) (Intermediate!1713 (undefined!2525 Bool) (index!9024 (_ BitVec 32)) (x!27285 (_ BitVec 32))) (Undefined!1713) (MissingVacant!1713 (index!9025 (_ BitVec 32))) )
))
(declare-fun lt!137795 () SeekEntryResult!1713)

(assert (=> b!277427 (= res!141348 (or (= lt!137795 (MissingZero!1713 i!1267)) (= lt!137795 (MissingVacant!1713 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13814 (_ BitVec 32)) SeekEntryResult!1713)

(assert (=> b!277427 (= lt!137795 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277428 () Bool)

(assert (=> b!277428 (= e!177002 false)))

(declare-fun lt!137796 () Unit!8712)

(assert (=> b!277428 (= lt!137796 e!177001)))

(declare-fun c!45589 () Bool)

(assert (=> b!277428 (= c!45589 (bvslt startIndex!26 (bvsub (size!6909 a!3325) #b00000000000000000000000000000001)))))

(declare-fun b!277429 () Bool)

(declare-fun res!141351 () Bool)

(assert (=> b!277429 (=> (not res!141351) (not e!177000))))

(declare-datatypes ((List!4337 0))(
  ( (Nil!4334) (Cons!4333 (h!5000 (_ BitVec 64)) (t!9410 List!4337)) )
))
(declare-fun arrayNoDuplicates!0 (array!13814 (_ BitVec 32) List!4337) Bool)

(assert (=> b!277429 (= res!141351 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4334))))

(declare-fun b!277430 () Bool)

(declare-fun Unit!8714 () Unit!8712)

(assert (=> b!277430 (= e!177001 Unit!8714)))

(assert (= (and start!26728 res!141350) b!277426))

(assert (= (and b!277426 res!141345) b!277425))

(assert (= (and b!277425 res!141346) b!277429))

(assert (= (and b!277429 res!141351) b!277422))

(assert (= (and b!277422 res!141347) b!277427))

(assert (= (and b!277427 res!141348) b!277423))

(assert (= (and b!277423 res!141349) b!277421))

(assert (= (and b!277421 res!141352) b!277428))

(assert (= (and b!277428 c!45589) b!277424))

(assert (= (and b!277428 (not c!45589)) b!277430))

(declare-fun m!291979 () Bool)

(assert (=> b!277422 m!291979))

(declare-fun m!291981 () Bool)

(assert (=> b!277424 m!291981))

(declare-fun m!291983 () Bool)

(assert (=> b!277424 m!291983))

(declare-fun m!291985 () Bool)

(assert (=> b!277424 m!291985))

(declare-fun m!291987 () Bool)

(assert (=> b!277429 m!291987))

(declare-fun m!291989 () Bool)

(assert (=> start!26728 m!291989))

(declare-fun m!291991 () Bool)

(assert (=> start!26728 m!291991))

(declare-fun m!291993 () Bool)

(assert (=> b!277427 m!291993))

(declare-fun m!291995 () Bool)

(assert (=> b!277425 m!291995))

(declare-fun m!291997 () Bool)

(assert (=> b!277423 m!291997))

(push 1)

(assert (not b!277425))

(assert (not start!26728))

(assert (not b!277429))

(assert (not b!277424))

(assert (not b!277423))

(assert (not b!277422))

(assert (not b!277427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

