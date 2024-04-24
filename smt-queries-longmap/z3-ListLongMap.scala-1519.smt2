; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28636 () Bool)

(assert start!28636)

(declare-fun b!292868 () Bool)

(declare-fun res!153898 () Bool)

(declare-fun e!185239 () Bool)

(assert (=> b!292868 (=> (not res!153898) (not e!185239))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14820 0))(
  ( (array!14821 (arr!7033 (Array (_ BitVec 32) (_ BitVec 64))) (size!7385 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14820)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292868 (= res!153898 (and (= (size!7385 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7385 a!3312))))))

(declare-fun b!292869 () Bool)

(declare-fun e!185238 () Bool)

(assert (=> b!292869 (= e!185238 false)))

(declare-fun lt!145157 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2147 0))(
  ( (MissingZero!2147 (index!10758 (_ BitVec 32))) (Found!2147 (index!10759 (_ BitVec 32))) (Intermediate!2147 (undefined!2959 Bool) (index!10760 (_ BitVec 32)) (x!29050 (_ BitVec 32))) (Undefined!2147) (MissingVacant!2147 (index!10761 (_ BitVec 32))) )
))
(declare-fun lt!145156 () SeekEntryResult!2147)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14820 (_ BitVec 32)) SeekEntryResult!2147)

(assert (=> b!292869 (= lt!145156 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145157 k0!2524 (array!14821 (store (arr!7033 a!3312) i!1256 k0!2524) (size!7385 a!3312)) mask!3809))))

(declare-fun lt!145155 () SeekEntryResult!2147)

(assert (=> b!292869 (= lt!145155 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145157 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292869 (= lt!145157 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292870 () Bool)

(declare-fun res!153899 () Bool)

(assert (=> b!292870 (=> (not res!153899) (not e!185239))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292870 (= res!153899 (validKeyInArray!0 k0!2524))))

(declare-fun res!153903 () Bool)

(assert (=> start!28636 (=> (not res!153903) (not e!185239))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28636 (= res!153903 (validMask!0 mask!3809))))

(assert (=> start!28636 e!185239))

(assert (=> start!28636 true))

(declare-fun array_inv!4983 (array!14820) Bool)

(assert (=> start!28636 (array_inv!4983 a!3312)))

(declare-fun b!292871 () Bool)

(assert (=> b!292871 (= e!185239 e!185238)))

(declare-fun res!153900 () Bool)

(assert (=> b!292871 (=> (not res!153900) (not e!185238))))

(declare-fun lt!145158 () SeekEntryResult!2147)

(assert (=> b!292871 (= res!153900 (or (= lt!145158 (MissingZero!2147 i!1256)) (= lt!145158 (MissingVacant!2147 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14820 (_ BitVec 32)) SeekEntryResult!2147)

(assert (=> b!292871 (= lt!145158 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292872 () Bool)

(declare-fun res!153902 () Bool)

(assert (=> b!292872 (=> (not res!153902) (not e!185238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14820 (_ BitVec 32)) Bool)

(assert (=> b!292872 (= res!153902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292873 () Bool)

(declare-fun res!153901 () Bool)

(assert (=> b!292873 (=> (not res!153901) (not e!185239))))

(declare-fun arrayContainsKey!0 (array!14820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292873 (= res!153901 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28636 res!153903) b!292868))

(assert (= (and b!292868 res!153898) b!292870))

(assert (= (and b!292870 res!153899) b!292873))

(assert (= (and b!292873 res!153901) b!292871))

(assert (= (and b!292871 res!153900) b!292872))

(assert (= (and b!292872 res!153902) b!292869))

(declare-fun m!306803 () Bool)

(assert (=> start!28636 m!306803))

(declare-fun m!306805 () Bool)

(assert (=> start!28636 m!306805))

(declare-fun m!306807 () Bool)

(assert (=> b!292871 m!306807))

(declare-fun m!306809 () Bool)

(assert (=> b!292873 m!306809))

(declare-fun m!306811 () Bool)

(assert (=> b!292872 m!306811))

(declare-fun m!306813 () Bool)

(assert (=> b!292869 m!306813))

(declare-fun m!306815 () Bool)

(assert (=> b!292869 m!306815))

(declare-fun m!306817 () Bool)

(assert (=> b!292869 m!306817))

(declare-fun m!306819 () Bool)

(assert (=> b!292869 m!306819))

(declare-fun m!306821 () Bool)

(assert (=> b!292870 m!306821))

(check-sat (not b!292870) (not b!292871) (not start!28636) (not b!292873) (not b!292869) (not b!292872))
(check-sat)
