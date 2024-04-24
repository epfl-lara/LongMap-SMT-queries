; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28624 () Bool)

(assert start!28624)

(declare-fun b!292760 () Bool)

(declare-fun res!153793 () Bool)

(declare-fun e!185186 () Bool)

(assert (=> b!292760 (=> (not res!153793) (not e!185186))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292760 (= res!153793 (validKeyInArray!0 k0!2524))))

(declare-fun b!292761 () Bool)

(declare-fun e!185184 () Bool)

(assert (=> b!292761 (= e!185184 false)))

(declare-datatypes ((SeekEntryResult!2141 0))(
  ( (MissingZero!2141 (index!10734 (_ BitVec 32))) (Found!2141 (index!10735 (_ BitVec 32))) (Intermediate!2141 (undefined!2953 Bool) (index!10736 (_ BitVec 32)) (x!29028 (_ BitVec 32))) (Undefined!2141) (MissingVacant!2141 (index!10737 (_ BitVec 32))) )
))
(declare-fun lt!145084 () SeekEntryResult!2141)

(declare-fun lt!145085 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14808 0))(
  ( (array!14809 (arr!7027 (Array (_ BitVec 32) (_ BitVec 64))) (size!7379 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14808)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14808 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!292761 (= lt!145084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145085 k0!2524 (array!14809 (store (arr!7027 a!3312) i!1256 k0!2524) (size!7379 a!3312)) mask!3809))))

(declare-fun lt!145083 () SeekEntryResult!2141)

(assert (=> b!292761 (= lt!145083 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!145085 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292761 (= lt!145085 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292762 () Bool)

(declare-fun res!153790 () Bool)

(assert (=> b!292762 (=> (not res!153790) (not e!185186))))

(assert (=> b!292762 (= res!153790 (and (= (size!7379 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7379 a!3312))))))

(declare-fun b!292763 () Bool)

(assert (=> b!292763 (= e!185186 e!185184)))

(declare-fun res!153791 () Bool)

(assert (=> b!292763 (=> (not res!153791) (not e!185184))))

(declare-fun lt!145086 () SeekEntryResult!2141)

(assert (=> b!292763 (= res!153791 (or (= lt!145086 (MissingZero!2141 i!1256)) (= lt!145086 (MissingVacant!2141 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14808 (_ BitVec 32)) SeekEntryResult!2141)

(assert (=> b!292763 (= lt!145086 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!153794 () Bool)

(assert (=> start!28624 (=> (not res!153794) (not e!185186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28624 (= res!153794 (validMask!0 mask!3809))))

(assert (=> start!28624 e!185186))

(assert (=> start!28624 true))

(declare-fun array_inv!4977 (array!14808) Bool)

(assert (=> start!28624 (array_inv!4977 a!3312)))

(declare-fun b!292764 () Bool)

(declare-fun res!153792 () Bool)

(assert (=> b!292764 (=> (not res!153792) (not e!185184))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14808 (_ BitVec 32)) Bool)

(assert (=> b!292764 (= res!153792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292765 () Bool)

(declare-fun res!153795 () Bool)

(assert (=> b!292765 (=> (not res!153795) (not e!185186))))

(declare-fun arrayContainsKey!0 (array!14808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292765 (= res!153795 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28624 res!153794) b!292762))

(assert (= (and b!292762 res!153790) b!292760))

(assert (= (and b!292760 res!153793) b!292765))

(assert (= (and b!292765 res!153795) b!292763))

(assert (= (and b!292763 res!153791) b!292764))

(assert (= (and b!292764 res!153792) b!292761))

(declare-fun m!306683 () Bool)

(assert (=> b!292764 m!306683))

(declare-fun m!306685 () Bool)

(assert (=> b!292760 m!306685))

(declare-fun m!306687 () Bool)

(assert (=> b!292761 m!306687))

(declare-fun m!306689 () Bool)

(assert (=> b!292761 m!306689))

(declare-fun m!306691 () Bool)

(assert (=> b!292761 m!306691))

(declare-fun m!306693 () Bool)

(assert (=> b!292761 m!306693))

(declare-fun m!306695 () Bool)

(assert (=> b!292763 m!306695))

(declare-fun m!306697 () Bool)

(assert (=> start!28624 m!306697))

(declare-fun m!306699 () Bool)

(assert (=> start!28624 m!306699))

(declare-fun m!306701 () Bool)

(assert (=> b!292765 m!306701))

(check-sat (not b!292761) (not b!292760) (not start!28624) (not b!292765) (not b!292763) (not b!292764))
(check-sat)
