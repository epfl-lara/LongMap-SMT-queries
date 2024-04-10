; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26596 () Bool)

(assert start!26596)

(declare-fun b!276132 () Bool)

(declare-fun e!176459 () Bool)

(declare-fun e!176457 () Bool)

(assert (=> b!276132 (= e!176459 e!176457)))

(declare-fun res!140126 () Bool)

(assert (=> b!276132 (=> (not res!140126) (not e!176457))))

(declare-datatypes ((SeekEntryResult!1654 0))(
  ( (MissingZero!1654 (index!8786 (_ BitVec 32))) (Found!1654 (index!8787 (_ BitVec 32))) (Intermediate!1654 (undefined!2466 Bool) (index!8788 (_ BitVec 32)) (x!27051 (_ BitVec 32))) (Undefined!1654) (MissingVacant!1654 (index!8789 (_ BitVec 32))) )
))
(declare-fun lt!137554 () SeekEntryResult!1654)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276132 (= res!140126 (or (= lt!137554 (MissingZero!1654 i!1267)) (= lt!137554 (MissingVacant!1654 i!1267))))))

(declare-datatypes ((array!13693 0))(
  ( (array!13694 (arr!6496 (Array (_ BitVec 32) (_ BitVec 64))) (size!6848 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13693)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13693 (_ BitVec 32)) SeekEntryResult!1654)

(assert (=> b!276132 (= lt!137554 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276133 () Bool)

(declare-fun res!140127 () Bool)

(assert (=> b!276133 (=> (not res!140127) (not e!176459))))

(declare-datatypes ((List!4304 0))(
  ( (Nil!4301) (Cons!4300 (h!4967 (_ BitVec 64)) (t!9386 List!4304)) )
))
(declare-fun arrayNoDuplicates!0 (array!13693 (_ BitVec 32) List!4304) Bool)

(assert (=> b!276133 (= res!140127 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4301))))

(declare-fun b!276134 () Bool)

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276134 (= e!176457 (and (bvsge startIndex!26 (bvsub (size!6848 a!3325) #b00000000000000000000000000000001)) (bvsgt startIndex!26 (size!6848 a!3325))))))

(declare-fun res!140122 () Bool)

(assert (=> start!26596 (=> (not res!140122) (not e!176459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26596 (= res!140122 (validMask!0 mask!3868))))

(assert (=> start!26596 e!176459))

(declare-fun array_inv!4459 (array!13693) Bool)

(assert (=> start!26596 (array_inv!4459 a!3325)))

(assert (=> start!26596 true))

(declare-fun b!276135 () Bool)

(declare-fun res!140124 () Bool)

(assert (=> b!276135 (=> (not res!140124) (not e!176457))))

(assert (=> b!276135 (= res!140124 (not (= startIndex!26 i!1267)))))

(declare-fun b!276136 () Bool)

(declare-fun res!140125 () Bool)

(assert (=> b!276136 (=> (not res!140125) (not e!176459))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276136 (= res!140125 (validKeyInArray!0 k!2581))))

(declare-fun b!276137 () Bool)

(declare-fun res!140128 () Bool)

(assert (=> b!276137 (=> (not res!140128) (not e!176459))))

(assert (=> b!276137 (= res!140128 (and (= (size!6848 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6848 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6848 a!3325))))))

(declare-fun b!276138 () Bool)

(declare-fun res!140129 () Bool)

(assert (=> b!276138 (=> (not res!140129) (not e!176459))))

(declare-fun arrayContainsKey!0 (array!13693 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276138 (= res!140129 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276139 () Bool)

(declare-fun res!140123 () Bool)

(assert (=> b!276139 (=> (not res!140123) (not e!176457))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13693 (_ BitVec 32)) Bool)

(assert (=> b!276139 (= res!140123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276140 () Bool)

(declare-fun res!140130 () Bool)

(assert (=> b!276140 (=> (not res!140130) (not e!176457))))

(assert (=> b!276140 (= res!140130 (not (validKeyInArray!0 (select (arr!6496 a!3325) startIndex!26))))))

(assert (= (and start!26596 res!140122) b!276137))

(assert (= (and b!276137 res!140128) b!276136))

(assert (= (and b!276136 res!140125) b!276133))

(assert (= (and b!276133 res!140127) b!276138))

(assert (= (and b!276138 res!140129) b!276132))

(assert (= (and b!276132 res!140126) b!276139))

(assert (= (and b!276139 res!140123) b!276135))

(assert (= (and b!276135 res!140124) b!276140))

(assert (= (and b!276140 res!140130) b!276134))

(declare-fun m!291543 () Bool)

(assert (=> start!26596 m!291543))

(declare-fun m!291545 () Bool)

(assert (=> start!26596 m!291545))

(declare-fun m!291547 () Bool)

(assert (=> b!276133 m!291547))

(declare-fun m!291549 () Bool)

(assert (=> b!276138 m!291549))

(declare-fun m!291551 () Bool)

(assert (=> b!276140 m!291551))

(assert (=> b!276140 m!291551))

(declare-fun m!291553 () Bool)

(assert (=> b!276140 m!291553))

(declare-fun m!291555 () Bool)

(assert (=> b!276132 m!291555))

(declare-fun m!291557 () Bool)

(assert (=> b!276136 m!291557))

(declare-fun m!291559 () Bool)

(assert (=> b!276139 m!291559))

(push 1)

(assert (not b!276139))

(assert (not b!276132))

(assert (not start!26596))

(assert (not b!276133))

(assert (not b!276136))

(assert (not b!276138))

(assert (not b!276140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

