; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28652 () Bool)

(assert start!28652)

(declare-fun b!292893 () Bool)

(declare-fun e!185252 () Bool)

(assert (=> b!292893 (= e!185252 false)))

(declare-fun lt!145147 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2187 0))(
  ( (MissingZero!2187 (index!10918 (_ BitVec 32))) (Found!2187 (index!10919 (_ BitVec 32))) (Intermediate!2187 (undefined!2999 Bool) (index!10920 (_ BitVec 32)) (x!29098 (_ BitVec 32))) (Undefined!2187) (MissingVacant!2187 (index!10921 (_ BitVec 32))) )
))
(declare-fun lt!145145 () SeekEntryResult!2187)

(declare-datatypes ((array!14831 0))(
  ( (array!14832 (arr!7038 (Array (_ BitVec 32) (_ BitVec 64))) (size!7390 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14831)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14831 (_ BitVec 32)) SeekEntryResult!2187)

(assert (=> b!292893 (= lt!145145 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145147 k0!2524 (array!14832 (store (arr!7038 a!3312) i!1256 k0!2524) (size!7390 a!3312)) mask!3809))))

(declare-fun lt!145146 () SeekEntryResult!2187)

(assert (=> b!292893 (= lt!145146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145147 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292893 (= lt!145147 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292894 () Bool)

(declare-fun res!153953 () Bool)

(declare-fun e!185251 () Bool)

(assert (=> b!292894 (=> (not res!153953) (not e!185251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292894 (= res!153953 (validKeyInArray!0 k0!2524))))

(declare-fun b!292895 () Bool)

(declare-fun res!153952 () Bool)

(assert (=> b!292895 (=> (not res!153952) (not e!185252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14831 (_ BitVec 32)) Bool)

(assert (=> b!292895 (= res!153952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292896 () Bool)

(declare-fun res!153954 () Bool)

(assert (=> b!292896 (=> (not res!153954) (not e!185251))))

(assert (=> b!292896 (= res!153954 (and (= (size!7390 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7390 a!3312))))))

(declare-fun b!292897 () Bool)

(assert (=> b!292897 (= e!185251 e!185252)))

(declare-fun res!153950 () Bool)

(assert (=> b!292897 (=> (not res!153950) (not e!185252))))

(declare-fun lt!145144 () SeekEntryResult!2187)

(assert (=> b!292897 (= res!153950 (or (= lt!145144 (MissingZero!2187 i!1256)) (= lt!145144 (MissingVacant!2187 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14831 (_ BitVec 32)) SeekEntryResult!2187)

(assert (=> b!292897 (= lt!145144 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292898 () Bool)

(declare-fun res!153951 () Bool)

(assert (=> b!292898 (=> (not res!153951) (not e!185251))))

(declare-fun arrayContainsKey!0 (array!14831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292898 (= res!153951 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153949 () Bool)

(assert (=> start!28652 (=> (not res!153949) (not e!185251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28652 (= res!153949 (validMask!0 mask!3809))))

(assert (=> start!28652 e!185251))

(assert (=> start!28652 true))

(declare-fun array_inv!5001 (array!14831) Bool)

(assert (=> start!28652 (array_inv!5001 a!3312)))

(assert (= (and start!28652 res!153949) b!292896))

(assert (= (and b!292896 res!153954) b!292894))

(assert (= (and b!292894 res!153953) b!292898))

(assert (= (and b!292898 res!153951) b!292897))

(assert (= (and b!292897 res!153950) b!292895))

(assert (= (and b!292895 res!153952) b!292893))

(declare-fun m!306677 () Bool)

(assert (=> b!292895 m!306677))

(declare-fun m!306679 () Bool)

(assert (=> b!292893 m!306679))

(declare-fun m!306681 () Bool)

(assert (=> b!292893 m!306681))

(declare-fun m!306683 () Bool)

(assert (=> b!292893 m!306683))

(declare-fun m!306685 () Bool)

(assert (=> b!292893 m!306685))

(declare-fun m!306687 () Bool)

(assert (=> b!292897 m!306687))

(declare-fun m!306689 () Bool)

(assert (=> start!28652 m!306689))

(declare-fun m!306691 () Bool)

(assert (=> start!28652 m!306691))

(declare-fun m!306693 () Bool)

(assert (=> b!292894 m!306693))

(declare-fun m!306695 () Bool)

(assert (=> b!292898 m!306695))

(check-sat (not b!292894) (not b!292895) (not b!292898) (not b!292897) (not b!292893) (not start!28652))
(check-sat)
