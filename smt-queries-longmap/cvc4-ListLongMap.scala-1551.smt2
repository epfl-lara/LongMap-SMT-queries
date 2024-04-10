; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29336 () Bool)

(assert start!29336)

(declare-fun b!297246 () Bool)

(declare-fun res!156775 () Bool)

(declare-fun e!187851 () Bool)

(assert (=> b!297246 (=> (not res!156775) (not e!187851))))

(declare-datatypes ((array!15049 0))(
  ( (array!15050 (arr!7132 (Array (_ BitVec 32) (_ BitVec 64))) (size!7484 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15049)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297246 (= res!156775 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297247 () Bool)

(declare-fun res!156774 () Bool)

(assert (=> b!297247 (=> (not res!156774) (not e!187851))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!297247 (= res!156774 (and (= (size!7484 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7484 a!3312))))))

(declare-fun b!297248 () Bool)

(declare-fun e!187852 () Bool)

(assert (=> b!297248 (= e!187851 e!187852)))

(declare-fun res!156773 () Bool)

(assert (=> b!297248 (=> (not res!156773) (not e!187852))))

(declare-datatypes ((SeekEntryResult!2281 0))(
  ( (MissingZero!2281 (index!11294 (_ BitVec 32))) (Found!2281 (index!11295 (_ BitVec 32))) (Intermediate!2281 (undefined!3093 Bool) (index!11296 (_ BitVec 32)) (x!29505 (_ BitVec 32))) (Undefined!2281) (MissingVacant!2281 (index!11297 (_ BitVec 32))) )
))
(declare-fun lt!147723 () SeekEntryResult!2281)

(declare-fun lt!147720 () Bool)

(assert (=> b!297248 (= res!156773 (or lt!147720 (= lt!147723 (MissingVacant!2281 i!1256))))))

(assert (=> b!297248 (= lt!147720 (= lt!147723 (MissingZero!2281 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15049 (_ BitVec 32)) SeekEntryResult!2281)

(assert (=> b!297248 (= lt!147723 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!297249 () Bool)

(declare-fun lt!147721 () SeekEntryResult!2281)

(assert (=> b!297249 (= e!187852 (and lt!147720 (not (is-Intermediate!2281 lt!147721))))))

(declare-fun lt!147719 () SeekEntryResult!2281)

(declare-fun lt!147722 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15049 (_ BitVec 32)) SeekEntryResult!2281)

(assert (=> b!297249 (= lt!147719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147722 k!2524 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312)) mask!3809))))

(assert (=> b!297249 (= lt!147721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147722 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297249 (= lt!147722 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297250 () Bool)

(declare-fun res!156777 () Bool)

(assert (=> b!297250 (=> (not res!156777) (not e!187852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15049 (_ BitVec 32)) Bool)

(assert (=> b!297250 (= res!156777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297251 () Bool)

(declare-fun res!156776 () Bool)

(assert (=> b!297251 (=> (not res!156776) (not e!187851))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297251 (= res!156776 (validKeyInArray!0 k!2524))))

(declare-fun res!156772 () Bool)

(assert (=> start!29336 (=> (not res!156772) (not e!187851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29336 (= res!156772 (validMask!0 mask!3809))))

(assert (=> start!29336 e!187851))

(assert (=> start!29336 true))

(declare-fun array_inv!5095 (array!15049) Bool)

(assert (=> start!29336 (array_inv!5095 a!3312)))

(assert (= (and start!29336 res!156772) b!297247))

(assert (= (and b!297247 res!156774) b!297251))

(assert (= (and b!297251 res!156776) b!297246))

(assert (= (and b!297246 res!156775) b!297248))

(assert (= (and b!297248 res!156773) b!297250))

(assert (= (and b!297250 res!156777) b!297249))

(declare-fun m!310081 () Bool)

(assert (=> b!297251 m!310081))

(declare-fun m!310083 () Bool)

(assert (=> b!297246 m!310083))

(declare-fun m!310085 () Bool)

(assert (=> b!297249 m!310085))

(declare-fun m!310087 () Bool)

(assert (=> b!297249 m!310087))

(declare-fun m!310089 () Bool)

(assert (=> b!297249 m!310089))

(declare-fun m!310091 () Bool)

(assert (=> b!297249 m!310091))

(declare-fun m!310093 () Bool)

(assert (=> start!29336 m!310093))

(declare-fun m!310095 () Bool)

(assert (=> start!29336 m!310095))

(declare-fun m!310097 () Bool)

(assert (=> b!297248 m!310097))

(declare-fun m!310099 () Bool)

(assert (=> b!297250 m!310099))

(push 1)

(assert (not start!29336))

(assert (not b!297249))

(assert (not b!297246))

(assert (not b!297248))

(assert (not b!297251))

(assert (not b!297250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!67167 () Bool)

(declare-fun res!156782 () Bool)

(declare-fun e!187861 () Bool)

(assert (=> d!67167 (=> res!156782 e!187861)))

(assert (=> d!67167 (= res!156782 (= (select (arr!7132 a!3312) #b00000000000000000000000000000000) k!2524))))

(assert (=> d!67167 (= (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000) e!187861)))

(declare-fun b!297264 () Bool)

(declare-fun e!187862 () Bool)

(assert (=> b!297264 (= e!187861 e!187862)))

(declare-fun res!156783 () Bool)

(assert (=> b!297264 (=> (not res!156783) (not e!187862))))

(assert (=> b!297264 (= res!156783 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7484 a!3312)))))

(declare-fun b!297265 () Bool)

(assert (=> b!297265 (= e!187862 (arrayContainsKey!0 a!3312 k!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!67167 (not res!156782)) b!297264))

(assert (= (and b!297264 res!156783) b!297265))

(declare-fun m!310101 () Bool)

(assert (=> d!67167 m!310101))

(declare-fun m!310103 () Bool)

(assert (=> b!297265 m!310103))

(assert (=> b!297246 d!67167))

(declare-fun d!67169 () Bool)

(assert (=> d!67169 (= (validKeyInArray!0 k!2524) (and (not (= k!2524 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2524 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!297251 d!67169))

(declare-fun d!67171 () Bool)

(declare-fun res!156811 () Bool)

(declare-fun e!187901 () Bool)

(assert (=> d!67171 (=> res!156811 e!187901)))

(assert (=> d!67171 (= res!156811 (bvsge #b00000000000000000000000000000000 (size!7484 a!3312)))))

(assert (=> d!67171 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!187901)))

(declare-fun b!297329 () Bool)

(declare-fun e!187902 () Bool)

(declare-fun e!187900 () Bool)

(assert (=> b!297329 (= e!187902 e!187900)))

(declare-fun lt!147744 () (_ BitVec 64))

(assert (=> b!297329 (= lt!147744 (select (arr!7132 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9256 0))(
  ( (Unit!9257) )
))
(declare-fun lt!147745 () Unit!9256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!15049 (_ BitVec 64) (_ BitVec 32)) Unit!9256)

(assert (=> b!297329 (= lt!147745 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!147744 #b00000000000000000000000000000000))))

(assert (=> b!297329 (arrayContainsKey!0 a!3312 lt!147744 #b00000000000000000000000000000000)))

(declare-fun lt!147746 () Unit!9256)

(assert (=> b!297329 (= lt!147746 lt!147745)))

(declare-fun res!156810 () Bool)

(assert (=> b!297329 (= res!156810 (= (seekEntryOrOpen!0 (select (arr!7132 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!2281 #b00000000000000000000000000000000)))))

(assert (=> b!297329 (=> (not res!156810) (not e!187900))))

(declare-fun b!297330 () Bool)

(declare-fun call!25756 () Bool)

(assert (=> b!297330 (= e!187902 call!25756)))

(declare-fun b!297331 () Bool)

(assert (=> b!297331 (= e!187901 e!187902)))

(declare-fun c!47841 () Bool)

(assert (=> b!297331 (= c!47841 (validKeyInArray!0 (select (arr!7132 a!3312) #b00000000000000000000000000000000)))))

(declare-fun bm!25753 () Bool)

(assert (=> bm!25753 (= call!25756 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun b!297332 () Bool)

(assert (=> b!297332 (= e!187900 call!25756)))

(assert (= (and d!67171 (not res!156811)) b!297331))

(assert (= (and b!297331 c!47841) b!297329))

(assert (= (and b!297331 (not c!47841)) b!297330))

(assert (= (and b!297329 res!156810) b!297332))

(assert (= (or b!297332 b!297330) bm!25753))

(assert (=> b!297329 m!310101))

(declare-fun m!310121 () Bool)

(assert (=> b!297329 m!310121))

(declare-fun m!310123 () Bool)

(assert (=> b!297329 m!310123))

(assert (=> b!297329 m!310101))

(declare-fun m!310127 () Bool)

(assert (=> b!297329 m!310127))

(assert (=> b!297331 m!310101))

(assert (=> b!297331 m!310101))

(declare-fun m!310131 () Bool)

(assert (=> b!297331 m!310131))

(declare-fun m!310135 () Bool)

(assert (=> bm!25753 m!310135))

(assert (=> b!297250 d!67171))

(declare-fun d!67177 () Bool)

(assert (=> d!67177 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!29336 d!67177))

(declare-fun d!67189 () Bool)

(assert (=> d!67189 (= (array_inv!5095 a!3312) (bvsge (size!7484 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!29336 d!67189))

(declare-fun b!297408 () Bool)

(declare-fun lt!147789 () SeekEntryResult!2281)

(assert (=> b!297408 (and (bvsge (index!11296 lt!147789) #b00000000000000000000000000000000) (bvslt (index!11296 lt!147789) (size!7484 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312)))))))

(declare-fun res!156846 () Bool)

(assert (=> b!297408 (= res!156846 (= (select (arr!7132 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312))) (index!11296 lt!147789)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187958 () Bool)

(assert (=> b!297408 (=> res!156846 e!187958)))

(declare-fun b!297409 () Bool)

(declare-fun e!187955 () SeekEntryResult!2281)

(declare-fun e!187954 () SeekEntryResult!2281)

(assert (=> b!297409 (= e!187955 e!187954)))

(declare-fun c!47865 () Bool)

(declare-fun lt!147790 () (_ BitVec 64))

(assert (=> b!297409 (= c!47865 (or (= lt!147790 k!2524) (= (bvadd lt!147790 lt!147790) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67191 () Bool)

(declare-fun e!187957 () Bool)

(assert (=> d!67191 e!187957))

(declare-fun c!47864 () Bool)

(assert (=> d!67191 (= c!47864 (and (is-Intermediate!2281 lt!147789) (undefined!3093 lt!147789)))))

(assert (=> d!67191 (= lt!147789 e!187955)))

(declare-fun c!47863 () Bool)

(assert (=> d!67191 (= c!47863 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67191 (= lt!147790 (select (arr!7132 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312))) lt!147722))))

(assert (=> d!67191 (validMask!0 mask!3809)))

(assert (=> d!67191 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147722 k!2524 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312)) mask!3809) lt!147789)))

(declare-fun b!297410 () Bool)

(assert (=> b!297410 (= e!187955 (Intermediate!2281 true lt!147722 #b00000000000000000000000000000000))))

(declare-fun b!297411 () Bool)

(assert (=> b!297411 (and (bvsge (index!11296 lt!147789) #b00000000000000000000000000000000) (bvslt (index!11296 lt!147789) (size!7484 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312)))))))

(assert (=> b!297411 (= e!187958 (= (select (arr!7132 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312))) (index!11296 lt!147789)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!297412 () Bool)

(assert (=> b!297412 (= e!187957 (bvsge (x!29505 lt!147789) #b01111111111111111111111111111110))))

(declare-fun b!297413 () Bool)

(assert (=> b!297413 (= e!187954 (Intermediate!2281 false lt!147722 #b00000000000000000000000000000000))))

(declare-fun b!297414 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297414 (= e!187954 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!147722 #b00000000000000000000000000000000 mask!3809) k!2524 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312)) mask!3809))))

(declare-fun b!297415 () Bool)

(declare-fun e!187956 () Bool)

(assert (=> b!297415 (= e!187957 e!187956)))

(declare-fun res!156847 () Bool)

(assert (=> b!297415 (= res!156847 (and (is-Intermediate!2281 lt!147789) (not (undefined!3093 lt!147789)) (bvslt (x!29505 lt!147789) #b01111111111111111111111111111110) (bvsge (x!29505 lt!147789) #b00000000000000000000000000000000) (bvsge (x!29505 lt!147789) #b00000000000000000000000000000000)))))

(assert (=> b!297415 (=> (not res!156847) (not e!187956))))

(declare-fun b!297416 () Bool)

(assert (=> b!297416 (and (bvsge (index!11296 lt!147789) #b00000000000000000000000000000000) (bvslt (index!11296 lt!147789) (size!7484 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312)))))))

(declare-fun res!156848 () Bool)

(assert (=> b!297416 (= res!156848 (= (select (arr!7132 (array!15050 (store (arr!7132 a!3312) i!1256 k!2524) (size!7484 a!3312))) (index!11296 lt!147789)) k!2524))))

(assert (=> b!297416 (=> res!156848 e!187958)))

(assert (=> b!297416 (= e!187956 e!187958)))

(assert (= (and d!67191 c!47863) b!297410))

(assert (= (and d!67191 (not c!47863)) b!297409))

(assert (= (and b!297409 c!47865) b!297413))

(assert (= (and b!297409 (not c!47865)) b!297414))

(assert (= (and d!67191 c!47864) b!297412))

(assert (= (and d!67191 (not c!47864)) b!297415))

(assert (= (and b!297415 res!156847) b!297416))

(assert (= (and b!297416 (not res!156848)) b!297408))

(assert (= (and b!297408 (not res!156846)) b!297411))

(declare-fun m!310171 () Bool)

(assert (=> b!297414 m!310171))

(assert (=> b!297414 m!310171))

(declare-fun m!310173 () Bool)

(assert (=> b!297414 m!310173))

(declare-fun m!310175 () Bool)

(assert (=> b!297408 m!310175))

(declare-fun m!310177 () Bool)

(assert (=> d!67191 m!310177))

(assert (=> d!67191 m!310093))

(assert (=> b!297416 m!310175))

(assert (=> b!297411 m!310175))

(assert (=> b!297249 d!67191))

(declare-fun b!297417 () Bool)

(declare-fun lt!147791 () SeekEntryResult!2281)

(assert (=> b!297417 (and (bvsge (index!11296 lt!147791) #b00000000000000000000000000000000) (bvslt (index!11296 lt!147791) (size!7484 a!3312)))))

(declare-fun res!156849 () Bool)

(assert (=> b!297417 (= res!156849 (= (select (arr!7132 a!3312) (index!11296 lt!147791)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!187963 () Bool)

(assert (=> b!297417 (=> res!156849 e!187963)))

(declare-fun b!297418 () Bool)

(declare-fun e!187960 () SeekEntryResult!2281)

(declare-fun e!187959 () SeekEntryResult!2281)

(assert (=> b!297418 (= e!187960 e!187959)))

(declare-fun c!47868 () Bool)

(declare-fun lt!147792 () (_ BitVec 64))

(assert (=> b!297418 (= c!47868 (or (= lt!147792 k!2524) (= (bvadd lt!147792 lt!147792) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!67207 () Bool)

(declare-fun e!187962 () Bool)

(assert (=> d!67207 e!187962))

(declare-fun c!47867 () Bool)

(assert (=> d!67207 (= c!47867 (and (is-Intermediate!2281 lt!147791) (undefined!3093 lt!147791)))))

(assert (=> d!67207 (= lt!147791 e!187960)))

(declare-fun c!47866 () Bool)

(assert (=> d!67207 (= c!47866 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!67207 (= lt!147792 (select (arr!7132 a!3312) lt!147722))))

