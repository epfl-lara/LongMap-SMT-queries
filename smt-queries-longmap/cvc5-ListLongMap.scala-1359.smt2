; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26712 () Bool)

(assert start!26712)

(declare-fun b!277358 () Bool)

(declare-fun res!141275 () Bool)

(declare-fun e!177017 () Bool)

(assert (=> b!277358 (=> (not res!141275) (not e!177017))))

(declare-datatypes ((array!13809 0))(
  ( (array!13810 (arr!6554 (Array (_ BitVec 32) (_ BitVec 64))) (size!6906 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13809)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13809 (_ BitVec 32)) Bool)

(assert (=> b!277358 (= res!141275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!277359 () Bool)

(declare-datatypes ((Unit!8737 0))(
  ( (Unit!8738) )
))
(declare-fun e!177020 () Unit!8737)

(declare-fun lt!137913 () Unit!8737)

(assert (=> b!277359 (= e!177020 lt!137913)))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13809 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8737)

(assert (=> b!277359 (= lt!137913 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> b!277359 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13810 (store (arr!6554 a!3325) i!1267 k!2581) (size!6906 a!3325)) mask!3868)))

(declare-fun b!277360 () Bool)

(declare-fun Unit!8739 () Unit!8737)

(assert (=> b!277360 (= e!177020 Unit!8739)))

(declare-fun b!277361 () Bool)

(declare-fun res!141272 () Bool)

(declare-fun e!177018 () Bool)

(assert (=> b!277361 (=> (not res!141272) (not e!177018))))

(declare-datatypes ((List!4362 0))(
  ( (Nil!4359) (Cons!4358 (h!5025 (_ BitVec 64)) (t!9444 List!4362)) )
))
(declare-fun arrayNoDuplicates!0 (array!13809 (_ BitVec 32) List!4362) Bool)

(assert (=> b!277361 (= res!141272 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4359))))

(declare-fun b!277362 () Bool)

(declare-fun res!141278 () Bool)

(assert (=> b!277362 (=> (not res!141278) (not e!177018))))

(declare-fun arrayContainsKey!0 (array!13809 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!277362 (= res!141278 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!277363 () Bool)

(declare-fun res!141274 () Bool)

(assert (=> b!277363 (=> (not res!141274) (not e!177018))))

(assert (=> b!277363 (= res!141274 (and (= (size!6906 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6906 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6906 a!3325))))))

(declare-fun b!277364 () Bool)

(declare-fun res!141277 () Bool)

(assert (=> b!277364 (=> (not res!141277) (not e!177017))))

(assert (=> b!277364 (= res!141277 (= startIndex!26 i!1267))))

(declare-fun res!141273 () Bool)

(assert (=> start!26712 (=> (not res!141273) (not e!177018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26712 (= res!141273 (validMask!0 mask!3868))))

(assert (=> start!26712 e!177018))

(declare-fun array_inv!4517 (array!13809) Bool)

(assert (=> start!26712 (array_inv!4517 a!3325)))

(assert (=> start!26712 true))

(declare-fun b!277365 () Bool)

(assert (=> b!277365 (= e!177018 e!177017)))

(declare-fun res!141279 () Bool)

(assert (=> b!277365 (=> (not res!141279) (not e!177017))))

(declare-datatypes ((SeekEntryResult!1712 0))(
  ( (MissingZero!1712 (index!9018 (_ BitVec 32))) (Found!1712 (index!9019 (_ BitVec 32))) (Intermediate!1712 (undefined!2524 Bool) (index!9020 (_ BitVec 32)) (x!27269 (_ BitVec 32))) (Undefined!1712) (MissingVacant!1712 (index!9021 (_ BitVec 32))) )
))
(declare-fun lt!137914 () SeekEntryResult!1712)

(assert (=> b!277365 (= res!141279 (or (= lt!137914 (MissingZero!1712 i!1267)) (= lt!137914 (MissingVacant!1712 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13809 (_ BitVec 32)) SeekEntryResult!1712)

(assert (=> b!277365 (= lt!137914 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!277366 () Bool)

(declare-fun res!141276 () Bool)

(assert (=> b!277366 (=> (not res!141276) (not e!177018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!277366 (= res!141276 (validKeyInArray!0 k!2581))))

(declare-fun b!277367 () Bool)

(assert (=> b!277367 (= e!177017 false)))

(declare-fun lt!137912 () Unit!8737)

(assert (=> b!277367 (= lt!137912 e!177020)))

(declare-fun c!45594 () Bool)

(assert (=> b!277367 (= c!45594 (bvslt startIndex!26 (bvsub (size!6906 a!3325) #b00000000000000000000000000000001)))))

(assert (= (and start!26712 res!141273) b!277363))

(assert (= (and b!277363 res!141274) b!277366))

(assert (= (and b!277366 res!141276) b!277361))

(assert (= (and b!277361 res!141272) b!277362))

(assert (= (and b!277362 res!141278) b!277365))

(assert (= (and b!277365 res!141279) b!277358))

(assert (= (and b!277358 res!141275) b!277364))

(assert (= (and b!277364 res!141277) b!277367))

(assert (= (and b!277367 c!45594) b!277359))

(assert (= (and b!277367 (not c!45594)) b!277360))

(declare-fun m!292431 () Bool)

(assert (=> start!26712 m!292431))

(declare-fun m!292433 () Bool)

(assert (=> start!26712 m!292433))

(declare-fun m!292435 () Bool)

(assert (=> b!277362 m!292435))

(declare-fun m!292437 () Bool)

(assert (=> b!277366 m!292437))

(declare-fun m!292439 () Bool)

(assert (=> b!277359 m!292439))

(declare-fun m!292441 () Bool)

(assert (=> b!277359 m!292441))

(declare-fun m!292443 () Bool)

(assert (=> b!277359 m!292443))

(declare-fun m!292445 () Bool)

(assert (=> b!277365 m!292445))

(declare-fun m!292447 () Bool)

(assert (=> b!277361 m!292447))

(declare-fun m!292449 () Bool)

(assert (=> b!277358 m!292449))

(push 1)

(assert (not b!277361))

(assert (not b!277366))

(assert (not b!277359))

(assert (not start!26712))

(assert (not b!277365))

(assert (not b!277358))

