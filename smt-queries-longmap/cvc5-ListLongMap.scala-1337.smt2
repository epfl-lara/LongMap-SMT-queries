; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26580 () Bool)

(assert start!26580)

(declare-fun b!275964 () Bool)

(declare-fun res!139956 () Bool)

(declare-fun e!176386 () Bool)

(assert (=> b!275964 (=> (not res!139956) (not e!176386))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-datatypes ((array!13677 0))(
  ( (array!13678 (arr!6488 (Array (_ BitVec 32) (_ BitVec 64))) (size!6840 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13677)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275964 (= res!139956 (and (= (size!6840 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6840 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6840 a!3325))))))

(declare-fun b!275965 () Bool)

(declare-fun res!139954 () Bool)

(assert (=> b!275965 (=> (not res!139954) (not e!176386))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13677 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275965 (= res!139954 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275966 () Bool)

(declare-fun res!139959 () Bool)

(assert (=> b!275966 (=> (not res!139959) (not e!176386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275966 (= res!139959 (validKeyInArray!0 k!2581))))

(declare-fun b!275967 () Bool)

(declare-fun e!176385 () Bool)

(assert (=> b!275967 (= e!176385 false)))

(declare-fun lt!137514 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13677 (_ BitVec 32)) Bool)

(assert (=> b!275967 (= lt!137514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275968 () Bool)

(assert (=> b!275968 (= e!176386 e!176385)))

(declare-fun res!139958 () Bool)

(assert (=> b!275968 (=> (not res!139958) (not e!176385))))

(declare-datatypes ((SeekEntryResult!1646 0))(
  ( (MissingZero!1646 (index!8754 (_ BitVec 32))) (Found!1646 (index!8755 (_ BitVec 32))) (Intermediate!1646 (undefined!2458 Bool) (index!8756 (_ BitVec 32)) (x!27027 (_ BitVec 32))) (Undefined!1646) (MissingVacant!1646 (index!8757 (_ BitVec 32))) )
))
(declare-fun lt!137515 () SeekEntryResult!1646)

(assert (=> b!275968 (= res!139958 (or (= lt!137515 (MissingZero!1646 i!1267)) (= lt!137515 (MissingVacant!1646 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13677 (_ BitVec 32)) SeekEntryResult!1646)

(assert (=> b!275968 (= lt!137515 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!139957 () Bool)

(assert (=> start!26580 (=> (not res!139957) (not e!176386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26580 (= res!139957 (validMask!0 mask!3868))))

(assert (=> start!26580 e!176386))

(declare-fun array_inv!4451 (array!13677) Bool)

(assert (=> start!26580 (array_inv!4451 a!3325)))

(assert (=> start!26580 true))

(declare-fun b!275969 () Bool)

(declare-fun res!139955 () Bool)

(assert (=> b!275969 (=> (not res!139955) (not e!176386))))

(declare-datatypes ((List!4296 0))(
  ( (Nil!4293) (Cons!4292 (h!4959 (_ BitVec 64)) (t!9378 List!4296)) )
))
(declare-fun arrayNoDuplicates!0 (array!13677 (_ BitVec 32) List!4296) Bool)

(assert (=> b!275969 (= res!139955 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4293))))

(assert (= (and start!26580 res!139957) b!275964))

(assert (= (and b!275964 res!139956) b!275966))

(assert (= (and b!275966 res!139959) b!275969))

(assert (= (and b!275969 res!139955) b!275965))

(assert (= (and b!275965 res!139954) b!275968))

(assert (= (and b!275968 res!139958) b!275967))

(declare-fun m!291423 () Bool)

(assert (=> b!275965 m!291423))

(declare-fun m!291425 () Bool)

(assert (=> b!275969 m!291425))

(declare-fun m!291427 () Bool)

(assert (=> b!275968 m!291427))

(declare-fun m!291429 () Bool)

(assert (=> b!275967 m!291429))

(declare-fun m!291431 () Bool)

(assert (=> b!275966 m!291431))

(declare-fun m!291433 () Bool)

(assert (=> start!26580 m!291433))

(declare-fun m!291435 () Bool)

(assert (=> start!26580 m!291435))

(push 1)

