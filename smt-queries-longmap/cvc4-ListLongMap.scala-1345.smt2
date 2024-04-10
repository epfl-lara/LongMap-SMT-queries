; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26632 () Bool)

(assert start!26632)

(declare-fun b!276468 () Bool)

(declare-fun res!140462 () Bool)

(declare-fun e!176619 () Bool)

(assert (=> b!276468 (=> (not res!140462) (not e!176619))))

(declare-datatypes ((array!13729 0))(
  ( (array!13730 (arr!6514 (Array (_ BitVec 32) (_ BitVec 64))) (size!6866 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13729)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276468 (= res!140462 (and (= (size!6866 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6866 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6866 a!3325))))))

(declare-fun b!276469 () Bool)

(declare-fun e!176621 () Bool)

(assert (=> b!276469 (= e!176621 false)))

(declare-fun lt!137652 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13729 (_ BitVec 32)) Bool)

(assert (=> b!276469 (= lt!137652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276471 () Bool)

(declare-fun res!140459 () Bool)

(assert (=> b!276471 (=> (not res!140459) (not e!176619))))

(declare-datatypes ((List!4322 0))(
  ( (Nil!4319) (Cons!4318 (h!4985 (_ BitVec 64)) (t!9404 List!4322)) )
))
(declare-fun arrayNoDuplicates!0 (array!13729 (_ BitVec 32) List!4322) Bool)

(assert (=> b!276471 (= res!140459 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4319))))

(declare-fun b!276470 () Bool)

(declare-fun res!140461 () Bool)

(assert (=> b!276470 (=> (not res!140461) (not e!176619))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276470 (= res!140461 (validKeyInArray!0 k!2581))))

(declare-fun res!140458 () Bool)

(assert (=> start!26632 (=> (not res!140458) (not e!176619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26632 (= res!140458 (validMask!0 mask!3868))))

(assert (=> start!26632 e!176619))

(declare-fun array_inv!4477 (array!13729) Bool)

(assert (=> start!26632 (array_inv!4477 a!3325)))

(assert (=> start!26632 true))

(declare-fun b!276472 () Bool)

(declare-fun res!140460 () Bool)

(assert (=> b!276472 (=> (not res!140460) (not e!176619))))

(declare-fun arrayContainsKey!0 (array!13729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276472 (= res!140460 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276473 () Bool)

(assert (=> b!276473 (= e!176619 e!176621)))

(declare-fun res!140463 () Bool)

(assert (=> b!276473 (=> (not res!140463) (not e!176621))))

(declare-datatypes ((SeekEntryResult!1672 0))(
  ( (MissingZero!1672 (index!8858 (_ BitVec 32))) (Found!1672 (index!8859 (_ BitVec 32))) (Intermediate!1672 (undefined!2484 Bool) (index!8860 (_ BitVec 32)) (x!27117 (_ BitVec 32))) (Undefined!1672) (MissingVacant!1672 (index!8861 (_ BitVec 32))) )
))
(declare-fun lt!137653 () SeekEntryResult!1672)

(assert (=> b!276473 (= res!140463 (or (= lt!137653 (MissingZero!1672 i!1267)) (= lt!137653 (MissingVacant!1672 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13729 (_ BitVec 32)) SeekEntryResult!1672)

(assert (=> b!276473 (= lt!137653 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(assert (= (and start!26632 res!140458) b!276468))

(assert (= (and b!276468 res!140462) b!276470))

(assert (= (and b!276470 res!140461) b!276471))

(assert (= (and b!276471 res!140459) b!276472))

(assert (= (and b!276472 res!140460) b!276473))

(assert (= (and b!276473 res!140463) b!276469))

(declare-fun m!291799 () Bool)

(assert (=> b!276472 m!291799))

(declare-fun m!291801 () Bool)

(assert (=> b!276473 m!291801))

(declare-fun m!291803 () Bool)

(assert (=> start!26632 m!291803))

(declare-fun m!291805 () Bool)

(assert (=> start!26632 m!291805))

(declare-fun m!291807 () Bool)

(assert (=> b!276470 m!291807))

(declare-fun m!291809 () Bool)

(assert (=> b!276471 m!291809))

(declare-fun m!291811 () Bool)

(assert (=> b!276469 m!291811))

(push 1)

(assert (not start!26632))

(assert (not b!276473))

(assert (not b!276469))

(assert (not b!276470))

(assert (not b!276472))

(assert (not b!276471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

