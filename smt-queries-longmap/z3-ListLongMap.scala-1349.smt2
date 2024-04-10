; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!26654 () Bool)

(assert start!26654)

(declare-fun b!276675 () Bool)

(declare-fun res!140665 () Bool)

(declare-fun e!176720 () Bool)

(assert (=> b!276675 (=> (not res!140665) (not e!176720))))

(declare-datatypes ((array!13751 0))(
  ( (array!13752 (arr!6525 (Array (_ BitVec 32) (_ BitVec 64))) (size!6877 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!13751)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!13751 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!276675 (= res!140665 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!276676 () Bool)

(declare-fun e!176718 () Bool)

(assert (=> b!276676 (= e!176720 e!176718)))

(declare-fun res!140668 () Bool)

(assert (=> b!276676 (=> (not res!140668) (not e!176718))))

(declare-datatypes ((SeekEntryResult!1683 0))(
  ( (MissingZero!1683 (index!8902 (_ BitVec 32))) (Found!1683 (index!8903 (_ BitVec 32))) (Intermediate!1683 (undefined!2495 Bool) (index!8904 (_ BitVec 32)) (x!27160 (_ BitVec 32))) (Undefined!1683) (MissingVacant!1683 (index!8905 (_ BitVec 32))) )
))
(declare-fun lt!137710 () SeekEntryResult!1683)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!276676 (= res!140668 (or (= lt!137710 (MissingZero!1683 i!1267)) (= lt!137710 (MissingVacant!1683 i!1267))))))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!13751 (_ BitVec 32)) SeekEntryResult!1683)

(assert (=> b!276676 (= lt!137710 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!276677 () Bool)

(declare-fun res!140669 () Bool)

(assert (=> b!276677 (=> (not res!140669) (not e!176720))))

(declare-datatypes ((List!4333 0))(
  ( (Nil!4330) (Cons!4329 (h!4996 (_ BitVec 64)) (t!9415 List!4333)) )
))
(declare-fun arrayNoDuplicates!0 (array!13751 (_ BitVec 32) List!4333) Bool)

(assert (=> b!276677 (= res!140669 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4330))))

(declare-fun res!140670 () Bool)

(assert (=> start!26654 (=> (not res!140670) (not e!176720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!26654 (= res!140670 (validMask!0 mask!3868))))

(assert (=> start!26654 e!176720))

(declare-fun array_inv!4488 (array!13751) Bool)

(assert (=> start!26654 (array_inv!4488 a!3325)))

(assert (=> start!26654 true))

(declare-fun b!276678 () Bool)

(declare-fun res!140666 () Bool)

(assert (=> b!276678 (=> (not res!140666) (not e!176720))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!276678 (= res!140666 (and (= (size!6877 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!6877 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!6877 a!3325))))))

(declare-fun b!276679 () Bool)

(assert (=> b!276679 (= e!176718 false)))

(declare-fun lt!137709 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!13751 (_ BitVec 32)) Bool)

(assert (=> b!276679 (= lt!137709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!276680 () Bool)

(declare-fun res!140667 () Bool)

(assert (=> b!276680 (=> (not res!140667) (not e!176720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!276680 (= res!140667 (validKeyInArray!0 k0!2581))))

(assert (= (and start!26654 res!140670) b!276678))

(assert (= (and b!276678 res!140666) b!276680))

(assert (= (and b!276680 res!140667) b!276677))

(assert (= (and b!276677 res!140669) b!276675))

(assert (= (and b!276675 res!140665) b!276676))

(assert (= (and b!276676 res!140668) b!276679))

(declare-fun m!291953 () Bool)

(assert (=> b!276677 m!291953))

(declare-fun m!291955 () Bool)

(assert (=> start!26654 m!291955))

(declare-fun m!291957 () Bool)

(assert (=> start!26654 m!291957))

(declare-fun m!291959 () Bool)

(assert (=> b!276680 m!291959))

(declare-fun m!291961 () Bool)

(assert (=> b!276676 m!291961))

(declare-fun m!291963 () Bool)

(assert (=> b!276675 m!291963))

(declare-fun m!291965 () Bool)

(assert (=> b!276679 m!291965))

(check-sat (not b!276680) (not b!276675) (not start!26654) (not b!276676) (not b!276677) (not b!276679))
(check-sat)
