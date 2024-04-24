; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28606 () Bool)

(assert start!28606)

(declare-fun b!292598 () Bool)

(declare-fun res!153632 () Bool)

(declare-fun e!185105 () Bool)

(assert (=> b!292598 (=> (not res!153632) (not e!185105))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14790 0))(
  ( (array!14791 (arr!7018 (Array (_ BitVec 32) (_ BitVec 64))) (size!7370 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14790)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292598 (= res!153632 (and (= (size!7370 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7370 a!3312))))))

(declare-fun b!292599 () Bool)

(declare-fun res!153631 () Bool)

(assert (=> b!292599 (=> (not res!153631) (not e!185105))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292599 (= res!153631 (validKeyInArray!0 k0!2524))))

(declare-fun res!153633 () Bool)

(assert (=> start!28606 (=> (not res!153633) (not e!185105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28606 (= res!153633 (validMask!0 mask!3809))))

(assert (=> start!28606 e!185105))

(assert (=> start!28606 true))

(declare-fun array_inv!4968 (array!14790) Bool)

(assert (=> start!28606 (array_inv!4968 a!3312)))

(declare-fun b!292600 () Bool)

(declare-fun res!153629 () Bool)

(assert (=> b!292600 (=> (not res!153629) (not e!185105))))

(declare-fun arrayContainsKey!0 (array!14790 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292600 (= res!153629 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292601 () Bool)

(declare-fun res!153628 () Bool)

(declare-fun e!185104 () Bool)

(assert (=> b!292601 (=> (not res!153628) (not e!185104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14790 (_ BitVec 32)) Bool)

(assert (=> b!292601 (= res!153628 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292602 () Bool)

(assert (=> b!292602 (= e!185104 false)))

(declare-datatypes ((SeekEntryResult!2132 0))(
  ( (MissingZero!2132 (index!10698 (_ BitVec 32))) (Found!2132 (index!10699 (_ BitVec 32))) (Intermediate!2132 (undefined!2944 Bool) (index!10700 (_ BitVec 32)) (x!28995 (_ BitVec 32))) (Undefined!2132) (MissingVacant!2132 (index!10701 (_ BitVec 32))) )
))
(declare-fun lt!144978 () SeekEntryResult!2132)

(declare-fun lt!144976 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14790 (_ BitVec 32)) SeekEntryResult!2132)

(assert (=> b!292602 (= lt!144978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144976 k0!2524 (array!14791 (store (arr!7018 a!3312) i!1256 k0!2524) (size!7370 a!3312)) mask!3809))))

(declare-fun lt!144975 () SeekEntryResult!2132)

(assert (=> b!292602 (= lt!144975 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144976 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292602 (= lt!144976 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292603 () Bool)

(assert (=> b!292603 (= e!185105 e!185104)))

(declare-fun res!153630 () Bool)

(assert (=> b!292603 (=> (not res!153630) (not e!185104))))

(declare-fun lt!144977 () SeekEntryResult!2132)

(assert (=> b!292603 (= res!153630 (or (= lt!144977 (MissingZero!2132 i!1256)) (= lt!144977 (MissingVacant!2132 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14790 (_ BitVec 32)) SeekEntryResult!2132)

(assert (=> b!292603 (= lt!144977 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28606 res!153633) b!292598))

(assert (= (and b!292598 res!153632) b!292599))

(assert (= (and b!292599 res!153631) b!292600))

(assert (= (and b!292600 res!153629) b!292603))

(assert (= (and b!292603 res!153630) b!292601))

(assert (= (and b!292601 res!153628) b!292602))

(declare-fun m!306503 () Bool)

(assert (=> b!292601 m!306503))

(declare-fun m!306505 () Bool)

(assert (=> b!292602 m!306505))

(declare-fun m!306507 () Bool)

(assert (=> b!292602 m!306507))

(declare-fun m!306509 () Bool)

(assert (=> b!292602 m!306509))

(declare-fun m!306511 () Bool)

(assert (=> b!292602 m!306511))

(declare-fun m!306513 () Bool)

(assert (=> b!292603 m!306513))

(declare-fun m!306515 () Bool)

(assert (=> b!292599 m!306515))

(declare-fun m!306517 () Bool)

(assert (=> b!292600 m!306517))

(declare-fun m!306519 () Bool)

(assert (=> start!28606 m!306519))

(declare-fun m!306521 () Bool)

(assert (=> start!28606 m!306521))

(check-sat (not start!28606) (not b!292601) (not b!292599) (not b!292600) (not b!292603) (not b!292602))
(check-sat)
