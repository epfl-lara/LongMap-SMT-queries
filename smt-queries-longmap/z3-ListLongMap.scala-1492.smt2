; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28378 () Bool)

(assert start!28378)

(declare-fun b!290640 () Bool)

(declare-fun res!151957 () Bool)

(declare-fun e!183908 () Bool)

(assert (=> b!290640 (=> (not res!151957) (not e!183908))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290640 (= res!151957 (validKeyInArray!0 k0!2524))))

(declare-fun b!290641 () Bool)

(declare-fun e!183910 () Bool)

(assert (=> b!290641 (= e!183908 e!183910)))

(declare-fun res!151954 () Bool)

(assert (=> b!290641 (=> (not res!151954) (not e!183910))))

(declare-datatypes ((SeekEntryResult!2066 0))(
  ( (MissingZero!2066 (index!10434 (_ BitVec 32))) (Found!2066 (index!10435 (_ BitVec 32))) (Intermediate!2066 (undefined!2878 Bool) (index!10436 (_ BitVec 32)) (x!28741 (_ BitVec 32))) (Undefined!2066) (MissingVacant!2066 (index!10437 (_ BitVec 32))) )
))
(declare-fun lt!143618 () SeekEntryResult!2066)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143621 () Bool)

(assert (=> b!290641 (= res!151954 (or lt!143621 (= lt!143618 (MissingVacant!2066 i!1256))))))

(assert (=> b!290641 (= lt!143621 (= lt!143618 (MissingZero!2066 i!1256)))))

(declare-datatypes ((array!14652 0))(
  ( (array!14653 (arr!6952 (Array (_ BitVec 32) (_ BitVec 64))) (size!7304 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14652)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14652 (_ BitVec 32)) SeekEntryResult!2066)

(assert (=> b!290641 (= lt!143618 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290642 () Bool)

(declare-fun e!183911 () Bool)

(assert (=> b!290642 (= e!183911 (not true))))

(declare-fun lt!143619 () SeekEntryResult!2066)

(assert (=> b!290642 (= (index!10436 lt!143619) i!1256)))

(declare-fun b!290643 () Bool)

(declare-fun res!151953 () Bool)

(assert (=> b!290643 (=> (not res!151953) (not e!183910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14652 (_ BitVec 32)) Bool)

(assert (=> b!290643 (= res!151953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290644 () Bool)

(declare-fun e!183907 () Bool)

(assert (=> b!290644 (= e!183910 e!183907)))

(declare-fun res!151959 () Bool)

(assert (=> b!290644 (=> (not res!151959) (not e!183907))))

(assert (=> b!290644 (= res!151959 (and (not lt!143621) (= lt!143618 (MissingVacant!2066 i!1256))))))

(declare-fun lt!143620 () SeekEntryResult!2066)

(declare-fun lt!143617 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14652 (_ BitVec 32)) SeekEntryResult!2066)

(assert (=> b!290644 (= lt!143620 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143617 k0!2524 (array!14653 (store (arr!6952 a!3312) i!1256 k0!2524) (size!7304 a!3312)) mask!3809))))

(assert (=> b!290644 (= lt!143619 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143617 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290644 (= lt!143617 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!290645 () Bool)

(assert (=> b!290645 (= e!183907 e!183911)))

(declare-fun res!151956 () Bool)

(assert (=> b!290645 (=> (not res!151956) (not e!183911))))

(declare-fun lt!143622 () Bool)

(assert (=> b!290645 (= res!151956 (and (or lt!143622 (not (undefined!2878 lt!143619))) (not lt!143622) (= (select (arr!6952 a!3312) (index!10436 lt!143619)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290645 (= lt!143622 (not ((_ is Intermediate!2066) lt!143619)))))

(declare-fun res!151952 () Bool)

(assert (=> start!28378 (=> (not res!151952) (not e!183908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28378 (= res!151952 (validMask!0 mask!3809))))

(assert (=> start!28378 e!183908))

(assert (=> start!28378 true))

(declare-fun array_inv!4902 (array!14652) Bool)

(assert (=> start!28378 (array_inv!4902 a!3312)))

(declare-fun b!290646 () Bool)

(declare-fun res!151955 () Bool)

(assert (=> b!290646 (=> (not res!151955) (not e!183908))))

(declare-fun arrayContainsKey!0 (array!14652 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290646 (= res!151955 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290647 () Bool)

(declare-fun res!151958 () Bool)

(assert (=> b!290647 (=> (not res!151958) (not e!183908))))

(assert (=> b!290647 (= res!151958 (and (= (size!7304 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7304 a!3312))))))

(assert (= (and start!28378 res!151952) b!290647))

(assert (= (and b!290647 res!151958) b!290640))

(assert (= (and b!290640 res!151957) b!290646))

(assert (= (and b!290646 res!151955) b!290641))

(assert (= (and b!290641 res!151954) b!290643))

(assert (= (and b!290643 res!151953) b!290644))

(assert (= (and b!290644 res!151959) b!290645))

(assert (= (and b!290645 res!151956) b!290642))

(declare-fun m!304805 () Bool)

(assert (=> b!290645 m!304805))

(declare-fun m!304807 () Bool)

(assert (=> b!290646 m!304807))

(declare-fun m!304809 () Bool)

(assert (=> b!290643 m!304809))

(declare-fun m!304811 () Bool)

(assert (=> b!290640 m!304811))

(declare-fun m!304813 () Bool)

(assert (=> b!290644 m!304813))

(declare-fun m!304815 () Bool)

(assert (=> b!290644 m!304815))

(declare-fun m!304817 () Bool)

(assert (=> b!290644 m!304817))

(declare-fun m!304819 () Bool)

(assert (=> b!290644 m!304819))

(declare-fun m!304821 () Bool)

(assert (=> b!290641 m!304821))

(declare-fun m!304823 () Bool)

(assert (=> start!28378 m!304823))

(declare-fun m!304825 () Bool)

(assert (=> start!28378 m!304825))

(check-sat (not b!290644) (not b!290640) (not b!290646) (not start!28378) (not b!290641) (not b!290643))
(check-sat)
