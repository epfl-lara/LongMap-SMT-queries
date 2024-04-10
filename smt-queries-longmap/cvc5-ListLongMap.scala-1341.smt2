; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26604 () Bool)

(assert start!26604)

(declare-fun b!276216 () Bool)

(declare-fun res!140210 () Bool)

(declare-fun e!176495 () Bool)

(assert (=> b!276216 (=> (not res!140210) (not e!176495))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276216 (= res!140210 (validKeyInArray!0 k!2581))))

(declare-fun b!276217 () Bool)

(declare-fun res!140208 () Bool)

(assert (=> b!276217 (=> (not res!140208) (not e!176495))))

(declare-datatypes ((array!13701 0))(
  ( (array!13702 (arr!6500 (Array (_ BitVec 32) (_ BitVec 64))) (size!6852 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13701)

(declare-fun arrayContainsKey!0 (array!13701 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276217 (= res!140208 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276218 () Bool)

(declare-fun e!176493 () Bool)

(assert (=> b!276218 (= e!176495 e!176493)))

(declare-fun res!140206 () Bool)

(assert (=> b!276218 (=> (not res!140206) (not e!176493))))

(declare-datatypes ((SeekEntryResult!1658 0))(
  ( (MissingZero!1658 (index!8802 (_ BitVec 32))) (Found!1658 (index!8803 (_ BitVec 32))) (Intermediate!1658 (undefined!2470 Bool) (index!8804 (_ BitVec 32)) (x!27071 (_ BitVec 32))) (Undefined!1658) (MissingVacant!1658 (index!8805 (_ BitVec 32))) )
))
(declare-fun lt!137569 () SeekEntryResult!1658)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276218 (= res!140206 (or (= lt!137569 (MissingZero!1658 i!1267)) (= lt!137569 (MissingVacant!1658 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13701 (_ BitVec 32)) SeekEntryResult!1658)

(assert (=> b!276218 (= lt!137569 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun res!140209 () Bool)

(assert (=> start!26604 (=> (not res!140209) (not e!176495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26604 (= res!140209 (validMask!0 mask!3868))))

(assert (=> start!26604 e!176495))

(declare-fun array_inv!4463 (array!13701) Bool)

(assert (=> start!26604 (array_inv!4463 a!3325)))

(assert (=> start!26604 true))

(declare-fun b!276219 () Bool)

(declare-fun res!140211 () Bool)

(assert (=> b!276219 (=> (not res!140211) (not e!176495))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276219 (= res!140211 (and (= (size!6852 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6852 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6852 a!3325))))))

(declare-fun b!276220 () Bool)

(declare-fun res!140207 () Bool)

(assert (=> b!276220 (=> (not res!140207) (not e!176495))))

(declare-datatypes ((List!4308 0))(
  ( (Nil!4305) (Cons!4304 (h!4971 (_ BitVec 64)) (t!9390 List!4308)) )
))
(declare-fun arrayNoDuplicates!0 (array!13701 (_ BitVec 32) List!4308) Bool)

(assert (=> b!276220 (= res!140207 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4305))))

(declare-fun b!276221 () Bool)

(assert (=> b!276221 (= e!176493 false)))

(declare-fun lt!137568 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13701 (_ BitVec 32)) Bool)

(assert (=> b!276221 (= lt!137568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26604 res!140209) b!276219))

(assert (= (and b!276219 res!140211) b!276216))

(assert (= (and b!276216 res!140210) b!276220))

(assert (= (and b!276220 res!140207) b!276217))

(assert (= (and b!276217 res!140208) b!276218))

(assert (= (and b!276218 res!140206) b!276221))

(declare-fun m!291603 () Bool)

(assert (=> b!276216 m!291603))

(declare-fun m!291605 () Bool)

(assert (=> b!276221 m!291605))

(declare-fun m!291607 () Bool)

(assert (=> b!276220 m!291607))

(declare-fun m!291609 () Bool)

(assert (=> b!276218 m!291609))

(declare-fun m!291611 () Bool)

(assert (=> start!26604 m!291611))

(declare-fun m!291613 () Bool)

(assert (=> start!26604 m!291613))

(declare-fun m!291615 () Bool)

(assert (=> b!276217 m!291615))

(push 1)

