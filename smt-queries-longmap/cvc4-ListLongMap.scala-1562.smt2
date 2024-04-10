; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29720 () Bool)

(assert start!29720)

(declare-fun b!299637 () Bool)

(declare-fun res!157953 () Bool)

(declare-fun e!189248 () Bool)

(assert (=> b!299637 (=> (not res!157953) (not e!189248))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15133 0))(
  ( (array!15134 (arr!7165 (Array (_ BitVec 32) (_ BitVec 64))) (size!7517 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15133)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!299637 (= res!157953 (and (= (size!7517 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7517 a!3312))))))

(declare-fun b!299638 () Bool)

(declare-fun res!157954 () Bool)

(declare-fun e!189249 () Bool)

(assert (=> b!299638 (=> (not res!157954) (not e!189249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15133 (_ BitVec 32)) Bool)

(assert (=> b!299638 (= res!157954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!299639 () Bool)

(declare-fun res!157952 () Bool)

(assert (=> b!299639 (=> (not res!157952) (not e!189248))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299639 (= res!157952 (validKeyInArray!0 k!2524))))

(declare-fun b!299640 () Bool)

(declare-datatypes ((SeekEntryResult!2314 0))(
  ( (MissingZero!2314 (index!11432 (_ BitVec 32))) (Found!2314 (index!11433 (_ BitVec 32))) (Intermediate!2314 (undefined!3126 Bool) (index!11434 (_ BitVec 32)) (x!29674 (_ BitVec 32))) (Undefined!2314) (MissingVacant!2314 (index!11435 (_ BitVec 32))) )
))
(declare-fun lt!149024 () SeekEntryResult!2314)

(declare-fun lt!149025 () Bool)

(declare-fun lt!149026 () SeekEntryResult!2314)

(assert (=> b!299640 (= e!189249 (and (not lt!149025) (= lt!149024 (MissingVacant!2314 i!1256)) (let ((bdg!6446 (not (is-Intermediate!2314 lt!149026)))) (and (or bdg!6446 (not (undefined!3126 lt!149026))) (or bdg!6446 (not (= (select (arr!7165 a!3312) (index!11434 lt!149026)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not bdg!6446) (or (bvslt (index!11434 lt!149026) #b00000000000000000000000000000000) (bvsge (index!11434 lt!149026) (size!7517 a!3312)))))))))

(declare-fun lt!149027 () (_ BitVec 32))

(declare-fun lt!149028 () SeekEntryResult!2314)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15133 (_ BitVec 32)) SeekEntryResult!2314)

(assert (=> b!299640 (= lt!149028 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149027 k!2524 (array!15134 (store (arr!7165 a!3312) i!1256 k!2524) (size!7517 a!3312)) mask!3809))))

(assert (=> b!299640 (= lt!149026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149027 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299640 (= lt!149027 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!299641 () Bool)

(declare-fun res!157956 () Bool)

(assert (=> b!299641 (=> (not res!157956) (not e!189248))))

(declare-fun arrayContainsKey!0 (array!15133 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299641 (= res!157956 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299642 () Bool)

(assert (=> b!299642 (= e!189248 e!189249)))

(declare-fun res!157951 () Bool)

(assert (=> b!299642 (=> (not res!157951) (not e!189249))))

(assert (=> b!299642 (= res!157951 (or lt!149025 (= lt!149024 (MissingVacant!2314 i!1256))))))

(assert (=> b!299642 (= lt!149025 (= lt!149024 (MissingZero!2314 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15133 (_ BitVec 32)) SeekEntryResult!2314)

(assert (=> b!299642 (= lt!149024 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!157955 () Bool)

(assert (=> start!29720 (=> (not res!157955) (not e!189248))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29720 (= res!157955 (validMask!0 mask!3809))))

(assert (=> start!29720 e!189248))

(assert (=> start!29720 true))

(declare-fun array_inv!5128 (array!15133) Bool)

(assert (=> start!29720 (array_inv!5128 a!3312)))

(assert (= (and start!29720 res!157955) b!299637))

(assert (= (and b!299637 res!157953) b!299639))

(assert (= (and b!299639 res!157952) b!299641))

(assert (= (and b!299641 res!157956) b!299642))

(assert (= (and b!299642 res!157951) b!299638))

(assert (= (and b!299638 res!157954) b!299640))

(declare-fun m!311855 () Bool)

(assert (=> b!299640 m!311855))

(declare-fun m!311857 () Bool)

(assert (=> b!299640 m!311857))

(declare-fun m!311859 () Bool)

(assert (=> b!299640 m!311859))

(declare-fun m!311861 () Bool)

(assert (=> b!299640 m!311861))

(declare-fun m!311863 () Bool)

(assert (=> b!299640 m!311863))

(declare-fun m!311865 () Bool)

(assert (=> b!299641 m!311865))

(declare-fun m!311867 () Bool)

(assert (=> start!29720 m!311867))

(declare-fun m!311869 () Bool)

(assert (=> start!29720 m!311869))

(declare-fun m!311871 () Bool)

(assert (=> b!299642 m!311871))

(declare-fun m!311873 () Bool)

(assert (=> b!299639 m!311873))

(declare-fun m!311875 () Bool)

(assert (=> b!299638 m!311875))

(push 1)

(assert (not b!299639))

(assert (not b!299641))

(assert (not b!299642))

(assert (not start!29720))

(assert (not b!299638))

(assert (not b!299640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67607 () Bool)

(assert (=> d!67607 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299639 d!67607))

(declare-fun bm!25831 () Bool)

(declare-fun call!25834 () Bool)

(assert (=> bm!25831 (= call!25834 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!299717 () Bool)

(declare-fun e!189299 () Bool)

(declare-fun e!189298 () Bool)

(assert (=> b!299717 (= e!189299 e!189298)))

(declare-fun lt!149066 () (_ BitVec 64))

(assert (=> b!299717 (= lt!149066 (select (arr!7165 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9355 0))(
  ( (Unit!9356) )
))
(declare-fun lt!149064 () Unit!9355)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15133 (_ BitVec 64) (_ BitVec 32)) Unit!9355)

(assert (=> b!299717 (= lt!149064 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149066 #b00000000000000000000000000000000))))

(assert (=> b!299717 (arrayContainsKey!0 a!3312 lt!149066 #b00000000000000000000000000000000)))

(declare-fun lt!149065 () Unit!9355)

(assert (=> b!299717 (= lt!149065 lt!149064)))

(declare-fun res!157986 () Bool)

(assert (=> b!299717 (= res!157986 (= (seekEntryOrOpen!0 (select (arr!7165 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2314 #b00000000000000000000000000000000)))))

(assert (=> b!299717 (=> (not res!157986) (not e!189298))))

(declare-fun b!299718 () Bool)

(declare-fun e!189300 () Bool)

(assert (=> b!299718 (= e!189300 e!189299)))

(declare-fun c!48456 () Bool)

(assert (=> b!299718 (= c!48456 (validKeyInArray!0 (select (arr!7165 a!3312) #b00000000000000000000000000000000)))))

(declare-fun d!67611 () Bool)

(declare-fun res!157987 () Bool)

(assert (=> d!67611 (=> res!157987 e!189300)))

(assert (=> d!67611 (= res!157987 (bvsge #b00000000000000000000000000000000 (size!7517 a!3312)))))

(assert (=> d!67611 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189300)))

(declare-fun b!299719 () Bool)

(assert (=> b!299719 (= e!189298 call!25834)))

(declare-fun b!299720 () Bool)

(assert (=> b!299720 (= e!189299 call!25834)))

(assert (= (and d!67611 (not res!157987)) b!299718))

(assert (= (and b!299718 c!48456) b!299717))

(assert (= (and b!299718 (not c!48456)) b!299720))

(assert (= (and b!299717 res!157986) b!299719))

(assert (= (or b!299719 b!299720) bm!25831))

(declare-fun m!311907 () Bool)

(assert (=> bm!25831 m!311907))

(declare-fun m!311909 () Bool)

(assert (=> b!299717 m!311909))

(declare-fun m!311911 () Bool)

(assert (=> b!299717 m!311911))

(declare-fun m!311913 () Bool)

(assert (=> b!299717 m!311913))

(assert (=> b!299717 m!311909))

(declare-fun m!311915 () Bool)

(assert (=> b!299717 m!311915))

(assert (=> b!299718 m!311909))

(assert (=> b!299718 m!311909))

(declare-fun m!311917 () Bool)

(assert (=> b!299718 m!311917))

(assert (=> b!299638 d!67611))

(declare-fun d!67619 () Bool)

(declare-fun res!157992 () Bool)

(declare-fun e!189308 () Bool)

(assert (=> d!67619 (=> res!157992 e!189308)))

(assert (=> d!67619 (= res!157992 (= (select (arr!7165 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67619 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!189308)))

(declare-fun b!299731 () Bool)

(declare-fun e!189309 () Bool)

(assert (=> b!299731 (= e!189308 e!189309)))

(declare-fun res!157993 () Bool)

(assert (=> b!299731 (=> (not res!157993) (not e!189309))))

(assert (=> b!299731 (= res!157993 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7517 a!3312)))))

(declare-fun b!299732 () Bool)

(assert (=> b!299732 (= e!189309 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67619 (not res!157992)) b!299731))

(assert (= (and b!299731 res!157993) b!299732))

(assert (=> d!67619 m!311909))

(declare-fun m!311931 () Bool)

(assert (=> b!299732 m!311931))

(assert (=> b!299641 d!67619))

(declare-fun b!299781 () Bool)

(declare-fun e!189340 () SeekEntryResult!2314)

(assert (=> b!299781 (= e!189340 Undefined!2314)))

(declare-fun b!299782 () Bool)

(declare-fun c!48479 () Bool)

(declare-fun lt!149095 () (_ BitVec 64))

(assert (=> b!299782 (= c!48479 (= lt!149095 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189341 () SeekEntryResult!2314)

(declare-fun e!189342 () SeekEntryResult!2314)

(assert (=> b!299782 (= e!189341 e!189342)))

(declare-fun b!299783 () Bool)

(declare-fun lt!149094 () SeekEntryResult!2314)

(assert (=> b!299783 (= e!189342 (MissingZero!2314 (index!11434 lt!149094)))))

(declare-fun d!67625 () Bool)

(declare-fun lt!149096 () SeekEntryResult!2314)

(assert (=> d!67625 (and (or (is-Undefined!2314 lt!149096) (not (is-Found!2314 lt!149096)) (and (bvsge (index!11433 lt!149096) #b00000000000000000000000000000000) (bvslt (index!11433 lt!149096) (size!7517 a!3312)))) (or (is-Undefined!2314 lt!149096) (is-Found!2314 lt!149096) (not (is-MissingZero!2314 lt!149096)) (and (bvsge (index!11432 lt!149096) #b00000000000000000000000000000000) (bvslt (index!11432 lt!149096) (size!7517 a!3312)))) (or (is-Undefined!2314 lt!149096) (is-Found!2314 