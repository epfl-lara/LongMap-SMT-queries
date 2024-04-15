; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29818 () Bool)

(assert start!29818)

(declare-fun b!299974 () Bool)

(declare-fun res!158153 () Bool)

(declare-fun e!189426 () Bool)

(assert (=> b!299974 (=> (not res!158153) (not e!189426))))

(declare-datatypes ((array!15148 0))(
  ( (array!15149 (arr!7170 (Array (_ BitVec 32) (_ BitVec 64))) (size!7523 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15148)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15148 (_ BitVec 32)) Bool)

(assert (=> b!299974 (= res!158153 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!158156 () Bool)

(declare-fun e!189427 () Bool)

(assert (=> start!29818 (=> (not res!158156) (not e!189427))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29818 (= res!158156 (validMask!0 mask!3809))))

(assert (=> start!29818 e!189427))

(assert (=> start!29818 true))

(declare-fun array_inv!5142 (array!15148) Bool)

(assert (=> start!29818 (array_inv!5142 a!3312)))

(declare-fun b!299975 () Bool)

(assert (=> b!299975 (= e!189427 e!189426)))

(declare-fun res!158152 () Bool)

(assert (=> b!299975 (=> (not res!158152) (not e!189426))))

(declare-fun lt!149115 () Bool)

(declare-datatypes ((SeekEntryResult!2318 0))(
  ( (MissingZero!2318 (index!11448 (_ BitVec 32))) (Found!2318 (index!11449 (_ BitVec 32))) (Intermediate!2318 (undefined!3130 Bool) (index!11450 (_ BitVec 32)) (x!29717 (_ BitVec 32))) (Undefined!2318) (MissingVacant!2318 (index!11451 (_ BitVec 32))) )
))
(declare-fun lt!149113 () SeekEntryResult!2318)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!299975 (= res!158152 (or lt!149115 (= lt!149113 (MissingVacant!2318 i!1256))))))

(assert (=> b!299975 (= lt!149115 (= lt!149113 (MissingZero!2318 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15148 (_ BitVec 32)) SeekEntryResult!2318)

(assert (=> b!299975 (= lt!149113 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!299976 () Bool)

(declare-fun res!158157 () Bool)

(assert (=> b!299976 (=> (not res!158157) (not e!189427))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!299976 (= res!158157 (validKeyInArray!0 k0!2524))))

(declare-fun b!299977 () Bool)

(declare-fun res!158154 () Bool)

(assert (=> b!299977 (=> (not res!158154) (not e!189427))))

(declare-fun arrayContainsKey!0 (array!15148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!299977 (= res!158154 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!299978 () Bool)

(declare-fun lt!149117 () SeekEntryResult!2318)

(get-info :version)

(assert (=> b!299978 (= e!189426 (and (not lt!149115) (= lt!149113 (MissingVacant!2318 i!1256)) (let ((bdg!6466 (not ((_ is Intermediate!2318) lt!149117)))) (and (or bdg!6466 (not (undefined!3130 lt!149117))) (or bdg!6466 (not (= (select (arr!7170 a!3312) (index!11450 lt!149117)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or bdg!6466 (not (= (select (arr!7170 a!3312) (index!11450 lt!149117)) k0!2524))) (not bdg!6466)))))))

(declare-fun lt!149116 () (_ BitVec 32))

(declare-fun lt!149114 () SeekEntryResult!2318)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15148 (_ BitVec 32)) SeekEntryResult!2318)

(assert (=> b!299978 (= lt!149114 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149116 k0!2524 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312)) mask!3809))))

(assert (=> b!299978 (= lt!149117 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149116 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!299978 (= lt!149116 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!299979 () Bool)

(declare-fun res!158155 () Bool)

(assert (=> b!299979 (=> (not res!158155) (not e!189427))))

(assert (=> b!299979 (= res!158155 (and (= (size!7523 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7523 a!3312))))))

(assert (= (and start!29818 res!158156) b!299979))

(assert (= (and b!299979 res!158155) b!299976))

(assert (= (and b!299976 res!158157) b!299977))

(assert (= (and b!299977 res!158154) b!299975))

(assert (= (and b!299975 res!158152) b!299974))

(assert (= (and b!299974 res!158153) b!299978))

(declare-fun m!311563 () Bool)

(assert (=> b!299977 m!311563))

(declare-fun m!311565 () Bool)

(assert (=> start!29818 m!311565))

(declare-fun m!311567 () Bool)

(assert (=> start!29818 m!311567))

(declare-fun m!311569 () Bool)

(assert (=> b!299978 m!311569))

(declare-fun m!311571 () Bool)

(assert (=> b!299978 m!311571))

(declare-fun m!311573 () Bool)

(assert (=> b!299978 m!311573))

(declare-fun m!311575 () Bool)

(assert (=> b!299978 m!311575))

(declare-fun m!311577 () Bool)

(assert (=> b!299978 m!311577))

(declare-fun m!311579 () Bool)

(assert (=> b!299976 m!311579))

(declare-fun m!311581 () Bool)

(assert (=> b!299974 m!311581))

(declare-fun m!311583 () Bool)

(assert (=> b!299975 m!311583))

(check-sat (not start!29818) (not b!299974) (not b!299977) (not b!299978) (not b!299976) (not b!299975))
(check-sat)
(get-model)

(declare-fun b!300024 () Bool)

(declare-fun e!189453 () Bool)

(declare-fun e!189455 () Bool)

(assert (=> b!300024 (= e!189453 e!189455)))

(declare-fun lt!149155 () (_ BitVec 64))

(assert (=> b!300024 (= lt!149155 (select (arr!7170 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9323 0))(
  ( (Unit!9324) )
))
(declare-fun lt!149154 () Unit!9323)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15148 (_ BitVec 64) (_ BitVec 32)) Unit!9323)

(assert (=> b!300024 (= lt!149154 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!149155 #b00000000000000000000000000000000))))

(assert (=> b!300024 (arrayContainsKey!0 a!3312 lt!149155 #b00000000000000000000000000000000)))

(declare-fun lt!149156 () Unit!9323)

(assert (=> b!300024 (= lt!149156 lt!149154)))

(declare-fun res!158199 () Bool)

(assert (=> b!300024 (= res!158199 (= (seekEntryOrOpen!0 (select (arr!7170 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2318 #b00000000000000000000000000000000)))))

(assert (=> b!300024 (=> (not res!158199) (not e!189455))))

(declare-fun b!300025 () Bool)

(declare-fun e!189454 () Bool)

(assert (=> b!300025 (= e!189454 e!189453)))

(declare-fun c!48506 () Bool)

(assert (=> b!300025 (= c!48506 (validKeyInArray!0 (select (arr!7170 a!3312) #b00000000000000000000000000000000)))))

(declare-fun b!300026 () Bool)

(declare-fun call!25823 () Bool)

(assert (=> b!300026 (= e!189453 call!25823)))

(declare-fun d!67505 () Bool)

(declare-fun res!158198 () Bool)

(assert (=> d!67505 (=> res!158198 e!189454)))

(assert (=> d!67505 (= res!158198 (bvsge #b00000000000000000000000000000000 (size!7523 a!3312)))))

(assert (=> d!67505 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!189454)))

(declare-fun b!300027 () Bool)

(assert (=> b!300027 (= e!189455 call!25823)))

(declare-fun bm!25820 () Bool)

(assert (=> bm!25820 (= call!25823 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(assert (= (and d!67505 (not res!158198)) b!300025))

(assert (= (and b!300025 c!48506) b!300024))

(assert (= (and b!300025 (not c!48506)) b!300026))

(assert (= (and b!300024 res!158199) b!300027))

(assert (= (or b!300027 b!300026) bm!25820))

(declare-fun m!311629 () Bool)

(assert (=> b!300024 m!311629))

(declare-fun m!311631 () Bool)

(assert (=> b!300024 m!311631))

(declare-fun m!311633 () Bool)

(assert (=> b!300024 m!311633))

(assert (=> b!300024 m!311629))

(declare-fun m!311635 () Bool)

(assert (=> b!300024 m!311635))

(assert (=> b!300025 m!311629))

(assert (=> b!300025 m!311629))

(declare-fun m!311637 () Bool)

(assert (=> b!300025 m!311637))

(declare-fun m!311639 () Bool)

(assert (=> bm!25820 m!311639))

(assert (=> b!299974 d!67505))

(declare-fun d!67507 () Bool)

(assert (=> d!67507 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!299976 d!67507))

(declare-fun b!300040 () Bool)

(declare-fun e!189464 () SeekEntryResult!2318)

(assert (=> b!300040 (= e!189464 Undefined!2318)))

(declare-fun b!300041 () Bool)

(declare-fun e!189462 () SeekEntryResult!2318)

(declare-fun lt!149165 () SeekEntryResult!2318)

(assert (=> b!300041 (= e!189462 (MissingZero!2318 (index!11450 lt!149165)))))

(declare-fun b!300042 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15148 (_ BitVec 32)) SeekEntryResult!2318)

(assert (=> b!300042 (= e!189462 (seekKeyOrZeroReturnVacant!0 (x!29717 lt!149165) (index!11450 lt!149165) (index!11450 lt!149165) k0!2524 a!3312 mask!3809))))

(declare-fun d!67509 () Bool)

(declare-fun lt!149163 () SeekEntryResult!2318)

(assert (=> d!67509 (and (or ((_ is Undefined!2318) lt!149163) (not ((_ is Found!2318) lt!149163)) (and (bvsge (index!11449 lt!149163) #b00000000000000000000000000000000) (bvslt (index!11449 lt!149163) (size!7523 a!3312)))) (or ((_ is Undefined!2318) lt!149163) ((_ is Found!2318) lt!149163) (not ((_ is MissingZero!2318) lt!149163)) (and (bvsge (index!11448 lt!149163) #b00000000000000000000000000000000) (bvslt (index!11448 lt!149163) (size!7523 a!3312)))) (or ((_ is Undefined!2318) lt!149163) ((_ is Found!2318) lt!149163) ((_ is MissingZero!2318) lt!149163) (not ((_ is MissingVacant!2318) lt!149163)) (and (bvsge (index!11451 lt!149163) #b00000000000000000000000000000000) (bvslt (index!11451 lt!149163) (size!7523 a!3312)))) (or ((_ is Undefined!2318) lt!149163) (ite ((_ is Found!2318) lt!149163) (= (select (arr!7170 a!3312) (index!11449 lt!149163)) k0!2524) (ite ((_ is MissingZero!2318) lt!149163) (= (select (arr!7170 a!3312) (index!11448 lt!149163)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2318) lt!149163) (= (select (arr!7170 a!3312) (index!11451 lt!149163)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!67509 (= lt!149163 e!189464)))

(declare-fun c!48514 () Bool)

(assert (=> d!67509 (= c!48514 (and ((_ is Intermediate!2318) lt!149165) (undefined!3130 lt!149165)))))

(assert (=> d!67509 (= lt!149165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!67509 (validMask!0 mask!3809)))

(assert (=> d!67509 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!149163)))

(declare-fun b!300043 () Bool)

(declare-fun e!189463 () SeekEntryResult!2318)

(assert (=> b!300043 (= e!189464 e!189463)))

(declare-fun lt!149164 () (_ BitVec 64))

(assert (=> b!300043 (= lt!149164 (select (arr!7170 a!3312) (index!11450 lt!149165)))))

(declare-fun c!48515 () Bool)

(assert (=> b!300043 (= c!48515 (= lt!149164 k0!2524))))

(declare-fun b!300044 () Bool)

(assert (=> b!300044 (= e!189463 (Found!2318 (index!11450 lt!149165)))))

(declare-fun b!300045 () Bool)

(declare-fun c!48513 () Bool)

(assert (=> b!300045 (= c!48513 (= lt!149164 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!300045 (= e!189463 e!189462)))

(assert (= (and d!67509 c!48514) b!300040))

(assert (= (and d!67509 (not c!48514)) b!300043))

(assert (= (and b!300043 c!48515) b!300044))

(assert (= (and b!300043 (not c!48515)) b!300045))

(assert (= (and b!300045 c!48513) b!300041))

(assert (= (and b!300045 (not c!48513)) b!300042))

(declare-fun m!311641 () Bool)

(assert (=> b!300042 m!311641))

(declare-fun m!311643 () Bool)

(assert (=> d!67509 m!311643))

(declare-fun m!311645 () Bool)

(assert (=> d!67509 m!311645))

(assert (=> d!67509 m!311577))

(declare-fun m!311647 () Bool)

(assert (=> d!67509 m!311647))

(declare-fun m!311649 () Bool)

(assert (=> d!67509 m!311649))

(assert (=> d!67509 m!311577))

(assert (=> d!67509 m!311565))

(declare-fun m!311651 () Bool)

(assert (=> b!300043 m!311651))

(assert (=> b!299975 d!67509))

(declare-fun d!67515 () Bool)

(declare-fun res!158204 () Bool)

(declare-fun e!189469 () Bool)

(assert (=> d!67515 (=> res!158204 e!189469)))

(assert (=> d!67515 (= res!158204 (= (select (arr!7170 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!67515 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!189469)))

(declare-fun b!300050 () Bool)

(declare-fun e!189470 () Bool)

(assert (=> b!300050 (= e!189469 e!189470)))

(declare-fun res!158205 () Bool)

(assert (=> b!300050 (=> (not res!158205) (not e!189470))))

(assert (=> b!300050 (= res!158205 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7523 a!3312)))))

(declare-fun b!300051 () Bool)

(assert (=> b!300051 (= e!189470 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67515 (not res!158204)) b!300050))

(assert (= (and b!300050 res!158205) b!300051))

(assert (=> d!67515 m!311629))

(declare-fun m!311653 () Bool)

(assert (=> b!300051 m!311653))

(assert (=> b!299977 d!67515))

(declare-fun lt!149209 () SeekEntryResult!2318)

(declare-fun b!300148 () Bool)

(assert (=> b!300148 (and (bvsge (index!11450 lt!149209) #b00000000000000000000000000000000) (bvslt (index!11450 lt!149209) (size!7523 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312)))))))

(declare-fun res!158241 () Bool)

(assert (=> b!300148 (= res!158241 (= (select (arr!7170 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312))) (index!11450 lt!149209)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189529 () Bool)

(assert (=> b!300148 (=> res!158241 e!189529)))

(declare-fun b!300149 () Bool)

(assert (=> b!300149 (and (bvsge (index!11450 lt!149209) #b00000000000000000000000000000000) (bvslt (index!11450 lt!149209) (size!7523 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312)))))))

(declare-fun res!158240 () Bool)

(assert (=> b!300149 (= res!158240 (= (select (arr!7170 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312))) (index!11450 lt!149209)) k0!2524))))

(assert (=> b!300149 (=> res!158240 e!189529)))

(declare-fun e!189531 () Bool)

(assert (=> b!300149 (= e!189531 e!189529)))

(declare-fun b!300150 () Bool)

(assert (=> b!300150 (and (bvsge (index!11450 lt!149209) #b00000000000000000000000000000000) (bvslt (index!11450 lt!149209) (size!7523 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312)))))))

(assert (=> b!300150 (= e!189529 (= (select (arr!7170 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312))) (index!11450 lt!149209)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300151 () Bool)

(declare-fun e!189532 () Bool)

(assert (=> b!300151 (= e!189532 (bvsge (x!29717 lt!149209) #b01111111111111111111111111111110))))

(declare-fun b!300153 () Bool)

(declare-fun e!189533 () SeekEntryResult!2318)

(assert (=> b!300153 (= e!189533 (Intermediate!2318 true lt!149116 #b00000000000000000000000000000000))))

(declare-fun b!300154 () Bool)

(declare-fun e!189530 () SeekEntryResult!2318)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300154 (= e!189530 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149116 #b00000000000000000000000000000000 mask!3809) k0!2524 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312)) mask!3809))))

(declare-fun b!300155 () Bool)

(assert (=> b!300155 (= e!189533 e!189530)))

(declare-fun c!48548 () Bool)

(declare-fun lt!149208 () (_ BitVec 64))

(assert (=> b!300155 (= c!48548 (or (= lt!149208 k0!2524) (= (bvadd lt!149208 lt!149208) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300156 () Bool)

(assert (=> b!300156 (= e!189530 (Intermediate!2318 false lt!149116 #b00000000000000000000000000000000))))

(declare-fun d!67517 () Bool)

(assert (=> d!67517 e!189532))

(declare-fun c!48549 () Bool)

(assert (=> d!67517 (= c!48549 (and ((_ is Intermediate!2318) lt!149209) (undefined!3130 lt!149209)))))

(assert (=> d!67517 (= lt!149209 e!189533)))

(declare-fun c!48550 () Bool)

(assert (=> d!67517 (= c!48550 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67517 (= lt!149208 (select (arr!7170 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312))) lt!149116))))

(assert (=> d!67517 (validMask!0 mask!3809)))

(assert (=> d!67517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149116 k0!2524 (array!15149 (store (arr!7170 a!3312) i!1256 k0!2524) (size!7523 a!3312)) mask!3809) lt!149209)))

(declare-fun b!300152 () Bool)

(assert (=> b!300152 (= e!189532 e!189531)))

(declare-fun res!158239 () Bool)

(assert (=> b!300152 (= res!158239 (and ((_ is Intermediate!2318) lt!149209) (not (undefined!3130 lt!149209)) (bvslt (x!29717 lt!149209) #b01111111111111111111111111111110) (bvsge (x!29717 lt!149209) #b00000000000000000000000000000000) (bvsge (x!29717 lt!149209) #b00000000000000000000000000000000)))))

(assert (=> b!300152 (=> (not res!158239) (not e!189531))))

(assert (= (and d!67517 c!48550) b!300153))

(assert (= (and d!67517 (not c!48550)) b!300155))

(assert (= (and b!300155 c!48548) b!300156))

(assert (= (and b!300155 (not c!48548)) b!300154))

(assert (= (and d!67517 c!48549) b!300151))

(assert (= (and d!67517 (not c!48549)) b!300152))

(assert (= (and b!300152 res!158239) b!300149))

(assert (= (and b!300149 (not res!158240)) b!300148))

(assert (= (and b!300148 (not res!158241)) b!300150))

(declare-fun m!311695 () Bool)

(assert (=> b!300154 m!311695))

(assert (=> b!300154 m!311695))

(declare-fun m!311697 () Bool)

(assert (=> b!300154 m!311697))

(declare-fun m!311699 () Bool)

(assert (=> b!300148 m!311699))

(assert (=> b!300150 m!311699))

(assert (=> b!300149 m!311699))

(declare-fun m!311701 () Bool)

(assert (=> d!67517 m!311701))

(assert (=> d!67517 m!311565))

(assert (=> b!299978 d!67517))

(declare-fun b!300159 () Bool)

(declare-fun lt!149211 () SeekEntryResult!2318)

(assert (=> b!300159 (and (bvsge (index!11450 lt!149211) #b00000000000000000000000000000000) (bvslt (index!11450 lt!149211) (size!7523 a!3312)))))

(declare-fun res!158246 () Bool)

(assert (=> b!300159 (= res!158246 (= (select (arr!7170 a!3312) (index!11450 lt!149211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!189536 () Bool)

(assert (=> b!300159 (=> res!158246 e!189536)))

(declare-fun b!300160 () Bool)

(assert (=> b!300160 (and (bvsge (index!11450 lt!149211) #b00000000000000000000000000000000) (bvslt (index!11450 lt!149211) (size!7523 a!3312)))))

(declare-fun res!158245 () Bool)

(assert (=> b!300160 (= res!158245 (= (select (arr!7170 a!3312) (index!11450 lt!149211)) k0!2524))))

(assert (=> b!300160 (=> res!158245 e!189536)))

(declare-fun e!189538 () Bool)

(assert (=> b!300160 (= e!189538 e!189536)))

(declare-fun b!300161 () Bool)

(assert (=> b!300161 (and (bvsge (index!11450 lt!149211) #b00000000000000000000000000000000) (bvslt (index!11450 lt!149211) (size!7523 a!3312)))))

(assert (=> b!300161 (= e!189536 (= (select (arr!7170 a!3312) (index!11450 lt!149211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!300162 () Bool)

(declare-fun e!189539 () Bool)

(assert (=> b!300162 (= e!189539 (bvsge (x!29717 lt!149211) #b01111111111111111111111111111110))))

(declare-fun b!300164 () Bool)

(declare-fun e!189540 () SeekEntryResult!2318)

(assert (=> b!300164 (= e!189540 (Intermediate!2318 true lt!149116 #b00000000000000000000000000000000))))

(declare-fun b!300165 () Bool)

(declare-fun e!189537 () SeekEntryResult!2318)

(assert (=> b!300165 (= e!189537 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!149116 #b00000000000000000000000000000000 mask!3809) k0!2524 a!3312 mask!3809))))

(declare-fun b!300166 () Bool)

(assert (=> b!300166 (= e!189540 e!189537)))

(declare-fun c!48551 () Bool)

(declare-fun lt!149210 () (_ BitVec 64))

(assert (=> b!300166 (= c!48551 (or (= lt!149210 k0!2524) (= (bvadd lt!149210 lt!149210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!300167 () Bool)

(assert (=> b!300167 (= e!189537 (Intermediate!2318 false lt!149116 #b00000000000000000000000000000000))))

(declare-fun d!67531 () Bool)

(assert (=> d!67531 e!189539))

(declare-fun c!48552 () Bool)

(assert (=> d!67531 (= c!48552 (and ((_ is Intermediate!2318) lt!149211) (undefined!3130 lt!149211)))))

(assert (=> d!67531 (= lt!149211 e!189540)))

(declare-fun c!48553 () Bool)

(assert (=> d!67531 (= c!48553 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67531 (= lt!149210 (select (arr!7170 a!3312) lt!149116))))

(assert (=> d!67531 (validMask!0 mask!3809)))

(assert (=> d!67531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149116 k0!2524 a!3312 mask!3809) lt!149211)))

(declare-fun b!300163 () Bool)

(assert (=> b!300163 (= e!189539 e!189538)))

(declare-fun res!158244 () Bool)

(assert (=> b!300163 (= res!158244 (and ((_ is Intermediate!2318) lt!149211) (not (undefined!3130 lt!149211)) (bvslt (x!29717 lt!149211) #b01111111111111111111111111111110) (bvsge (x!29717 lt!149211) #b00000000000000000000000000000000) (bvsge (x!29717 lt!149211) #b00000000000000000000000000000000)))))

(assert (=> b!300163 (=> (not res!158244) (not e!189538))))

(assert (= (and d!67531 c!48553) b!300164))

(assert (= (and d!67531 (not c!48553)) b!300166))

(assert (= (and b!300166 c!48551) b!300167))

(assert (= (and b!300166 (not c!48551)) b!300165))

(assert (= (and d!67531 c!48552) b!300162))

(assert (= (and d!67531 (not c!48552)) b!300163))

(assert (= (and b!300163 res!158244) b!300160))

(assert (= (and b!300160 (not res!158245)) b!300159))

(assert (= (and b!300159 (not res!158246)) b!300161))

(assert (=> b!300165 m!311695))

(assert (=> b!300165 m!311695))

(declare-fun m!311703 () Bool)

(assert (=> b!300165 m!311703))

(declare-fun m!311705 () Bool)

(assert (=> b!300159 m!311705))

(assert (=> b!300161 m!311705))

(assert (=> b!300160 m!311705))

(declare-fun m!311707 () Bool)

(assert (=> d!67531 m!311707))

(assert (=> d!67531 m!311565))

(assert (=> b!299978 d!67531))

(declare-fun d!67533 () Bool)

(declare-fun lt!149220 () (_ BitVec 32))

(declare-fun lt!149219 () (_ BitVec 32))

(assert (=> d!67533 (= lt!149220 (bvmul (bvxor lt!149219 (bvlshr lt!149219 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!67533 (= lt!149219 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!67533 (and (bvsge mask!3809 #b00000000000000000000000000000000) (let ((res!158247 (let ((h!5291 ((_ extract 31 0) (bvand (bvxor k0!2524 (bvlshr k0!2524 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!29723 (bvmul (bvxor h!5291 (bvlshr h!5291 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!29723 (bvlshr x!29723 #b00000000000000000000000000001101)) mask!3809))))) (and (bvslt res!158247 (bvadd mask!3809 #b00000000000000000000000000000001)) (bvsge res!158247 #b00000000000000000000000000000000))))))

(assert (=> d!67533 (= (toIndex!0 k0!2524 mask!3809) (bvand (bvxor lt!149220 (bvlshr lt!149220 #b00000000000000000000000000001101)) mask!3809))))

(assert (=> b!299978 d!67533))

(declare-fun d!67539 () Bool)

(assert (=> d!67539 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29818 d!67539))

(declare-fun d!67551 () Bool)

(assert (=> d!67551 (= (array_inv!5142 a!3312) (bvsge (size!7523 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29818 d!67551))

(check-sat (not bm!25820) (not b!300154) (not b!300042) (not d!67517) (not b!300025) (not d!67509) (not b!300024) (not b!300165) (not d!67531) (not b!300051))
(check-sat)
