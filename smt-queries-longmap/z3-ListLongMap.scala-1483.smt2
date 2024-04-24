; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28276 () Bool)

(assert start!28276)

(declare-fun b!289898 () Bool)

(declare-fun res!151352 () Bool)

(declare-fun e!183493 () Bool)

(assert (=> b!289898 (=> (not res!151352) (not e!183493))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14595 0))(
  ( (array!14596 (arr!6925 (Array (_ BitVec 32) (_ BitVec 64))) (size!7277 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14595)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289898 (= res!151352 (and (= (size!7277 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7277 a!3312))))))

(declare-fun b!289899 () Bool)

(declare-fun res!151354 () Bool)

(assert (=> b!289899 (=> (not res!151354) (not e!183493))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289899 (= res!151354 (validKeyInArray!0 k0!2524))))

(declare-fun b!289901 () Bool)

(declare-fun res!151356 () Bool)

(assert (=> b!289901 (=> (not res!151356) (not e!183493))))

(declare-fun arrayContainsKey!0 (array!14595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289901 (= res!151356 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289902 () Bool)

(declare-fun res!151353 () Bool)

(declare-fun e!183492 () Bool)

(assert (=> b!289902 (=> (not res!151353) (not e!183492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14595 (_ BitVec 32)) Bool)

(assert (=> b!289902 (= res!151353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289903 () Bool)

(declare-fun lt!143152 () Bool)

(assert (=> b!289903 (= e!183492 (and (not lt!143152) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!143154 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2039 0))(
  ( (MissingZero!2039 (index!10326 (_ BitVec 32))) (Found!2039 (index!10327 (_ BitVec 32))) (Intermediate!2039 (undefined!2851 Bool) (index!10328 (_ BitVec 32)) (x!28636 (_ BitVec 32))) (Undefined!2039) (MissingVacant!2039 (index!10329 (_ BitVec 32))) )
))
(declare-fun lt!143153 () SeekEntryResult!2039)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14595 (_ BitVec 32)) SeekEntryResult!2039)

(assert (=> b!289903 (= lt!143153 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143154 k0!2524 (array!14596 (store (arr!6925 a!3312) i!1256 k0!2524) (size!7277 a!3312)) mask!3809))))

(declare-fun lt!143150 () SeekEntryResult!2039)

(assert (=> b!289903 (= lt!143150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143154 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289903 (= lt!143154 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151355 () Bool)

(assert (=> start!28276 (=> (not res!151355) (not e!183493))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28276 (= res!151355 (validMask!0 mask!3809))))

(assert (=> start!28276 e!183493))

(assert (=> start!28276 true))

(declare-fun array_inv!4875 (array!14595) Bool)

(assert (=> start!28276 (array_inv!4875 a!3312)))

(declare-fun b!289900 () Bool)

(assert (=> b!289900 (= e!183493 e!183492)))

(declare-fun res!151351 () Bool)

(assert (=> b!289900 (=> (not res!151351) (not e!183492))))

(declare-fun lt!143151 () SeekEntryResult!2039)

(assert (=> b!289900 (= res!151351 (or lt!143152 (= lt!143151 (MissingVacant!2039 i!1256))))))

(assert (=> b!289900 (= lt!143152 (= lt!143151 (MissingZero!2039 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14595 (_ BitVec 32)) SeekEntryResult!2039)

(assert (=> b!289900 (= lt!143151 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28276 res!151355) b!289898))

(assert (= (and b!289898 res!151352) b!289899))

(assert (= (and b!289899 res!151354) b!289901))

(assert (= (and b!289901 res!151356) b!289900))

(assert (= (and b!289900 res!151351) b!289902))

(assert (= (and b!289902 res!151353) b!289903))

(declare-fun m!304133 () Bool)

(assert (=> start!28276 m!304133))

(declare-fun m!304135 () Bool)

(assert (=> start!28276 m!304135))

(declare-fun m!304137 () Bool)

(assert (=> b!289902 m!304137))

(declare-fun m!304139 () Bool)

(assert (=> b!289899 m!304139))

(declare-fun m!304141 () Bool)

(assert (=> b!289900 m!304141))

(declare-fun m!304143 () Bool)

(assert (=> b!289903 m!304143))

(declare-fun m!304145 () Bool)

(assert (=> b!289903 m!304145))

(declare-fun m!304147 () Bool)

(assert (=> b!289903 m!304147))

(declare-fun m!304149 () Bool)

(assert (=> b!289903 m!304149))

(declare-fun m!304151 () Bool)

(assert (=> b!289901 m!304151))

(check-sat (not b!289903) (not b!289900) (not start!28276) (not b!289902) (not b!289899) (not b!289901))
(check-sat)
