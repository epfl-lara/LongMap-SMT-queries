; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28580 () Bool)

(assert start!28580)

(declare-fun b!292103 () Bool)

(declare-fun e!184814 () Bool)

(declare-fun e!184813 () Bool)

(assert (=> b!292103 (= e!184814 e!184813)))

(declare-fun res!153215 () Bool)

(assert (=> b!292103 (=> (not res!153215) (not e!184813))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2147 0))(
  ( (MissingZero!2147 (index!10758 (_ BitVec 32))) (Found!2147 (index!10759 (_ BitVec 32))) (Intermediate!2147 (undefined!2959 Bool) (index!10760 (_ BitVec 32)) (x!28969 (_ BitVec 32))) (Undefined!2147) (MissingVacant!2147 (index!10761 (_ BitVec 32))) )
))
(declare-fun lt!144508 () SeekEntryResult!2147)

(declare-fun lt!144513 () Bool)

(assert (=> b!292103 (= res!153215 (and (not lt!144513) (= lt!144508 (MissingVacant!2147 i!1256))))))

(declare-fun lt!144510 () (_ BitVec 32))

(declare-datatypes ((array!14752 0))(
  ( (array!14753 (arr!6999 (Array (_ BitVec 32) (_ BitVec 64))) (size!7352 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14752)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!144511 () SeekEntryResult!2147)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14752 (_ BitVec 32)) SeekEntryResult!2147)

(assert (=> b!292103 (= lt!144511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144510 k0!2524 (array!14753 (store (arr!6999 a!3312) i!1256 k0!2524) (size!7352 a!3312)) mask!3809))))

(declare-fun lt!144507 () SeekEntryResult!2147)

(assert (=> b!292103 (= lt!144507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144510 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292103 (= lt!144510 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292104 () Bool)

(declare-fun e!184811 () Bool)

(assert (=> b!292104 (= e!184813 e!184811)))

(declare-fun res!153212 () Bool)

(assert (=> b!292104 (=> (not res!153212) (not e!184811))))

(declare-fun lt!144512 () Bool)

(assert (=> b!292104 (= res!153212 (and (or lt!144512 (not (undefined!2959 lt!144507))) (not lt!144512) (= (select (arr!6999 a!3312) (index!10760 lt!144507)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292104 (= lt!144512 (not ((_ is Intermediate!2147) lt!144507)))))

(declare-fun b!292105 () Bool)

(declare-fun e!184815 () Bool)

(assert (=> b!292105 (= e!184815 e!184814)))

(declare-fun res!153217 () Bool)

(assert (=> b!292105 (=> (not res!153217) (not e!184814))))

(assert (=> b!292105 (= res!153217 (or lt!144513 (= lt!144508 (MissingVacant!2147 i!1256))))))

(assert (=> b!292105 (= lt!144513 (= lt!144508 (MissingZero!2147 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14752 (_ BitVec 32)) SeekEntryResult!2147)

(assert (=> b!292105 (= lt!144508 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292106 () Bool)

(declare-fun res!153210 () Bool)

(assert (=> b!292106 (=> (not res!153210) (not e!184815))))

(declare-fun arrayContainsKey!0 (array!14752 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292106 (= res!153210 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292107 () Bool)

(declare-fun res!153216 () Bool)

(assert (=> b!292107 (=> (not res!153216) (not e!184815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292107 (= res!153216 (validKeyInArray!0 k0!2524))))

(declare-fun b!292102 () Bool)

(declare-fun res!153211 () Bool)

(assert (=> b!292102 (=> (not res!153211) (not e!184815))))

(assert (=> b!292102 (= res!153211 (and (= (size!7352 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7352 a!3312))))))

(declare-fun res!153214 () Bool)

(assert (=> start!28580 (=> (not res!153214) (not e!184815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28580 (= res!153214 (validMask!0 mask!3809))))

(assert (=> start!28580 e!184815))

(assert (=> start!28580 true))

(declare-fun array_inv!4971 (array!14752) Bool)

(assert (=> start!28580 (array_inv!4971 a!3312)))

(declare-fun b!292108 () Bool)

(declare-fun res!153213 () Bool)

(assert (=> b!292108 (=> (not res!153213) (not e!184814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14752 (_ BitVec 32)) Bool)

(assert (=> b!292108 (= res!153213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292109 () Bool)

(assert (=> b!292109 (= e!184811 (not true))))

(declare-datatypes ((Unit!9118 0))(
  ( (Unit!9119) )
))
(declare-fun lt!144509 () Unit!9118)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14752 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9118)

(assert (=> b!292109 (= lt!144509 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144510 (index!10760 lt!144507) (x!28969 lt!144507) mask!3809))))

(assert (=> b!292109 (= (index!10760 lt!144507) i!1256)))

(assert (= (and start!28580 res!153214) b!292102))

(assert (= (and b!292102 res!153211) b!292107))

(assert (= (and b!292107 res!153216) b!292106))

(assert (= (and b!292106 res!153210) b!292105))

(assert (= (and b!292105 res!153217) b!292108))

(assert (= (and b!292108 res!153213) b!292103))

(assert (= (and b!292103 res!153215) b!292104))

(assert (= (and b!292104 res!153212) b!292109))

(declare-fun m!305381 () Bool)

(assert (=> b!292109 m!305381))

(declare-fun m!305383 () Bool)

(assert (=> b!292106 m!305383))

(declare-fun m!305385 () Bool)

(assert (=> b!292105 m!305385))

(declare-fun m!305387 () Bool)

(assert (=> b!292104 m!305387))

(declare-fun m!305389 () Bool)

(assert (=> b!292103 m!305389))

(declare-fun m!305391 () Bool)

(assert (=> b!292103 m!305391))

(declare-fun m!305393 () Bool)

(assert (=> b!292103 m!305393))

(declare-fun m!305395 () Bool)

(assert (=> b!292103 m!305395))

(declare-fun m!305397 () Bool)

(assert (=> b!292108 m!305397))

(declare-fun m!305399 () Bool)

(assert (=> start!28580 m!305399))

(declare-fun m!305401 () Bool)

(assert (=> start!28580 m!305401))

(declare-fun m!305403 () Bool)

(assert (=> b!292107 m!305403))

(check-sat (not b!292108) (not start!28580) (not b!292103) (not b!292106) (not b!292105) (not b!292109) (not b!292107))
(check-sat)
