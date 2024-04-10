; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26578 () Bool)

(assert start!26578)

(declare-fun res!139936 () Bool)

(declare-fun e!176377 () Bool)

(assert (=> start!26578 (=> (not res!139936) (not e!176377))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26578 (= res!139936 (validMask!0 mask!3868))))

(assert (=> start!26578 e!176377))

(declare-datatypes ((array!13675 0))(
  ( (array!13676 (arr!6487 (Array (_ BitVec 32) (_ BitVec 64))) (size!6839 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13675)

(declare-fun array_inv!4450 (array!13675) Bool)

(assert (=> start!26578 (array_inv!4450 a!3325)))

(assert (=> start!26578 true))

(declare-fun b!275946 () Bool)

(declare-fun res!139941 () Bool)

(assert (=> b!275946 (=> (not res!139941) (not e!176377))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275946 (= res!139941 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!275947 () Bool)

(declare-fun res!139937 () Bool)

(assert (=> b!275947 (=> (not res!139937) (not e!176377))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275947 (= res!139937 (and (= (size!6839 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6839 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6839 a!3325))))))

(declare-fun b!275948 () Bool)

(declare-fun res!139938 () Bool)

(assert (=> b!275948 (=> (not res!139938) (not e!176377))))

(declare-datatypes ((List!4295 0))(
  ( (Nil!4292) (Cons!4291 (h!4958 (_ BitVec 64)) (t!9377 List!4295)) )
))
(declare-fun arrayNoDuplicates!0 (array!13675 (_ BitVec 32) List!4295) Bool)

(assert (=> b!275948 (= res!139938 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4292))))

(declare-fun b!275949 () Bool)

(declare-fun e!176378 () Bool)

(assert (=> b!275949 (= e!176378 false)))

(declare-fun lt!137508 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13675 (_ BitVec 32)) Bool)

(assert (=> b!275949 (= lt!137508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275950 () Bool)

(assert (=> b!275950 (= e!176377 e!176378)))

(declare-fun res!139940 () Bool)

(assert (=> b!275950 (=> (not res!139940) (not e!176378))))

(declare-datatypes ((SeekEntryResult!1645 0))(
  ( (MissingZero!1645 (index!8750 (_ BitVec 32))) (Found!1645 (index!8751 (_ BitVec 32))) (Intermediate!1645 (undefined!2457 Bool) (index!8752 (_ BitVec 32)) (x!27018 (_ BitVec 32))) (Undefined!1645) (MissingVacant!1645 (index!8753 (_ BitVec 32))) )
))
(declare-fun lt!137509 () SeekEntryResult!1645)

(assert (=> b!275950 (= res!139940 (or (= lt!137509 (MissingZero!1645 i!1267)) (= lt!137509 (MissingVacant!1645 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13675 (_ BitVec 32)) SeekEntryResult!1645)

(assert (=> b!275950 (= lt!137509 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275951 () Bool)

(declare-fun res!139939 () Bool)

(assert (=> b!275951 (=> (not res!139939) (not e!176377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275951 (= res!139939 (validKeyInArray!0 k!2581))))

(assert (= (and start!26578 res!139936) b!275947))

(assert (= (and b!275947 res!139937) b!275951))

(assert (= (and b!275951 res!139939) b!275948))

(assert (= (and b!275948 res!139938) b!275946))

(assert (= (and b!275946 res!139941) b!275950))

(assert (= (and b!275950 res!139940) b!275949))

(declare-fun m!291409 () Bool)

(assert (=> b!275948 m!291409))

(declare-fun m!291411 () Bool)

(assert (=> b!275946 m!291411))

(declare-fun m!291413 () Bool)

(assert (=> b!275950 m!291413))

(declare-fun m!291415 () Bool)

(assert (=> b!275949 m!291415))

(declare-fun m!291417 () Bool)

(assert (=> b!275951 m!291417))

(declare-fun m!291419 () Bool)

(assert (=> start!26578 m!291419))

(declare-fun m!291421 () Bool)

(assert (=> start!26578 m!291421))

(push 1)

(assert (not b!275948))

(assert (not b!275951))

(assert (not b!275950))

(assert (not b!275949))

(assert (not b!275946))

(assert (not start!26578))

(check-sat)

