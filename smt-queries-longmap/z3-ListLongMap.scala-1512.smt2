; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28598 () Bool)

(assert start!28598)

(declare-fun b!292296 () Bool)

(declare-fun res!153409 () Bool)

(declare-fun e!184926 () Bool)

(assert (=> b!292296 (=> (not res!153409) (not e!184926))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292296 (= res!153409 (validKeyInArray!0 k0!2524))))

(declare-fun res!153405 () Bool)

(assert (=> start!28598 (=> (not res!153405) (not e!184926))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28598 (= res!153405 (validMask!0 mask!3809))))

(assert (=> start!28598 e!184926))

(assert (=> start!28598 true))

(declare-datatypes ((array!14770 0))(
  ( (array!14771 (arr!7008 (Array (_ BitVec 32) (_ BitVec 64))) (size!7361 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14770)

(declare-fun array_inv!4980 (array!14770) Bool)

(assert (=> start!28598 (array_inv!4980 a!3312)))

(declare-fun b!292297 () Bool)

(declare-fun res!153408 () Bool)

(assert (=> b!292297 (=> (not res!153408) (not e!184926))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!292297 (= res!153408 (and (= (size!7361 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7361 a!3312))))))

(declare-fun b!292298 () Bool)

(declare-fun e!184924 () Bool)

(assert (=> b!292298 (= e!184924 false)))

(declare-datatypes ((SeekEntryResult!2156 0))(
  ( (MissingZero!2156 (index!10794 (_ BitVec 32))) (Found!2156 (index!10795 (_ BitVec 32))) (Intermediate!2156 (undefined!2968 Bool) (index!10796 (_ BitVec 32)) (x!29002 (_ BitVec 32))) (Undefined!2156) (MissingVacant!2156 (index!10797 (_ BitVec 32))) )
))
(declare-fun lt!144665 () SeekEntryResult!2156)

(declare-fun lt!144666 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14770 (_ BitVec 32)) SeekEntryResult!2156)

(assert (=> b!292298 (= lt!144665 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144666 k0!2524 (array!14771 (store (arr!7008 a!3312) i!1256 k0!2524) (size!7361 a!3312)) mask!3809))))

(declare-fun lt!144663 () SeekEntryResult!2156)

(assert (=> b!292298 (= lt!144663 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144666 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292298 (= lt!144666 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292299 () Bool)

(assert (=> b!292299 (= e!184926 e!184924)))

(declare-fun res!153407 () Bool)

(assert (=> b!292299 (=> (not res!153407) (not e!184924))))

(declare-fun lt!144664 () SeekEntryResult!2156)

(assert (=> b!292299 (= res!153407 (or (= lt!144664 (MissingZero!2156 i!1256)) (= lt!144664 (MissingVacant!2156 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14770 (_ BitVec 32)) SeekEntryResult!2156)

(assert (=> b!292299 (= lt!144664 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292300 () Bool)

(declare-fun res!153404 () Bool)

(assert (=> b!292300 (=> (not res!153404) (not e!184926))))

(declare-fun arrayContainsKey!0 (array!14770 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292300 (= res!153404 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292301 () Bool)

(declare-fun res!153406 () Bool)

(assert (=> b!292301 (=> (not res!153406) (not e!184924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14770 (_ BitVec 32)) Bool)

(assert (=> b!292301 (= res!153406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28598 res!153405) b!292297))

(assert (= (and b!292297 res!153408) b!292296))

(assert (= (and b!292296 res!153409) b!292300))

(assert (= (and b!292300 res!153404) b!292299))

(assert (= (and b!292299 res!153407) b!292301))

(assert (= (and b!292301 res!153406) b!292298))

(declare-fun m!305585 () Bool)

(assert (=> b!292301 m!305585))

(declare-fun m!305587 () Bool)

(assert (=> b!292298 m!305587))

(declare-fun m!305589 () Bool)

(assert (=> b!292298 m!305589))

(declare-fun m!305591 () Bool)

(assert (=> b!292298 m!305591))

(declare-fun m!305593 () Bool)

(assert (=> b!292298 m!305593))

(declare-fun m!305595 () Bool)

(assert (=> b!292300 m!305595))

(declare-fun m!305597 () Bool)

(assert (=> b!292296 m!305597))

(declare-fun m!305599 () Bool)

(assert (=> b!292299 m!305599))

(declare-fun m!305601 () Bool)

(assert (=> start!28598 m!305601))

(declare-fun m!305603 () Bool)

(assert (=> start!28598 m!305603))

(check-sat (not b!292298) (not b!292299) (not b!292301) (not start!28598) (not b!292300) (not b!292296))
(check-sat)
