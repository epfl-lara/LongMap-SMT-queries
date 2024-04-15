; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28574 () Bool)

(assert start!28574)

(declare-fun b!292030 () Bool)

(declare-fun e!184766 () Bool)

(declare-fun e!184768 () Bool)

(assert (=> b!292030 (= e!184766 e!184768)))

(declare-fun res!153145 () Bool)

(assert (=> b!292030 (=> (not res!153145) (not e!184768))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2144 0))(
  ( (MissingZero!2144 (index!10746 (_ BitVec 32))) (Found!2144 (index!10747 (_ BitVec 32))) (Intermediate!2144 (undefined!2956 Bool) (index!10748 (_ BitVec 32)) (x!28958 (_ BitVec 32))) (Undefined!2144) (MissingVacant!2144 (index!10749 (_ BitVec 32))) )
))
(declare-fun lt!144444 () SeekEntryResult!2144)

(declare-fun lt!144450 () Bool)

(assert (=> b!292030 (= res!153145 (or lt!144450 (= lt!144444 (MissingVacant!2144 i!1256))))))

(assert (=> b!292030 (= lt!144450 (= lt!144444 (MissingZero!2144 i!1256)))))

(declare-datatypes ((array!14746 0))(
  ( (array!14747 (arr!6996 (Array (_ BitVec 32) (_ BitVec 64))) (size!7349 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14746)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14746 (_ BitVec 32)) SeekEntryResult!2144)

(assert (=> b!292030 (= lt!144444 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292031 () Bool)

(declare-fun res!153142 () Bool)

(assert (=> b!292031 (=> (not res!153142) (not e!184766))))

(assert (=> b!292031 (= res!153142 (and (= (size!7349 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7349 a!3312))))))

(declare-fun b!292032 () Bool)

(declare-fun res!153143 () Bool)

(assert (=> b!292032 (=> (not res!153143) (not e!184766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292032 (= res!153143 (validKeyInArray!0 k0!2524))))

(declare-fun b!292033 () Bool)

(declare-fun e!184770 () Bool)

(declare-fun e!184769 () Bool)

(assert (=> b!292033 (= e!184770 e!184769)))

(declare-fun res!153141 () Bool)

(assert (=> b!292033 (=> (not res!153141) (not e!184769))))

(declare-fun lt!144449 () SeekEntryResult!2144)

(declare-fun lt!144448 () Bool)

(assert (=> b!292033 (= res!153141 (and (or lt!144448 (not (undefined!2956 lt!144449))) (not lt!144448) (= (select (arr!6996 a!3312) (index!10748 lt!144449)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292033 (= lt!144448 (not ((_ is Intermediate!2144) lt!144449)))))

(declare-fun b!292034 () Bool)

(assert (=> b!292034 (= e!184769 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!144445 () (_ BitVec 32))

(declare-datatypes ((Unit!9112 0))(
  ( (Unit!9113) )
))
(declare-fun lt!144446 () Unit!9112)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14746 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9112)

(assert (=> b!292034 (= lt!144446 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144445 (index!10748 lt!144449) (x!28958 lt!144449) mask!3809))))

(assert (=> b!292034 (= (index!10748 lt!144449) i!1256)))

(declare-fun b!292035 () Bool)

(declare-fun res!153140 () Bool)

(assert (=> b!292035 (=> (not res!153140) (not e!184768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14746 (_ BitVec 32)) Bool)

(assert (=> b!292035 (= res!153140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292036 () Bool)

(assert (=> b!292036 (= e!184768 e!184770)))

(declare-fun res!153144 () Bool)

(assert (=> b!292036 (=> (not res!153144) (not e!184770))))

(assert (=> b!292036 (= res!153144 (and (not lt!144450) (= lt!144444 (MissingVacant!2144 i!1256))))))

(declare-fun lt!144447 () SeekEntryResult!2144)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14746 (_ BitVec 32)) SeekEntryResult!2144)

(assert (=> b!292036 (= lt!144447 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144445 k0!2524 (array!14747 (store (arr!6996 a!3312) i!1256 k0!2524) (size!7349 a!3312)) mask!3809))))

(assert (=> b!292036 (= lt!144449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144445 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292036 (= lt!144445 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292037 () Bool)

(declare-fun res!153139 () Bool)

(assert (=> b!292037 (=> (not res!153139) (not e!184766))))

(declare-fun arrayContainsKey!0 (array!14746 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292037 (= res!153139 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153138 () Bool)

(assert (=> start!28574 (=> (not res!153138) (not e!184766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28574 (= res!153138 (validMask!0 mask!3809))))

(assert (=> start!28574 e!184766))

(assert (=> start!28574 true))

(declare-fun array_inv!4968 (array!14746) Bool)

(assert (=> start!28574 (array_inv!4968 a!3312)))

(assert (= (and start!28574 res!153138) b!292031))

(assert (= (and b!292031 res!153142) b!292032))

(assert (= (and b!292032 res!153143) b!292037))

(assert (= (and b!292037 res!153139) b!292030))

(assert (= (and b!292030 res!153145) b!292035))

(assert (= (and b!292035 res!153140) b!292036))

(assert (= (and b!292036 res!153144) b!292033))

(assert (= (and b!292033 res!153141) b!292034))

(declare-fun m!305309 () Bool)

(assert (=> start!28574 m!305309))

(declare-fun m!305311 () Bool)

(assert (=> start!28574 m!305311))

(declare-fun m!305313 () Bool)

(assert (=> b!292035 m!305313))

(declare-fun m!305315 () Bool)

(assert (=> b!292037 m!305315))

(declare-fun m!305317 () Bool)

(assert (=> b!292034 m!305317))

(declare-fun m!305319 () Bool)

(assert (=> b!292033 m!305319))

(declare-fun m!305321 () Bool)

(assert (=> b!292036 m!305321))

(declare-fun m!305323 () Bool)

(assert (=> b!292036 m!305323))

(declare-fun m!305325 () Bool)

(assert (=> b!292036 m!305325))

(declare-fun m!305327 () Bool)

(assert (=> b!292036 m!305327))

(declare-fun m!305329 () Bool)

(assert (=> b!292032 m!305329))

(declare-fun m!305331 () Bool)

(assert (=> b!292030 m!305331))

(check-sat (not b!292034) (not b!292036) (not b!292032) (not start!28574) (not b!292030) (not b!292037) (not b!292035))
(check-sat)
