; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26650 () Bool)

(assert start!26650)

(declare-fun b!276639 () Bool)

(declare-fun res!140634 () Bool)

(declare-fun e!176700 () Bool)

(assert (=> b!276639 (=> (not res!140634) (not e!176700))))

(declare-datatypes ((array!13747 0))(
  ( (array!13748 (arr!6523 (Array (_ BitVec 32) (_ BitVec 64))) (size!6875 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13747)

(declare-fun k!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13747 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276639 (= res!140634 (not (arrayContainsKey!0 a!3325 k!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276640 () Bool)

(declare-fun e!176702 () Bool)

(assert (=> b!276640 (= e!176700 e!176702)))

(declare-fun res!140629 () Bool)

(assert (=> b!276640 (=> (not res!140629) (not e!176702))))

(declare-datatypes ((SeekEntryResult!1681 0))(
  ( (MissingZero!1681 (index!8894 (_ BitVec 32))) (Found!1681 (index!8895 (_ BitVec 32))) (Intermediate!1681 (undefined!2493 Bool) (index!8896 (_ BitVec 32)) (x!27150 (_ BitVec 32))) (Undefined!1681) (MissingVacant!1681 (index!8897 (_ BitVec 32))) )
))
(declare-fun lt!137697 () SeekEntryResult!1681)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276640 (= res!140629 (or (= lt!137697 (MissingZero!1681 i!1267)) (= lt!137697 (MissingVacant!1681 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13747 (_ BitVec 32)) SeekEntryResult!1681)

(assert (=> b!276640 (= lt!137697 (seekEntryOrOpen!0 k!2581 a!3325 mask!3868))))

(declare-fun b!276641 () Bool)

(declare-fun res!140630 () Bool)

(assert (=> b!276641 (=> (not res!140630) (not e!176700))))

(declare-datatypes ((List!4331 0))(
  ( (Nil!4328) (Cons!4327 (h!4994 (_ BitVec 64)) (t!9413 List!4331)) )
))
(declare-fun arrayNoDuplicates!0 (array!13747 (_ BitVec 32) List!4331) Bool)

(assert (=> b!276641 (= res!140630 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4328))))

(declare-fun b!276642 () Bool)

(declare-fun res!140631 () Bool)

(assert (=> b!276642 (=> (not res!140631) (not e!176700))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276642 (= res!140631 (and (= (size!6875 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6875 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6875 a!3325))))))

(declare-fun b!276644 () Bool)

(declare-fun res!140632 () Bool)

(assert (=> b!276644 (=> (not res!140632) (not e!176700))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276644 (= res!140632 (validKeyInArray!0 k!2581))))

(declare-fun res!140633 () Bool)

(assert (=> start!26650 (=> (not res!140633) (not e!176700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26650 (= res!140633 (validMask!0 mask!3868))))

(assert (=> start!26650 e!176700))

(declare-fun array_inv!4486 (array!13747) Bool)

(assert (=> start!26650 (array_inv!4486 a!3325)))

(assert (=> start!26650 true))

(declare-fun b!276643 () Bool)

(assert (=> b!276643 (= e!176702 false)))

(declare-fun lt!137698 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13747 (_ BitVec 32)) Bool)

(assert (=> b!276643 (= lt!137698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26650 res!140633) b!276642))

(assert (= (and b!276642 res!140631) b!276644))

(assert (= (and b!276644 res!140632) b!276641))

(assert (= (and b!276641 res!140630) b!276639))

(assert (= (and b!276639 res!140634) b!276640))

(assert (= (and b!276640 res!140629) b!276643))

(declare-fun m!291925 () Bool)

(assert (=> b!276639 m!291925))

(declare-fun m!291927 () Bool)

(assert (=> b!276641 m!291927))

(declare-fun m!291929 () Bool)

(assert (=> b!276640 m!291929))

(declare-fun m!291931 () Bool)

(assert (=> b!276644 m!291931))

(declare-fun m!291933 () Bool)

(assert (=> b!276643 m!291933))

(declare-fun m!291935 () Bool)

(assert (=> start!26650 m!291935))

(declare-fun m!291937 () Bool)

(assert (=> start!26650 m!291937))

(push 1)

(assert (not b!276644))

(assert (not b!276643))

(assert (not start!26650))

(assert (not b!276639))

(assert (not b!276641))

(assert (not b!276640))

(check-sat)

(pop 1)

