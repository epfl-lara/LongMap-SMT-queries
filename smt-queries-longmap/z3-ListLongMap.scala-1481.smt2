; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28264 () Bool)

(assert start!28264)

(declare-fun b!289755 () Bool)

(declare-fun res!151240 () Bool)

(declare-fun e!183422 () Bool)

(assert (=> b!289755 (=> (not res!151240) (not e!183422))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289755 (= res!151240 (validKeyInArray!0 k0!2524))))

(declare-fun b!289756 () Bool)

(declare-fun res!151242 () Bool)

(assert (=> b!289756 (=> (not res!151242) (not e!183422))))

(declare-datatypes ((array!14583 0))(
  ( (array!14584 (arr!6919 (Array (_ BitVec 32) (_ BitVec 64))) (size!7271 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14583)

(declare-fun arrayContainsKey!0 (array!14583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289756 (= res!151242 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289757 () Bool)

(declare-datatypes ((SeekEntryResult!2033 0))(
  ( (MissingZero!2033 (index!10302 (_ BitVec 32))) (Found!2033 (index!10303 (_ BitVec 32))) (Intermediate!2033 (undefined!2845 Bool) (index!10304 (_ BitVec 32)) (x!28614 (_ BitVec 32))) (Undefined!2033) (MissingVacant!2033 (index!10305 (_ BitVec 32))) )
))
(declare-fun lt!143059 () SeekEntryResult!2033)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!143056 () SeekEntryResult!2033)

(assert (=> b!289757 (and (= lt!143056 lt!143059) (= (select (store (arr!6919 a!3312) i!1256 k0!2524) (index!10304 lt!143059)) k0!2524))))

(declare-datatypes ((Unit!9093 0))(
  ( (Unit!9094) )
))
(declare-fun lt!143055 () Unit!9093)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!143057 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14583 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9093)

(assert (=> b!289757 (= lt!143055 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!143057 (index!10304 lt!143059) (x!28614 lt!143059) mask!3809))))

(assert (=> b!289757 (and (= (select (arr!6919 a!3312) (index!10304 lt!143059)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10304 lt!143059) i!1256))))

(declare-fun e!183418 () Unit!9093)

(declare-fun Unit!9095 () Unit!9093)

(assert (=> b!289757 (= e!183418 Unit!9095)))

(declare-fun b!289758 () Bool)

(declare-fun e!183417 () Bool)

(assert (=> b!289758 (= e!183417 false)))

(declare-fun lt!143061 () Unit!9093)

(declare-fun e!183420 () Unit!9093)

(assert (=> b!289758 (= lt!143061 e!183420)))

(declare-fun c!46822 () Bool)

(get-info :version)

(assert (=> b!289758 (= c!46822 (or (and ((_ is Intermediate!2033) lt!143059) (undefined!2845 lt!143059)) (and ((_ is Intermediate!2033) lt!143059) (= (select (arr!6919 a!3312) (index!10304 lt!143059)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2033) lt!143059) (= (select (arr!6919 a!3312) (index!10304 lt!143059)) k0!2524))))))

(declare-fun res!151238 () Bool)

(assert (=> start!28264 (=> (not res!151238) (not e!183422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28264 (= res!151238 (validMask!0 mask!3809))))

(assert (=> start!28264 e!183422))

(assert (=> start!28264 true))

(declare-fun array_inv!4869 (array!14583) Bool)

(assert (=> start!28264 (array_inv!4869 a!3312)))

(declare-fun b!289759 () Bool)

(assert (=> b!289759 false))

(declare-fun Unit!9096 () Unit!9093)

(assert (=> b!289759 (= e!183418 Unit!9096)))

(declare-fun b!289760 () Bool)

(declare-fun Unit!9097 () Unit!9093)

(assert (=> b!289760 (= e!183420 Unit!9097)))

(assert (=> b!289760 false))

(declare-fun b!289761 () Bool)

(declare-fun res!151236 () Bool)

(declare-fun e!183419 () Bool)

(assert (=> b!289761 (=> (not res!151236) (not e!183419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14583 (_ BitVec 32)) Bool)

(assert (=> b!289761 (= res!151236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289762 () Bool)

(declare-fun res!151237 () Bool)

(assert (=> b!289762 (=> (not res!151237) (not e!183422))))

(assert (=> b!289762 (= res!151237 (and (= (size!7271 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7271 a!3312))))))

(declare-fun b!289763 () Bool)

(assert (=> b!289763 (= e!183422 e!183419)))

(declare-fun res!151241 () Bool)

(assert (=> b!289763 (=> (not res!151241) (not e!183419))))

(declare-fun lt!143058 () Bool)

(declare-fun lt!143060 () SeekEntryResult!2033)

(assert (=> b!289763 (= res!151241 (or lt!143058 (= lt!143060 (MissingVacant!2033 i!1256))))))

(assert (=> b!289763 (= lt!143058 (= lt!143060 (MissingZero!2033 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14583 (_ BitVec 32)) SeekEntryResult!2033)

(assert (=> b!289763 (= lt!143060 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289764 () Bool)

(assert (=> b!289764 (= e!183420 e!183418)))

(declare-fun c!46821 () Bool)

(assert (=> b!289764 (= c!46821 ((_ is Intermediate!2033) lt!143059))))

(declare-fun b!289765 () Bool)

(assert (=> b!289765 (= e!183419 e!183417)))

(declare-fun res!151239 () Bool)

(assert (=> b!289765 (=> (not res!151239) (not e!183417))))

(assert (=> b!289765 (= res!151239 lt!143058)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14583 (_ BitVec 32)) SeekEntryResult!2033)

(assert (=> b!289765 (= lt!143056 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143057 k0!2524 (array!14584 (store (arr!6919 a!3312) i!1256 k0!2524) (size!7271 a!3312)) mask!3809))))

(assert (=> b!289765 (= lt!143059 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143057 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289765 (= lt!143057 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!28264 res!151238) b!289762))

(assert (= (and b!289762 res!151237) b!289755))

(assert (= (and b!289755 res!151240) b!289756))

(assert (= (and b!289756 res!151242) b!289763))

(assert (= (and b!289763 res!151241) b!289761))

(assert (= (and b!289761 res!151236) b!289765))

(assert (= (and b!289765 res!151239) b!289758))

(assert (= (and b!289758 c!46822) b!289760))

(assert (= (and b!289758 (not c!46822)) b!289764))

(assert (= (and b!289764 c!46821) b!289757))

(assert (= (and b!289764 (not c!46821)) b!289759))

(declare-fun m!303995 () Bool)

(assert (=> b!289761 m!303995))

(declare-fun m!303997 () Bool)

(assert (=> b!289757 m!303997))

(declare-fun m!303999 () Bool)

(assert (=> b!289757 m!303999))

(declare-fun m!304001 () Bool)

(assert (=> b!289757 m!304001))

(declare-fun m!304003 () Bool)

(assert (=> b!289757 m!304003))

(declare-fun m!304005 () Bool)

(assert (=> b!289755 m!304005))

(declare-fun m!304007 () Bool)

(assert (=> b!289756 m!304007))

(assert (=> b!289765 m!303997))

(declare-fun m!304009 () Bool)

(assert (=> b!289765 m!304009))

(declare-fun m!304011 () Bool)

(assert (=> b!289765 m!304011))

(declare-fun m!304013 () Bool)

(assert (=> b!289765 m!304013))

(assert (=> b!289758 m!304003))

(declare-fun m!304015 () Bool)

(assert (=> start!28264 m!304015))

(declare-fun m!304017 () Bool)

(assert (=> start!28264 m!304017))

(declare-fun m!304019 () Bool)

(assert (=> b!289763 m!304019))

(check-sat (not b!289757) (not start!28264) (not b!289763) (not b!289756) (not b!289755) (not b!289761) (not b!289765))
(check-sat)
