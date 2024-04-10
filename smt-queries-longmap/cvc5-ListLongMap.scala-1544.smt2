; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29194 () Bool)

(assert start!29194)

(declare-fun res!156090 () Bool)

(declare-fun e!187259 () Bool)

(assert (=> start!29194 (=> (not res!156090) (not e!187259))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29194 (= res!156090 (validMask!0 mask!3809))))

(assert (=> start!29194 e!187259))

(assert (=> start!29194 true))

(declare-datatypes ((array!14997 0))(
  ( (array!14998 (arr!7109 (Array (_ BitVec 32) (_ BitVec 64))) (size!7461 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14997)

(declare-fun array_inv!5072 (array!14997) Bool)

(assert (=> start!29194 (array_inv!5072 a!3312)))

(declare-fun b!296278 () Bool)

(declare-fun res!156086 () Bool)

(assert (=> b!296278 (=> (not res!156086) (not e!187259))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296278 (= res!156086 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296279 () Bool)

(declare-fun e!187261 () Bool)

(declare-fun e!187257 () Bool)

(assert (=> b!296279 (= e!187261 e!187257)))

(declare-fun res!156087 () Bool)

(assert (=> b!296279 (=> (not res!156087) (not e!187257))))

(declare-fun lt!147095 () Bool)

(assert (=> b!296279 (= res!156087 lt!147095)))

(declare-fun lt!147099 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2258 0))(
  ( (MissingZero!2258 (index!11202 (_ BitVec 32))) (Found!2258 (index!11203 (_ BitVec 32))) (Intermediate!2258 (undefined!3070 Bool) (index!11204 (_ BitVec 32)) (x!29414 (_ BitVec 32))) (Undefined!2258) (MissingVacant!2258 (index!11205 (_ BitVec 32))) )
))
(declare-fun lt!147098 () SeekEntryResult!2258)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14997 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!296279 (= lt!147098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147099 k!2524 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312)) mask!3809))))

(declare-fun lt!147094 () SeekEntryResult!2258)

