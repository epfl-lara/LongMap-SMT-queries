; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28612 () Bool)

(assert start!28612)

(declare-fun b!292653 () Bool)

(declare-fun res!153686 () Bool)

(declare-fun e!185132 () Bool)

(assert (=> b!292653 (=> (not res!153686) (not e!185132))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292653 (= res!153686 (validKeyInArray!0 k0!2524))))

(declare-fun b!292654 () Bool)

(declare-fun e!185130 () Bool)

(assert (=> b!292654 (= e!185132 e!185130)))

(declare-fun res!153687 () Bool)

(assert (=> b!292654 (=> (not res!153687) (not e!185130))))

(declare-datatypes ((SeekEntryResult!2135 0))(
  ( (MissingZero!2135 (index!10710 (_ BitVec 32))) (Found!2135 (index!10711 (_ BitVec 32))) (Intermediate!2135 (undefined!2947 Bool) (index!10712 (_ BitVec 32)) (x!29006 (_ BitVec 32))) (Undefined!2135) (MissingVacant!2135 (index!10713 (_ BitVec 32))) )
))
(declare-fun lt!145014 () SeekEntryResult!2135)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292654 (= res!153687 (or (= lt!145014 (MissingZero!2135 i!1256)) (= lt!145014 (MissingVacant!2135 i!1256))))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14796 0))(
  ( (array!14797 (arr!7021 (Array (_ BitVec 32) (_ BitVec 64))) (size!7373 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14796)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14796 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!292654 (= lt!145014 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292655 () Bool)

(declare-fun res!153682 () Bool)

(assert (=> b!292655 (=> (not res!153682) (not e!185130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14796 (_ BitVec 32)) Bool)

(assert (=> b!292655 (= res!153682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292656 () Bool)

(declare-fun res!153684 () Bool)

(assert (=> b!292656 (=> (not res!153684) (not e!185132))))

(declare-fun arrayContainsKey!0 (array!14796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292656 (= res!153684 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292657 () Bool)

(assert (=> b!292657 (= e!185130 false)))

(declare-fun lt!145013 () SeekEntryResult!2135)

(declare-fun lt!145011 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14796 (_ BitVec 32)) SeekEntryResult!2135)

(assert (=> b!292657 (= lt!145013 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145011 k0!2524 (array!14797 (store (arr!7021 a!3312) i!1256 k0!2524) (size!7373 a!3312)) mask!3809))))

(declare-fun lt!145012 () SeekEntryResult!2135)

(assert (=> b!292657 (= lt!145012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145011 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292657 (= lt!145011 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!153683 () Bool)

(assert (=> start!28612 (=> (not res!153683) (not e!185132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28612 (= res!153683 (validMask!0 mask!3809))))

(assert (=> start!28612 e!185132))

(assert (=> start!28612 true))

(declare-fun array_inv!4971 (array!14796) Bool)

(assert (=> start!28612 (array_inv!4971 a!3312)))

(declare-fun b!292652 () Bool)

(declare-fun res!153685 () Bool)

(assert (=> b!292652 (=> (not res!153685) (not e!185132))))

(assert (=> b!292652 (= res!153685 (and (= (size!7373 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7373 a!3312))))))

(assert (= (and start!28612 res!153683) b!292652))

(assert (= (and b!292652 res!153685) b!292653))

(assert (= (and b!292653 res!153686) b!292656))

(assert (= (and b!292656 res!153684) b!292654))

(assert (= (and b!292654 res!153687) b!292655))

(assert (= (and b!292655 res!153682) b!292657))

(declare-fun m!306563 () Bool)

(assert (=> b!292657 m!306563))

(declare-fun m!306565 () Bool)

(assert (=> b!292657 m!306565))

(declare-fun m!306567 () Bool)

(assert (=> b!292657 m!306567))

(declare-fun m!306569 () Bool)

(assert (=> b!292657 m!306569))

(declare-fun m!306571 () Bool)

(assert (=> b!292655 m!306571))

(declare-fun m!306573 () Bool)

(assert (=> b!292653 m!306573))

(declare-fun m!306575 () Bool)

(assert (=> b!292656 m!306575))

(declare-fun m!306577 () Bool)

(assert (=> b!292654 m!306577))

(declare-fun m!306579 () Bool)

(assert (=> start!28612 m!306579))

(declare-fun m!306581 () Bool)

(assert (=> start!28612 m!306581))

(check-sat (not b!292656) (not b!292655) (not b!292653) (not start!28612) (not b!292657) (not b!292654))
(check-sat)
