; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28576 () Bool)

(assert start!28576)

(declare-fun res!153327 () Bool)

(declare-fun e!184940 () Bool)

(assert (=> start!28576 (=> (not res!153327) (not e!184940))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28576 (= res!153327 (validMask!0 mask!3809))))

(assert (=> start!28576 e!184940))

(assert (=> start!28576 true))

(declare-datatypes ((array!14760 0))(
  ( (array!14761 (arr!7003 (Array (_ BitVec 32) (_ BitVec 64))) (size!7355 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14760)

(declare-fun array_inv!4953 (array!14760) Bool)

(assert (=> start!28576 (array_inv!4953 a!3312)))

(declare-fun b!292296 () Bool)

(declare-fun res!153333 () Bool)

(assert (=> b!292296 (=> (not res!153333) (not e!184940))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292296 (= res!153333 (validKeyInArray!0 k0!2524))))

(declare-fun b!292297 () Bool)

(declare-fun e!184938 () Bool)

(assert (=> b!292297 (= e!184938 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2117 0))(
  ( (MissingZero!2117 (index!10638 (_ BitVec 32))) (Found!2117 (index!10639 (_ BitVec 32))) (Intermediate!2117 (undefined!2929 Bool) (index!10640 (_ BitVec 32)) (x!28940 (_ BitVec 32))) (Undefined!2117) (MissingVacant!2117 (index!10641 (_ BitVec 32))) )
))
(declare-fun lt!144749 () SeekEntryResult!2117)

(declare-datatypes ((Unit!9136 0))(
  ( (Unit!9137) )
))
(declare-fun lt!144747 () Unit!9136)

(declare-fun lt!144752 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14760 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9136)

(assert (=> b!292297 (= lt!144747 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144752 (index!10640 lt!144749) (x!28940 lt!144749) mask!3809))))

(assert (=> b!292297 (= (index!10640 lt!144749) i!1256)))

(declare-fun b!292298 () Bool)

(declare-fun e!184936 () Bool)

(declare-fun e!184937 () Bool)

(assert (=> b!292298 (= e!184936 e!184937)))

(declare-fun res!153332 () Bool)

(assert (=> b!292298 (=> (not res!153332) (not e!184937))))

(declare-fun lt!144750 () Bool)

(declare-fun lt!144753 () SeekEntryResult!2117)

(assert (=> b!292298 (= res!153332 (and (not lt!144750) (= lt!144753 (MissingVacant!2117 i!1256))))))

(declare-fun lt!144751 () SeekEntryResult!2117)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14760 (_ BitVec 32)) SeekEntryResult!2117)

(assert (=> b!292298 (= lt!144751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144752 k0!2524 (array!14761 (store (arr!7003 a!3312) i!1256 k0!2524) (size!7355 a!3312)) mask!3809))))

(assert (=> b!292298 (= lt!144749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144752 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292298 (= lt!144752 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292299 () Bool)

(declare-fun res!153329 () Bool)

(assert (=> b!292299 (=> (not res!153329) (not e!184940))))

(assert (=> b!292299 (= res!153329 (and (= (size!7355 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7355 a!3312))))))

(declare-fun b!292300 () Bool)

(assert (=> b!292300 (= e!184940 e!184936)))

(declare-fun res!153326 () Bool)

(assert (=> b!292300 (=> (not res!153326) (not e!184936))))

(assert (=> b!292300 (= res!153326 (or lt!144750 (= lt!144753 (MissingVacant!2117 i!1256))))))

(assert (=> b!292300 (= lt!144750 (= lt!144753 (MissingZero!2117 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14760 (_ BitVec 32)) SeekEntryResult!2117)

(assert (=> b!292300 (= lt!144753 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292301 () Bool)

(declare-fun res!153328 () Bool)

(assert (=> b!292301 (=> (not res!153328) (not e!184936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14760 (_ BitVec 32)) Bool)

(assert (=> b!292301 (= res!153328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!292302 () Bool)

(assert (=> b!292302 (= e!184937 e!184938)))

(declare-fun res!153330 () Bool)

(assert (=> b!292302 (=> (not res!153330) (not e!184938))))

(declare-fun lt!144748 () Bool)

(assert (=> b!292302 (= res!153330 (and (or lt!144748 (not (undefined!2929 lt!144749))) (not lt!144748) (= (select (arr!7003 a!3312) (index!10640 lt!144749)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292302 (= lt!144748 (not ((_ is Intermediate!2117) lt!144749)))))

(declare-fun b!292303 () Bool)

(declare-fun res!153331 () Bool)

(assert (=> b!292303 (=> (not res!153331) (not e!184940))))

(declare-fun arrayContainsKey!0 (array!14760 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292303 (= res!153331 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28576 res!153327) b!292299))

(assert (= (and b!292299 res!153329) b!292296))

(assert (= (and b!292296 res!153333) b!292303))

(assert (= (and b!292303 res!153331) b!292300))

(assert (= (and b!292300 res!153326) b!292301))

(assert (= (and b!292301 res!153328) b!292298))

(assert (= (and b!292298 res!153332) b!292302))

(assert (= (and b!292302 res!153330) b!292297))

(declare-fun m!306179 () Bool)

(assert (=> start!28576 m!306179))

(declare-fun m!306181 () Bool)

(assert (=> start!28576 m!306181))

(declare-fun m!306183 () Bool)

(assert (=> b!292296 m!306183))

(declare-fun m!306185 () Bool)

(assert (=> b!292297 m!306185))

(declare-fun m!306187 () Bool)

(assert (=> b!292302 m!306187))

(declare-fun m!306189 () Bool)

(assert (=> b!292298 m!306189))

(declare-fun m!306191 () Bool)

(assert (=> b!292298 m!306191))

(declare-fun m!306193 () Bool)

(assert (=> b!292298 m!306193))

(declare-fun m!306195 () Bool)

(assert (=> b!292298 m!306195))

(declare-fun m!306197 () Bool)

(assert (=> b!292300 m!306197))

(declare-fun m!306199 () Bool)

(assert (=> b!292303 m!306199))

(declare-fun m!306201 () Bool)

(assert (=> b!292301 m!306201))

(check-sat (not b!292300) (not b!292297) (not b!292298) (not start!28576) (not b!292296) (not b!292303) (not b!292301))
(check-sat)
