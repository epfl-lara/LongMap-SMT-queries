; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26010 () Bool)

(assert start!26010)

(declare-fun b!268352 () Bool)

(declare-fun res!132635 () Bool)

(declare-fun e!173343 () Bool)

(assert (=> b!268352 (=> (not res!132635) (not e!173343))))

(declare-datatypes ((array!13107 0))(
  ( (array!13108 (arr!6203 (Array (_ BitVec 32) (_ BitVec 64))) (size!6555 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13107)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13107 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268352 (= res!132635 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!132631 () Bool)

(assert (=> start!26010 (=> (not res!132631) (not e!173343))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26010 (= res!132631 (validMask!0 mask!3868))))

(assert (=> start!26010 e!173343))

(declare-fun array_inv!4166 (array!13107) Bool)

(assert (=> start!26010 (array_inv!4166 a!3325)))

(assert (=> start!26010 true))

(declare-fun b!268353 () Bool)

(declare-fun res!132633 () Bool)

(assert (=> b!268353 (=> (not res!132633) (not e!173343))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268353 (= res!132633 (and (= (size!6555 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6555 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6555 a!3325))))))

(declare-fun b!268354 () Bool)

(declare-fun e!173345 () Bool)

(assert (=> b!268354 (= e!173345 (bvsgt #b00000000000000000000000000000000 (size!6555 a!3325)))))

(declare-fun b!268355 () Bool)

(declare-fun res!132636 () Bool)

(assert (=> b!268355 (=> (not res!132636) (not e!173345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13107 (_ BitVec 32)) Bool)

(assert (=> b!268355 (= res!132636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!268356 () Bool)

(assert (=> b!268356 (= e!173343 e!173345)))

(declare-fun res!132634 () Bool)

(assert (=> b!268356 (=> (not res!132634) (not e!173345))))

(declare-datatypes ((SeekEntryResult!1361 0))(
  ( (MissingZero!1361 (index!7614 (_ BitVec 32))) (Found!1361 (index!7615 (_ BitVec 32))) (Intermediate!1361 (undefined!2173 Bool) (index!7616 (_ BitVec 32)) (x!25982 (_ BitVec 32))) (Undefined!1361) (MissingVacant!1361 (index!7617 (_ BitVec 32))) )
))
(declare-fun lt!134857 () SeekEntryResult!1361)

(assert (=> b!268356 (= res!132634 (or (= lt!134857 (MissingZero!1361 i!1267)) (= lt!134857 (MissingVacant!1361 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13107 (_ BitVec 32)) SeekEntryResult!1361)

(assert (=> b!268356 (= lt!134857 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268357 () Bool)

(declare-fun res!132632 () Bool)

(assert (=> b!268357 (=> (not res!132632) (not e!173343))))

(declare-datatypes ((List!4011 0))(
  ( (Nil!4008) (Cons!4007 (h!4674 (_ BitVec 64)) (t!9093 List!4011)) )
))
(declare-fun arrayNoDuplicates!0 (array!13107 (_ BitVec 32) List!4011) Bool)

(assert (=> b!268357 (= res!132632 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4008))))

(declare-fun b!268358 () Bool)

(declare-fun res!132630 () Bool)

(assert (=> b!268358 (=> (not res!132630) (not e!173343))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268358 (= res!132630 (validKeyInArray!0 k!2581))))

(assert (= (and start!26010 res!132631) b!268353))

(assert (= (and b!268353 res!132633) b!268358))

(assert (= (and b!268358 res!132630) b!268357))

(assert (= (and b!268357 res!132632) b!268352))

(assert (= (and b!268352 res!132635) b!268356))

(assert (= (and b!268356 res!132634) b!268355))

(assert (= (and b!268355 res!132636) b!268354))

(declare-fun m!284505 () Bool)

(assert (=> b!268355 m!284505))

(declare-fun m!284507 () Bool)

(assert (=> b!268358 m!284507))

(declare-fun m!284509 () Bool)

(assert (=> b!268357 m!284509))

(declare-fun m!284511 () Bool)

(assert (=> start!26010 m!284511))

(declare-fun m!284513 () Bool)

(assert (=> start!26010 m!284513))

(declare-fun m!284515 () Bool)

(assert (=> b!268352 m!284515))

(declare-fun m!284517 () Bool)

(assert (=> b!268356 m!284517))

(push 1)

