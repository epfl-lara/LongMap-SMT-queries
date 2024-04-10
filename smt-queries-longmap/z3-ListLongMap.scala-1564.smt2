; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29826 () Bool)

(assert start!29826)

(declare-fun res!158191 () Bool)

(declare-fun e!189557 () Bool)

(assert (=> start!29826 (=> (not res!158191) (not e!189557))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29826 (= res!158191 (validMask!0 mask!3809))))

(assert (=> start!29826 e!189557))

(assert (=> start!29826 true))

(declare-datatypes ((array!15149 0))(
  ( (array!15150 (arr!7170 (Array (_ BitVec 32) (_ BitVec 64))) (size!7522 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15149)

(declare-fun array_inv!5133 (array!15149) Bool)

(assert (=> start!29826 (array_inv!5133 a!3312)))

(declare-fun b!300159 () Bool)

(declare-fun res!158196 () Bool)

(assert (=> b!300159 (=> (not res!158196) (not e!189557))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300159 (= res!158196 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!300160 () Bool)

(declare-fun e!189558 () Bool)

(assert (=> b!300160 (= e!189557 e!189558)))

(declare-fun res!158195 () Bool)

(assert (=> b!300160 (=> (not res!158195) (not e!189558))))

(declare-datatypes ((SeekEntryResult!2319 0))(
  ( (MissingZero!2319 (index!11452 (_ BitVec 32))) (Found!2319 (index!11453 (_ BitVec 32))) (Intermediate!2319 (undefined!3131 Bool) (index!11454 (_ BitVec 32)) (x!29707 (_ BitVec 32))) (Undefined!2319) (MissingVacant!2319 (index!11455 (_ BitVec 32))) )
))
(declare-fun lt!149286 () SeekEntryResult!2319)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!300160 (= res!158195 (or (= lt!149286 (MissingZero!2319 i!1256)) (= lt!149286 (MissingVacant!2319 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15149 (_ BitVec 32)) SeekEntryResult!2319)

(assert (=> b!300160 (= lt!149286 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!300161 () Bool)

(declare-fun res!158193 () Bool)

(assert (=> b!300161 (=> (not res!158193) (not e!189557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300161 (= res!158193 (validKeyInArray!0 k0!2524))))

(declare-fun b!300162 () Bool)

(declare-fun res!158194 () Bool)

(assert (=> b!300162 (=> (not res!158194) (not e!189558))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15149 (_ BitVec 32)) Bool)

(assert (=> b!300162 (= res!158194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300163 () Bool)

(declare-fun res!158192 () Bool)

(assert (=> b!300163 (=> (not res!158192) (not e!189557))))

(assert (=> b!300163 (= res!158192 (and (= (size!7522 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7522 a!3312))))))

(declare-fun b!300164 () Bool)

(assert (=> b!300164 (= e!189558 false)))

(declare-fun lt!149288 () SeekEntryResult!2319)

(declare-fun lt!149289 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15149 (_ BitVec 32)) SeekEntryResult!2319)

(assert (=> b!300164 (= lt!149288 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149289 k0!2524 (array!15150 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7522 a!3312)) mask!3809))))

(declare-fun lt!149287 () SeekEntryResult!2319)

(assert (=> b!300164 (= lt!149287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149289 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300164 (= lt!149289 (toIndex!0 k0!2524 mask!3809))))

(assert (= (and start!29826 res!158191) b!300163))

(assert (= (and b!300163 res!158192) b!300161))

(assert (= (and b!300161 res!158193) b!300159))

(assert (= (and b!300159 res!158196) b!300160))

(assert (= (and b!300160 res!158195) b!300162))

(assert (= (and b!300162 res!158194) b!300164))

(declare-fun m!312203 () Bool)

(assert (=> b!300164 m!312203))

(declare-fun m!312205 () Bool)

(assert (=> b!300164 m!312205))

(declare-fun m!312207 () Bool)

(assert (=> b!300164 m!312207))

(declare-fun m!312209 () Bool)

(assert (=> b!300164 m!312209))

(declare-fun m!312211 () Bool)

(assert (=> start!29826 m!312211))

(declare-fun m!312213 () Bool)

(assert (=> start!29826 m!312213))

(declare-fun m!312215 () Bool)

(assert (=> b!300162 m!312215))

(declare-fun m!312217 () Bool)

(assert (=> b!300160 m!312217))

(declare-fun m!312219 () Bool)

(assert (=> b!300159 m!312219))

(declare-fun m!312221 () Bool)

(assert (=> b!300161 m!312221))

(check-sat (not b!300159) (not b!300160) (not b!300161) (not start!29826) (not b!300164) (not b!300162))
(check-sat)
