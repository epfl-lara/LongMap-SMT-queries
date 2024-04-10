; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26636 () Bool)

(assert start!26636)

(declare-fun res!140505 () Bool)

(declare-fun e!176638 () Bool)

(assert (=> start!26636 (=> (not res!140505) (not e!176638))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26636 (= res!140505 (validMask!0 mask!3868))))

(assert (=> start!26636 e!176638))

(declare-datatypes ((array!13733 0))(
  ( (array!13734 (arr!6516 (Array (_ BitVec 32) (_ BitVec 64))) (size!6868 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13733)

(declare-fun array_inv!4479 (array!13733) Bool)

(assert (=> start!26636 (array_inv!4479 a!3325)))

(assert (=> start!26636 true))

(declare-fun b!276509 () Bool)

(declare-fun res!140503 () Bool)

(assert (=> b!276509 (=> (not res!140503) (not e!176638))))

(declare-datatypes ((List!4324 0))(
  ( (Nil!4321) (Cons!4320 (h!4987 (_ BitVec 64)) (t!9406 List!4324)) )
))
(declare-fun arrayNoDuplicates!0 (array!13733 (_ BitVec 32) List!4324) Bool)

(assert (=> b!276509 (= res!140503 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4321))))

(declare-fun b!276510 () Bool)

(declare-fun res!140499 () Bool)

(assert (=> b!276510 (=> (not res!140499) (not e!176638))))

(declare-fun i!1267 () (_ BitVec 32))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276510 (= res!140499 (and (= (size!6868 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6868 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6868 a!3325))))))

(declare-fun b!276511 () Bool)

(declare-fun e!176637 () Bool)

(assert (=> b!276511 (= e!176638 e!176637)))

(declare-fun res!140500 () Bool)

(assert (=> b!276511 (=> (not res!140500) (not e!176637))))

(declare-datatypes ((SeekEntryResult!1674 0))(
  ( (MissingZero!1674 (index!8866 (_ BitVec 32))) (Found!1674 (index!8867 (_ BitVec 32))) (Intermediate!1674 (undefined!2486 Bool) (index!8868 (_ BitVec 32)) (x!27127 (_ BitVec 32))) (Undefined!1674) (MissingVacant!1674 (index!8869 (_ BitVec 32))) )
))
(declare-fun lt!137659 () SeekEntryResult!1674)

(assert (=> b!276511 (= res!140500 (or (= lt!137659 (MissingZero!1674 i!1267)) (= lt!137659 (MissingVacant!1674 i!1267))))))

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13733 (_ BitVec 32)) SeekEntryResult!1674)

(assert (=> b!276511 (= lt!137659 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276512 () Bool)

(declare-fun res!140501 () Bool)

(assert (=> b!276512 (=> (not res!140501) (not e!176638))))

(declare-fun arrayContainsKey!0 (array!13733 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276512 (= res!140501 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276513 () Bool)

(declare-fun res!140502 () Bool)

(assert (=> b!276513 (=> (not res!140502) (not e!176637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13733 (_ BitVec 32)) Bool)

(assert (=> b!276513 (= res!140502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276514 () Bool)

(declare-fun res!140504 () Bool)

(assert (=> b!276514 (=> (not res!140504) (not e!176638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276514 (= res!140504 (validKeyInArray!0 k0!2581))))

(declare-fun b!276515 () Bool)

(assert (=> b!276515 (= e!176637 (and (= startIndex!26 i!1267) (bvslt startIndex!26 (bvsub (size!6868 a!3325) #b00000000000000000000000000000001)) (bvslt (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(assert (= (and start!26636 res!140505) b!276510))

(assert (= (and b!276510 res!140499) b!276514))

(assert (= (and b!276514 res!140504) b!276509))

(assert (= (and b!276509 res!140503) b!276512))

(assert (= (and b!276512 res!140501) b!276511))

(assert (= (and b!276511 res!140500) b!276513))

(assert (= (and b!276513 res!140502) b!276515))

(declare-fun m!291827 () Bool)

(assert (=> b!276512 m!291827))

(declare-fun m!291829 () Bool)

(assert (=> b!276514 m!291829))

(declare-fun m!291831 () Bool)

(assert (=> b!276513 m!291831))

(declare-fun m!291833 () Bool)

(assert (=> start!26636 m!291833))

(declare-fun m!291835 () Bool)

(assert (=> start!26636 m!291835))

(declare-fun m!291837 () Bool)

(assert (=> b!276509 m!291837))

(declare-fun m!291839 () Bool)

(assert (=> b!276511 m!291839))

(check-sat (not start!26636) (not b!276513) (not b!276514) (not b!276512) (not b!276511) (not b!276509))
(check-sat)
