; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26638 () Bool)

(assert start!26638)

(declare-fun b!276530 () Bool)

(declare-fun res!140522 () Bool)

(declare-fun e!176646 () Bool)

(assert (=> b!276530 (=> (not res!140522) (not e!176646))))

(declare-datatypes ((array!13735 0))(
  ( (array!13736 (arr!6517 (Array (_ BitVec 32) (_ BitVec 64))) (size!6869 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13735)

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276530 (= res!140522 (and (= (size!6869 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6869 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6869 a!3325))))))

(declare-fun b!276531 () Bool)

(declare-fun e!176648 () Bool)

(assert (=> b!276531 (= e!176646 e!176648)))

(declare-fun res!140520 () Bool)

(assert (=> b!276531 (=> (not res!140520) (not e!176648))))

(declare-datatypes ((SeekEntryResult!1675 0))(
  ( (MissingZero!1675 (index!8870 (_ BitVec 32))) (Found!1675 (index!8871 (_ BitVec 32))) (Intermediate!1675 (undefined!2487 Bool) (index!8872 (_ BitVec 32)) (x!27128 (_ BitVec 32))) (Undefined!1675) (MissingVacant!1675 (index!8873 (_ BitVec 32))) )
))
(declare-fun lt!137662 () SeekEntryResult!1675)

(assert (=> b!276531 (= res!140520 (or (= lt!137662 (MissingZero!1675 i!1267)) (= lt!137662 (MissingVacant!1675 i!1267))))))

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13735 (_ BitVec 32)) SeekEntryResult!1675)

(assert (=> b!276531 (= lt!137662 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276532 () Bool)

(declare-fun res!140523 () Bool)

(assert (=> b!276532 (=> (not res!140523) (not e!176646))))

(declare-datatypes ((List!4325 0))(
  ( (Nil!4322) (Cons!4321 (h!4988 (_ BitVec 64)) (t!9407 List!4325)) )
))
(declare-fun arrayNoDuplicates!0 (array!13735 (_ BitVec 32) List!4325) Bool)

(assert (=> b!276532 (= res!140523 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4322))))

(declare-fun b!276533 () Bool)

(declare-fun res!140521 () Bool)

(assert (=> b!276533 (=> (not res!140521) (not e!176646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276533 (= res!140521 (validKeyInArray!0 k!2581))))

(declare-fun b!276534 () Bool)

(declare-fun res!140524 () Bool)

(assert (=> b!276534 (=> (not res!140524) (not e!176646))))

(declare-fun arrayContainsKey!0 (array!13735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276534 (= res!140524 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun res!140526 () Bool)

(assert (=> start!26638 (=> (not res!140526) (not e!176646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26638 (= res!140526 (validMask!0 mask!3868))))

(assert (=> start!26638 e!176646))

(declare-fun array_inv!4480 (array!13735) Bool)

(assert (=> start!26638 (array_inv!4480 a!3325)))

(assert (=> start!26638 true))

(declare-fun b!276535 () Bool)

(assert (=> b!276535 (= e!176648 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6869 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!276536 () Bool)

(declare-fun res!140525 () Bool)

(assert (=> b!276536 (=> (not res!140525) (not e!176648))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13735 (_ BitVec 32)) Bool)

(assert (=> b!276536 (= res!140525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26638 res!140526) b!276530))

(assert (= (and b!276530 res!140522) b!276533))

(assert (= (and b!276533 res!140521) b!276532))

(assert (= (and b!276532 res!140523) b!276534))

(assert (= (and b!276534 res!140524) b!276531))

(assert (= (and b!276531 res!140520) b!276536))

(assert (= (and b!276536 res!140525) b!276535))

(declare-fun m!291841 () Bool)

(assert (=> b!276531 m!291841))

(declare-fun m!291843 () Bool)

(assert (=> b!276534 m!291843))

(declare-fun m!291845 () Bool)

(assert (=> b!276532 m!291845))

(declare-fun m!291847 () Bool)

(assert (=> b!276536 m!291847))

(declare-fun m!291849 () Bool)

(assert (=> start!26638 m!291849))

(declare-fun m!291851 () Bool)

(assert (=> start!26638 m!291851))

(declare-fun m!291853 () Bool)

(assert (=> b!276533 m!291853))

(push 1)

(assert (not b!276532))

(assert (not start!26638))

(assert (not b!276533))

(assert (not b!276534))

(assert (not b!276536))

(assert (not b!276531))

(check-sat)

(pop 1)

