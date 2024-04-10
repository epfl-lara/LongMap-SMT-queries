; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30032 () Bool)

(assert start!30032)

(declare-fun b!301320 () Bool)

(declare-fun res!159075 () Bool)

(declare-fun e!190177 () Bool)

(assert (=> b!301320 (=> (not res!159075) (not e!190177))))

(declare-datatypes ((array!15252 0))(
  ( (array!15253 (arr!7218 (Array (_ BitVec 32) (_ BitVec 64))) (size!7570 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15252)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15252 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301320 (= res!159075 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301321 () Bool)

(declare-fun res!159073 () Bool)

(assert (=> b!301321 (=> (not res!159073) (not e!190177))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15252 (_ BitVec 32)) Bool)

(assert (=> b!301321 (= res!159073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!301322 () Bool)

(declare-fun res!159074 () Bool)

(assert (=> b!301322 (=> (not res!159074) (not e!190177))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301322 (= res!159074 (and (= (size!7570 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7570 a!3293))))))

(declare-fun b!301323 () Bool)

(declare-fun res!159071 () Bool)

(assert (=> b!301323 (=> (not res!159071) (not e!190177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301323 (= res!159071 (validKeyInArray!0 k0!2441))))

(declare-fun res!159072 () Bool)

(assert (=> start!30032 (=> (not res!159072) (not e!190177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30032 (= res!159072 (validMask!0 mask!3709))))

(assert (=> start!30032 e!190177))

(assert (=> start!30032 true))

(declare-fun array_inv!5181 (array!15252) Bool)

(assert (=> start!30032 (array_inv!5181 a!3293)))

(declare-fun b!301324 () Bool)

(assert (=> b!301324 (= e!190177 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsgt mask!3709 #b00111111111111111111111111111111)))))

(declare-fun b!301325 () Bool)

(declare-fun res!159070 () Bool)

(assert (=> b!301325 (=> (not res!159070) (not e!190177))))

(declare-datatypes ((SeekEntryResult!2358 0))(
  ( (MissingZero!2358 (index!11608 (_ BitVec 32))) (Found!2358 (index!11609 (_ BitVec 32))) (Intermediate!2358 (undefined!3170 Bool) (index!11610 (_ BitVec 32)) (x!29886 (_ BitVec 32))) (Undefined!2358) (MissingVacant!2358 (index!11611 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15252 (_ BitVec 32)) SeekEntryResult!2358)

(assert (=> b!301325 (= res!159070 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2358 i!1240)))))

(assert (= (and start!30032 res!159072) b!301322))

(assert (= (and b!301322 res!159074) b!301323))

(assert (= (and b!301323 res!159071) b!301320))

(assert (= (and b!301320 res!159075) b!301325))

(assert (= (and b!301325 res!159070) b!301321))

(assert (= (and b!301321 res!159073) b!301324))

(declare-fun m!313137 () Bool)

(assert (=> b!301325 m!313137))

(declare-fun m!313139 () Bool)

(assert (=> b!301320 m!313139))

(declare-fun m!313141 () Bool)

(assert (=> b!301323 m!313141))

(declare-fun m!313143 () Bool)

(assert (=> b!301321 m!313143))

(declare-fun m!313145 () Bool)

(assert (=> start!30032 m!313145))

(declare-fun m!313147 () Bool)

(assert (=> start!30032 m!313147))

(check-sat (not b!301323) (not b!301320) (not start!30032) (not b!301321) (not b!301325))
(check-sat)
(get-model)

(declare-fun b!301368 () Bool)

(declare-fun c!48732 () Bool)

(declare-fun lt!149806 () (_ BitVec 64))

(assert (=> b!301368 (= c!48732 (= lt!149806 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!190201 () SeekEntryResult!2358)

(declare-fun e!190200 () SeekEntryResult!2358)

(assert (=> b!301368 (= e!190201 e!190200)))

(declare-fun b!301369 () Bool)

(declare-fun lt!149808 () SeekEntryResult!2358)

(assert (=> b!301369 (= e!190200 (MissingZero!2358 (index!11610 lt!149808)))))

(declare-fun d!67865 () Bool)

(declare-fun lt!149807 () SeekEntryResult!2358)

(get-info :version)

(assert (=> d!67865 (and (or ((_ is Undefined!2358) lt!149807) (not ((_ is Found!2358) lt!149807)) (and (bvsge (index!11609 lt!149807) #b00000000000000000000000000000000) (bvslt (index!11609 lt!149807) (size!7570 a!3293)))) (or ((_ is Undefined!2358) lt!149807) ((_ is Found!2358) lt!149807) (not ((_ is MissingZero!2358) lt!149807)) (and (bvsge (index!11608 lt!149807) #b00000000000000000000000000000000) (bvslt (index!11608 lt!149807) (size!7570 a!3293)))) (or ((_ is Undefined!2358) lt!149807) ((_ is Found!2358) lt!149807) ((_ is MissingZero!2358) lt!149807) (not ((_ is MissingVacant!2358) lt!149807)) (and (bvsge (index!11611 lt!149807) #b00000000000000000000000000000000) (bvslt (index!11611 lt!149807) (size!7570 a!3293)))) (or ((_ is Undefined!2358) lt!149807) (ite ((_ is Found!2358) lt!149807) (= (select (arr!7218 a!3293) (index!11609 lt!149807)) k0!2441) (ite ((_ is MissingZero!2358) lt!149807) (= (select (arr!7218 a!3293) (index!11608 lt!149807)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2358) lt!149807) (= (select (arr!7218 a!3293) (index!11611 lt!149807)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!190199 () SeekEntryResult!2358)

(assert (=> d!67865 (= lt!149807 e!190199)))

(declare-fun c!48730 () Bool)

(assert (=> d!67865 (= c!48730 (and ((_ is Intermediate!2358) lt!149808) (undefined!3170 lt!149808)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15252 (_ BitVec 32)) SeekEntryResult!2358)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67865 (= lt!149808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!67865 (validMask!0 mask!3709)))

(assert (=> d!67865 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!149807)))

(declare-fun b!301370 () Bool)

(assert (=> b!301370 (= e!190199 Undefined!2358)))

(declare-fun b!301371 () Bool)

(assert (=> b!301371 (= e!190199 e!190201)))

(assert (=> b!301371 (= lt!149806 (select (arr!7218 a!3293) (index!11610 lt!149808)))))

(declare-fun c!48731 () Bool)

(assert (=> b!301371 (= c!48731 (= lt!149806 k0!2441))))

(declare-fun b!301372 () Bool)

(assert (=> b!301372 (= e!190201 (Found!2358 (index!11610 lt!149808)))))

(declare-fun b!301373 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15252 (_ BitVec 32)) SeekEntryResult!2358)

(assert (=> b!301373 (= e!190200 (seekKeyOrZeroReturnVacant!0 (x!29886 lt!149808) (index!11610 lt!149808) (index!11610 lt!149808) k0!2441 a!3293 mask!3709))))

(assert (= (and d!67865 c!48730) b!301370))

(assert (= (and d!67865 (not c!48730)) b!301371))

(assert (= (and b!301371 c!48731) b!301372))

(assert (= (and b!301371 (not c!48731)) b!301368))

(assert (= (and b!301368 c!48732) b!301369))

(assert (= (and b!301368 (not c!48732)) b!301373))

(declare-fun m!313173 () Bool)

(assert (=> d!67865 m!313173))

(assert (=> d!67865 m!313145))

(declare-fun m!313175 () Bool)

(assert (=> d!67865 m!313175))

(declare-fun m!313177 () Bool)

(assert (=> d!67865 m!313177))

(assert (=> d!67865 m!313175))

(declare-fun m!313179 () Bool)

(assert (=> d!67865 m!313179))

(declare-fun m!313181 () Bool)

(assert (=> d!67865 m!313181))

(declare-fun m!313183 () Bool)

(assert (=> b!301371 m!313183))

(declare-fun m!313185 () Bool)

(assert (=> b!301373 m!313185))

(assert (=> b!301325 d!67865))

(declare-fun d!67877 () Bool)

(declare-fun res!159104 () Bool)

(declare-fun e!190206 () Bool)

(assert (=> d!67877 (=> res!159104 e!190206)))

(assert (=> d!67877 (= res!159104 (= (select (arr!7218 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!67877 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!190206)))

(declare-fun b!301378 () Bool)

(declare-fun e!190207 () Bool)

(assert (=> b!301378 (= e!190206 e!190207)))

(declare-fun res!159105 () Bool)

(assert (=> b!301378 (=> (not res!159105) (not e!190207))))

(assert (=> b!301378 (= res!159105 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7570 a!3293)))))

(declare-fun b!301379 () Bool)

(assert (=> b!301379 (= e!190207 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67877 (not res!159104)) b!301378))

(assert (= (and b!301378 res!159105) b!301379))

(declare-fun m!313187 () Bool)

(assert (=> d!67877 m!313187))

(declare-fun m!313189 () Bool)

(assert (=> b!301379 m!313189))

(assert (=> b!301320 d!67877))

(declare-fun b!301406 () Bool)

(declare-fun e!190227 () Bool)

(declare-fun e!190226 () Bool)

(assert (=> b!301406 (= e!190227 e!190226)))

(declare-fun lt!149822 () (_ BitVec 64))

(assert (=> b!301406 (= lt!149822 (select (arr!7218 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9375 0))(
  ( (Unit!9376) )
))
(declare-fun lt!149823 () Unit!9375)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15252 (_ BitVec 64) (_ BitVec 32)) Unit!9375)

(assert (=> b!301406 (= lt!149823 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149822 #b00000000000000000000000000000000))))

(assert (=> b!301406 (arrayContainsKey!0 a!3293 lt!149822 #b00000000000000000000000000000000)))

(declare-fun lt!149821 () Unit!9375)

(assert (=> b!301406 (= lt!149821 lt!149823)))

(declare-fun res!159116 () Bool)

(assert (=> b!301406 (= res!159116 (= (seekEntryOrOpen!0 (select (arr!7218 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2358 #b00000000000000000000000000000000)))))

(assert (=> b!301406 (=> (not res!159116) (not e!190226))))

(declare-fun b!301407 () Bool)

(declare-fun call!25870 () Bool)

(assert (=> b!301407 (= e!190227 call!25870)))

(declare-fun d!67879 () Bool)

(declare-fun res!159117 () Bool)

(declare-fun e!190228 () Bool)

(assert (=> d!67879 (=> res!159117 e!190228)))

(assert (=> d!67879 (= res!159117 (bvsge #b00000000000000000000000000000000 (size!7570 a!3293)))))

(assert (=> d!67879 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190228)))

(declare-fun b!301408 () Bool)

(assert (=> b!301408 (= e!190226 call!25870)))

(declare-fun bm!25867 () Bool)

(assert (=> bm!25867 (= call!25870 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!301409 () Bool)

(assert (=> b!301409 (= e!190228 e!190227)))

(declare-fun c!48741 () Bool)

(assert (=> b!301409 (= c!48741 (validKeyInArray!0 (select (arr!7218 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!67879 (not res!159117)) b!301409))

(assert (= (and b!301409 c!48741) b!301406))

(assert (= (and b!301409 (not c!48741)) b!301407))

(assert (= (and b!301406 res!159116) b!301408))

(assert (= (or b!301408 b!301407) bm!25867))

(assert (=> b!301406 m!313187))

(declare-fun m!313195 () Bool)

(assert (=> b!301406 m!313195))

(declare-fun m!313197 () Bool)

(assert (=> b!301406 m!313197))

(assert (=> b!301406 m!313187))

(declare-fun m!313199 () Bool)

(assert (=> b!301406 m!313199))

(declare-fun m!313201 () Bool)

(assert (=> bm!25867 m!313201))

(assert (=> b!301409 m!313187))

(assert (=> b!301409 m!313187))

(declare-fun m!313203 () Bool)

(assert (=> b!301409 m!313203))

(assert (=> b!301321 d!67879))

(declare-fun d!67883 () Bool)

(assert (=> d!67883 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30032 d!67883))

(declare-fun d!67887 () Bool)

(assert (=> d!67887 (= (array_inv!5181 a!3293) (bvsge (size!7570 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30032 d!67887))

(declare-fun d!67889 () Bool)

(assert (=> d!67889 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301323 d!67889))

(check-sat (not d!67865) (not b!301409) (not b!301373) (not b!301379) (not b!301406) (not bm!25867))
(check-sat)
