; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26452 () Bool)

(assert start!26452)

(declare-fun b!274379 () Bool)

(declare-fun res!138429 () Bool)

(declare-fun e!175656 () Bool)

(assert (=> b!274379 (=> (not res!138429) (not e!175656))))

(declare-datatypes ((array!13538 0))(
  ( (array!13539 (arr!6418 (Array (_ BitVec 32) (_ BitVec 64))) (size!6771 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13538)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13538 (_ BitVec 32)) Bool)

(assert (=> b!274379 (= res!138429 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!274380 () Bool)

(declare-fun e!175658 () Bool)

(declare-fun e!175659 () Bool)

(assert (=> b!274380 (= e!175658 (not e!175659))))

(declare-fun res!138422 () Bool)

(assert (=> b!274380 (=> res!138422 e!175659)))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!274380 (= res!138422 (or (bvsge startIndex!26 (bvsub (size!6771 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (=> b!274380 (arrayForallSeekEntryOrOpenFound!0 startIndex!26 a!3325 mask!3868)))

(declare-datatypes ((Unit!8603 0))(
  ( (Unit!8604) )
))
(declare-fun lt!136821 () Unit!8603)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!13538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!274380 (= lt!136821 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3325 mask!3868 #b00000000000000000000000000000000 startIndex!26))))

(declare-fun lt!136819 () array!13538)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1575 0))(
  ( (MissingZero!1575 (index!8470 (_ BitVec 32))) (Found!1575 (index!8471 (_ BitVec 32))) (Intermediate!1575 (undefined!2387 Bool) (index!8472 (_ BitVec 32)) (x!26779 (_ BitVec 32))) (Undefined!1575) (MissingVacant!1575 (index!8473 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13538 (_ BitVec 32)) SeekEntryResult!1575)

(assert (=> b!274380 (= (seekEntryOrOpen!0 (select (arr!6418 a!3325) startIndex!26) a!3325 mask!3868) (seekEntryOrOpen!0 (select (store (arr!6418 a!3325) i!1267 k!2581) startIndex!26) lt!136819 mask!3868))))

(declare-fun lt!136823 () Unit!8603)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 (array!13538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!274380 (= lt!136823 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2!0 a!3325 i!1267 k!2581 startIndex!26 mask!3868))))

(declare-datatypes ((List!4199 0))(
  ( (Nil!4196) (Cons!4195 (h!4862 (_ BitVec 64)) (t!9272 List!4199)) )
))
(declare-fun arrayNoDuplicates!0 (array!13538 (_ BitVec 32) List!4199) Bool)

(assert (=> b!274380 (arrayNoDuplicates!0 lt!136819 #b00000000000000000000000000000000 Nil!4196)))

(declare-fun lt!136820 () Unit!8603)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!13538 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!4199) Unit!8603)

(assert (=> b!274380 (= lt!136820 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!3325 k!2581 i!1267 #b00000000000000000000000000000000 Nil!4196))))

(declare-fun b!274381 () Bool)

(assert (=> b!274381 (= e!175656 e!175658)))

(declare-fun res!138430 () Bool)

(assert (=> b!274381 (=> (not res!138430) (not e!175658))))

(assert (=> b!274381 (= res!138430 (not (= startIndex!26 i!1267)))))

(assert (=> b!274381 (= lt!136819 (array!13539 (store (arr!6418 a!3325) i!1267 k!2581) (size!6771 a!3325)))))

(declare-fun b!274382 () Bool)

(declare-fun res!138427 () Bool)

(declare-fun e!175655 () Bool)

(assert (=> b!274382 (=> (not res!138427) (not e!175655))))

(assert (=> b!274382 (= res!138427 (and (= (size!6771 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6771 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6771 a!3325))))))

(declare-fun b!274383 () Bool)

(declare-fun res!138425 () Bool)

(assert (=> b!274383 (=> (not res!138425) (not e!175655))))

(declare-fun arrayContainsKey!0 (array!13538 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!274383 (= res!138425 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!138423 () Bool)

(assert (=> start!26452 (=> (not res!138423) (not e!175655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26452 (= res!138423 (validMask!0 mask!3868))))

(assert (=> start!26452 e!175655))

(declare-fun array_inv!4390 (array!13538) Bool)

(assert (=> start!26452 (array_inv!4390 a!3325)))

(assert (=> start!26452 true))

(declare-fun b!274384 () Bool)

(assert (=> b!274384 (= e!175659 (bvsle startIndex!26 (size!6771 a!3325)))))

(assert (=> b!274384 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!136819 mask!3868)))

(declare-fun lt!136824 () Unit!8603)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13538 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8603)

(assert (=> b!274384 (= lt!136824 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!274385 () Bool)

(assert (=> b!274385 (= e!175655 e!175656)))

(declare-fun res!138424 () Bool)

(assert (=> b!274385 (=> (not res!138424) (not e!175656))))

(declare-fun lt!136822 () SeekEntryResult!1575)

(assert (=> b!274385 (= res!138424 (or (= lt!136822 (MissingZero!1575 i!1267)) (= lt!136822 (MissingVacant!1575 i!1267))))))

(assert (=> b!274385 (= lt!136822 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!274386 () Bool)

(declare-fun res!138421 () Bool)

(assert (=> b!274386 (=> (not res!138421) (not e!175658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!274386 (= res!138421 (validKeyInArray!0 (select (arr!6418 a!3325) startIndex!26)))))

(declare-fun b!274387 () Bool)

(declare-fun res!138428 () Bool)

(assert (=> b!274387 (=> (not res!138428) (not e!175655))))

(assert (=> b!274387 (= res!138428 (validKeyInArray!0 k!2581))))

(declare-fun b!274388 () Bool)

(declare-fun res!138426 () Bool)

(assert (=> b!274388 (=> (not res!138426) (not e!175655))))

(assert (=> b!274388 (= res!138426 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4196))))

(assert (= (and start!26452 res!138423) b!274382))

(assert (= (and b!274382 res!138427) b!274387))

(assert (= (and b!274387 res!138428) b!274388))

(assert (= (and b!274388 res!138426) b!274383))

(assert (= (and b!274383 res!138425) b!274385))

(assert (= (and b!274385 res!138424) b!274379))

(assert (= (and b!274379 res!138429) b!274381))

(assert (= (and b!274381 res!138430) b!274386))

(assert (= (and b!274386 res!138421) b!274380))

(assert (= (and b!274380 (not res!138422)) b!274384))

(declare-fun m!289485 () Bool)

(assert (=> b!274383 m!289485))

(declare-fun m!289487 () Bool)

(assert (=> start!26452 m!289487))

(declare-fun m!289489 () Bool)

(assert (=> start!26452 m!289489))

(declare-fun m!289491 () Bool)

(assert (=> b!274380 m!289491))

(declare-fun m!289493 () Bool)

(assert (=> b!274380 m!289493))

(assert (=> b!274380 m!289493))

(declare-fun m!289495 () Bool)

(assert (=> b!274380 m!289495))

(declare-fun m!289497 () Bool)

(assert (=> b!274380 m!289497))

(declare-fun m!289499 () Bool)

(assert (=> b!274380 m!289499))

(declare-fun m!289501 () Bool)

(assert (=> b!274380 m!289501))

(declare-fun m!289503 () Bool)

(assert (=> b!274380 m!289503))

(declare-fun m!289505 () Bool)

(assert (=> b!274380 m!289505))

(declare-fun m!289507 () Bool)

(assert (=> b!274380 m!289507))

(assert (=> b!274380 m!289501))

(declare-fun m!289509 () Bool)

(assert (=> b!274380 m!289509))

(declare-fun m!289511 () Bool)

(assert (=> b!274379 m!289511))

(declare-fun m!289513 () Bool)

(assert (=> b!274387 m!289513))

(assert (=> b!274381 m!289497))

(assert (=> b!274386 m!289501))

(assert (=> b!274386 m!289501))

(declare-fun m!289515 () Bool)

(assert (=> b!274386 m!289515))

(declare-fun m!289517 () Bool)

(assert (=> b!274385 m!289517))

(declare-fun m!289519 () Bool)

(assert (=> b!274384 m!289519))

(declare-fun m!289521 () Bool)

(assert (=> b!274384 m!289521))

(declare-fun m!289523 () Bool)

(assert (=> b!274388 m!289523))

(push 1)

(assert (not b!274384))

(assert (not b!274379))

(assert (not b!274388))

(assert (not b!274380))

(assert (not b!274386))

(assert (not b!274387))

(assert (not start!26452))

(assert (not b!274383))

(assert (not b!274385))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

