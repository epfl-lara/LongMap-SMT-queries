; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28310 () Bool)

(assert start!28310)

(declare-fun b!289974 () Bool)

(declare-fun e!183504 () Bool)

(declare-fun e!183503 () Bool)

(assert (=> b!289974 (= e!183504 e!183503)))

(declare-fun res!151505 () Bool)

(assert (=> b!289974 (=> (not res!151505) (not e!183503))))

(declare-datatypes ((SeekEntryResult!2084 0))(
  ( (MissingZero!2084 (index!10506 (_ BitVec 32))) (Found!2084 (index!10507 (_ BitVec 32))) (Intermediate!2084 (undefined!2896 Bool) (index!10508 (_ BitVec 32)) (x!28720 (_ BitVec 32))) (Undefined!2084) (MissingVacant!2084 (index!10509 (_ BitVec 32))) )
))
(declare-fun lt!143100 () SeekEntryResult!2084)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289974 (= res!151505 (or (= lt!143100 (MissingZero!2084 i!1256)) (= lt!143100 (MissingVacant!2084 i!1256))))))

(declare-datatypes ((array!14617 0))(
  ( (array!14618 (arr!6936 (Array (_ BitVec 32) (_ BitVec 64))) (size!7289 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14617)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14617 (_ BitVec 32)) SeekEntryResult!2084)

(assert (=> b!289974 (= lt!143100 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289975 () Bool)

(declare-fun res!151506 () Bool)

(assert (=> b!289975 (=> (not res!151506) (not e!183504))))

(declare-fun arrayContainsKey!0 (array!14617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289975 (= res!151506 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289976 () Bool)

(declare-fun res!151510 () Bool)

(assert (=> b!289976 (=> (not res!151510) (not e!183504))))

(assert (=> b!289976 (= res!151510 (and (= (size!7289 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7289 a!3312))))))

(declare-fun b!289977 () Bool)

(declare-fun res!151509 () Bool)

(assert (=> b!289977 (=> (not res!151509) (not e!183504))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289977 (= res!151509 (validKeyInArray!0 k0!2524))))

(declare-fun b!289978 () Bool)

(declare-fun res!151508 () Bool)

(assert (=> b!289978 (=> (not res!151508) (not e!183503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14617 (_ BitVec 32)) Bool)

(assert (=> b!289978 (= res!151508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289979 () Bool)

(assert (=> b!289979 (= e!183503 false)))

(declare-fun lt!143099 () SeekEntryResult!2084)

(declare-fun lt!143098 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14617 (_ BitVec 32)) SeekEntryResult!2084)

(assert (=> b!289979 (= lt!143099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143098 k0!2524 (array!14618 (store (arr!6936 a!3312) i!1256 k0!2524) (size!7289 a!3312)) mask!3809))))

(declare-fun lt!143097 () SeekEntryResult!2084)

(assert (=> b!289979 (= lt!143097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143098 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289979 (= lt!143098 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151507 () Bool)

(assert (=> start!28310 (=> (not res!151507) (not e!183504))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28310 (= res!151507 (validMask!0 mask!3809))))

(assert (=> start!28310 e!183504))

(assert (=> start!28310 true))

(declare-fun array_inv!4908 (array!14617) Bool)

(assert (=> start!28310 (array_inv!4908 a!3312)))

(assert (= (and start!28310 res!151507) b!289976))

(assert (= (and b!289976 res!151510) b!289977))

(assert (= (and b!289977 res!151509) b!289975))

(assert (= (and b!289975 res!151506) b!289974))

(assert (= (and b!289974 res!151505) b!289978))

(assert (= (and b!289978 res!151508) b!289979))

(declare-fun m!303635 () Bool)

(assert (=> b!289978 m!303635))

(declare-fun m!303637 () Bool)

(assert (=> b!289979 m!303637))

(declare-fun m!303639 () Bool)

(assert (=> b!289979 m!303639))

(declare-fun m!303641 () Bool)

(assert (=> b!289979 m!303641))

(declare-fun m!303643 () Bool)

(assert (=> b!289979 m!303643))

(declare-fun m!303645 () Bool)

(assert (=> start!28310 m!303645))

(declare-fun m!303647 () Bool)

(assert (=> start!28310 m!303647))

(declare-fun m!303649 () Bool)

(assert (=> b!289974 m!303649))

(declare-fun m!303651 () Bool)

(assert (=> b!289975 m!303651))

(declare-fun m!303653 () Bool)

(assert (=> b!289977 m!303653))

(check-sat (not b!289974) (not start!28310) (not b!289979) (not b!289977) (not b!289978) (not b!289975))
(check-sat)
