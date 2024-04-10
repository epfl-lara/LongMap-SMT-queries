; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28298 () Bool)

(assert start!28298)

(declare-fun b!289977 () Bool)

(declare-fun e!183533 () Bool)

(declare-fun e!183531 () Bool)

(assert (=> b!289977 (= e!183533 e!183531)))

(declare-fun res!151456 () Bool)

(assert (=> b!289977 (=> (not res!151456) (not e!183531))))

(declare-datatypes ((SeekEntryResult!2082 0))(
  ( (MissingZero!2082 (index!10498 (_ BitVec 32))) (Found!2082 (index!10499 (_ BitVec 32))) (Intermediate!2082 (undefined!2894 Bool) (index!10500 (_ BitVec 32)) (x!28695 (_ BitVec 32))) (Undefined!2082) (MissingVacant!2082 (index!10501 (_ BitVec 32))) )
))
(declare-fun lt!143183 () SeekEntryResult!2082)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289977 (= res!151456 (or (= lt!143183 (MissingZero!2082 i!1256)) (= lt!143183 (MissingVacant!2082 i!1256))))))

(declare-datatypes ((array!14612 0))(
  ( (array!14613 (arr!6933 (Array (_ BitVec 32) (_ BitVec 64))) (size!7285 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14612)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14612 (_ BitVec 32)) SeekEntryResult!2082)

(assert (=> b!289977 (= lt!143183 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289978 () Bool)

(declare-fun res!151461 () Bool)

(assert (=> b!289978 (=> (not res!151461) (not e!183531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14612 (_ BitVec 32)) Bool)

(assert (=> b!289978 (= res!151461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!151457 () Bool)

(assert (=> start!28298 (=> (not res!151457) (not e!183533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28298 (= res!151457 (validMask!0 mask!3809))))

(assert (=> start!28298 e!183533))

(assert (=> start!28298 true))

(declare-fun array_inv!4896 (array!14612) Bool)

(assert (=> start!28298 (array_inv!4896 a!3312)))

(declare-fun b!289979 () Bool)

(declare-fun res!151460 () Bool)

(assert (=> b!289979 (=> (not res!151460) (not e!183533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289979 (= res!151460 (validKeyInArray!0 k0!2524))))

(declare-fun b!289980 () Bool)

(assert (=> b!289980 (= e!183531 false)))

(declare-fun lt!143184 () (_ BitVec 32))

(declare-fun lt!143182 () SeekEntryResult!2082)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14612 (_ BitVec 32)) SeekEntryResult!2082)

(assert (=> b!289980 (= lt!143182 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143184 k0!2524 (array!14613 (store (arr!6933 a!3312) i!1256 k0!2524) (size!7285 a!3312)) mask!3809))))

(declare-fun lt!143185 () SeekEntryResult!2082)

(assert (=> b!289980 (= lt!143185 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143184 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289980 (= lt!143184 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289981 () Bool)

(declare-fun res!151459 () Bool)

(assert (=> b!289981 (=> (not res!151459) (not e!183533))))

(assert (=> b!289981 (= res!151459 (and (= (size!7285 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7285 a!3312))))))

(declare-fun b!289982 () Bool)

(declare-fun res!151458 () Bool)

(assert (=> b!289982 (=> (not res!151458) (not e!183533))))

(declare-fun arrayContainsKey!0 (array!14612 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289982 (= res!151458 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28298 res!151457) b!289981))

(assert (= (and b!289981 res!151459) b!289979))

(assert (= (and b!289979 res!151460) b!289982))

(assert (= (and b!289982 res!151458) b!289977))

(assert (= (and b!289977 res!151456) b!289978))

(assert (= (and b!289978 res!151461) b!289980))

(declare-fun m!304067 () Bool)

(assert (=> start!28298 m!304067))

(declare-fun m!304069 () Bool)

(assert (=> start!28298 m!304069))

(declare-fun m!304071 () Bool)

(assert (=> b!289978 m!304071))

(declare-fun m!304073 () Bool)

(assert (=> b!289982 m!304073))

(declare-fun m!304075 () Bool)

(assert (=> b!289977 m!304075))

(declare-fun m!304077 () Bool)

(assert (=> b!289980 m!304077))

(declare-fun m!304079 () Bool)

(assert (=> b!289980 m!304079))

(declare-fun m!304081 () Bool)

(assert (=> b!289980 m!304081))

(declare-fun m!304083 () Bool)

(assert (=> b!289980 m!304083))

(declare-fun m!304085 () Bool)

(assert (=> b!289979 m!304085))

(check-sat (not b!289980) (not b!289977) (not start!28298) (not b!289979) (not b!289982) (not b!289978))
(check-sat)
