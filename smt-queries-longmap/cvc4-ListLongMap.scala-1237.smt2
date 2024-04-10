; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25984 () Bool)

(assert start!25984)

(declare-fun b!268126 () Bool)

(declare-fun res!132407 () Bool)

(declare-fun e!173236 () Bool)

(assert (=> b!268126 (=> (not res!132407) (not e!173236))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!268126 (= res!132407 (validKeyInArray!0 k!2581))))

(declare-fun b!268127 () Bool)

(assert (=> b!268127 (= e!173236 false)))

(declare-datatypes ((array!13081 0))(
  ( (array!13082 (arr!6190 (Array (_ BitVec 32) (_ BitVec 64))) (size!6542 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13081)

(declare-datatypes ((SeekEntryResult!1348 0))(
  ( (MissingZero!1348 (index!7562 (_ BitVec 32))) (Found!1348 (index!7563 (_ BitVec 32))) (Intermediate!1348 (undefined!2160 Bool) (index!7564 (_ BitVec 32)) (x!25929 (_ BitVec 32))) (Undefined!1348) (MissingVacant!1348 (index!7565 (_ BitVec 32))) )
))
(declare-fun lt!134791 () SeekEntryResult!1348)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13081 (_ BitVec 32)) SeekEntryResult!1348)

(assert (=> b!268127 (= lt!134791 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!268128 () Bool)

(declare-fun res!132405 () Bool)

(assert (=> b!268128 (=> (not res!132405) (not e!173236))))

(declare-datatypes ((List!3998 0))(
  ( (Nil!3995) (Cons!3994 (h!4661 (_ BitVec 64)) (t!9080 List!3998)) )
))
(declare-fun arrayNoDuplicates!0 (array!13081 (_ BitVec 32) List!3998) Bool)

(assert (=> b!268128 (= res!132405 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!3995))))

(declare-fun res!132408 () Bool)

(assert (=> start!25984 (=> (not res!132408) (not e!173236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25984 (= res!132408 (validMask!0 mask!3868))))

(assert (=> start!25984 e!173236))

(declare-fun array_inv!4153 (array!13081) Bool)

(assert (=> start!25984 (array_inv!4153 a!3325)))

(assert (=> start!25984 true))

(declare-fun b!268129 () Bool)

(declare-fun res!132406 () Bool)

(assert (=> b!268129 (=> (not res!132406) (not e!173236))))

(declare-fun arrayContainsKey!0 (array!13081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!268129 (= res!132406 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!268130 () Bool)

(declare-fun res!132404 () Bool)

(assert (=> b!268130 (=> (not res!132404) (not e!173236))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!268130 (= res!132404 (and (= (size!6542 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6542 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6542 a!3325))))))

(assert (= (and start!25984 res!132408) b!268130))

(assert (= (and b!268130 res!132404) b!268126))

(assert (= (and b!268126 res!132407) b!268128))

(assert (= (and b!268128 res!132405) b!268129))

(assert (= (and b!268129 res!132406) b!268127))

(declare-fun m!284331 () Bool)

(assert (=> b!268126 m!284331))

(declare-fun m!284333 () Bool)

(assert (=> b!268129 m!284333))

(declare-fun m!284335 () Bool)

(assert (=> b!268128 m!284335))

(declare-fun m!284337 () Bool)

(assert (=> b!268127 m!284337))

(declare-fun m!284339 () Bool)

(assert (=> start!25984 m!284339))

(declare-fun m!284341 () Bool)

(assert (=> start!25984 m!284341))

(push 1)

(assert (not b!268127))

(assert (not start!25984))

(assert (not b!268129))

(assert (not b!268126))

(assert (not b!268128))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