(assert (=> b!296279 (= lt!147094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147099 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296279 (= lt!147099 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296280 () Bool)

(declare-fun res!156091 () Bool)

(assert (=> b!296280 (=> (not res!156091) (not e!187259))))

(assert (=> b!296280 (= res!156091 (and (= (size!7461 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7461 a!3312))))))

(declare-fun b!296281 () Bool)

(declare-fun res!156092 () Bool)

(assert (=> b!296281 (=> (not res!156092) (not e!187261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14997 (_ BitVec 32)) Bool)

(assert (=> b!296281 (= res!156092 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296282 () Bool)

(assert (=> b!296282 (= e!187259 e!187261)))

(declare-fun res!156088 () Bool)

(assert (=> b!296282 (=> (not res!156088) (not e!187261))))

(declare-fun lt!147096 () SeekEntryResult!2258)

(assert (=> b!296282 (= res!156088 (or lt!147095 (= lt!147096 (MissingVacant!2258 i!1256))))))

(assert (=> b!296282 (= lt!147095 (= lt!147096 (MissingZero!2258 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14997 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!296282 (= lt!147096 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296283 () Bool)

(declare-fun e!187260 () Bool)

(assert (=> b!296283 (= e!187257 e!187260)))

(declare-fun res!156093 () Bool)

(assert (=> b!296283 (=> (not res!156093) (not e!187260))))

(declare-fun lt!147097 () Bool)

(assert (=> b!296283 (= res!156093 (and (or lt!147097 (not (undefined!3070 lt!147094))) (or lt!147097 (not (= (select (arr!7109 a!3312) (index!11204 lt!147094)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147097 (not (= (select (arr!7109 a!3312) (index!11204 lt!147094)) k!2524))) (not lt!147097)))))

(assert (=> b!296283 (= lt!147097 (not (is-Intermediate!2258 lt!147094)))))

(declare-fun b!296284 () Bool)

(declare-fun res!156089 () Bool)

(assert (=> b!296284 (=> (not res!156089) (not e!187259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296284 (= res!156089 (validKeyInArray!0 k!2524))))

(declare-fun b!296285 () Bool)

(assert (=> b!296285 (= e!187260 (not (or (not (= lt!147094 (Intermediate!2258 false (index!11204 lt!147094) (x!29414 lt!147094)))) (bvsle #b00000000000000000000000000000000 (x!29414 lt!147094)))))))

(assert (=> b!296285 (and (= (select (arr!7109 a!3312) (index!11204 lt!147094)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11204 lt!147094) i!1256))))

(assert (= (and start!29194 res!156090) b!296280))

(assert (= (and b!296280 res!156091) b!296284))

(assert (= (and b!296284 res!156089) b!296278))

(assert (= (and b!296278 res!156086) b!296282))

(assert (= (and b!296282 res!156088) b!296281))

(assert (= (and b!296281 res!156092) b!296279))

(assert (= (and b!296279 res!156087) b!296283))

(assert (= (and b!296283 res!156093) b!296285))

(declare-fun m!309315 () Bool)

(assert (=> b!296279 m!309315))

(declare-fun m!309317 () Bool)

(assert (=> b!296279 m!309317))

(declare-fun m!309319 () Bool)

(assert (=> b!296279 m!309319))

(declare-fun m!309321 () Bool)

(assert (=> b!296279 m!309321))

(declare-fun m!309323 () Bool)

(assert (=> b!296282 m!309323))

(declare-fun m!309325 () Bool)

(assert (=> start!29194 m!309325))

(declare-fun m!309327 () Bool)

(assert (=> start!29194 m!309327))

(declare-fun m!309329 () Bool)

(assert (=> b!296281 m!309329))

(declare-fun m!309331 () Bool)

(assert (=> b!296285 m!309331))

(assert (=> b!296283 m!309331))

(declare-fun m!309333 () Bool)

(assert (=> b!296278 m!309333))

(declare-fun m!309335 () Bool)

(assert (=> b!296284 m!309335))

(push 1)

(assert (not b!296284))

(assert (not b!296281))

(assert (not b!296279))

(assert (not b!296278))

(assert (not b!296282))

(assert (not start!29194))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67043 () Bool)

(declare-fun res!156156 () Bool)

(declare-fun e!187313 () Bool)

(assert (=> d!67043 (=> res!156156 e!187313)))

(assert (=> d!67043 (= res!156156 (bvsge #b00000000000000000000000000000000 (size!7461 a!3312)))))

(assert (=> d!67043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187313)))

(declare-fun b!296369 () Bool)

(declare-fun e!187314 () Bool)

(declare-fun e!187315 () Bool)

(assert (=> b!296369 (= e!187314 e!187315)))

(declare-fun lt!147150 () (_ BitVec 64))

(assert (=> b!296369 (= lt!147150 (select (arr!7109 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9226 0))(
  ( (Unit!9227) )
))
(declare-fun lt!147148 () Unit!9226)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14997 (_ BitVec 64) (_ BitVec 32)) Unit!9226)

(assert (=> b!296369 (= lt!147148 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147150 #b00000000000000000000000000000000))))

(assert (=> b!296369 (arrayContainsKey!0 a!3312 lt!147150 #b00000000000000000000000000000000)))

(declare-fun lt!147149 () Unit!9226)

(assert (=> b!296369 (= lt!147149 lt!147148)))

(declare-fun res!156155 () Bool)

(assert (=> b!296369 (= res!156155 (= (seekEntryOrOpen!0 (select (arr!7109 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2258 #b00000000000000000000000000000000)))))

(assert (=> b!296369 (=> (not res!156155) (not e!187315))))

(declare-fun b!296370 () Bool)

(assert (=> b!296370 (= e!187313 e!187314)))

(declare-fun c!47685 () Bool)

(assert (=> b!296370 (= c!47685 (validKeyInArray!0 (select (arr!7109 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296371 () Bool)

(declare-fun call!25738 () Bool)

(assert (=> b!296371 (= e!187315 call!25738)))

(declare-fun bm!25735 () Bool)

(assert (=> bm!25735 (= call!25738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!296372 () Bool)

(assert (=> b!296372 (= e!187314 call!25738)))

(assert (= (and d!67043 (not res!156156)) b!296370))

(assert (= (and b!296370 c!47685) b!296369))

(assert (= (and b!296370 (not c!47685)) b!296372))

(assert (= (and b!296369 res!156155) b!296371))

(assert (= (or b!296371 b!296372) bm!25735))

(declare-fun m!309389 () Bool)

(assert (=> b!296369 m!309389))

(declare-fun m!309391 () Bool)

(assert (=> b!296369 m!309391))

(declare-fun m!309393 () Bool)

(assert (=> b!296369 m!309393))

(assert (=> b!296369 m!309389))

(declare-fun m!309395 () Bool)

(assert (=> b!296369 m!309395))

(assert (=> b!296370 m!309389))

(assert (=> b!296370 m!309389))

(declare-fun m!309397 () Bool)

(assert (=> b!296370 m!309397))

(declare-fun m!309399 () Bool)

(assert (=> bm!25735 m!309399))

(assert (=> b!296281 d!67043))

(declare-fun d!67049 () Bool)

(assert (=> d!67049 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296284 d!67049))

(declare-fun d!67053 () Bool)

(assert (=> d!67053 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29194 d!67053))

(declare-fun d!67057 () Bool)

(assert (=> d!67057 (= (array_inv!5072 a!3312) (bvsge (size!7461 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29194 d!67057))

(declare-fun lt!147186 () SeekEntryResult!2258)

(declare-fun b!296454 () Bool)

(assert (=> b!296454 (and (bvsge (index!11204 lt!147186) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147186) (size!7461 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312)))))))

(declare-fun e!187370 () Bool)

(assert (=> b!296454 (= e!187370 (= (select (arr!7109 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312))) (index!11204 lt!147186)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67059 () Bool)

(declare-fun e!187367 () Bool)

(assert (=> d!67059 e!187367))

(declare-fun c!47712 () Bool)

(assert (=> d!67059 (= c!47712 (and (is-Intermediate!2258 lt!147186) (undefined!3070 lt!147186)))))

(declare-fun e!187366 () SeekEntryResult!2258)

(assert (=> d!67059 (= lt!147186 e!187366)))

(declare-fun c!47710 () Bool)

(assert (=> d!67059 (= c!47710 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147187 () (_ BitVec 64))

(assert (=> d!67059 (= lt!147187 (select (arr!7109 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312))) lt!147099))))

(assert (=> d!67059 (validMask!0 mask!3809)))

(assert (=> d!67059 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147099 k!2524 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312)) mask!3809) lt!147186)))

(declare-fun b!296455 () Bool)

(declare-fun e!187368 () SeekEntryResult!2258)

(assert (=> b!296455 (= e!187366 e!187368)))

(declare-fun c!47711 () Bool)

(assert (=> b!296455 (= c!47711 (or (= lt!147187 k!2524) (= (bvadd lt!147187 lt!147187) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296456 () Bool)

(assert (=> b!296456 (and (bvsge (index!11204 lt!147186) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147186) (size!7461 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312)))))))

(declare-fun res!156192 () Bool)

(assert (=> b!296456 (= res!156192 (= (select (arr!7109 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312))) (index!11204 lt!147186)) k!2524))))

(assert (=> b!296456 (=> res!156192 e!187370)))

(declare-fun e!187369 () Bool)

(assert (=> b!296456 (= e!187369 e!187370)))

(declare-fun b!296457 () Bool)

(assert (=> b!296457 (= e!187367 (bvsge (x!29414 lt!147186) #b01111111111111111111111111111110))))

(declare-fun b!296458 () Bool)

(assert (=> b!296458 (= e!187368 (Intermediate!2258 false lt!147099 #b00000000000000000000000000000000))))

(declare-fun b!296459 () Bool)

(assert (=> b!296459 (and (bvsge (index!11204 lt!147186) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147186) (size!7461 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312)))))))

(declare-fun res!156193 () Bool)

(assert (=> b!296459 (= res!156193 (= (select (arr!7109 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312))) (index!11204 lt!147186)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296459 (=> res!156193 e!187370)))

(declare-fun b!296460 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296460 (= e!187368 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147099 #b00000000000000000000000000000000 mask!3809) k!2524 (array!14998 (store (arr!7109 a!3312) i!1256 k!2524) (size!7461 a!3312)) mask!3809))))

(declare-fun b!296461 () Bool)

(assert (=> b!296461 (= e!187367 e!187369)))

(declare-fun res!156194 () Bool)

(assert (=> b!296461 (= res!156194 (and (is-Intermediate!2258 lt!147186) (not (undefined!3070 lt!147186)) (bvslt (x!29414 lt!147186) #b01111111111111111111111111111110) (bvsge (x!29414 lt!147186) #b00000000000000000000000000000000) (bvsge (x!29414 lt!147186) #b00000000000000000000000000000000)))))

(assert (=> b!296461 (=> (not res!156194) (not e!187369))))

(declare-fun b!296462 () Bool)

(assert (=> b!296462 (= e!187366 (Intermediate!2258 true lt!147099 #b00000000000000000000000000000000))))

(assert (= (and d!67059 c!47710) b!296462))

(assert (= (and d!67059 (not c!47710)) b!296455))

(assert (= (and b!296455 c!47711) b!296458))

(assert (= (and b!296455 (not c!47711)) b!296460))

(assert (= (and d!67059 c!47712) b!296457))

(assert (= (and d!67059 (not c!47712)) b!296461))

(assert (= (and b!296461 res!156194) b!296456))

(assert (= (and b!296456 (not res!156192)) b!296459))

(assert (= (and b!296459 (not res!156193)) b!296454))

(declare-fun m!309437 () Bool)

(assert (=> b!296456 m!309437))

(declare-fun m!309439 () Bool)

(assert (=> b!296460 m!309439))

(assert (=> b!296460 m!309439))

(declare-fun m!309441 () Bool)

(assert (=> b!296460 m!309441))

(assert (=> b!296454 m!309437))

(assert (=> b!296459 m!309437))

(declare-fun m!309443 () Bool)

(assert (=> d!67059 m!309443))

(assert (=> d!67059 m!309325))

(assert (=> b!296279 d!67059))

(declare-fun b!296463 () Bool)

(declare-fun lt!147188 () SeekEntryResult!2258)

(assert (=> b!296463 (and (bvsge (index!11204 lt!147188) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147188) (size!7461 a!3312)))))

(declare-fun e!187375 () Bool)

(assert (=> b!296463 (= e!187375 (= (select (arr!7109 a!3312) (index!11204 lt!147188)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!67079 () Bool)

(declare-fun e!187372 () Bool)

(assert (=> d!67079 e!187372))

(declare-fun c!47715 () Bool)

(assert (=> d!67079 (= c!47715 (and (is-Intermediate!2258 lt!147188) (undefined!3070 lt!147188)))))

(declare-fun e!187371 () SeekEntryResult!2258)

(assert (=> d!67079 (= lt!147188 e!187371)))

(declare-fun c!47713 () Bool)

(assert (=> d!67079 (= c!47713 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!147189 () (_ BitVec 64))

(assert (=> d!67079 (= lt!147189 (select (arr!7109 a!3312) lt!147099))))

(assert (=> d!67079 (validMask!0 mask!3809)))

(assert (=> d!67079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147099 k!2524 a!3312 mask!3809) lt!147188)))

(declare-fun b!296464 () Bool)

(declare-fun e!187373 () SeekEntryResult!2258)

(assert (=> b!296464 (= e!187371 e!187373)))

(declare-fun c!47714 () Bool)

(assert (=> b!296464 (= c!47714 (or (= lt!147189 k!2524) (= (bvadd lt!147189 lt!147189) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!296465 () Bool)

(assert (=> b!296465 (and (bvsge (index!11204 lt!147188) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147188) (size!7461 a!3312)))))

(declare-fun res!156195 () Bool)

(assert (=> b!296465 (= res!156195 (= (select (arr!7109 a!3312) (index!11204 lt!147188)) k!2524))))

(assert (=> b!296465 (=> res!156195 e!187375)))

(declare-fun e!187374 () Bool)

(assert (=> b!296465 (= e!187374 e!187375)))

(declare-fun b!296466 () Bool)

(assert (=> b!296466 (= e!187372 (bvsge (x!29414 lt!147188) #b01111111111111111111111111111110))))

(declare-fun b!296467 () Bool)

(assert (=> b!296467 (= e!187373 (Intermediate!2258 false lt!147099 #b00000000000000000000000000000000))))

(declare-fun b!296468 () Bool)

(assert (=> b!296468 (and (bvsge (index!11204 lt!147188) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147188) (size!7461 a!3312)))))

(declare-fun res!156196 () Bool)

(assert (=> b!296468 (= res!156196 (= (select (arr!7109 a!3312) (index!11204 lt!147188)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296468 (=> res!156196 e!187375)))

(declare-fun b!296469 () Bool)

(assert (=> b!296469 (= e!187373 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147099 #b00000000000000000000000000000000 mask!3809) k!2524 a!3312 mask!3809))))

(declare-fun b!296470 () Bool)

(assert (=> b!296470 (= e!187372 e!187374)))

(declare-fun res!156197 () Bool)

(assert (=> b!296470 (= res!156197 (and (is-Intermediate!2258 lt!147188) (not (undefined!3070 lt!147188)) (bvslt (x!29414 lt!147188) #b01111111111111111111111111111110) (bvsge (x!29414 lt!147188) #b00000000000000000000000000000000) (bvsge (x!29414 lt!147188) #b00000000000000000000000000000000)))))

(assert (=> b!296470 (=> (not res!156197) (not e!187374))))

(declare-fun b!296471 () Bool)

(assert (=> b!296471 (= e!187371 (Intermediate!2258 true lt!147099 #b00000000000000000000000000000000))))

(assert (= (and d!67079 c!47713) b!296471))

(assert (= (and d!67079 (not c!47713)) b!296464))

(assert (= (and b!296464 c!47714) b!296467))

(assert (= (and b!296464 (not c!47714)) b!296469))

(assert (= (and d!67079 c!47715) b!296466))

(assert (= (and d!67079 (not c!47715)) b!296470))

(assert (= (and b!296470 res!156197) b!296465))

(assert (= (and b!296465 (not res!156195)) b!296468))

(assert (= (and b!296468 (not res!156196)) b!296463))

(declare-fun m!309445 () Bool)

(assert (=> b!296465 m!309445))

(assert (=> b!296469 m!309439))

(assert (=> b!296469 m!309439))

(declare-fun m!309447 () Bool)

(assert (=> b!296469 m!309447))

(assert (=> b!296463 m!309445))

(assert (=> b!296468 m!309445))

(declare-fun m!309449 () Bool)

(assert (=> d!67079 m!309449))

(assert (=> d!67079 m!309325))

(assert (=> b!296279 d!67079))

(declare-fun d!67083 () Bool)

(declare-fun lt!147195 () (_ BitVec 32))

(declare-fun lt!147194 () (_ BitVec 32))

(assert (=> d!67083 (= lt!147195 (bvmul (bvxor lt!147194 (bvlshr lt!147194 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67083 (= lt!147194 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67083 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156198 (let ((h!5294 ((_ extract 31 0) (bvand (bvxor k!2524 (bvlshr k!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29422 (bvmul (bvxor h!5294 (bvlshr h!5294 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29422 (bvlshr x!29422 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156198 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156198 #b00000000000000000000000000000000))))))

(assert (=> d!67083 (= (toIndex!0 k!2524 mask!3809) (bvand (bvxor lt!147195 (bvlshr lt!147195 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296279 d!67083))

(declare-fun d!67085 () Bool)

(declare-fun res!156207 () Bool)

(declare-fun e!187386 () Bool)

(assert (=> d!67085 (=> res!156207 e!187386)))

(assert (=> d!67085 (= res!156207 (= (select (arr!7109 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67085 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187386)))

(declare-fun b!296484 () Bool)

(declare-fun e!187387 () Bool)

(assert (=> b!296484 (= e!187386 e!187387)))

(declare-fun res!156208 () Bool)

(assert (=> b!296484 (=> (not res!156208) (not e!187387))))

(assert (=> b!296484 (= res!156208 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7461 a!3312)))))

(declare-fun b!296485 () Bool)

(assert (=> b!296485 (= e!187387 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67085 (not res!156207)) b!296484))

(assert (= (and b!296484 res!156208) b!296485))

(assert (=> d!67085 m!309389))

(declare-fun m!309451 () Bool)

(assert (=> b!296485 m!309451))

(assert (=> b!296278 d!67085))

(declare-fun d!67087 () Bool)

(declare-fun lt!147228 () SeekEntryResult!2258)

(assert (=> d!67087 (and (or (is-Undefined!2258 lt!147228) (not (is-Found!2258 lt!147228)) (and (bvsge (index!11203 lt!147228) #b00000000000000000000000000000000) (bvslt (index!11203 lt!147228) (size!7461 a!3312)))) (or (is-Undefined!2258 lt!147228) (is-Found!2258 lt!147228) (not (is-MissingZero!2258 lt!147228)) (and (bvsge (index!11202 lt!147228) #b00000000000000000000000000000000) (bvslt (index!11202 lt!147228) (size!7461 a!3312)))) (or (is-Undefined!2258 lt!147228) (is-Found!2258 lt!147228) (is-MissingZero!2258 lt!147228) (not (is-MissingVacant!2258 lt!147228)) (and (bvsge (index!11205 lt!147228) #b00000000000000000000000000000000) (bvslt (index!11205 lt!147228) (size!7461 a!3312)))) (or (is-Undefined!2258 lt!147228) (ite (is-Found!2258 lt!147228) (= (select (arr!7109 a!3312) (index!11203 lt!147228)) k!2524) (ite (is-MissingZero!2258 lt!147228) (= (select (arr!7109 a!3312) (index!11202 lt!147228)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2258 lt!147228) (= (select (arr!7109 a!3312) (index!11205 lt!147228)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!187420 () SeekEntryResult!2258)

(assert (=> d!67087 (= lt!147228 e!187420)))

(declare-fun c!47742 () Bool)

(declare-fun lt!147226 () SeekEntryResult!2258)

(assert (=> d!67087 (= c!47742 (and (is-Intermediate!2258 lt!147226) (undefined!3070 lt!147226)))))

(assert (=> d!67087 (= lt!147226 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2524 mask!3809) k!2524 a!3312 mask!3809))))

(assert (=> d!67087 (validMask!0 mask!3809)))

(assert (=> d!67087 (= (seekEntryOrOpen!0 k!2524 a!3312 mask!3809) lt!147228)))

(declare-fun b!296538 () Bool)

(declare-fun e!187419 () SeekEntryResult!2258)

(assert (=> b!296538 (= e!187419 (Found!2258 (index!11204 lt!147226)))))

(declare-fun b!296539 () Bool)

(assert (=> b!296539 (= e!187420 e!187419)))

(declare-fun lt!147227 () (_ BitVec 64))

(assert (=> b!296539 (= lt!147227 (select (arr!7109 a!3312) (index!11204 lt!147226)))))

(declare-fun c!47740 () Bool)

(assert (=> b!296539 (= c!47740 (= lt!147227 k!2524))))

(declare-fun b!296540 () Bool)

(declare-fun e!187418 () SeekEntryResult!2258)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14997 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!296540 (= e!187418 (seekKeyOrZeroReturnVacant!0 (x!29414 lt!147226) (index!11204 lt!147226) (index!11204 lt!147226) k!2524 a!3312 mask!3809))))

(declare-fun b!296541 () Bool)

(declare-fun c!47741 () Bool)

(assert (=> b!296541 (= c!47741 (= lt!147227 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296541 (= e!187419 e!187418)))

(declare-fun b!296542 () Bool)

(assert (=> b!296542 (= e!187420 Undefined!2258)))

(declare-fun b!296543 () Bool)

(assert (=> b!296543 (= e!187418 (MissingZero!2258 (index!11204 lt!147226)))))

(assert (= (and d!67087 c!47742) b!296542))

(assert (= (and d!67087 (not c!47742)) b!296539))

(assert (= (and b!296539 c!47740) b!296538))

(assert (= (and b!296539 (not c!47740)) b!296541))

(assert (= (and b!296541 c!47741) b!296543))

(assert (= (and b!296541 (not c!47741)) b!296540))

(assert (=> d!67087 m!309321))

(declare-fun m!309477 () Bool)

(assert (=> d!67087 m!309477))

(assert (=> d!67087 m!309321))

(declare-fun m!309479 () Bool)

(assert (=> d!67087 m!309479))

(declare-fun m!309481 () Bool)

(assert (=> d!67087 m!309481))

(assert (=> d!67087 m!309325))

(declare-fun m!309483 () Bool)

(assert (=> d!67087 m!309483))

(declare-fun m!309485 () Bool)

(assert (=> b!296539 m!309485))

(declare-fun m!309487 () Bool)

(assert (=> b!296540 m!309487))

(assert (=> b!296282 d!67087))

(push 1)

