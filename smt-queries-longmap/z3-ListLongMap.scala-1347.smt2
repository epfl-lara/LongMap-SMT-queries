; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26642 () Bool)

(assert start!26642)

(declare-fun b!276567 () Bool)

(declare-fun res!140559 () Bool)

(declare-fun e!176665 () Bool)

(assert (=> b!276567 (=> (not res!140559) (not e!176665))))

(declare-datatypes ((array!13739 0))(
  ( (array!13740 (arr!6519 (Array (_ BitVec 32) (_ BitVec 64))) (size!6871 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13739)

(declare-datatypes ((List!4327 0))(
  ( (Nil!4324) (Cons!4323 (h!4990 (_ BitVec 64)) (t!9409 List!4327)) )
))
(declare-fun arrayNoDuplicates!0 (array!13739 (_ BitVec 32) List!4327) Bool)

(assert (=> b!276567 (= res!140559 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4324))))

(declare-fun b!276569 () Bool)

(declare-fun res!140561 () Bool)

(assert (=> b!276569 (=> (not res!140561) (not e!176665))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276569 (= res!140561 (validKeyInArray!0 k0!2581))))

(declare-fun b!276570 () Bool)

(declare-fun e!176666 () Bool)

(assert (=> b!276570 (= e!176665 e!176666)))

(declare-fun res!140558 () Bool)

(assert (=> b!276570 (=> (not res!140558) (not e!176666))))

(declare-datatypes ((SeekEntryResult!1677 0))(
  ( (MissingZero!1677 (index!8878 (_ BitVec 32))) (Found!1677 (index!8879 (_ BitVec 32))) (Intermediate!1677 (undefined!2489 Bool) (index!8880 (_ BitVec 32)) (x!27138 (_ BitVec 32))) (Undefined!1677) (MissingVacant!1677 (index!8881 (_ BitVec 32))) )
))
(declare-fun lt!137673 () SeekEntryResult!1677)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276570 (= res!140558 (or (= lt!137673 (MissingZero!1677 i!1267)) (= lt!137673 (MissingVacant!1677 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13739 (_ BitVec 32)) SeekEntryResult!1677)

(assert (=> b!276570 (= lt!137673 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276571 () Bool)

(declare-fun res!140560 () Bool)

(assert (=> b!276571 (=> (not res!140560) (not e!176665))))

(declare-fun arrayContainsKey!0 (array!13739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276571 (= res!140560 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276572 () Bool)

(declare-fun res!140562 () Bool)

(assert (=> b!276572 (=> (not res!140562) (not e!176665))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276572 (= res!140562 (and (= (size!6871 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6871 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6871 a!3325))))))

(declare-fun res!140557 () Bool)

(assert (=> start!26642 (=> (not res!140557) (not e!176665))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26642 (= res!140557 (validMask!0 mask!3868))))

(assert (=> start!26642 e!176665))

(declare-fun array_inv!4482 (array!13739) Bool)

(assert (=> start!26642 (array_inv!4482 a!3325)))

(assert (=> start!26642 true))

(declare-fun b!276568 () Bool)

(assert (=> b!276568 (= e!176666 false)))

(declare-fun lt!137674 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13739 (_ BitVec 32)) Bool)

(assert (=> b!276568 (= lt!137674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(assert (= (and start!26642 res!140557) b!276572))

(assert (= (and b!276572 res!140562) b!276569))

(assert (= (and b!276569 res!140561) b!276567))

(assert (= (and b!276567 res!140559) b!276571))

(assert (= (and b!276571 res!140560) b!276570))

(assert (= (and b!276570 res!140558) b!276568))

(declare-fun m!291869 () Bool)

(assert (=> b!276568 m!291869))

(declare-fun m!291871 () Bool)

(assert (=> b!276570 m!291871))

(declare-fun m!291873 () Bool)

(assert (=> start!26642 m!291873))

(declare-fun m!291875 () Bool)

(assert (=> start!26642 m!291875))

(declare-fun m!291877 () Bool)

(assert (=> b!276569 m!291877))

(declare-fun m!291879 () Bool)

(assert (=> b!276567 m!291879))

(declare-fun m!291881 () Bool)

(assert (=> b!276571 m!291881))

(check-sat (not b!276568) (not b!276570) (not b!276571) (not start!26642) (not b!276567) (not b!276569))
(check-sat)
