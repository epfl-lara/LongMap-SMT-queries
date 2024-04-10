; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26500 () Bool)

(assert start!26500)

(declare-fun b!275100 () Bool)

(declare-fun res!139091 () Bool)

(declare-fun e!176026 () Bool)

(assert (=> b!275100 (=> (not res!139091) (not e!176026))))

(declare-datatypes ((array!13597 0))(
  ( (array!13598 (arr!6448 (Array (_ BitVec 32) (_ BitVec 64))) (size!6800 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13597)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!275100 (= res!139091 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!139093 () Bool)

(assert (=> start!26500 (=> (not res!139093) (not e!176026))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26500 (= res!139093 (validMask!0 mask!3868))))

(assert (=> start!26500 e!176026))

(declare-fun array_inv!4411 (array!13597) Bool)

(assert (=> start!26500 (array_inv!4411 a!3325)))

(assert (=> start!26500 true))

(declare-fun b!275101 () Bool)

(declare-fun e!176027 () Bool)

(assert (=> b!275101 (= e!176026 e!176027)))

(declare-fun res!139095 () Bool)

(assert (=> b!275101 (=> (not res!139095) (not e!176027))))

(declare-datatypes ((SeekEntryResult!1606 0))(
  ( (MissingZero!1606 (index!8594 (_ BitVec 32))) (Found!1606 (index!8595 (_ BitVec 32))) (Intermediate!1606 (undefined!2418 Bool) (index!8596 (_ BitVec 32)) (x!26875 (_ BitVec 32))) (Undefined!1606) (MissingVacant!1606 (index!8597 (_ BitVec 32))) )
))
(declare-fun lt!137275 () SeekEntryResult!1606)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!275101 (= res!139095 (or (= lt!137275 (MissingZero!1606 i!1267)) (= lt!137275 (MissingVacant!1606 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13597 (_ BitVec 32)) SeekEntryResult!1606)

(assert (=> b!275101 (= lt!137275 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!275102 () Bool)

(declare-fun res!139090 () Bool)

(assert (=> b!275102 (=> (not res!139090) (not e!176026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!275102 (= res!139090 (validKeyInArray!0 k!2581))))

(declare-fun b!275103 () Bool)

(declare-fun res!139094 () Bool)

(assert (=> b!275103 (=> (not res!139094) (not e!176026))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!275103 (= res!139094 (and (= (size!6800 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6800 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6800 a!3325))))))

(declare-fun b!275104 () Bool)

(declare-fun res!139092 () Bool)

(assert (=> b!275104 (=> (not res!139092) (not e!176026))))

(declare-datatypes ((List!4256 0))(
  ( (Nil!4253) (Cons!4252 (h!4919 (_ BitVec 64)) (t!9338 List!4256)) )
))
(declare-fun arrayNoDuplicates!0 (array!13597 (_ BitVec 32) List!4256) Bool)

(assert (=> b!275104 (= res!139092 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4253))))

(declare-fun b!275105 () Bool)

(assert (=> b!275105 (= e!176027 false)))

(declare-fun lt!137274 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13597 (_ BitVec 32)) Bool)

(assert (=> b!275105 (= lt!137274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26500 res!139093) b!275103))

(assert (= (and b!275103 res!139094) b!275102))

(assert (= (and b!275102 res!139090) b!275104))

(assert (= (and b!275104 res!139092) b!275100))

(assert (= (and b!275100 res!139091) b!275101))

(assert (= (and b!275101 res!139095) b!275105))

(declare-fun m!290743 () Bool)

(assert (=> b!275104 m!290743))

(declare-fun m!290745 () Bool)

(assert (=> b!275100 m!290745))

(declare-fun m!290747 () Bool)

(assert (=> b!275102 m!290747))

(declare-fun m!290749 () Bool)

(assert (=> b!275105 m!290749))

(declare-fun m!290751 () Bool)

(assert (=> b!275101 m!290751))

(declare-fun m!290753 () Bool)

(assert (=> start!26500 m!290753))

(declare-fun m!290755 () Bool)

(assert (=> start!26500 m!290755))

(push 1)

(assert (not b!275101))

(assert (not start!26500))

(assert (not b!275100))

(assert (not b!275104))

(assert (not b!275102))

(assert (not b!275105))

(check-sat)

