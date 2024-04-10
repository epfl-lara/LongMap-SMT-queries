; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30030 () Bool)

(assert start!30030)

(declare-fun b!301302 () Bool)

(declare-fun e!190170 () Bool)

(declare-fun mask!3709 () (_ BitVec 32))

(assert (=> b!301302 (= e!190170 (and (bvsge mask!3709 #b00000000000000000000000000000000) (bvsgt mask!3709 #b00111111111111111111111111111111)))))

(declare-fun b!301303 () Bool)

(declare-fun res!159055 () Bool)

(assert (=> b!301303 (=> (not res!159055) (not e!190170))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15250 0))(
  ( (array!15251 (arr!7217 (Array (_ BitVec 32) (_ BitVec 64))) (size!7569 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15250)

(declare-datatypes ((SeekEntryResult!2357 0))(
  ( (MissingZero!2357 (index!11604 (_ BitVec 32))) (Found!2357 (index!11605 (_ BitVec 32))) (Intermediate!2357 (undefined!3169 Bool) (index!11606 (_ BitVec 32)) (x!29885 (_ BitVec 32))) (Undefined!2357) (MissingVacant!2357 (index!11607 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15250 (_ BitVec 32)) SeekEntryResult!2357)

(assert (=> b!301303 (= res!159055 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2357 i!1240)))))

(declare-fun b!301304 () Bool)

(declare-fun res!159057 () Bool)

(assert (=> b!301304 (=> (not res!159057) (not e!190170))))

(declare-fun arrayContainsKey!0 (array!15250 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301304 (= res!159057 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!301305 () Bool)

(declare-fun res!159054 () Bool)

(assert (=> b!301305 (=> (not res!159054) (not e!190170))))

(assert (=> b!301305 (= res!159054 (and (= (size!7569 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7569 a!3293))))))

(declare-fun res!159056 () Bool)

(assert (=> start!30030 (=> (not res!159056) (not e!190170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30030 (= res!159056 (validMask!0 mask!3709))))

(assert (=> start!30030 e!190170))

(assert (=> start!30030 true))

(declare-fun array_inv!5180 (array!15250) Bool)

(assert (=> start!30030 (array_inv!5180 a!3293)))

(declare-fun b!301306 () Bool)

(declare-fun res!159053 () Bool)

(assert (=> b!301306 (=> (not res!159053) (not e!190170))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301306 (= res!159053 (validKeyInArray!0 k!2441))))

(declare-fun b!301307 () Bool)

(declare-fun res!159052 () Bool)

(assert (=> b!301307 (=> (not res!159052) (not e!190170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15250 (_ BitVec 32)) Bool)

(assert (=> b!301307 (= res!159052 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!30030 res!159056) b!301305))

(assert (= (and b!301305 res!159054) b!301306))

(assert (= (and b!301306 res!159053) b!301304))

(assert (= (and b!301304 res!159057) b!301303))

(assert (= (and b!301303 res!159055) b!301307))

(assert (= (and b!301307 res!159052) b!301302))

(declare-fun m!313125 () Bool)

(assert (=> b!301306 m!313125))

(declare-fun m!313127 () Bool)

(assert (=> b!301303 m!313127))

(declare-fun m!313129 () Bool)

(assert (=> b!301304 m!313129))

(declare-fun m!313131 () Bool)

(assert (=> start!30030 m!313131))

(declare-fun m!313133 () Bool)

(assert (=> start!30030 m!313133))

(declare-fun m!313135 () Bool)

(assert (=> b!301307 m!313135))

(push 1)

(assert (not b!301307))

(assert (not b!301304))

(assert (not start!30030))

(assert (not b!301306))

(assert (not b!301303))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67867 () Bool)

(declare-fun res!159098 () Bool)

(declare-fun e!190192 () Bool)

(assert (=> d!67867 (=> res!159098 e!190192)))

(assert (=> d!67867 (= res!159098 (bvsge #b00000000000000000000000000000000 (size!7569 a!3293)))))

(assert (=> d!67867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!190192)))

(declare-fun b!301352 () Bool)

(declare-fun e!190190 () Bool)

(assert (=> b!301352 (= e!190192 e!190190)))

(declare-fun c!48723 () Bool)

(assert (=> b!301352 (= c!48723 (validKeyInArray!0 (select (arr!7217 a!3293) #b00000000000000000000000000000000)))))

(declare-fun bm!25864 () Bool)

(declare-fun call!25867 () Bool)

(assert (=> bm!25864 (= call!25867 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!301353 () Bool)

(declare-fun e!190191 () Bool)

(assert (=> b!301353 (= e!190191 call!25867)))

(declare-fun b!301354 () Bool)

(assert (=> b!301354 (= e!190190 call!25867)))

(declare-fun b!301355 () Bool)

(assert (=> b!301355 (= e!190190 e!190191)))

(declare-fun lt!149797 () (_ BitVec 64))

(assert (=> b!301355 (= lt!149797 (select (arr!7217 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9373 0))(
  ( (Unit!9374) )
))
(declare-fun lt!149798 () Unit!9373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15250 (_ BitVec 64) (_ BitVec 32)) Unit!9373)

(assert (=> b!301355 (= lt!149798 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!149797 #b00000000000000000000000000000000))))

(assert (=> b!301355 (arrayContainsKey!0 a!3293 lt!149797 #b00000000000000000000000000000000)))

(declare-fun lt!149799 () Unit!9373)

(assert (=> b!301355 (= lt!149799 lt!149798)))

(declare-fun res!159099 () Bool)

(assert (=> b!301355 (= res!159099 (= (seekEntryOrOpen!0 (select (arr!7217 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2357 #b00000000000000000000000000000000)))))

(assert (=> b!301355 (=> (not res!159099) (not e!190191))))

(assert (= (and d!67867 (not res!159098)) b!301352))

(assert (= (and b!301352 c!48723) b!301355))

(assert (= (and b!301352 (not c!48723)) b!301354))

(assert (= (and b!301355 res!159099) b!301353))

(assert (= (or b!301353 b!301354) bm!25864))

(declare-fun m!313161 () Bool)

(assert (=> b!301352 m!313161))

(assert (=> b!301352 m!313161))

(declare-fun m!313163 () Bool)

(assert (=> b!301352 m!313163))

(declare-fun m!313165 () Bool)

(assert (=> bm!25864 m!313165))

(assert (=> b!301355 m!313161))

(declare-fun m!313167 () Bool)

(assert (=> b!301355 m!313167))

(declare-fun m!313169 () Bool)

(assert (=> b!301355 m!313169))

(assert (=> b!301355 m!313161))

(declare-fun m!313171 () Bool)

(assert (=> b!301355 m!313171))

(assert (=> b!301307 d!67867))

(declare-fun d!67869 () Bool)

(assert (=> d!67869 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!301306 d!67869))

(declare-fun b!301410 () Bool)

(declare-fun e!190231 () SeekEntryResult!2357)

(declare-fun lt!149825 () SeekEntryResult!2357)

(assert (=> b!301410 (= e!190231 (MissingZero!2357 (index!11606 lt!149825)))))

(declare-fun b!301411 () Bool)

(declare-fun e!190229 () SeekEntryResult!2357)

(declare-fun e!190230 () SeekEntryResult!2357)

(assert (=> b!301411 (= e!190229 e!190230)))

(declare-fun lt!149826 () (_ BitVec 64))

(assert (=> b!301411 (= lt!149826 (select (arr!7217 a!3293) (index!11606 lt!149825)))))

(declare-fun c!48742 () Bool)

(assert (=> b!301411 (= c!48742 (= lt!149826 k!2441))))

(declare-fun d!67871 () Bool)

(declare-fun lt!149824 () SeekEntryResult!2357)

(assert (=> d!67871 (and (or (is-Undefined!2357 lt!149824) (not (is-Found!2357 lt!149824)) (and (bvsge (index!11605 lt!149824) #b00000000000000000000000000000000) (bvslt (index!11605 lt!149824) (size!7569 a!3293)))) (or (is-Undefined!2357 lt!149824) (is-Found!2357 lt!149824) (not (is-MissingZero!2357 lt!149824)) (and (bvsge (index!11604 lt!149824) #b00000000000000000000000000000000) (bvslt (index!11604 lt!149824) (size!7569 a!3293)))) (or (is-Undefined!2357 lt!149824) (is-Found!2357 lt!149824) (is-MissingZero!2357 lt!149824) (not (is-MissingVacant!2357 lt!149824)) (and (bvsge (index!11607 lt!149824) #b00000000000000000000000000000000) (bvslt (index!11607 lt!149824) (size!7569 a!3293)))) (or (is-Undefined!2357 lt!149824) (ite (is-Found!2357 lt!149824) (= (select (arr!7217 a!3293) (index!11605 lt!149824)) k!2441) (ite (is-MissingZero!2357 lt!149824) (= (select (arr!7217 a!3293) (index!11604 lt!149824)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2357 lt!149824) (= (select (arr!7217 a!3293) (index!11607 lt!149824)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67871 (= lt!149824 e!190229)))

(declare-fun c!48743 () Bool)

(assert (=> d!67871 (= c!48743 (and (is-Intermediate!2357 lt!149825) (undefined!3169 lt!149825)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15250 (_ BitVec 32)) SeekEntryResult!2357)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!67871 (= lt!149825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!67871 (validMask!0 mask!3709)))

(assert (=> d!67871 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!149824)))

(declare-fun b!301412 () Bool)

(declare-fun c!48744 () Bool)

(assert (=> b!301412 (= c!48744 (= lt!149826 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!301412 (= e!190230 e!190231)))

(declare-fun b!301413 () Bool)

(assert (=> b!301413 (= e!190229 Undefined!2357)))

(declare-fun b!301414 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15250 (_ BitVec 32)) SeekEntryResult!2357)

(assert (=> b!301414 (= e!190231 (seekKeyOrZeroReturnVacant!0 (x!29885 lt!149825) (index!11606 lt!149825) (index!11606 lt!149825) k!2441 a!3293 mask!3709))))

(declare-fun b!301415 () Bool)

(assert (=> b!301415 (= e!190230 (Found!2357 (index!11606 lt!149825)))))

(assert (= (and d!67871 c!48743) b!301413))

(assert (= (and d!67871 (not c!48743)) b!301411))

(assert (= (and b!301411 c!48742) b!301415))

(assert (= (and b!301411 (not c!48742)) b!301412))

(assert (= (and b!301412 c!48744) b!301410))

(assert (= (and b!301412 (not c!48744)) b!301414))

(declare-fun m!313205 () Bool)

(assert (=> b!301411 m!313205))

(declare-fun m!313207 () Bool)

(assert (=> d!67871 m!313207))

(declare-fun m!313209 () Bool)

(assert (=> d!67871 m!313209))

(assert (=> d!67871 m!313209))

(declare-fun m!313211 () Bool)

(assert (=> d!67871 m!313211))

(declare-fun m!313213 () Bool)

(assert (=> d!67871 m!313213))

(assert (=> d!67871 m!313131))

(declare-fun m!313215 () Bool)

(assert (=> d!67871 m!313215))

(declare-fun m!313217 () Bool)

(assert (=> b!301414 m!313217))

(assert (=> b!301303 d!67871))

(declare-fun d!67885 () Bool)

(assert (=> d!67885 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!30030 d!67885))

(declare-fun d!67891 () Bool)

(assert (=> d!67891 (= (array_inv!5180 a!3293) (bvsge (size!7569 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!30030 d!67891))

