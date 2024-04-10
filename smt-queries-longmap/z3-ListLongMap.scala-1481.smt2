; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28274 () Bool)

(assert start!28274)

(declare-fun b!289741 () Bool)

(declare-fun e!183412 () Bool)

(assert (=> b!289741 (= e!183412 false)))

(declare-datatypes ((Unit!9130 0))(
  ( (Unit!9131) )
))
(declare-fun lt!143022 () Unit!9130)

(declare-fun e!183411 () Unit!9130)

(assert (=> b!289741 (= lt!143022 e!183411)))

(declare-fun c!46814 () Bool)

(declare-datatypes ((SeekEntryResult!2070 0))(
  ( (MissingZero!2070 (index!10450 (_ BitVec 32))) (Found!2070 (index!10451 (_ BitVec 32))) (Intermediate!2070 (undefined!2882 Bool) (index!10452 (_ BitVec 32)) (x!28651 (_ BitVec 32))) (Undefined!2070) (MissingVacant!2070 (index!10453 (_ BitVec 32))) )
))
(declare-fun lt!143021 () SeekEntryResult!2070)

(declare-datatypes ((array!14588 0))(
  ( (array!14589 (arr!6921 (Array (_ BitVec 32) (_ BitVec 64))) (size!7273 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14588)

(declare-fun k0!2524 () (_ BitVec 64))

(get-info :version)

(assert (=> b!289741 (= c!46814 (or (and ((_ is Intermediate!2070) lt!143021) (undefined!2882 lt!143021)) (and ((_ is Intermediate!2070) lt!143021) (= (select (arr!6921 a!3312) (index!10452 lt!143021)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2070) lt!143021) (= (select (arr!6921 a!3312) (index!10452 lt!143021)) k0!2524))))))

(declare-fun b!289742 () Bool)

(declare-fun e!183414 () Bool)

(assert (=> b!289742 (= e!183414 e!183412)))

(declare-fun res!151242 () Bool)

(assert (=> b!289742 (=> (not res!151242) (not e!183412))))

(declare-fun lt!143020 () Bool)

(assert (=> b!289742 (= res!151242 lt!143020)))

(declare-fun lt!143023 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!143018 () SeekEntryResult!2070)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14588 (_ BitVec 32)) SeekEntryResult!2070)

(assert (=> b!289742 (= lt!143018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143023 k0!2524 (array!14589 (store (arr!6921 a!3312) i!1256 k0!2524) (size!7273 a!3312)) mask!3809))))

(assert (=> b!289742 (= lt!143021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143023 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289742 (= lt!143023 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!151239 () Bool)

(declare-fun e!183415 () Bool)

(assert (=> start!28274 (=> (not res!151239) (not e!183415))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28274 (= res!151239 (validMask!0 mask!3809))))

(assert (=> start!28274 e!183415))

(assert (=> start!28274 true))

(declare-fun array_inv!4884 (array!14588) Bool)

(assert (=> start!28274 (array_inv!4884 a!3312)))

(declare-fun b!289743 () Bool)

(assert (=> b!289743 (= e!183415 e!183414)))

(declare-fun res!151237 () Bool)

(assert (=> b!289743 (=> (not res!151237) (not e!183414))))

(declare-fun lt!143019 () SeekEntryResult!2070)

(assert (=> b!289743 (= res!151237 (or lt!143020 (= lt!143019 (MissingVacant!2070 i!1256))))))

(assert (=> b!289743 (= lt!143020 (= lt!143019 (MissingZero!2070 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14588 (_ BitVec 32)) SeekEntryResult!2070)

(assert (=> b!289743 (= lt!143019 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289744 () Bool)

(declare-fun res!151236 () Bool)

(assert (=> b!289744 (=> (not res!151236) (not e!183414))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14588 (_ BitVec 32)) Bool)

(assert (=> b!289744 (= res!151236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289745 () Bool)

(declare-fun res!151238 () Bool)

(assert (=> b!289745 (=> (not res!151238) (not e!183415))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289745 (= res!151238 (validKeyInArray!0 k0!2524))))

(declare-fun b!289746 () Bool)

(declare-fun e!183413 () Unit!9130)

(assert (=> b!289746 (= e!183411 e!183413)))

(declare-fun c!46815 () Bool)

(assert (=> b!289746 (= c!46815 ((_ is Intermediate!2070) lt!143021))))

(declare-fun b!289747 () Bool)

(assert (=> b!289747 false))

(declare-fun Unit!9132 () Unit!9130)

(assert (=> b!289747 (= e!183413 Unit!9132)))

(declare-fun b!289748 () Bool)

(declare-fun res!151241 () Bool)

(assert (=> b!289748 (=> (not res!151241) (not e!183415))))

(declare-fun arrayContainsKey!0 (array!14588 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289748 (= res!151241 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289749 () Bool)

(declare-fun Unit!9133 () Unit!9130)

(assert (=> b!289749 (= e!183411 Unit!9133)))

(assert (=> b!289749 false))

(declare-fun b!289750 () Bool)

(declare-fun res!151240 () Bool)

(assert (=> b!289750 (=> (not res!151240) (not e!183415))))

(assert (=> b!289750 (= res!151240 (and (= (size!7273 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7273 a!3312))))))

(declare-fun b!289751 () Bool)

(assert (=> b!289751 (and (= lt!143018 lt!143021) (= (select (store (arr!6921 a!3312) i!1256 k0!2524) (index!10452 lt!143021)) k0!2524))))

(declare-fun lt!143017 () Unit!9130)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14588 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9130)

(assert (=> b!289751 (= lt!143017 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!143023 (index!10452 lt!143021) (x!28651 lt!143021) mask!3809))))

(assert (=> b!289751 (and (= (select (arr!6921 a!3312) (index!10452 lt!143021)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10452 lt!143021) i!1256))))

(declare-fun Unit!9134 () Unit!9130)

(assert (=> b!289751 (= e!183413 Unit!9134)))

(assert (= (and start!28274 res!151239) b!289750))

(assert (= (and b!289750 res!151240) b!289745))

(assert (= (and b!289745 res!151238) b!289748))

(assert (= (and b!289748 res!151241) b!289743))

(assert (= (and b!289743 res!151237) b!289744))

(assert (= (and b!289744 res!151236) b!289742))

(assert (= (and b!289742 res!151242) b!289741))

(assert (= (and b!289741 c!46814) b!289749))

(assert (= (and b!289741 (not c!46814)) b!289746))

(assert (= (and b!289746 c!46815) b!289751))

(assert (= (and b!289746 (not c!46815)) b!289747))

(declare-fun m!303815 () Bool)

(assert (=> b!289743 m!303815))

(declare-fun m!303817 () Bool)

(assert (=> b!289742 m!303817))

(declare-fun m!303819 () Bool)

(assert (=> b!289742 m!303819))

(declare-fun m!303821 () Bool)

(assert (=> b!289742 m!303821))

(declare-fun m!303823 () Bool)

(assert (=> b!289742 m!303823))

(assert (=> b!289751 m!303817))

(declare-fun m!303825 () Bool)

(assert (=> b!289751 m!303825))

(declare-fun m!303827 () Bool)

(assert (=> b!289751 m!303827))

(declare-fun m!303829 () Bool)

(assert (=> b!289751 m!303829))

(declare-fun m!303831 () Bool)

(assert (=> b!289748 m!303831))

(declare-fun m!303833 () Bool)

(assert (=> start!28274 m!303833))

(declare-fun m!303835 () Bool)

(assert (=> start!28274 m!303835))

(declare-fun m!303837 () Bool)

(assert (=> b!289744 m!303837))

(declare-fun m!303839 () Bool)

(assert (=> b!289745 m!303839))

(assert (=> b!289741 m!303829))

(check-sat (not start!28274) (not b!289745) (not b!289748) (not b!289742) (not b!289751) (not b!289744) (not b!289743))
(check-sat)
