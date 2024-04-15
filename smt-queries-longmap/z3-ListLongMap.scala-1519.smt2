; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28640 () Bool)

(assert start!28640)

(declare-fun b!292674 () Bool)

(declare-fun e!185114 () Bool)

(declare-fun e!185113 () Bool)

(assert (=> b!292674 (= e!185114 e!185113)))

(declare-fun res!153783 () Bool)

(assert (=> b!292674 (=> (not res!153783) (not e!185113))))

(declare-datatypes ((SeekEntryResult!2177 0))(
  ( (MissingZero!2177 (index!10878 (_ BitVec 32))) (Found!2177 (index!10879 (_ BitVec 32))) (Intermediate!2177 (undefined!2989 Bool) (index!10880 (_ BitVec 32)) (x!29079 (_ BitVec 32))) (Undefined!2177) (MissingVacant!2177 (index!10881 (_ BitVec 32))) )
))
(declare-fun lt!144915 () SeekEntryResult!2177)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292674 (= res!153783 (or (= lt!144915 (MissingZero!2177 i!1256)) (= lt!144915 (MissingVacant!2177 i!1256))))))

(declare-datatypes ((array!14812 0))(
  ( (array!14813 (arr!7029 (Array (_ BitVec 32) (_ BitVec 64))) (size!7382 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14812)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14812 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!292674 (= lt!144915 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292675 () Bool)

(declare-fun res!153785 () Bool)

(assert (=> b!292675 (=> (not res!153785) (not e!185113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14812 (_ BitVec 32)) Bool)

(assert (=> b!292675 (= res!153785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292676 () Bool)

(declare-fun res!153786 () Bool)

(assert (=> b!292676 (=> (not res!153786) (not e!185114))))

(assert (=> b!292676 (= res!153786 (and (= (size!7382 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7382 a!3312))))))

(declare-fun res!153782 () Bool)

(assert (=> start!28640 (=> (not res!153782) (not e!185114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28640 (= res!153782 (validMask!0 mask!3809))))

(assert (=> start!28640 e!185114))

(assert (=> start!28640 true))

(declare-fun array_inv!5001 (array!14812) Bool)

(assert (=> start!28640 (array_inv!5001 a!3312)))

(declare-fun b!292677 () Bool)

(declare-fun res!153784 () Bool)

(assert (=> b!292677 (=> (not res!153784) (not e!185114))))

(declare-fun arrayContainsKey!0 (array!14812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292677 (= res!153784 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292678 () Bool)

(assert (=> b!292678 (= e!185113 false)))

(declare-fun lt!144918 () (_ BitVec 32))

(declare-fun lt!144916 () SeekEntryResult!2177)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14812 (_ BitVec 32)) SeekEntryResult!2177)

(assert (=> b!292678 (= lt!144916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144918 k0!2524 (array!14813 (store (arr!7029 a!3312) i!1256 k0!2524) (size!7382 a!3312)) mask!3809))))

(declare-fun lt!144917 () SeekEntryResult!2177)

(assert (=> b!292678 (= lt!144917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144918 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292678 (= lt!144918 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292679 () Bool)

(declare-fun res!153787 () Bool)

(assert (=> b!292679 (=> (not res!153787) (not e!185114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292679 (= res!153787 (validKeyInArray!0 k0!2524))))

(assert (= (and start!28640 res!153782) b!292676))

(assert (= (and b!292676 res!153786) b!292679))

(assert (= (and b!292679 res!153787) b!292677))

(assert (= (and b!292677 res!153784) b!292674))

(assert (= (and b!292674 res!153783) b!292675))

(assert (= (and b!292675 res!153785) b!292678))

(declare-fun m!306005 () Bool)

(assert (=> b!292675 m!306005))

(declare-fun m!306007 () Bool)

(assert (=> b!292678 m!306007))

(declare-fun m!306009 () Bool)

(assert (=> b!292678 m!306009))

(declare-fun m!306011 () Bool)

(assert (=> b!292678 m!306011))

(declare-fun m!306013 () Bool)

(assert (=> b!292678 m!306013))

(declare-fun m!306015 () Bool)

(assert (=> start!28640 m!306015))

(declare-fun m!306017 () Bool)

(assert (=> start!28640 m!306017))

(declare-fun m!306019 () Bool)

(assert (=> b!292679 m!306019))

(declare-fun m!306021 () Bool)

(assert (=> b!292674 m!306021))

(declare-fun m!306023 () Bool)

(assert (=> b!292677 m!306023))

(check-sat (not b!292674) (not b!292677) (not b!292679) (not start!28640) (not b!292675) (not b!292678))
(check-sat)
