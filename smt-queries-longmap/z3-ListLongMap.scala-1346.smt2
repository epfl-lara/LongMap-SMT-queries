; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26634 () Bool)

(assert start!26634)

(declare-fun b!276535 () Bool)

(declare-fun res!140500 () Bool)

(declare-fun e!176652 () Bool)

(assert (=> b!276535 (=> (not res!140500) (not e!176652))))

(declare-datatypes ((array!13730 0))(
  ( (array!13731 (arr!6514 (Array (_ BitVec 32) (_ BitVec 64))) (size!6866 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13730)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13730 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276535 (= res!140500 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276536 () Bool)

(declare-fun res!140502 () Bool)

(assert (=> b!276536 (=> (not res!140502) (not e!176652))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(declare-fun mask!3868 () (_ BitVec 32))

(assert (=> b!276536 (= res!140502 (and (= (size!6866 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6866 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6866 a!3325))))))

(declare-fun b!276537 () Bool)

(declare-fun e!176654 () Bool)

(assert (=> b!276537 (= e!176652 e!176654)))

(declare-fun res!140501 () Bool)

(assert (=> b!276537 (=> (not res!140501) (not e!176654))))

(declare-datatypes ((SeekEntryResult!1637 0))(
  ( (MissingZero!1637 (index!8718 (_ BitVec 32))) (Found!1637 (index!8719 (_ BitVec 32))) (Intermediate!1637 (undefined!2449 Bool) (index!8720 (_ BitVec 32)) (x!27090 (_ BitVec 32))) (Undefined!1637) (MissingVacant!1637 (index!8721 (_ BitVec 32))) )
))
(declare-fun lt!137715 () SeekEntryResult!1637)

(assert (=> b!276537 (= res!140501 (or (= lt!137715 (MissingZero!1637 i!1267)) (= lt!137715 (MissingVacant!1637 i!1267))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13730 (_ BitVec 32)) SeekEntryResult!1637)

(assert (=> b!276537 (= lt!137715 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276538 () Bool)

(declare-fun res!140505 () Bool)

(assert (=> b!276538 (=> (not res!140505) (not e!176652))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276538 (= res!140505 (validKeyInArray!0 k0!2581))))

(declare-fun b!276539 () Bool)

(declare-fun res!140499 () Bool)

(assert (=> b!276539 (=> (not res!140499) (not e!176652))))

(declare-datatypes ((List!4235 0))(
  ( (Nil!4232) (Cons!4231 (h!4898 (_ BitVec 64)) (t!9309 List!4235)) )
))
(declare-fun arrayNoDuplicates!0 (array!13730 (_ BitVec 32) List!4235) Bool)

(assert (=> b!276539 (= res!140499 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4232))))

(declare-fun b!276540 () Bool)

(assert (=> b!276540 (= e!176654 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6866 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!276541 () Bool)

(declare-fun res!140504 () Bool)

(assert (=> b!276541 (=> (not res!140504) (not e!176654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13730 (_ BitVec 32)) Bool)

(assert (=> b!276541 (= res!140504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun res!140503 () Bool)

(assert (=> start!26634 (=> (not res!140503) (not e!176652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26634 (= res!140503 (validMask!0 mask!3868))))

(assert (=> start!26634 e!176652))

(declare-fun array_inv!4464 (array!13730) Bool)

(assert (=> start!26634 (array_inv!4464 a!3325)))

(assert (=> start!26634 true))

(assert (= (and start!26634 res!140503) b!276536))

(assert (= (and b!276536 res!140502) b!276538))

(assert (= (and b!276538 res!140505) b!276539))

(assert (= (and b!276539 res!140499) b!276535))

(assert (= (and b!276535 res!140500) b!276537))

(assert (= (and b!276537 res!140501) b!276541))

(assert (= (and b!276541 res!140504) b!276540))

(declare-fun m!292019 () Bool)

(assert (=> b!276539 m!292019))

(declare-fun m!292021 () Bool)

(assert (=> b!276535 m!292021))

(declare-fun m!292023 () Bool)

(assert (=> b!276538 m!292023))

(declare-fun m!292025 () Bool)

(assert (=> start!26634 m!292025))

(declare-fun m!292027 () Bool)

(assert (=> start!26634 m!292027))

(declare-fun m!292029 () Bool)

(assert (=> b!276537 m!292029))

(declare-fun m!292031 () Bool)

(assert (=> b!276541 m!292031))

(check-sat (not b!276541) (not b!276538) (not b!276537) (not start!26634) (not b!276535) (not b!276539))
(check-sat)
