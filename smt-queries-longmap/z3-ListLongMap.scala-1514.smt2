; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28616 () Bool)

(assert start!28616)

(declare-fun res!153627 () Bool)

(declare-fun e!185088 () Bool)

(assert (=> start!28616 (=> (not res!153627) (not e!185088))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28616 (= res!153627 (validMask!0 mask!3809))))

(assert (=> start!28616 e!185088))

(assert (=> start!28616 true))

(declare-datatypes ((array!14795 0))(
  ( (array!14796 (arr!7020 (Array (_ BitVec 32) (_ BitVec 64))) (size!7372 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14795)

(declare-fun array_inv!4983 (array!14795) Bool)

(assert (=> start!28616 (array_inv!4983 a!3312)))

(declare-fun b!292569 () Bool)

(declare-fun e!185089 () Bool)

(assert (=> b!292569 (= e!185088 e!185089)))

(declare-fun res!153625 () Bool)

(assert (=> b!292569 (=> (not res!153625) (not e!185089))))

(declare-datatypes ((SeekEntryResult!2169 0))(
  ( (MissingZero!2169 (index!10846 (_ BitVec 32))) (Found!2169 (index!10847 (_ BitVec 32))) (Intermediate!2169 (undefined!2981 Bool) (index!10848 (_ BitVec 32)) (x!29032 (_ BitVec 32))) (Undefined!2169) (MissingVacant!2169 (index!10849 (_ BitVec 32))) )
))
(declare-fun lt!144929 () SeekEntryResult!2169)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292569 (= res!153625 (or (= lt!144929 (MissingZero!2169 i!1256)) (= lt!144929 (MissingVacant!2169 i!1256))))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14795 (_ BitVec 32)) SeekEntryResult!2169)

(assert (=> b!292569 (= lt!144929 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292570 () Bool)

(assert (=> b!292570 (= e!185089 false)))

(declare-fun lt!144930 () (_ BitVec 32))

(declare-fun lt!144928 () SeekEntryResult!2169)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14795 (_ BitVec 32)) SeekEntryResult!2169)

(assert (=> b!292570 (= lt!144928 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144930 k0!2524 (array!14796 (store (arr!7020 a!3312) i!1256 k0!2524) (size!7372 a!3312)) mask!3809))))

(declare-fun lt!144931 () SeekEntryResult!2169)

(assert (=> b!292570 (= lt!144931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144930 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292570 (= lt!144930 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292571 () Bool)

(declare-fun res!153630 () Bool)

(assert (=> b!292571 (=> (not res!153630) (not e!185089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14795 (_ BitVec 32)) Bool)

(assert (=> b!292571 (= res!153630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292572 () Bool)

(declare-fun res!153628 () Bool)

(assert (=> b!292572 (=> (not res!153628) (not e!185088))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292572 (= res!153628 (validKeyInArray!0 k0!2524))))

(declare-fun b!292573 () Bool)

(declare-fun res!153626 () Bool)

(assert (=> b!292573 (=> (not res!153626) (not e!185088))))

(assert (=> b!292573 (= res!153626 (and (= (size!7372 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7372 a!3312))))))

(declare-fun b!292574 () Bool)

(declare-fun res!153629 () Bool)

(assert (=> b!292574 (=> (not res!153629) (not e!185088))))

(declare-fun arrayContainsKey!0 (array!14795 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292574 (= res!153629 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28616 res!153627) b!292573))

(assert (= (and b!292573 res!153626) b!292572))

(assert (= (and b!292572 res!153628) b!292574))

(assert (= (and b!292574 res!153629) b!292569))

(assert (= (and b!292569 res!153625) b!292571))

(assert (= (and b!292571 res!153630) b!292570))

(declare-fun m!306317 () Bool)

(assert (=> b!292574 m!306317))

(declare-fun m!306319 () Bool)

(assert (=> b!292569 m!306319))

(declare-fun m!306321 () Bool)

(assert (=> start!28616 m!306321))

(declare-fun m!306323 () Bool)

(assert (=> start!28616 m!306323))

(declare-fun m!306325 () Bool)

(assert (=> b!292571 m!306325))

(declare-fun m!306327 () Bool)

(assert (=> b!292572 m!306327))

(declare-fun m!306329 () Bool)

(assert (=> b!292570 m!306329))

(declare-fun m!306331 () Bool)

(assert (=> b!292570 m!306331))

(declare-fun m!306333 () Bool)

(assert (=> b!292570 m!306333))

(declare-fun m!306335 () Bool)

(assert (=> b!292570 m!306335))

(check-sat (not b!292570) (not b!292571) (not start!28616) (not b!292574) (not b!292572) (not b!292569))
(check-sat)
