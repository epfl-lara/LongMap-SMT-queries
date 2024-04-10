; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26622 () Bool)

(assert start!26622)

(declare-fun b!276378 () Bool)

(declare-fun e!176574 () Bool)

(assert (=> b!276378 (= e!176574 false)))

(declare-fun lt!137622 () Bool)

(declare-datatypes ((array!13719 0))(
  ( (array!13720 (arr!6509 (Array (_ BitVec 32) (_ BitVec 64))) (size!6861 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13719)

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13719 (_ BitVec 32)) Bool)

(assert (=> b!276378 (= lt!137622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276379 () Bool)

(declare-fun res!140369 () Bool)

(declare-fun e!176575 () Bool)

(assert (=> b!276379 (=> (not res!140369) (not e!176575))))

(declare-datatypes ((List!4317 0))(
  ( (Nil!4314) (Cons!4313 (h!4980 (_ BitVec 64)) (t!9399 List!4317)) )
))
(declare-fun arrayNoDuplicates!0 (array!13719 (_ BitVec 32) List!4317) Bool)

(assert (=> b!276379 (= res!140369 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4314))))

(declare-fun b!276380 () Bool)

(declare-fun res!140373 () Bool)

(assert (=> b!276380 (=> (not res!140373) (not e!176575))))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276380 (= res!140373 (and (= (size!6861 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6861 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6861 a!3325))))))

(declare-fun b!276381 () Bool)

(declare-fun res!140370 () Bool)

(assert (=> b!276381 (=> (not res!140370) (not e!176575))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276381 (= res!140370 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140371 () Bool)

(assert (=> start!26622 (=> (not res!140371) (not e!176575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26622 (= res!140371 (validMask!0 mask!3868))))

(assert (=> start!26622 e!176575))

(declare-fun array_inv!4472 (array!13719) Bool)

(assert (=> start!26622 (array_inv!4472 a!3325)))

(assert (=> start!26622 true))

(declare-fun b!276382 () Bool)

(assert (=> b!276382 (= e!176575 e!176574)))

(declare-fun res!140372 () Bool)

(assert (=> b!276382 (=> (not res!140372) (not e!176574))))

(declare-datatypes ((SeekEntryResult!1667 0))(
  ( (MissingZero!1667 (index!8838 (_ BitVec 32))) (Found!1667 (index!8839 (_ BitVec 32))) (Intermediate!1667 (undefined!2479 Bool) (index!8840 (_ BitVec 32)) (x!27104 (_ BitVec 32))) (Undefined!1667) (MissingVacant!1667 (index!8841 (_ BitVec 32))) )
))
(declare-fun lt!137623 () SeekEntryResult!1667)

(assert (=> b!276382 (= res!140372 (or (= lt!137623 (MissingZero!1667 i!1267)) (= lt!137623 (MissingVacant!1667 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13719 (_ BitVec 32)) SeekEntryResult!1667)

(assert (=> b!276382 (= lt!137623 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276383 () Bool)

(declare-fun res!140368 () Bool)

(assert (=> b!276383 (=> (not res!140368) (not e!176575))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276383 (= res!140368 (validKeyInArray!0 k!2581))))

(assert (= (and start!26622 res!140371) b!276380))

(assert (= (and b!276380 res!140373) b!276383))

(assert (= (and b!276383 res!140368) b!276379))

(assert (= (and b!276379 res!140369) b!276381))

(assert (= (and b!276381 res!140370) b!276382))

(assert (= (and b!276382 res!140372) b!276378))

(declare-fun m!291729 () Bool)

(assert (=> b!276383 m!291729))

(declare-fun m!291731 () Bool)

(assert (=> b!276378 m!291731))

(declare-fun m!291733 () Bool)

(assert (=> b!276379 m!291733))

(declare-fun m!291735 () Bool)

(assert (=> b!276382 m!291735))

(declare-fun m!291737 () Bool)

(assert (=> b!276381 m!291737))

(declare-fun m!291739 () Bool)

(assert (=> start!26622 m!291739))

(declare-fun m!291741 () Bool)

(assert (=> start!26622 m!291741))

(push 1)

(assert (not b!276381))

