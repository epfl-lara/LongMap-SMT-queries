; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26536 () Bool)

(assert start!26536)

(declare-fun b!275424 () Bool)

(declare-fun res!139414 () Bool)

(declare-fun e!176188 () Bool)

(assert (=> b!275424 (=> (not res!139414) (not e!176188))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275424 (= res!139414 (validKeyInArray!0 k!2581))))

(declare-fun res!139419 () Bool)

(assert (=> start!26536 (=> (not res!139419) (not e!176188))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26536 (= res!139419 (validMask!0 mask!3868))))

(assert (=> start!26536 e!176188))

(declare-datatypes ((array!13633 0))(
  ( (array!13634 (arr!6466 (Array (_ BitVec 32) (_ BitVec 64))) (size!6818 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13633)

(declare-fun array_inv!4429 (array!13633) Bool)

(assert (=> start!26536 (array_inv!4429 a!3325)))

(assert (=> start!26536 true))

(declare-fun b!275425 () Bool)

(declare-fun res!139418 () Bool)

(assert (=> b!275425 (=> (not res!139418) (not e!176188))))

(declare-fun arrayContainsKey!0 (array!13633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275425 (= res!139418 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275426 () Bool)

(declare-fun res!139415 () Bool)

(assert (=> b!275426 (=> (not res!139415) (not e!176188))))

(declare-datatypes ((List!4274 0))(
  ( (Nil!4271) (Cons!4270 (h!4937 (_ BitVec 64)) (t!9356 List!4274)) )
))
(declare-fun arrayNoDuplicates!0 (array!13633 (_ BitVec 32) List!4274) Bool)

(assert (=> b!275426 (= res!139415 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4271))))

(declare-fun b!275427 () Bool)

(declare-fun e!176187 () Bool)

(assert (=> b!275427 (= e!176188 e!176187)))

(declare-fun res!139416 () Bool)

(assert (=> b!275427 (=> (not res!139416) (not e!176187))))

(declare-datatypes ((SeekEntryResult!1624 0))(
  ( (MissingZero!1624 (index!8666 (_ BitVec 32))) (Found!1624 (index!8667 (_ BitVec 32))) (Intermediate!1624 (undefined!2436 Bool) (index!8668 (_ BitVec 32)) (x!26941 (_ BitVec 32))) (Undefined!1624) (MissingVacant!1624 (index!8669 (_ BitVec 32))) )
))
(declare-fun lt!137383 () SeekEntryResult!1624)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275427 (= res!139416 (or (= lt!137383 (MissingZero!1624 i!1267)) (= lt!137383 (MissingVacant!1624 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13633 (_ BitVec 32)) SeekEntryResult!1624)

(assert (=> b!275427 (= lt!137383 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275428 () Bool)

(declare-fun res!139417 () Bool)

(assert (=> b!275428 (=> (not res!139417) (not e!176188))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275428 (= res!139417 (and (= (size!6818 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6818 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6818 a!3325))))))

(declare-fun b!275429 () Bool)

(assert (=> b!275429 (= e!176187 false)))

(declare-fun lt!137382 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13633 (_ BitVec 32)) Bool)

(assert (=> b!275429 (= lt!137382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26536 res!139419) b!275428))

(assert (= (and b!275428 res!139417) b!275424))

(assert (= (and b!275424 res!139414) b!275426))

(assert (= (and b!275426 res!139415) b!275425))

(assert (= (and b!275425 res!139418) b!275427))

(assert (= (and b!275427 res!139416) b!275429))

(declare-fun m!290995 () Bool)

(assert (=> start!26536 m!290995))

(declare-fun m!290997 () Bool)

(assert (=> start!26536 m!290997))

(declare-fun m!290999 () Bool)

(assert (=> b!275427 m!290999))

(declare-fun m!291001 () Bool)

(assert (=> b!275429 m!291001))

(declare-fun m!291003 () Bool)

(assert (=> b!275425 m!291003))

(declare-fun m!291005 () Bool)

(assert (=> b!275424 m!291005))

(declare-fun m!291007 () Bool)

(assert (=> b!275426 m!291007))

(push 1)

(assert (not b!275427))

(assert (not b!275426))

(assert (not b!275425))

(assert (not b!275424))

(assert (not b!275429))

(assert (not start!26536))

