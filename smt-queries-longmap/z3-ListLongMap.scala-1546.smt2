; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29240 () Bool)

(assert start!29240)

(declare-fun res!156192 () Bool)

(declare-fun e!187323 () Bool)

(assert (=> start!29240 (=> (not res!156192) (not e!187323))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29240 (= res!156192 (validMask!0 mask!3809))))

(assert (=> start!29240 e!187323))

(assert (=> start!29240 true))

(declare-datatypes ((array!15001 0))(
  ( (array!15002 (arr!7110 (Array (_ BitVec 32) (_ BitVec 64))) (size!7463 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15001)

(declare-fun array_inv!5082 (array!15001) Bool)

(assert (=> start!29240 (array_inv!5082 a!3312)))

(declare-fun lt!147076 () (_ BitVec 32))

(declare-fun b!296391 () Bool)

(declare-fun e!187320 () Bool)

(declare-datatypes ((SeekEntryResult!2258 0))(
  ( (MissingZero!2258 (index!11202 (_ BitVec 32))) (Found!2258 (index!11203 (_ BitVec 32))) (Intermediate!2258 (undefined!3070 Bool) (index!11204 (_ BitVec 32)) (x!29432 (_ BitVec 32))) (Undefined!2258) (MissingVacant!2258 (index!11205 (_ BitVec 32))) )
))
(declare-fun lt!147078 () SeekEntryResult!2258)

(assert (=> b!296391 (= e!187320 (not (or (not (= lt!147078 (Intermediate!2258 false (index!11204 lt!147078) (x!29432 lt!147078)))) (bvsgt #b00000000000000000000000000000000 (x!29432 lt!147078)) (and (bvsge lt!147076 #b00000000000000000000000000000000) (bvslt lt!147076 (size!7463 a!3312))))))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!296391 (and (= (select (arr!7110 a!3312) (index!11204 lt!147078)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11204 lt!147078) i!1256))))

(declare-fun b!296392 () Bool)

(declare-fun res!156191 () Bool)

(assert (=> b!296392 (=> (not res!156191) (not e!187323))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296392 (= res!156191 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!296393 () Bool)

(declare-fun res!156190 () Bool)

(assert (=> b!296393 (=> (not res!156190) (not e!187323))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296393 (= res!156190 (validKeyInArray!0 k0!2524))))

(declare-fun b!296394 () Bool)

(declare-fun e!187321 () Bool)

(declare-fun e!187324 () Bool)

(assert (=> b!296394 (= e!187321 e!187324)))

(declare-fun res!156187 () Bool)

(assert (=> b!296394 (=> (not res!156187) (not e!187324))))

(declare-fun lt!147077 () Bool)

(assert (=> b!296394 (= res!156187 lt!147077)))

(declare-fun lt!147080 () SeekEntryResult!2258)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15001 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!296394 (= lt!147080 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147076 k0!2524 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312)) mask!3809))))

(assert (=> b!296394 (= lt!147078 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147076 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296394 (= lt!147076 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!296395 () Bool)

(assert (=> b!296395 (= e!187324 e!187320)))

(declare-fun res!156186 () Bool)

(assert (=> b!296395 (=> (not res!156186) (not e!187320))))

(declare-fun lt!147081 () Bool)

(assert (=> b!296395 (= res!156186 (and (or lt!147081 (not (undefined!3070 lt!147078))) (or lt!147081 (not (= (select (arr!7110 a!3312) (index!11204 lt!147078)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147081 (not (= (select (arr!7110 a!3312) (index!11204 lt!147078)) k0!2524))) (not lt!147081)))))

(get-info :version)

(assert (=> b!296395 (= lt!147081 (not ((_ is Intermediate!2258) lt!147078)))))

(declare-fun b!296396 () Bool)

(assert (=> b!296396 (= e!187323 e!187321)))

(declare-fun res!156193 () Bool)

(assert (=> b!296396 (=> (not res!156193) (not e!187321))))

(declare-fun lt!147079 () SeekEntryResult!2258)

(assert (=> b!296396 (= res!156193 (or lt!147077 (= lt!147079 (MissingVacant!2258 i!1256))))))

(assert (=> b!296396 (= lt!147077 (= lt!147079 (MissingZero!2258 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15001 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!296396 (= lt!147079 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!296397 () Bool)

(declare-fun res!156189 () Bool)

(assert (=> b!296397 (=> (not res!156189) (not e!187321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15001 (_ BitVec 32)) Bool)

(assert (=> b!296397 (= res!156189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296398 () Bool)

(declare-fun res!156188 () Bool)

(assert (=> b!296398 (=> (not res!156188) (not e!187323))))

(assert (=> b!296398 (= res!156188 (and (= (size!7463 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7463 a!3312))))))

(assert (= (and start!29240 res!156192) b!296398))

(assert (= (and b!296398 res!156188) b!296393))

(assert (= (and b!296393 res!156190) b!296392))

(assert (= (and b!296392 res!156191) b!296396))

(assert (= (and b!296396 res!156193) b!296397))

(assert (= (and b!296397 res!156189) b!296394))

(assert (= (and b!296394 res!156187) b!296395))

(assert (= (and b!296395 res!156186) b!296391))

(declare-fun m!308871 () Bool)

(assert (=> b!296394 m!308871))

(declare-fun m!308873 () Bool)

(assert (=> b!296394 m!308873))

(declare-fun m!308875 () Bool)

(assert (=> b!296394 m!308875))

(declare-fun m!308877 () Bool)

(assert (=> b!296394 m!308877))

(declare-fun m!308879 () Bool)

(assert (=> b!296393 m!308879))

(declare-fun m!308881 () Bool)

(assert (=> start!29240 m!308881))

(declare-fun m!308883 () Bool)

(assert (=> start!29240 m!308883))

(declare-fun m!308885 () Bool)

(assert (=> b!296396 m!308885))

(declare-fun m!308887 () Bool)

(assert (=> b!296392 m!308887))

(declare-fun m!308889 () Bool)

(assert (=> b!296391 m!308889))

(assert (=> b!296395 m!308889))

(declare-fun m!308891 () Bool)

(assert (=> b!296397 m!308891))

(check-sat (not b!296393) (not b!296396) (not b!296392) (not b!296397) (not start!29240) (not b!296394))
(check-sat)
(get-model)

(declare-fun b!296459 () Bool)

(declare-fun e!187362 () SeekEntryResult!2258)

(declare-fun lt!147126 () SeekEntryResult!2258)

(assert (=> b!296459 (= e!187362 (Found!2258 (index!11204 lt!147126)))))

(declare-fun e!187361 () SeekEntryResult!2258)

(declare-fun b!296460 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15001 (_ BitVec 32)) SeekEntryResult!2258)

(assert (=> b!296460 (= e!187361 (seekKeyOrZeroReturnVacant!0 (x!29432 lt!147126) (index!11204 lt!147126) (index!11204 lt!147126) k0!2524 a!3312 mask!3809))))

(declare-fun b!296461 () Bool)

(declare-fun e!187363 () SeekEntryResult!2258)

(assert (=> b!296461 (= e!187363 Undefined!2258)))

(declare-fun d!66905 () Bool)

(declare-fun lt!147124 () SeekEntryResult!2258)

(assert (=> d!66905 (and (or ((_ is Undefined!2258) lt!147124) (not ((_ is Found!2258) lt!147124)) (and (bvsge (index!11203 lt!147124) #b00000000000000000000000000000000) (bvslt (index!11203 lt!147124) (size!7463 a!3312)))) (or ((_ is Undefined!2258) lt!147124) ((_ is Found!2258) lt!147124) (not ((_ is MissingZero!2258) lt!147124)) (and (bvsge (index!11202 lt!147124) #b00000000000000000000000000000000) (bvslt (index!11202 lt!147124) (size!7463 a!3312)))) (or ((_ is Undefined!2258) lt!147124) ((_ is Found!2258) lt!147124) ((_ is MissingZero!2258) lt!147124) (not ((_ is MissingVacant!2258) lt!147124)) (and (bvsge (index!11205 lt!147124) #b00000000000000000000000000000000) (bvslt (index!11205 lt!147124) (size!7463 a!3312)))) (or ((_ is Undefined!2258) lt!147124) (ite ((_ is Found!2258) lt!147124) (= (select (arr!7110 a!3312) (index!11203 lt!147124)) k0!2524) (ite ((_ is MissingZero!2258) lt!147124) (= (select (arr!7110 a!3312) (index!11202 lt!147124)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2258) lt!147124) (= (select (arr!7110 a!3312) (index!11205 lt!147124)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!66905 (= lt!147124 e!187363)))

(declare-fun c!47690 () Bool)

(assert (=> d!66905 (= c!47690 (and ((_ is Intermediate!2258) lt!147126) (undefined!3070 lt!147126)))))

(assert (=> d!66905 (= lt!147126 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!66905 (validMask!0 mask!3809)))

(assert (=> d!66905 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!147124)))

(declare-fun b!296462 () Bool)

(assert (=> b!296462 (= e!187363 e!187362)))

(declare-fun lt!147125 () (_ BitVec 64))

(assert (=> b!296462 (= lt!147125 (select (arr!7110 a!3312) (index!11204 lt!147126)))))

(declare-fun c!47688 () Bool)

(assert (=> b!296462 (= c!47688 (= lt!147125 k0!2524))))

(declare-fun b!296463 () Bool)

(assert (=> b!296463 (= e!187361 (MissingZero!2258 (index!11204 lt!147126)))))

(declare-fun b!296464 () Bool)

(declare-fun c!47689 () Bool)

(assert (=> b!296464 (= c!47689 (= lt!147125 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296464 (= e!187362 e!187361)))

(assert (= (and d!66905 c!47690) b!296461))

(assert (= (and d!66905 (not c!47690)) b!296462))

(assert (= (and b!296462 c!47688) b!296459))

(assert (= (and b!296462 (not c!47688)) b!296464))

(assert (= (and b!296464 c!47689) b!296463))

(assert (= (and b!296464 (not c!47689)) b!296460))

(declare-fun m!308937 () Bool)

(assert (=> b!296460 m!308937))

(assert (=> d!66905 m!308877))

(declare-fun m!308939 () Bool)

(assert (=> d!66905 m!308939))

(assert (=> d!66905 m!308881))

(declare-fun m!308941 () Bool)

(assert (=> d!66905 m!308941))

(declare-fun m!308943 () Bool)

(assert (=> d!66905 m!308943))

(assert (=> d!66905 m!308877))

(declare-fun m!308945 () Bool)

(assert (=> d!66905 m!308945))

(declare-fun m!308947 () Bool)

(assert (=> b!296462 m!308947))

(assert (=> b!296396 d!66905))

(declare-fun d!66909 () Bool)

(assert (=> d!66909 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!296393 d!66909))

(declare-fun b!296495 () Bool)

(declare-fun e!187387 () SeekEntryResult!2258)

(assert (=> b!296495 (= e!187387 (Intermediate!2258 true lt!147076 #b00000000000000000000000000000000))))

(declare-fun lt!147140 () SeekEntryResult!2258)

(declare-fun b!296496 () Bool)

(assert (=> b!296496 (and (bvsge (index!11204 lt!147140) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147140) (size!7463 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312)))))))

(declare-fun res!156256 () Bool)

(assert (=> b!296496 (= res!156256 (= (select (arr!7110 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312))) (index!11204 lt!147140)) k0!2524))))

(declare-fun e!187384 () Bool)

(assert (=> b!296496 (=> res!156256 e!187384)))

(declare-fun e!187386 () Bool)

(assert (=> b!296496 (= e!187386 e!187384)))

(declare-fun b!296497 () Bool)

(declare-fun e!187383 () Bool)

(assert (=> b!296497 (= e!187383 (bvsge (x!29432 lt!147140) #b01111111111111111111111111111110))))

(declare-fun b!296498 () Bool)

(declare-fun e!187385 () SeekEntryResult!2258)

(assert (=> b!296498 (= e!187387 e!187385)))

(declare-fun c!47701 () Bool)

(declare-fun lt!147141 () (_ BitVec 64))

(assert (=> b!296498 (= c!47701 (or (= lt!147141 k0!2524) (= (bvadd lt!147141 lt!147141) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66911 () Bool)

(assert (=> d!66911 e!187383))

(declare-fun c!47702 () Bool)

(assert (=> d!66911 (= c!47702 (and ((_ is Intermediate!2258) lt!147140) (undefined!3070 lt!147140)))))

(assert (=> d!66911 (= lt!147140 e!187387)))

(declare-fun c!47700 () Bool)

(assert (=> d!66911 (= c!47700 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66911 (= lt!147141 (select (arr!7110 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312))) lt!147076))))

(assert (=> d!66911 (validMask!0 mask!3809)))

(assert (=> d!66911 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147076 k0!2524 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312)) mask!3809) lt!147140)))

(declare-fun b!296499 () Bool)

(assert (=> b!296499 (= e!187383 e!187386)))

(declare-fun res!156255 () Bool)

(assert (=> b!296499 (= res!156255 (and ((_ is Intermediate!2258) lt!147140) (not (undefined!3070 lt!147140)) (bvslt (x!29432 lt!147140) #b01111111111111111111111111111110) (bvsge (x!29432 lt!147140) #b00000000000000000000000000000000) (bvsge (x!29432 lt!147140) #b00000000000000000000000000000000)))))

(assert (=> b!296499 (=> (not res!156255) (not e!187386))))

(declare-fun b!296500 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296500 (= e!187385 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147076 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312)) mask!3809))))

(declare-fun b!296501 () Bool)

(assert (=> b!296501 (= e!187385 (Intermediate!2258 false lt!147076 #b00000000000000000000000000000000))))

(declare-fun b!296502 () Bool)

(assert (=> b!296502 (and (bvsge (index!11204 lt!147140) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147140) (size!7463 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312)))))))

(declare-fun res!156254 () Bool)

(assert (=> b!296502 (= res!156254 (= (select (arr!7110 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312))) (index!11204 lt!147140)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296502 (=> res!156254 e!187384)))

(declare-fun b!296503 () Bool)

(assert (=> b!296503 (and (bvsge (index!11204 lt!147140) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147140) (size!7463 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312)))))))

(assert (=> b!296503 (= e!187384 (= (select (arr!7110 (array!15002 (store (arr!7110 a!3312) i!1256 k0!2524) (size!7463 a!3312))) (index!11204 lt!147140)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66911 c!47700) b!296495))

(assert (= (and d!66911 (not c!47700)) b!296498))

(assert (= (and b!296498 c!47701) b!296501))

(assert (= (and b!296498 (not c!47701)) b!296500))

(assert (= (and d!66911 c!47702) b!296497))

(assert (= (and d!66911 (not c!47702)) b!296499))

(assert (= (and b!296499 res!156255) b!296496))

(assert (= (and b!296496 (not res!156256)) b!296502))

(assert (= (and b!296502 (not res!156254)) b!296503))

(declare-fun m!308961 () Bool)

(assert (=> b!296496 m!308961))

(declare-fun m!308963 () Bool)

(assert (=> d!66911 m!308963))

(assert (=> d!66911 m!308881))

(assert (=> b!296502 m!308961))

(declare-fun m!308965 () Bool)

(assert (=> b!296500 m!308965))

(assert (=> b!296500 m!308965))

(declare-fun m!308967 () Bool)

(assert (=> b!296500 m!308967))

(assert (=> b!296503 m!308961))

(assert (=> b!296394 d!66911))

(declare-fun b!296504 () Bool)

(declare-fun e!187392 () SeekEntryResult!2258)

(assert (=> b!296504 (= e!187392 (Intermediate!2258 true lt!147076 #b00000000000000000000000000000000))))

(declare-fun b!296505 () Bool)

(declare-fun lt!147142 () SeekEntryResult!2258)

(assert (=> b!296505 (and (bvsge (index!11204 lt!147142) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147142) (size!7463 a!3312)))))

(declare-fun res!156259 () Bool)

(assert (=> b!296505 (= res!156259 (= (select (arr!7110 a!3312) (index!11204 lt!147142)) k0!2524))))

(declare-fun e!187389 () Bool)

(assert (=> b!296505 (=> res!156259 e!187389)))

(declare-fun e!187391 () Bool)

(assert (=> b!296505 (= e!187391 e!187389)))

(declare-fun b!296506 () Bool)

(declare-fun e!187388 () Bool)

(assert (=> b!296506 (= e!187388 (bvsge (x!29432 lt!147142) #b01111111111111111111111111111110))))

(declare-fun b!296507 () Bool)

(declare-fun e!187390 () SeekEntryResult!2258)

(assert (=> b!296507 (= e!187392 e!187390)))

(declare-fun c!47704 () Bool)

(declare-fun lt!147143 () (_ BitVec 64))

(assert (=> b!296507 (= c!47704 (or (= lt!147143 k0!2524) (= (bvadd lt!147143 lt!147143) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!66923 () Bool)

(assert (=> d!66923 e!187388))

(declare-fun c!47705 () Bool)

(assert (=> d!66923 (= c!47705 (and ((_ is Intermediate!2258) lt!147142) (undefined!3070 lt!147142)))))

(assert (=> d!66923 (= lt!147142 e!187392)))

(declare-fun c!47703 () Bool)

(assert (=> d!66923 (= c!47703 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!66923 (= lt!147143 (select (arr!7110 a!3312) lt!147076))))

(assert (=> d!66923 (validMask!0 mask!3809)))

(assert (=> d!66923 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147076 k0!2524 a!3312 mask!3809) lt!147142)))

(declare-fun b!296508 () Bool)

(assert (=> b!296508 (= e!187388 e!187391)))

(declare-fun res!156258 () Bool)

(assert (=> b!296508 (= res!156258 (and ((_ is Intermediate!2258) lt!147142) (not (undefined!3070 lt!147142)) (bvslt (x!29432 lt!147142) #b01111111111111111111111111111110) (bvsge (x!29432 lt!147142) #b00000000000000000000000000000000) (bvsge (x!29432 lt!147142) #b00000000000000000000000000000000)))))

(assert (=> b!296508 (=> (not res!156258) (not e!187391))))

(declare-fun b!296509 () Bool)

(assert (=> b!296509 (= e!187390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147076 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!296510 () Bool)

(assert (=> b!296510 (= e!187390 (Intermediate!2258 false lt!147076 #b00000000000000000000000000000000))))

(declare-fun b!296511 () Bool)

(assert (=> b!296511 (and (bvsge (index!11204 lt!147142) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147142) (size!7463 a!3312)))))

(declare-fun res!156257 () Bool)

(assert (=> b!296511 (= res!156257 (= (select (arr!7110 a!3312) (index!11204 lt!147142)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!296511 (=> res!156257 e!187389)))

(declare-fun b!296512 () Bool)

(assert (=> b!296512 (and (bvsge (index!11204 lt!147142) #b00000000000000000000000000000000) (bvslt (index!11204 lt!147142) (size!7463 a!3312)))))

(assert (=> b!296512 (= e!187389 (= (select (arr!7110 a!3312) (index!11204 lt!147142)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!66923 c!47703) b!296504))

(assert (= (and d!66923 (not c!47703)) b!296507))

(assert (= (and b!296507 c!47704) b!296510))

(assert (= (and b!296507 (not c!47704)) b!296509))

(assert (= (and d!66923 c!47705) b!296506))

(assert (= (and d!66923 (not c!47705)) b!296508))

(assert (= (and b!296508 res!156258) b!296505))

(assert (= (and b!296505 (not res!156259)) b!296511))

(assert (= (and b!296511 (not res!156257)) b!296512))

(declare-fun m!308969 () Bool)

(assert (=> b!296505 m!308969))

(declare-fun m!308971 () Bool)

(assert (=> d!66923 m!308971))

(assert (=> d!66923 m!308881))

(assert (=> b!296511 m!308969))

(assert (=> b!296509 m!308965))

(assert (=> b!296509 m!308965))

(declare-fun m!308973 () Bool)

(assert (=> b!296509 m!308973))

(assert (=> b!296512 m!308969))

(assert (=> b!296394 d!66923))

(declare-fun d!66925 () Bool)

(declare-fun lt!147153 () (_ BitVec 32))

(declare-fun lt!147152 () (_ BitVec 32))

(assert (=> d!66925 (= lt!147153 (bvmul (bvxor lt!147152 (bvlshr lt!147152 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!66925 (= lt!147152 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!66925 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!156260 (let ((h!5263 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29436 (bvmul (bvxor h!5263 (bvlshr h!5263 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29436 (bvlshr x!29436 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!156260 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!156260 #b00000000000000000000000000000000))))))

(assert (=> d!66925 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!147153 (bvlshr lt!147153 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!296394 d!66925))

(declare-fun d!66927 () Bool)

(declare-fun res!156277 () Bool)

(declare-fun e!187417 () Bool)

(assert (=> d!66927 (=> res!156277 e!187417)))

(assert (=> d!66927 (= res!156277 (= (select (arr!7110 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!66927 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!187417)))

(declare-fun b!296553 () Bool)

(declare-fun e!187418 () Bool)

(assert (=> b!296553 (= e!187417 e!187418)))

(declare-fun res!156278 () Bool)

(assert (=> b!296553 (=> (not res!156278) (not e!187418))))

(assert (=> b!296553 (= res!156278 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7463 a!3312)))))

(declare-fun b!296554 () Bool)

(assert (=> b!296554 (= e!187418 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!66927 (not res!156277)) b!296553))

(assert (= (and b!296553 res!156278) b!296554))

(declare-fun m!308983 () Bool)

(assert (=> d!66927 m!308983))

(declare-fun m!308985 () Bool)

(assert (=> b!296554 m!308985))

(assert (=> b!296392 d!66927))

(declare-fun d!66931 () Bool)

(assert (=> d!66931 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29240 d!66931))

(declare-fun d!66937 () Bool)

(assert (=> d!66937 (= (array_inv!5082 a!3312) (bvsge (size!7463 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29240 d!66937))

(declare-fun bm!25721 () Bool)

(declare-fun call!25724 () Bool)

(assert (=> bm!25721 (= call!25724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!66939 () Bool)

(declare-fun res!156304 () Bool)

(declare-fun e!187452 () Bool)

(assert (=> d!66939 (=> res!156304 e!187452)))

(assert (=> d!66939 (= res!156304 (bvsge #b00000000000000000000000000000000 (size!7463 a!3312)))))

(assert (=> d!66939 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187452)))

(declare-fun b!296605 () Bool)

(declare-fun e!187451 () Bool)

(assert (=> b!296605 (= e!187451 call!25724)))

(declare-fun b!296606 () Bool)

(declare-fun e!187453 () Bool)

(assert (=> b!296606 (= e!187452 e!187453)))

(declare-fun c!47732 () Bool)

(assert (=> b!296606 (= c!47732 (validKeyInArray!0 (select (arr!7110 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!296607 () Bool)

(assert (=> b!296607 (= e!187453 call!25724)))

(declare-fun b!296608 () Bool)

(assert (=> b!296608 (= e!187453 e!187451)))

(declare-fun lt!147186 () (_ BitVec 64))

(assert (=> b!296608 (= lt!147186 (select (arr!7110 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9186 0))(
  ( (Unit!9187) )
))
(declare-fun lt!147185 () Unit!9186)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15001 (_ BitVec 64) (_ BitVec 32)) Unit!9186)

(assert (=> b!296608 (= lt!147185 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147186 #b00000000000000000000000000000000))))

(assert (=> b!296608 (arrayContainsKey!0 a!3312 lt!147186 #b00000000000000000000000000000000)))

(declare-fun lt!147184 () Unit!9186)

(assert (=> b!296608 (= lt!147184 lt!147185)))

(declare-fun res!156303 () Bool)

(assert (=> b!296608 (= res!156303 (= (seekEntryOrOpen!0 (select (arr!7110 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2258 #b00000000000000000000000000000000)))))

(assert (=> b!296608 (=> (not res!156303) (not e!187451))))

(assert (= (and d!66939 (not res!156304)) b!296606))

(assert (= (and b!296606 c!47732) b!296608))

(assert (= (and b!296606 (not c!47732)) b!296607))

(assert (= (and b!296608 res!156303) b!296605))

(assert (= (or b!296605 b!296607) bm!25721))

(declare-fun m!309011 () Bool)

(assert (=> bm!25721 m!309011))

(assert (=> b!296606 m!308983))

(assert (=> b!296606 m!308983))

(declare-fun m!309013 () Bool)

(assert (=> b!296606 m!309013))

(assert (=> b!296608 m!308983))

(declare-fun m!309015 () Bool)

(assert (=> b!296608 m!309015))

(declare-fun m!309017 () Bool)

(assert (=> b!296608 m!309017))

(assert (=> b!296608 m!308983))

(declare-fun m!309019 () Bool)

(assert (=> b!296608 m!309019))

(assert (=> b!296397 d!66939))

(check-sat (not b!296606) (not b!296608) (not d!66905) (not bm!25721) (not b!296554) (not d!66923) (not b!296460) (not b!296500) (not d!66911) (not b!296509))
(check-sat)
