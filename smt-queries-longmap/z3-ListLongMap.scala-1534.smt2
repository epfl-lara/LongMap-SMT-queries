; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29120 () Bool)

(assert start!29120)

(declare-fun b!295311 () Bool)

(declare-fun e!186651 () Bool)

(assert (=> b!295311 (= e!186651 (not true))))

(declare-datatypes ((array!14926 0))(
  ( (array!14927 (arr!7074 (Array (_ BitVec 32) (_ BitVec 64))) (size!7427 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14926)

(declare-datatypes ((SeekEntryResult!2222 0))(
  ( (MissingZero!2222 (index!11058 (_ BitVec 32))) (Found!2222 (index!11059 (_ BitVec 32))) (Intermediate!2222 (undefined!3034 Bool) (index!11060 (_ BitVec 32)) (x!29294 (_ BitVec 32))) (Undefined!2222) (MissingVacant!2222 (index!11061 (_ BitVec 32))) )
))
(declare-fun lt!146337 () SeekEntryResult!2222)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295311 (and (= (select (arr!7074 a!3312) (index!11060 lt!146337)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11060 lt!146337) i!1256))))

(declare-fun b!295312 () Bool)

(declare-fun e!186650 () Bool)

(declare-fun e!186652 () Bool)

(assert (=> b!295312 (= e!186650 e!186652)))

(declare-fun res!155250 () Bool)

(assert (=> b!295312 (=> (not res!155250) (not e!186652))))

(declare-fun lt!146334 () Bool)

(declare-fun lt!146332 () SeekEntryResult!2222)

(assert (=> b!295312 (= res!155250 (or lt!146334 (= lt!146332 (MissingVacant!2222 i!1256))))))

(assert (=> b!295312 (= lt!146334 (= lt!146332 (MissingZero!2222 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14926 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!295312 (= lt!146332 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295313 () Bool)

(declare-fun res!155247 () Bool)

(assert (=> b!295313 (=> (not res!155247) (not e!186652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14926 (_ BitVec 32)) Bool)

(assert (=> b!295313 (= res!155247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295314 () Bool)

(declare-fun res!155253 () Bool)

(assert (=> b!295314 (=> (not res!155253) (not e!186650))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295314 (= res!155253 (validKeyInArray!0 k0!2524))))

(declare-fun b!295315 () Bool)

(declare-fun e!186649 () Bool)

(assert (=> b!295315 (= e!186649 e!186651)))

(declare-fun res!155249 () Bool)

(assert (=> b!295315 (=> (not res!155249) (not e!186651))))

(declare-fun lt!146335 () Bool)

(assert (=> b!295315 (= res!155249 (and (or lt!146335 (not (undefined!3034 lt!146337))) (or lt!146335 (not (= (select (arr!7074 a!3312) (index!11060 lt!146337)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146335 (not (= (select (arr!7074 a!3312) (index!11060 lt!146337)) k0!2524))) (not lt!146335)))))

(get-info :version)

(assert (=> b!295315 (= lt!146335 (not ((_ is Intermediate!2222) lt!146337)))))

(declare-fun b!295316 () Bool)

(declare-fun res!155254 () Bool)

(assert (=> b!295316 (=> (not res!155254) (not e!186650))))

(assert (=> b!295316 (= res!155254 (and (= (size!7427 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7427 a!3312))))))

(declare-fun res!155248 () Bool)

(assert (=> start!29120 (=> (not res!155248) (not e!186650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29120 (= res!155248 (validMask!0 mask!3809))))

(assert (=> start!29120 e!186650))

(assert (=> start!29120 true))

(declare-fun array_inv!5046 (array!14926) Bool)

(assert (=> start!29120 (array_inv!5046 a!3312)))

(declare-fun b!295317 () Bool)

(assert (=> b!295317 (= e!186652 e!186649)))

(declare-fun res!155252 () Bool)

(assert (=> b!295317 (=> (not res!155252) (not e!186649))))

(assert (=> b!295317 (= res!155252 lt!146334)))

(declare-fun lt!146336 () SeekEntryResult!2222)

(declare-fun lt!146333 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14926 (_ BitVec 32)) SeekEntryResult!2222)

(assert (=> b!295317 (= lt!146336 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146333 k0!2524 (array!14927 (store (arr!7074 a!3312) i!1256 k0!2524) (size!7427 a!3312)) mask!3809))))

(assert (=> b!295317 (= lt!146337 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146333 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295317 (= lt!146333 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295318 () Bool)

(declare-fun res!155251 () Bool)

(assert (=> b!295318 (=> (not res!155251) (not e!186650))))

(declare-fun arrayContainsKey!0 (array!14926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295318 (= res!155251 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29120 res!155248) b!295316))

(assert (= (and b!295316 res!155254) b!295314))

(assert (= (and b!295314 res!155253) b!295318))

(assert (= (and b!295318 res!155251) b!295312))

(assert (= (and b!295312 res!155250) b!295313))

(assert (= (and b!295313 res!155247) b!295317))

(assert (= (and b!295317 res!155252) b!295315))

(assert (= (and b!295315 res!155249) b!295311))

(declare-fun m!307959 () Bool)

(assert (=> b!295318 m!307959))

(declare-fun m!307961 () Bool)

(assert (=> start!29120 m!307961))

(declare-fun m!307963 () Bool)

(assert (=> start!29120 m!307963))

(declare-fun m!307965 () Bool)

(assert (=> b!295315 m!307965))

(declare-fun m!307967 () Bool)

(assert (=> b!295317 m!307967))

(declare-fun m!307969 () Bool)

(assert (=> b!295317 m!307969))

(declare-fun m!307971 () Bool)

(assert (=> b!295317 m!307971))

(declare-fun m!307973 () Bool)

(assert (=> b!295317 m!307973))

(assert (=> b!295311 m!307965))

(declare-fun m!307975 () Bool)

(assert (=> b!295312 m!307975))

(declare-fun m!307977 () Bool)

(assert (=> b!295314 m!307977))

(declare-fun m!307979 () Bool)

(assert (=> b!295313 m!307979))

(check-sat (not b!295314) (not b!295318) (not b!295313) (not start!29120) (not b!295312) (not b!295317))
(check-sat)
