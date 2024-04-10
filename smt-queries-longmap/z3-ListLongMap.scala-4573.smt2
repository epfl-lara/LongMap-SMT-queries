; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63738 () Bool)

(assert start!63738)

(declare-fun b!717333 () Bool)

(declare-fun res!480124 () Bool)

(declare-fun e!402728 () Bool)

(assert (=> b!717333 (=> (not res!480124) (not e!402728))))

(declare-datatypes ((array!40634 0))(
  ( (array!40635 (arr!19450 (Array (_ BitVec 32) (_ BitVec 64))) (size!19871 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40634)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!717333 (= res!480124 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!717334 () Bool)

(declare-fun res!480120 () Bool)

(assert (=> b!717334 (=> (not res!480120) (not e!402728))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!717334 (= res!480120 (validKeyInArray!0 (select (arr!19450 a!3186) j!159)))))

(declare-fun b!717335 () Bool)

(declare-fun res!480125 () Bool)

(assert (=> b!717335 (=> (not res!480125) (not e!402728))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!717335 (= res!480125 (and (= (size!19871 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19871 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19871 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!717336 () Bool)

(declare-fun e!402727 () Bool)

(assert (=> b!717336 (= e!402727 (and (bvsle #b00000000000000000000000000000000 (size!19871 a!3186)) (bvsge (size!19871 a!3186) #b01111111111111111111111111111111)))))

(declare-fun b!717337 () Bool)

(assert (=> b!717337 (= e!402728 e!402727)))

(declare-fun res!480119 () Bool)

(assert (=> b!717337 (=> (not res!480119) (not e!402727))))

(declare-datatypes ((SeekEntryResult!7050 0))(
  ( (MissingZero!7050 (index!30568 (_ BitVec 32))) (Found!7050 (index!30569 (_ BitVec 32))) (Intermediate!7050 (undefined!7862 Bool) (index!30570 (_ BitVec 32)) (x!61590 (_ BitVec 32))) (Undefined!7050) (MissingVacant!7050 (index!30571 (_ BitVec 32))) )
))
(declare-fun lt!319043 () SeekEntryResult!7050)

(assert (=> b!717337 (= res!480119 (or (= lt!319043 (MissingZero!7050 i!1173)) (= lt!319043 (MissingVacant!7050 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40634 (_ BitVec 32)) SeekEntryResult!7050)

(assert (=> b!717337 (= lt!319043 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!480121 () Bool)

(assert (=> start!63738 (=> (not res!480121) (not e!402728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63738 (= res!480121 (validMask!0 mask!3328))))

(assert (=> start!63738 e!402728))

(declare-fun array_inv!15246 (array!40634) Bool)

(assert (=> start!63738 (array_inv!15246 a!3186)))

(assert (=> start!63738 true))

(declare-fun b!717338 () Bool)

(declare-fun res!480123 () Bool)

(assert (=> b!717338 (=> (not res!480123) (not e!402728))))

(assert (=> b!717338 (= res!480123 (validKeyInArray!0 k0!2102))))

(declare-fun b!717339 () Bool)

(declare-fun res!480122 () Bool)

(assert (=> b!717339 (=> (not res!480122) (not e!402727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40634 (_ BitVec 32)) Bool)

(assert (=> b!717339 (= res!480122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!63738 res!480121) b!717335))

(assert (= (and b!717335 res!480125) b!717334))

(assert (= (and b!717334 res!480120) b!717338))

(assert (= (and b!717338 res!480123) b!717333))

(assert (= (and b!717333 res!480124) b!717337))

(assert (= (and b!717337 res!480119) b!717339))

(assert (= (and b!717339 res!480122) b!717336))

(declare-fun m!673259 () Bool)

(assert (=> b!717339 m!673259))

(declare-fun m!673261 () Bool)

(assert (=> start!63738 m!673261))

(declare-fun m!673263 () Bool)

(assert (=> start!63738 m!673263))

(declare-fun m!673265 () Bool)

(assert (=> b!717337 m!673265))

(declare-fun m!673267 () Bool)

(assert (=> b!717334 m!673267))

(assert (=> b!717334 m!673267))

(declare-fun m!673269 () Bool)

(assert (=> b!717334 m!673269))

(declare-fun m!673271 () Bool)

(assert (=> b!717333 m!673271))

(declare-fun m!673273 () Bool)

(assert (=> b!717338 m!673273))

(check-sat (not b!717339) (not b!717333) (not b!717334) (not b!717337) (not b!717338) (not start!63738))
(check-sat)
(get-model)

(declare-fun d!98799 () Bool)

(declare-fun res!480151 () Bool)

(declare-fun e!402742 () Bool)

(assert (=> d!98799 (=> res!480151 e!402742)))

(assert (=> d!98799 (= res!480151 (= (select (arr!19450 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98799 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!402742)))

(declare-fun b!717365 () Bool)

(declare-fun e!402743 () Bool)

(assert (=> b!717365 (= e!402742 e!402743)))

(declare-fun res!480152 () Bool)

(assert (=> b!717365 (=> (not res!480152) (not e!402743))))

(assert (=> b!717365 (= res!480152 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19871 a!3186)))))

(declare-fun b!717366 () Bool)

(assert (=> b!717366 (= e!402743 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98799 (not res!480151)) b!717365))

(assert (= (and b!717365 res!480152) b!717366))

(declare-fun m!673291 () Bool)

(assert (=> d!98799 m!673291))

(declare-fun m!673293 () Bool)

(assert (=> b!717366 m!673293))

(assert (=> b!717333 d!98799))

(declare-fun d!98801 () Bool)

(assert (=> d!98801 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63738 d!98801))

(declare-fun d!98811 () Bool)

(assert (=> d!98811 (= (array_inv!15246 a!3186) (bvsge (size!19871 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63738 d!98811))

(declare-fun b!717396 () Bool)

(declare-fun e!402768 () Bool)

(declare-fun e!402770 () Bool)

(assert (=> b!717396 (= e!402768 e!402770)))

(declare-fun c!78979 () Bool)

(assert (=> b!717396 (= c!78979 (validKeyInArray!0 (select (arr!19450 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!717397 () Bool)

(declare-fun e!402771 () Bool)

(assert (=> b!717397 (= e!402770 e!402771)))

(declare-fun lt!319064 () (_ BitVec 64))

(assert (=> b!717397 (= lt!319064 (select (arr!19450 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24642 0))(
  ( (Unit!24643) )
))
(declare-fun lt!319063 () Unit!24642)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40634 (_ BitVec 64) (_ BitVec 32)) Unit!24642)

(assert (=> b!717397 (= lt!319063 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319064 #b00000000000000000000000000000000))))

(assert (=> b!717397 (arrayContainsKey!0 a!3186 lt!319064 #b00000000000000000000000000000000)))

(declare-fun lt!319062 () Unit!24642)

(assert (=> b!717397 (= lt!319062 lt!319063)))

(declare-fun res!480172 () Bool)

(assert (=> b!717397 (= res!480172 (= (seekEntryOrOpen!0 (select (arr!19450 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7050 #b00000000000000000000000000000000)))))

(assert (=> b!717397 (=> (not res!480172) (not e!402771))))

(declare-fun d!98813 () Bool)

(declare-fun res!480171 () Bool)

(assert (=> d!98813 (=> res!480171 e!402768)))

(assert (=> d!98813 (= res!480171 (bvsge #b00000000000000000000000000000000 (size!19871 a!3186)))))

(assert (=> d!98813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!402768)))

(declare-fun b!717395 () Bool)

(declare-fun call!34692 () Bool)

(assert (=> b!717395 (= e!402770 call!34692)))

(declare-fun bm!34689 () Bool)

(assert (=> bm!34689 (= call!34692 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!717398 () Bool)

(assert (=> b!717398 (= e!402771 call!34692)))

(assert (= (and d!98813 (not res!480171)) b!717396))

(assert (= (and b!717396 c!78979) b!717397))

(assert (= (and b!717396 (not c!78979)) b!717395))

(assert (= (and b!717397 res!480172) b!717398))

(assert (= (or b!717398 b!717395) bm!34689))

(assert (=> b!717396 m!673291))

(assert (=> b!717396 m!673291))

(declare-fun m!673311 () Bool)

(assert (=> b!717396 m!673311))

(assert (=> b!717397 m!673291))

(declare-fun m!673313 () Bool)

(assert (=> b!717397 m!673313))

(declare-fun m!673315 () Bool)

(assert (=> b!717397 m!673315))

(assert (=> b!717397 m!673291))

(declare-fun m!673317 () Bool)

(assert (=> b!717397 m!673317))

(declare-fun m!673319 () Bool)

(assert (=> bm!34689 m!673319))

(assert (=> b!717339 d!98813))

(declare-fun d!98827 () Bool)

(assert (=> d!98827 (= (validKeyInArray!0 (select (arr!19450 a!3186) j!159)) (and (not (= (select (arr!19450 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19450 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717334 d!98827))

(declare-fun b!717451 () Bool)

(declare-fun c!79004 () Bool)

(declare-fun lt!319089 () (_ BitVec 64))

(assert (=> b!717451 (= c!79004 (= lt!319089 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!402798 () SeekEntryResult!7050)

(declare-fun e!402799 () SeekEntryResult!7050)

(assert (=> b!717451 (= e!402798 e!402799)))

(declare-fun b!717452 () Bool)

(declare-fun lt!319090 () SeekEntryResult!7050)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40634 (_ BitVec 32)) SeekEntryResult!7050)

(assert (=> b!717452 (= e!402799 (seekKeyOrZeroReturnVacant!0 (x!61590 lt!319090) (index!30570 lt!319090) (index!30570 lt!319090) k0!2102 a!3186 mask!3328))))

(declare-fun b!717453 () Bool)

(assert (=> b!717453 (= e!402799 (MissingZero!7050 (index!30570 lt!319090)))))

(declare-fun b!717454 () Bool)

(declare-fun e!402800 () SeekEntryResult!7050)

(assert (=> b!717454 (= e!402800 Undefined!7050)))

(declare-fun b!717455 () Bool)

(assert (=> b!717455 (= e!402800 e!402798)))

(assert (=> b!717455 (= lt!319089 (select (arr!19450 a!3186) (index!30570 lt!319090)))))

(declare-fun c!79006 () Bool)

(assert (=> b!717455 (= c!79006 (= lt!319089 k0!2102))))

(declare-fun b!717456 () Bool)

(assert (=> b!717456 (= e!402798 (Found!7050 (index!30570 lt!319090)))))

(declare-fun d!98831 () Bool)

(declare-fun lt!319091 () SeekEntryResult!7050)

(get-info :version)

(assert (=> d!98831 (and (or ((_ is Undefined!7050) lt!319091) (not ((_ is Found!7050) lt!319091)) (and (bvsge (index!30569 lt!319091) #b00000000000000000000000000000000) (bvslt (index!30569 lt!319091) (size!19871 a!3186)))) (or ((_ is Undefined!7050) lt!319091) ((_ is Found!7050) lt!319091) (not ((_ is MissingZero!7050) lt!319091)) (and (bvsge (index!30568 lt!319091) #b00000000000000000000000000000000) (bvslt (index!30568 lt!319091) (size!19871 a!3186)))) (or ((_ is Undefined!7050) lt!319091) ((_ is Found!7050) lt!319091) ((_ is MissingZero!7050) lt!319091) (not ((_ is MissingVacant!7050) lt!319091)) (and (bvsge (index!30571 lt!319091) #b00000000000000000000000000000000) (bvslt (index!30571 lt!319091) (size!19871 a!3186)))) (or ((_ is Undefined!7050) lt!319091) (ite ((_ is Found!7050) lt!319091) (= (select (arr!19450 a!3186) (index!30569 lt!319091)) k0!2102) (ite ((_ is MissingZero!7050) lt!319091) (= (select (arr!19450 a!3186) (index!30568 lt!319091)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7050) lt!319091) (= (select (arr!19450 a!3186) (index!30571 lt!319091)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98831 (= lt!319091 e!402800)))

(declare-fun c!79005 () Bool)

(assert (=> d!98831 (= c!79005 (and ((_ is Intermediate!7050) lt!319090) (undefined!7862 lt!319090)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40634 (_ BitVec 32)) SeekEntryResult!7050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!98831 (= lt!319090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98831 (validMask!0 mask!3328)))

(assert (=> d!98831 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319091)))

(assert (= (and d!98831 c!79005) b!717454))

(assert (= (and d!98831 (not c!79005)) b!717455))

(assert (= (and b!717455 c!79006) b!717456))

(assert (= (and b!717455 (not c!79006)) b!717451))

(assert (= (and b!717451 c!79004) b!717453))

(assert (= (and b!717451 (not c!79004)) b!717452))

(declare-fun m!673351 () Bool)

(assert (=> b!717452 m!673351))

(declare-fun m!673353 () Bool)

(assert (=> b!717455 m!673353))

(declare-fun m!673355 () Bool)

(assert (=> d!98831 m!673355))

(assert (=> d!98831 m!673355))

(declare-fun m!673357 () Bool)

(assert (=> d!98831 m!673357))

(assert (=> d!98831 m!673261))

(declare-fun m!673359 () Bool)

(assert (=> d!98831 m!673359))

(declare-fun m!673361 () Bool)

(assert (=> d!98831 m!673361))

(declare-fun m!673363 () Bool)

(assert (=> d!98831 m!673363))

(assert (=> b!717337 d!98831))

(declare-fun d!98837 () Bool)

(assert (=> d!98837 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!717338 d!98837))

(check-sat (not b!717397) (not b!717396) (not d!98831) (not b!717366) (not b!717452) (not bm!34689))
(check-sat)
