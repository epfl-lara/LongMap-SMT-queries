; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26562 () Bool)

(assert start!26562)

(declare-fun b!275738 () Bool)

(declare-fun res!139736 () Bool)

(declare-fun e!176305 () Bool)

(assert (=> b!275738 (=> (not res!139736) (not e!176305))))

(declare-datatypes ((array!13659 0))(
  ( (array!13660 (arr!6479 (Array (_ BitVec 32) (_ BitVec 64))) (size!6831 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13659)

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275738 (= res!139736 (not (validKeyInArray!0 (select (arr!6479 a!3325) startIndex!26))))))

(declare-fun b!275739 () Bool)

(declare-fun res!139728 () Bool)

(declare-fun e!176304 () Bool)

(assert (=> b!275739 (=> (not res!139728) (not e!176304))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!275739 (= res!139728 (and (= (size!6831 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6831 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6831 a!3325))))))

(declare-fun b!275740 () Bool)

(declare-fun res!139734 () Bool)

(assert (=> b!275740 (=> (not res!139734) (not e!176305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13659 (_ BitVec 32)) Bool)

(assert (=> b!275740 (= res!139734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!275741 () Bool)

(assert (=> b!275741 (= e!176304 e!176305)))

(declare-fun res!139735 () Bool)

(assert (=> b!275741 (=> (not res!139735) (not e!176305))))

(declare-datatypes ((SeekEntryResult!1637 0))(
  ( (MissingZero!1637 (index!8718 (_ BitVec 32))) (Found!1637 (index!8719 (_ BitVec 32))) (Intermediate!1637 (undefined!2449 Bool) (index!8720 (_ BitVec 32)) (x!26994 (_ BitVec 32))) (Undefined!1637) (MissingVacant!1637 (index!8721 (_ BitVec 32))) )
))
(declare-fun lt!137461 () SeekEntryResult!1637)

(assert (=> b!275741 (= res!139735 (or (= lt!137461 (MissingZero!1637 i!1267)) (= lt!137461 (MissingVacant!1637 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13659 (_ BitVec 32)) SeekEntryResult!1637)

(assert (=> b!275741 (= lt!137461 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!139733 () Bool)

(assert (=> start!26562 (=> (not res!139733) (not e!176304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26562 (= res!139733 (validMask!0 mask!3868))))

(assert (=> start!26562 e!176304))

(declare-fun array_inv!4442 (array!13659) Bool)

(assert (=> start!26562 (array_inv!4442 a!3325)))

(assert (=> start!26562 true))

(declare-fun b!275742 () Bool)

(declare-fun res!139730 () Bool)

(assert (=> b!275742 (=> (not res!139730) (not e!176305))))

(assert (=> b!275742 (= res!139730 (not (= startIndex!26 i!1267)))))

(declare-fun b!275743 () Bool)

(assert (=> b!275743 (= e!176305 (not true))))

(assert (=> b!275743 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!13660 (store (arr!6479 a!3325) i!1267 k!2581) (size!6831 a!3325)) mask!3868)))

(declare-datatypes ((Unit!8689 0))(
  ( (Unit!8690) )
))
(declare-fun lt!137460 () Unit!8689)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!13659 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8689)

(assert (=> b!275743 (= lt!137460 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!275744 () Bool)

(declare-fun res!139732 () Bool)

(assert (=> b!275744 (=> (not res!139732) (not e!176304))))

(assert (=> b!275744 (= res!139732 (validKeyInArray!0 k!2581))))

(declare-fun b!275745 () Bool)

(declare-fun res!139737 () Bool)

(assert (=> b!275745 (=> (not res!139737) (not e!176304))))

(declare-datatypes ((List!4287 0))(
  ( (Nil!4284) (Cons!4283 (h!4950 (_ BitVec 64)) (t!9369 List!4287)) )
))
(declare-fun arrayNoDuplicates!0 (array!13659 (_ BitVec 32) List!4287) Bool)

(assert (=> b!275745 (= res!139737 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4284))))

(declare-fun b!275746 () Bool)

(declare-fun res!139729 () Bool)

(assert (=> b!275746 (=> (not res!139729) (not e!176305))))

(assert (=> b!275746 (= res!139729 (and (bvslt startIndex!26 (bvsub (size!6831 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!275747 () Bool)

(declare-fun res!139731 () Bool)

(assert (=> b!275747 (=> (not res!139731) (not e!176304))))

(declare-fun arrayContainsKey!0 (array!13659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275747 (= res!139731 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(assert (= (and start!26562 res!139733) b!275739))

(assert (= (and b!275739 res!139728) b!275744))

(assert (= (and b!275744 res!139732) b!275745))

(assert (= (and b!275745 res!139737) b!275747))

(assert (= (and b!275747 res!139731) b!275741))

(assert (= (and b!275741 res!139735) b!275740))

(assert (= (and b!275740 res!139734) b!275742))

(assert (= (and b!275742 res!139730) b!275738))

(assert (= (and b!275738 res!139736) b!275746))

(assert (= (and b!275746 res!139729) b!275743))

(declare-fun m!291237 () Bool)

(assert (=> b!275740 m!291237))

(declare-fun m!291239 () Bool)

(assert (=> b!275741 m!291239))

(declare-fun m!291241 () Bool)

(assert (=> b!275743 m!291241))

(declare-fun m!291243 () Bool)

(assert (=> b!275743 m!291243))

(declare-fun m!291245 () Bool)

(assert (=> b!275743 m!291245))

(declare-fun m!291247 () Bool)

(assert (=> b!275745 m!291247))

(declare-fun m!291249 () Bool)

(assert (=> start!26562 m!291249))

(declare-fun m!291251 () Bool)

(assert (=> start!26562 m!291251))

(declare-fun m!291253 () Bool)

(assert (=> b!275744 m!291253))

(declare-fun m!291255 () Bool)

(assert (=> b!275738 m!291255))

(assert (=> b!275738 m!291255))

(declare-fun m!291257 () Bool)

(assert (=> b!275738 m!291257))

(declare-fun m!291259 () Bool)

(assert (=> b!275747 m!291259))

(push 1)

