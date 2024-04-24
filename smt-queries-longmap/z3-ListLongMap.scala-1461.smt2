; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28096 () Bool)

(assert start!28096)

(declare-fun b!288012 () Bool)

(declare-fun e!182356 () Bool)

(declare-fun e!182358 () Bool)

(assert (=> b!288012 (= e!182356 e!182358)))

(declare-fun res!149756 () Bool)

(assert (=> b!288012 (=> (not res!149756) (not e!182358))))

(declare-datatypes ((SeekEntryResult!1973 0))(
  ( (MissingZero!1973 (index!10062 (_ BitVec 32))) (Found!1973 (index!10063 (_ BitVec 32))) (Intermediate!1973 (undefined!2785 Bool) (index!10064 (_ BitVec 32)) (x!28388 (_ BitVec 32))) (Undefined!1973) (MissingVacant!1973 (index!10065 (_ BitVec 32))) )
))
(declare-fun lt!141852 () SeekEntryResult!1973)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!141855 () Bool)

(assert (=> b!288012 (= res!149756 (or lt!141855 (= lt!141852 (MissingVacant!1973 i!1256))))))

(assert (=> b!288012 (= lt!141855 (= lt!141852 (MissingZero!1973 i!1256)))))

(declare-datatypes ((array!14460 0))(
  ( (array!14461 (arr!6859 (Array (_ BitVec 32) (_ BitVec 64))) (size!7211 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14460)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14460 (_ BitVec 32)) SeekEntryResult!1973)

(assert (=> b!288012 (= lt!141852 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288013 () Bool)

(declare-fun e!182357 () Bool)

(assert (=> b!288013 (= e!182358 e!182357)))

(declare-fun res!149753 () Bool)

(assert (=> b!288013 (=> (not res!149753) (not e!182357))))

(assert (=> b!288013 (= res!149753 lt!141855)))

(declare-fun lt!141851 () (_ BitVec 32))

(declare-fun lt!141850 () SeekEntryResult!1973)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14460 (_ BitVec 32)) SeekEntryResult!1973)

(assert (=> b!288013 (= lt!141850 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141851 k0!2524 (array!14461 (store (arr!6859 a!3312) i!1256 k0!2524) (size!7211 a!3312)) mask!3809))))

(declare-fun lt!141854 () SeekEntryResult!1973)

(assert (=> b!288013 (= lt!141854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!141851 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288013 (= lt!141851 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288014 () Bool)

(declare-fun e!182360 () Bool)

(assert (=> b!288014 (= e!182357 e!182360)))

(declare-fun res!149755 () Bool)

(assert (=> b!288014 (=> (not res!149755) (not e!182360))))

(declare-fun lt!141853 () Bool)

(assert (=> b!288014 (= res!149755 (and (or lt!141853 (not (undefined!2785 lt!141854))) (or lt!141853 (not (= (select (arr!6859 a!3312) (index!10064 lt!141854)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!141853 (not (= (select (arr!6859 a!3312) (index!10064 lt!141854)) k0!2524))) (not lt!141853)))))

(get-info :version)

(assert (=> b!288014 (= lt!141853 (not ((_ is Intermediate!1973) lt!141854)))))

(declare-fun b!288015 () Bool)

(declare-fun res!149751 () Bool)

(assert (=> b!288015 (=> (not res!149751) (not e!182358))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14460 (_ BitVec 32)) Bool)

(assert (=> b!288015 (= res!149751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288016 () Bool)

(declare-fun res!149757 () Bool)

(assert (=> b!288016 (=> (not res!149757) (not e!182356))))

(assert (=> b!288016 (= res!149757 (and (= (size!7211 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7211 a!3312))))))

(declare-fun b!288017 () Bool)

(declare-fun res!149754 () Bool)

(assert (=> b!288017 (=> (not res!149754) (not e!182356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288017 (= res!149754 (validKeyInArray!0 k0!2524))))

(declare-fun res!149752 () Bool)

(assert (=> start!28096 (=> (not res!149752) (not e!182356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28096 (= res!149752 (validMask!0 mask!3809))))

(assert (=> start!28096 e!182356))

(assert (=> start!28096 true))

(declare-fun array_inv!4809 (array!14460) Bool)

(assert (=> start!28096 (array_inv!4809 a!3312)))

(declare-fun b!288018 () Bool)

(assert (=> b!288018 (= e!182360 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(assert (=> b!288018 (and (= (select (arr!6859 a!3312) (index!10064 lt!141854)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10064 lt!141854) i!1256))))

(declare-fun b!288019 () Bool)

(declare-fun res!149750 () Bool)

(assert (=> b!288019 (=> (not res!149750) (not e!182356))))

(declare-fun arrayContainsKey!0 (array!14460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288019 (= res!149750 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28096 res!149752) b!288016))

(assert (= (and b!288016 res!149757) b!288017))

(assert (= (and b!288017 res!149754) b!288019))

(assert (= (and b!288019 res!149750) b!288012))

(assert (= (and b!288012 res!149756) b!288015))

(assert (= (and b!288015 res!149751) b!288013))

(assert (= (and b!288013 res!149753) b!288014))

(assert (= (and b!288014 res!149755) b!288018))

(declare-fun m!302519 () Bool)

(assert (=> b!288019 m!302519))

(declare-fun m!302521 () Bool)

(assert (=> b!288015 m!302521))

(declare-fun m!302523 () Bool)

(assert (=> b!288014 m!302523))

(declare-fun m!302525 () Bool)

(assert (=> b!288017 m!302525))

(declare-fun m!302527 () Bool)

(assert (=> start!28096 m!302527))

(declare-fun m!302529 () Bool)

(assert (=> start!28096 m!302529))

(assert (=> b!288018 m!302523))

(declare-fun m!302531 () Bool)

(assert (=> b!288013 m!302531))

(declare-fun m!302533 () Bool)

(assert (=> b!288013 m!302533))

(declare-fun m!302535 () Bool)

(assert (=> b!288013 m!302535))

(declare-fun m!302537 () Bool)

(assert (=> b!288013 m!302537))

(declare-fun m!302539 () Bool)

(assert (=> b!288012 m!302539))

(check-sat (not b!288017) (not start!28096) (not b!288013) (not b!288019) (not b!288012) (not b!288015))
(check-sat)
