; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48038 () Bool)

(assert start!48038)

(declare-fun b!529290 () Bool)

(declare-fun res!325184 () Bool)

(declare-fun e!308411 () Bool)

(assert (=> b!529290 (=> (not res!325184) (not e!308411))))

(declare-datatypes ((array!33531 0))(
  ( (array!33532 (arr!16114 (Array (_ BitVec 32) (_ BitVec 64))) (size!16478 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33531)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529290 (= res!325184 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529291 () Bool)

(declare-fun e!308408 () Bool)

(declare-fun e!308410 () Bool)

(assert (=> b!529291 (= e!308408 (not e!308410))))

(declare-fun res!325182 () Bool)

(assert (=> b!529291 (=> res!325182 e!308410)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4581 0))(
  ( (MissingZero!4581 (index!20548 (_ BitVec 32))) (Found!4581 (index!20549 (_ BitVec 32))) (Intermediate!4581 (undefined!5393 Bool) (index!20550 (_ BitVec 32)) (x!49517 (_ BitVec 32))) (Undefined!4581) (MissingVacant!4581 (index!20551 (_ BitVec 32))) )
))
(declare-fun lt!244014 () SeekEntryResult!4581)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!244011 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33531 (_ BitVec 32)) SeekEntryResult!4581)

(assert (=> b!529291 (= res!325182 (= lt!244014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244011 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)) mask!3524)))))

(declare-fun lt!244013 () (_ BitVec 32))

(assert (=> b!529291 (= lt!244014 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244013 (select (arr!16114 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529291 (= lt!244011 (toIndex!0 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529291 (= lt!244013 (toIndex!0 (select (arr!16114 a!3235) j!176) mask!3524))))

(declare-fun e!308412 () Bool)

(assert (=> b!529291 e!308412))

(declare-fun res!325187 () Bool)

(assert (=> b!529291 (=> (not res!325187) (not e!308412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33531 (_ BitVec 32)) Bool)

(assert (=> b!529291 (= res!325187 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16774 0))(
  ( (Unit!16775) )
))
(declare-fun lt!244012 () Unit!16774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16774)

(assert (=> b!529291 (= lt!244012 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529292 () Bool)

(declare-fun res!325181 () Bool)

(assert (=> b!529292 (=> (not res!325181) (not e!308408))))

(declare-datatypes ((List!10272 0))(
  ( (Nil!10269) (Cons!10268 (h!11205 (_ BitVec 64)) (t!16500 List!10272)) )
))
(declare-fun arrayNoDuplicates!0 (array!33531 (_ BitVec 32) List!10272) Bool)

(assert (=> b!529292 (= res!325181 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10269))))

(declare-fun b!529293 () Bool)

(assert (=> b!529293 (= e!308411 e!308408)))

(declare-fun res!325185 () Bool)

(assert (=> b!529293 (=> (not res!325185) (not e!308408))))

(declare-fun lt!244010 () SeekEntryResult!4581)

(assert (=> b!529293 (= res!325185 (or (= lt!244010 (MissingZero!4581 i!1204)) (= lt!244010 (MissingVacant!4581 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33531 (_ BitVec 32)) SeekEntryResult!4581)

(assert (=> b!529293 (= lt!244010 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529294 () Bool)

(declare-fun res!325186 () Bool)

(assert (=> b!529294 (=> (not res!325186) (not e!308411))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529294 (= res!325186 (validKeyInArray!0 (select (arr!16114 a!3235) j!176)))))

(declare-fun b!529295 () Bool)

(declare-fun res!325180 () Bool)

(assert (=> b!529295 (=> (not res!325180) (not e!308408))))

(assert (=> b!529295 (= res!325180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529296 () Bool)

(assert (=> b!529296 (= e!308412 (= (seekEntryOrOpen!0 (select (arr!16114 a!3235) j!176) a!3235 mask!3524) (Found!4581 j!176)))))

(declare-fun b!529297 () Bool)

(declare-fun lt!244015 () Bool)

(assert (=> b!529297 (= e!308410 (or (and (not lt!244015) (undefined!5393 lt!244014)) (and (not lt!244015) (not (undefined!5393 lt!244014)))))))

(get-info :version)

(assert (=> b!529297 (= lt!244015 (not ((_ is Intermediate!4581) lt!244014)))))

(declare-fun b!529298 () Bool)

(declare-fun res!325183 () Bool)

(assert (=> b!529298 (=> (not res!325183) (not e!308411))))

(assert (=> b!529298 (= res!325183 (validKeyInArray!0 k0!2280))))

(declare-fun b!529289 () Bool)

(declare-fun res!325179 () Bool)

(assert (=> b!529289 (=> (not res!325179) (not e!308411))))

(assert (=> b!529289 (= res!325179 (and (= (size!16478 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16478 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16478 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!325178 () Bool)

(assert (=> start!48038 (=> (not res!325178) (not e!308411))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48038 (= res!325178 (validMask!0 mask!3524))))

(assert (=> start!48038 e!308411))

(assert (=> start!48038 true))

(declare-fun array_inv!11910 (array!33531) Bool)

(assert (=> start!48038 (array_inv!11910 a!3235)))

(assert (= (and start!48038 res!325178) b!529289))

(assert (= (and b!529289 res!325179) b!529294))

(assert (= (and b!529294 res!325186) b!529298))

(assert (= (and b!529298 res!325183) b!529290))

(assert (= (and b!529290 res!325184) b!529293))

(assert (= (and b!529293 res!325185) b!529295))

(assert (= (and b!529295 res!325180) b!529292))

(assert (= (and b!529292 res!325181) b!529291))

(assert (= (and b!529291 res!325187) b!529296))

(assert (= (and b!529291 (not res!325182)) b!529297))

(declare-fun m!509841 () Bool)

(assert (=> start!48038 m!509841))

(declare-fun m!509843 () Bool)

(assert (=> start!48038 m!509843))

(declare-fun m!509845 () Bool)

(assert (=> b!529296 m!509845))

(assert (=> b!529296 m!509845))

(declare-fun m!509847 () Bool)

(assert (=> b!529296 m!509847))

(declare-fun m!509849 () Bool)

(assert (=> b!529291 m!509849))

(declare-fun m!509851 () Bool)

(assert (=> b!529291 m!509851))

(declare-fun m!509853 () Bool)

(assert (=> b!529291 m!509853))

(assert (=> b!529291 m!509845))

(declare-fun m!509855 () Bool)

(assert (=> b!529291 m!509855))

(assert (=> b!529291 m!509845))

(declare-fun m!509857 () Bool)

(assert (=> b!529291 m!509857))

(assert (=> b!529291 m!509845))

(assert (=> b!529291 m!509853))

(declare-fun m!509859 () Bool)

(assert (=> b!529291 m!509859))

(declare-fun m!509861 () Bool)

(assert (=> b!529291 m!509861))

(assert (=> b!529291 m!509853))

(declare-fun m!509863 () Bool)

(assert (=> b!529291 m!509863))

(declare-fun m!509865 () Bool)

(assert (=> b!529298 m!509865))

(declare-fun m!509867 () Bool)

(assert (=> b!529292 m!509867))

(declare-fun m!509869 () Bool)

(assert (=> b!529290 m!509869))

(assert (=> b!529294 m!509845))

(assert (=> b!529294 m!509845))

(declare-fun m!509871 () Bool)

(assert (=> b!529294 m!509871))

(declare-fun m!509873 () Bool)

(assert (=> b!529293 m!509873))

(declare-fun m!509875 () Bool)

(assert (=> b!529295 m!509875))

(check-sat (not b!529298) (not b!529294) (not b!529292) (not b!529296) (not b!529291) (not b!529295) (not b!529290) (not start!48038) (not b!529293))
(check-sat)
(get-model)

(declare-fun d!81017 () Bool)

(assert (=> d!81017 (= (validKeyInArray!0 (select (arr!16114 a!3235) j!176)) (and (not (= (select (arr!16114 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16114 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529294 d!81017))

(declare-fun b!529342 () Bool)

(declare-fun e!308434 () SeekEntryResult!4581)

(assert (=> b!529342 (= e!308434 Undefined!4581)))

(declare-fun b!529343 () Bool)

(declare-fun e!308435 () SeekEntryResult!4581)

(assert (=> b!529343 (= e!308434 e!308435)))

(declare-fun lt!244040 () (_ BitVec 64))

(declare-fun lt!244041 () SeekEntryResult!4581)

(assert (=> b!529343 (= lt!244040 (select (arr!16114 a!3235) (index!20550 lt!244041)))))

(declare-fun c!62370 () Bool)

(assert (=> b!529343 (= c!62370 (= lt!244040 k0!2280))))

(declare-fun e!308436 () SeekEntryResult!4581)

(declare-fun b!529344 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33531 (_ BitVec 32)) SeekEntryResult!4581)

(assert (=> b!529344 (= e!308436 (seekKeyOrZeroReturnVacant!0 (x!49517 lt!244041) (index!20550 lt!244041) (index!20550 lt!244041) k0!2280 a!3235 mask!3524))))

(declare-fun b!529345 () Bool)

(assert (=> b!529345 (= e!308435 (Found!4581 (index!20550 lt!244041)))))

(declare-fun b!529346 () Bool)

(declare-fun c!62372 () Bool)

(assert (=> b!529346 (= c!62372 (= lt!244040 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529346 (= e!308435 e!308436)))

(declare-fun b!529341 () Bool)

(assert (=> b!529341 (= e!308436 (MissingZero!4581 (index!20550 lt!244041)))))

(declare-fun d!81019 () Bool)

(declare-fun lt!244042 () SeekEntryResult!4581)

(assert (=> d!81019 (and (or ((_ is Undefined!4581) lt!244042) (not ((_ is Found!4581) lt!244042)) (and (bvsge (index!20549 lt!244042) #b00000000000000000000000000000000) (bvslt (index!20549 lt!244042) (size!16478 a!3235)))) (or ((_ is Undefined!4581) lt!244042) ((_ is Found!4581) lt!244042) (not ((_ is MissingZero!4581) lt!244042)) (and (bvsge (index!20548 lt!244042) #b00000000000000000000000000000000) (bvslt (index!20548 lt!244042) (size!16478 a!3235)))) (or ((_ is Undefined!4581) lt!244042) ((_ is Found!4581) lt!244042) ((_ is MissingZero!4581) lt!244042) (not ((_ is MissingVacant!4581) lt!244042)) (and (bvsge (index!20551 lt!244042) #b00000000000000000000000000000000) (bvslt (index!20551 lt!244042) (size!16478 a!3235)))) (or ((_ is Undefined!4581) lt!244042) (ite ((_ is Found!4581) lt!244042) (= (select (arr!16114 a!3235) (index!20549 lt!244042)) k0!2280) (ite ((_ is MissingZero!4581) lt!244042) (= (select (arr!16114 a!3235) (index!20548 lt!244042)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4581) lt!244042) (= (select (arr!16114 a!3235) (index!20551 lt!244042)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81019 (= lt!244042 e!308434)))

(declare-fun c!62371 () Bool)

(assert (=> d!81019 (= c!62371 (and ((_ is Intermediate!4581) lt!244041) (undefined!5393 lt!244041)))))

(assert (=> d!81019 (= lt!244041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!81019 (validMask!0 mask!3524)))

(assert (=> d!81019 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!244042)))

(assert (= (and d!81019 c!62371) b!529342))

(assert (= (and d!81019 (not c!62371)) b!529343))

(assert (= (and b!529343 c!62370) b!529345))

(assert (= (and b!529343 (not c!62370)) b!529346))

(assert (= (and b!529346 c!62372) b!529341))

(assert (= (and b!529346 (not c!62372)) b!529344))

(declare-fun m!509913 () Bool)

(assert (=> b!529343 m!509913))

(declare-fun m!509915 () Bool)

(assert (=> b!529344 m!509915))

(declare-fun m!509917 () Bool)

(assert (=> d!81019 m!509917))

(declare-fun m!509919 () Bool)

(assert (=> d!81019 m!509919))

(declare-fun m!509921 () Bool)

(assert (=> d!81019 m!509921))

(declare-fun m!509923 () Bool)

(assert (=> d!81019 m!509923))

(assert (=> d!81019 m!509841))

(assert (=> d!81019 m!509921))

(declare-fun m!509925 () Bool)

(assert (=> d!81019 m!509925))

(assert (=> b!529293 d!81019))

(declare-fun d!81021 () Bool)

(declare-fun res!325222 () Bool)

(declare-fun e!308441 () Bool)

(assert (=> d!81021 (=> res!325222 e!308441)))

(assert (=> d!81021 (= res!325222 (= (select (arr!16114 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!81021 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!308441)))

(declare-fun b!529351 () Bool)

(declare-fun e!308442 () Bool)

(assert (=> b!529351 (= e!308441 e!308442)))

(declare-fun res!325223 () Bool)

(assert (=> b!529351 (=> (not res!325223) (not e!308442))))

(assert (=> b!529351 (= res!325223 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16478 a!3235)))))

(declare-fun b!529352 () Bool)

(assert (=> b!529352 (= e!308442 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81021 (not res!325222)) b!529351))

(assert (= (and b!529351 res!325223) b!529352))

(declare-fun m!509927 () Bool)

(assert (=> d!81021 m!509927))

(declare-fun m!509929 () Bool)

(assert (=> b!529352 m!509929))

(assert (=> b!529290 d!81021))

(declare-fun b!529373 () Bool)

(declare-fun e!308460 () Bool)

(declare-fun e!308459 () Bool)

(assert (=> b!529373 (= e!308460 e!308459)))

(declare-fun lt!244058 () (_ BitVec 64))

(assert (=> b!529373 (= lt!244058 (select (arr!16114 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!244059 () Unit!16774)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33531 (_ BitVec 64) (_ BitVec 32)) Unit!16774)

(assert (=> b!529373 (= lt!244059 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244058 #b00000000000000000000000000000000))))

(assert (=> b!529373 (arrayContainsKey!0 a!3235 lt!244058 #b00000000000000000000000000000000)))

(declare-fun lt!244060 () Unit!16774)

(assert (=> b!529373 (= lt!244060 lt!244059)))

(declare-fun res!325234 () Bool)

(assert (=> b!529373 (= res!325234 (= (seekEntryOrOpen!0 (select (arr!16114 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4581 #b00000000000000000000000000000000)))))

(assert (=> b!529373 (=> (not res!325234) (not e!308459))))

(declare-fun b!529374 () Bool)

(declare-fun e!308458 () Bool)

(assert (=> b!529374 (= e!308458 e!308460)))

(declare-fun c!62378 () Bool)

(assert (=> b!529374 (= c!62378 (validKeyInArray!0 (select (arr!16114 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!81025 () Bool)

(declare-fun res!325235 () Bool)

(assert (=> d!81025 (=> res!325235 e!308458)))

(assert (=> d!81025 (= res!325235 (bvsge #b00000000000000000000000000000000 (size!16478 a!3235)))))

(assert (=> d!81025 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!308458)))

(declare-fun b!529375 () Bool)

(declare-fun call!31919 () Bool)

(assert (=> b!529375 (= e!308459 call!31919)))

(declare-fun b!529376 () Bool)

(assert (=> b!529376 (= e!308460 call!31919)))

(declare-fun bm!31916 () Bool)

(assert (=> bm!31916 (= call!31919 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!81025 (not res!325235)) b!529374))

(assert (= (and b!529374 c!62378) b!529373))

(assert (= (and b!529374 (not c!62378)) b!529376))

(assert (= (and b!529373 res!325234) b!529375))

(assert (= (or b!529375 b!529376) bm!31916))

(assert (=> b!529373 m!509927))

(declare-fun m!509937 () Bool)

(assert (=> b!529373 m!509937))

(declare-fun m!509939 () Bool)

(assert (=> b!529373 m!509939))

(assert (=> b!529373 m!509927))

(declare-fun m!509945 () Bool)

(assert (=> b!529373 m!509945))

(assert (=> b!529374 m!509927))

(assert (=> b!529374 m!509927))

(declare-fun m!509949 () Bool)

(assert (=> b!529374 m!509949))

(declare-fun m!509951 () Bool)

(assert (=> bm!31916 m!509951))

(assert (=> b!529295 d!81025))

(declare-fun d!81033 () Bool)

(declare-fun lt!244066 () (_ BitVec 32))

(declare-fun lt!244065 () (_ BitVec 32))

(assert (=> d!81033 (= lt!244066 (bvmul (bvxor lt!244065 (bvlshr lt!244065 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81033 (= lt!244065 ((_ extract 31 0) (bvand (bvxor (select (arr!16114 a!3235) j!176) (bvlshr (select (arr!16114 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81033 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325236 (let ((h!11207 ((_ extract 31 0) (bvand (bvxor (select (arr!16114 a!3235) j!176) (bvlshr (select (arr!16114 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49519 (bvmul (bvxor h!11207 (bvlshr h!11207 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49519 (bvlshr x!49519 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325236 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325236 #b00000000000000000000000000000000))))))

(assert (=> d!81033 (= (toIndex!0 (select (arr!16114 a!3235) j!176) mask!3524) (bvand (bvxor lt!244066 (bvlshr lt!244066 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529291 d!81033))

(declare-fun b!529383 () Bool)

(declare-fun e!308469 () Bool)

(declare-fun e!308468 () Bool)

(assert (=> b!529383 (= e!308469 e!308468)))

(declare-fun lt!244067 () (_ BitVec 64))

(assert (=> b!529383 (= lt!244067 (select (arr!16114 a!3235) j!176))))

(declare-fun lt!244068 () Unit!16774)

(assert (=> b!529383 (= lt!244068 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244067 j!176))))

(assert (=> b!529383 (arrayContainsKey!0 a!3235 lt!244067 #b00000000000000000000000000000000)))

(declare-fun lt!244069 () Unit!16774)

(assert (=> b!529383 (= lt!244069 lt!244068)))

(declare-fun res!325243 () Bool)

(assert (=> b!529383 (= res!325243 (= (seekEntryOrOpen!0 (select (arr!16114 a!3235) j!176) a!3235 mask!3524) (Found!4581 j!176)))))

(assert (=> b!529383 (=> (not res!325243) (not e!308468))))

(declare-fun b!529384 () Bool)

(declare-fun e!308467 () Bool)

(assert (=> b!529384 (= e!308467 e!308469)))

(declare-fun c!62379 () Bool)

(assert (=> b!529384 (= c!62379 (validKeyInArray!0 (select (arr!16114 a!3235) j!176)))))

(declare-fun d!81041 () Bool)

(declare-fun res!325244 () Bool)

(assert (=> d!81041 (=> res!325244 e!308467)))

(assert (=> d!81041 (= res!325244 (bvsge j!176 (size!16478 a!3235)))))

(assert (=> d!81041 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!308467)))

(declare-fun b!529385 () Bool)

(declare-fun call!31920 () Bool)

(assert (=> b!529385 (= e!308468 call!31920)))

(declare-fun b!529386 () Bool)

(assert (=> b!529386 (= e!308469 call!31920)))

(declare-fun bm!31917 () Bool)

(assert (=> bm!31917 (= call!31920 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!81041 (not res!325244)) b!529384))

(assert (= (and b!529384 c!62379) b!529383))

(assert (= (and b!529384 (not c!62379)) b!529386))

(assert (= (and b!529383 res!325243) b!529385))

(assert (= (or b!529385 b!529386) bm!31917))

(assert (=> b!529383 m!509845))

(declare-fun m!509955 () Bool)

(assert (=> b!529383 m!509955))

(declare-fun m!509957 () Bool)

(assert (=> b!529383 m!509957))

(assert (=> b!529383 m!509845))

(assert (=> b!529383 m!509847))

(assert (=> b!529384 m!509845))

(assert (=> b!529384 m!509845))

(assert (=> b!529384 m!509871))

(declare-fun m!509959 () Bool)

(assert (=> bm!31917 m!509959))

(assert (=> b!529291 d!81041))

(declare-fun b!529423 () Bool)

(declare-fun e!308489 () SeekEntryResult!4581)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529423 (= e!308489 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!244013 #b00000000000000000000000000000000 mask!3524) (select (arr!16114 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529424 () Bool)

(declare-fun lt!244090 () SeekEntryResult!4581)

(assert (=> b!529424 (and (bvsge (index!20550 lt!244090) #b00000000000000000000000000000000) (bvslt (index!20550 lt!244090) (size!16478 a!3235)))))

(declare-fun res!325252 () Bool)

(assert (=> b!529424 (= res!325252 (= (select (arr!16114 a!3235) (index!20550 lt!244090)) (select (arr!16114 a!3235) j!176)))))

(declare-fun e!308490 () Bool)

(assert (=> b!529424 (=> res!325252 e!308490)))

(declare-fun e!308491 () Bool)

(assert (=> b!529424 (= e!308491 e!308490)))

(declare-fun b!529425 () Bool)

(declare-fun e!308493 () SeekEntryResult!4581)

(assert (=> b!529425 (= e!308493 e!308489)))

(declare-fun lt!244089 () (_ BitVec 64))

(declare-fun c!62397 () Bool)

(assert (=> b!529425 (= c!62397 (or (= lt!244089 (select (arr!16114 a!3235) j!176)) (= (bvadd lt!244089 lt!244089) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529426 () Bool)

(assert (=> b!529426 (and (bvsge (index!20550 lt!244090) #b00000000000000000000000000000000) (bvslt (index!20550 lt!244090) (size!16478 a!3235)))))

(declare-fun res!325253 () Bool)

(assert (=> b!529426 (= res!325253 (= (select (arr!16114 a!3235) (index!20550 lt!244090)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529426 (=> res!325253 e!308490)))

(declare-fun b!529427 () Bool)

(declare-fun e!308492 () Bool)

(assert (=> b!529427 (= e!308492 e!308491)))

(declare-fun res!325254 () Bool)

(assert (=> b!529427 (= res!325254 (and ((_ is Intermediate!4581) lt!244090) (not (undefined!5393 lt!244090)) (bvslt (x!49517 lt!244090) #b01111111111111111111111111111110) (bvsge (x!49517 lt!244090) #b00000000000000000000000000000000) (bvsge (x!49517 lt!244090) #b00000000000000000000000000000000)))))

(assert (=> b!529427 (=> (not res!325254) (not e!308491))))

(declare-fun b!529428 () Bool)

(assert (=> b!529428 (and (bvsge (index!20550 lt!244090) #b00000000000000000000000000000000) (bvslt (index!20550 lt!244090) (size!16478 a!3235)))))

(assert (=> b!529428 (= e!308490 (= (select (arr!16114 a!3235) (index!20550 lt!244090)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529430 () Bool)

(assert (=> b!529430 (= e!308493 (Intermediate!4581 true lt!244013 #b00000000000000000000000000000000))))

(declare-fun b!529431 () Bool)

(assert (=> b!529431 (= e!308492 (bvsge (x!49517 lt!244090) #b01111111111111111111111111111110))))

(declare-fun b!529429 () Bool)

(assert (=> b!529429 (= e!308489 (Intermediate!4581 false lt!244013 #b00000000000000000000000000000000))))

(declare-fun d!81043 () Bool)

(assert (=> d!81043 e!308492))

(declare-fun c!62396 () Bool)

(assert (=> d!81043 (= c!62396 (and ((_ is Intermediate!4581) lt!244090) (undefined!5393 lt!244090)))))

(assert (=> d!81043 (= lt!244090 e!308493)))

(declare-fun c!62395 () Bool)

(assert (=> d!81043 (= c!62395 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81043 (= lt!244089 (select (arr!16114 a!3235) lt!244013))))

(assert (=> d!81043 (validMask!0 mask!3524)))

(assert (=> d!81043 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244013 (select (arr!16114 a!3235) j!176) a!3235 mask!3524) lt!244090)))

(assert (= (and d!81043 c!62395) b!529430))

(assert (= (and d!81043 (not c!62395)) b!529425))

(assert (= (and b!529425 c!62397) b!529429))

(assert (= (and b!529425 (not c!62397)) b!529423))

(assert (= (and d!81043 c!62396) b!529431))

(assert (= (and d!81043 (not c!62396)) b!529427))

(assert (= (and b!529427 res!325254) b!529424))

(assert (= (and b!529424 (not res!325252)) b!529426))

(assert (= (and b!529426 (not res!325253)) b!529428))

(declare-fun m!509975 () Bool)

(assert (=> b!529426 m!509975))

(declare-fun m!509977 () Bool)

(assert (=> d!81043 m!509977))

(assert (=> d!81043 m!509841))

(assert (=> b!529424 m!509975))

(declare-fun m!509979 () Bool)

(assert (=> b!529423 m!509979))

(assert (=> b!529423 m!509979))

(assert (=> b!529423 m!509845))

(declare-fun m!509981 () Bool)

(assert (=> b!529423 m!509981))

(assert (=> b!529428 m!509975))

(assert (=> b!529291 d!81043))

(declare-fun e!308494 () SeekEntryResult!4581)

(declare-fun b!529432 () Bool)

(assert (=> b!529432 (= e!308494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!244011 #b00000000000000000000000000000000 mask!3524) (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)) mask!3524))))

(declare-fun lt!244092 () SeekEntryResult!4581)

(declare-fun b!529433 () Bool)

(assert (=> b!529433 (and (bvsge (index!20550 lt!244092) #b00000000000000000000000000000000) (bvslt (index!20550 lt!244092) (size!16478 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)))))))

(declare-fun res!325255 () Bool)

(assert (=> b!529433 (= res!325255 (= (select (arr!16114 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235))) (index!20550 lt!244092)) (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!308495 () Bool)

(assert (=> b!529433 (=> res!325255 e!308495)))

(declare-fun e!308496 () Bool)

(assert (=> b!529433 (= e!308496 e!308495)))

(declare-fun b!529434 () Bool)

(declare-fun e!308498 () SeekEntryResult!4581)

(assert (=> b!529434 (= e!308498 e!308494)))

(declare-fun lt!244091 () (_ BitVec 64))

(declare-fun c!62400 () Bool)

(assert (=> b!529434 (= c!62400 (or (= lt!244091 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!244091 lt!244091) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529435 () Bool)

(assert (=> b!529435 (and (bvsge (index!20550 lt!244092) #b00000000000000000000000000000000) (bvslt (index!20550 lt!244092) (size!16478 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)))))))

(declare-fun res!325256 () Bool)

(assert (=> b!529435 (= res!325256 (= (select (arr!16114 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235))) (index!20550 lt!244092)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529435 (=> res!325256 e!308495)))

(declare-fun b!529436 () Bool)

(declare-fun e!308497 () Bool)

(assert (=> b!529436 (= e!308497 e!308496)))

(declare-fun res!325257 () Bool)

(assert (=> b!529436 (= res!325257 (and ((_ is Intermediate!4581) lt!244092) (not (undefined!5393 lt!244092)) (bvslt (x!49517 lt!244092) #b01111111111111111111111111111110) (bvsge (x!49517 lt!244092) #b00000000000000000000000000000000) (bvsge (x!49517 lt!244092) #b00000000000000000000000000000000)))))

(assert (=> b!529436 (=> (not res!325257) (not e!308496))))

(declare-fun b!529437 () Bool)

(assert (=> b!529437 (and (bvsge (index!20550 lt!244092) #b00000000000000000000000000000000) (bvslt (index!20550 lt!244092) (size!16478 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)))))))

(assert (=> b!529437 (= e!308495 (= (select (arr!16114 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235))) (index!20550 lt!244092)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529439 () Bool)

(assert (=> b!529439 (= e!308498 (Intermediate!4581 true lt!244011 #b00000000000000000000000000000000))))

(declare-fun b!529440 () Bool)

(assert (=> b!529440 (= e!308497 (bvsge (x!49517 lt!244092) #b01111111111111111111111111111110))))

(declare-fun b!529438 () Bool)

(assert (=> b!529438 (= e!308494 (Intermediate!4581 false lt!244011 #b00000000000000000000000000000000))))

(declare-fun d!81053 () Bool)

(assert (=> d!81053 e!308497))

(declare-fun c!62399 () Bool)

(assert (=> d!81053 (= c!62399 (and ((_ is Intermediate!4581) lt!244092) (undefined!5393 lt!244092)))))

(assert (=> d!81053 (= lt!244092 e!308498)))

(declare-fun c!62398 () Bool)

(assert (=> d!81053 (= c!62398 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81053 (= lt!244091 (select (arr!16114 (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235))) lt!244011))))

(assert (=> d!81053 (validMask!0 mask!3524)))

(assert (=> d!81053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244011 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) (array!33532 (store (arr!16114 a!3235) i!1204 k0!2280) (size!16478 a!3235)) mask!3524) lt!244092)))

(assert (= (and d!81053 c!62398) b!529439))

(assert (= (and d!81053 (not c!62398)) b!529434))

(assert (= (and b!529434 c!62400) b!529438))

(assert (= (and b!529434 (not c!62400)) b!529432))

(assert (= (and d!81053 c!62399) b!529440))

(assert (= (and d!81053 (not c!62399)) b!529436))

(assert (= (and b!529436 res!325257) b!529433))

(assert (= (and b!529433 (not res!325255)) b!529435))

(assert (= (and b!529435 (not res!325256)) b!529437))

(declare-fun m!509983 () Bool)

(assert (=> b!529435 m!509983))

(declare-fun m!509985 () Bool)

(assert (=> d!81053 m!509985))

(assert (=> d!81053 m!509841))

(assert (=> b!529433 m!509983))

(declare-fun m!509987 () Bool)

(assert (=> b!529432 m!509987))

(assert (=> b!529432 m!509987))

(assert (=> b!529432 m!509853))

(declare-fun m!509989 () Bool)

(assert (=> b!529432 m!509989))

(assert (=> b!529437 m!509983))

(assert (=> b!529291 d!81053))

(declare-fun d!81055 () Bool)

(assert (=> d!81055 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!244099 () Unit!16774)

(declare-fun choose!38 (array!33531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16774)

(assert (=> d!81055 (= lt!244099 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!81055 (validMask!0 mask!3524)))

(assert (=> d!81055 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!244099)))

(declare-fun bs!16573 () Bool)

(assert (= bs!16573 d!81055))

(assert (=> bs!16573 m!509861))

(declare-fun m!509995 () Bool)

(assert (=> bs!16573 m!509995))

(assert (=> bs!16573 m!509841))

(assert (=> b!529291 d!81055))

(declare-fun d!81059 () Bool)

(declare-fun lt!244101 () (_ BitVec 32))

(declare-fun lt!244100 () (_ BitVec 32))

(assert (=> d!81059 (= lt!244101 (bvmul (bvxor lt!244100 (bvlshr lt!244100 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81059 (= lt!244100 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81059 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325236 (let ((h!11207 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49519 (bvmul (bvxor h!11207 (bvlshr h!11207 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49519 (bvlshr x!49519 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325236 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325236 #b00000000000000000000000000000000))))))

(assert (=> d!81059 (= (toIndex!0 (select (store (arr!16114 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!244101 (bvlshr lt!244101 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529291 d!81059))

(declare-fun b!529475 () Bool)

(declare-fun e!308521 () SeekEntryResult!4581)

(assert (=> b!529475 (= e!308521 Undefined!4581)))

(declare-fun b!529476 () Bool)

(declare-fun e!308522 () SeekEntryResult!4581)

(assert (=> b!529476 (= e!308521 e!308522)))

(declare-fun lt!244102 () (_ BitVec 64))

(declare-fun lt!244103 () SeekEntryResult!4581)

(assert (=> b!529476 (= lt!244102 (select (arr!16114 a!3235) (index!20550 lt!244103)))))

(declare-fun c!62410 () Bool)

(assert (=> b!529476 (= c!62410 (= lt!244102 (select (arr!16114 a!3235) j!176)))))

(declare-fun e!308523 () SeekEntryResult!4581)

(declare-fun b!529477 () Bool)

(assert (=> b!529477 (= e!308523 (seekKeyOrZeroReturnVacant!0 (x!49517 lt!244103) (index!20550 lt!244103) (index!20550 lt!244103) (select (arr!16114 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529478 () Bool)

(assert (=> b!529478 (= e!308522 (Found!4581 (index!20550 lt!244103)))))

(declare-fun b!529479 () Bool)

(declare-fun c!62412 () Bool)

(assert (=> b!529479 (= c!62412 (= lt!244102 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529479 (= e!308522 e!308523)))

(declare-fun b!529474 () Bool)

(assert (=> b!529474 (= e!308523 (MissingZero!4581 (index!20550 lt!244103)))))

(declare-fun d!81061 () Bool)

(declare-fun lt!244104 () SeekEntryResult!4581)

(assert (=> d!81061 (and (or ((_ is Undefined!4581) lt!244104) (not ((_ is Found!4581) lt!244104)) (and (bvsge (index!20549 lt!244104) #b00000000000000000000000000000000) (bvslt (index!20549 lt!244104) (size!16478 a!3235)))) (or ((_ is Undefined!4581) lt!244104) ((_ is Found!4581) lt!244104) (not ((_ is MissingZero!4581) lt!244104)) (and (bvsge (index!20548 lt!244104) #b00000000000000000000000000000000) (bvslt (index!20548 lt!244104) (size!16478 a!3235)))) (or ((_ is Undefined!4581) lt!244104) ((_ is Found!4581) lt!244104) ((_ is MissingZero!4581) lt!244104) (not ((_ is MissingVacant!4581) lt!244104)) (and (bvsge (index!20551 lt!244104) #b00000000000000000000000000000000) (bvslt (index!20551 lt!244104) (size!16478 a!3235)))) (or ((_ is Undefined!4581) lt!244104) (ite ((_ is Found!4581) lt!244104) (= (select (arr!16114 a!3235) (index!20549 lt!244104)) (select (arr!16114 a!3235) j!176)) (ite ((_ is MissingZero!4581) lt!244104) (= (select (arr!16114 a!3235) (index!20548 lt!244104)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4581) lt!244104) (= (select (arr!16114 a!3235) (index!20551 lt!244104)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81061 (= lt!244104 e!308521)))

(declare-fun c!62411 () Bool)

(assert (=> d!81061 (= c!62411 (and ((_ is Intermediate!4581) lt!244103) (undefined!5393 lt!244103)))))

(assert (=> d!81061 (= lt!244103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16114 a!3235) j!176) mask!3524) (select (arr!16114 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!81061 (validMask!0 mask!3524)))

(assert (=> d!81061 (= (seekEntryOrOpen!0 (select (arr!16114 a!3235) j!176) a!3235 mask!3524) lt!244104)))

(assert (= (and d!81061 c!62411) b!529475))

(assert (= (and d!81061 (not c!62411)) b!529476))

(assert (= (and b!529476 c!62410) b!529478))

(assert (= (and b!529476 (not c!62410)) b!529479))

(assert (= (and b!529479 c!62412) b!529474))

(assert (= (and b!529479 (not c!62412)) b!529477))

(declare-fun m!509997 () Bool)

(assert (=> b!529476 m!509997))

(assert (=> b!529477 m!509845))

(declare-fun m!509999 () Bool)

(assert (=> b!529477 m!509999))

(declare-fun m!510001 () Bool)

(assert (=> d!81061 m!510001))

(declare-fun m!510003 () Bool)

(assert (=> d!81061 m!510003))

(assert (=> d!81061 m!509845))

(assert (=> d!81061 m!509855))

(declare-fun m!510005 () Bool)

(assert (=> d!81061 m!510005))

(assert (=> d!81061 m!509841))

(assert (=> d!81061 m!509855))

(assert (=> d!81061 m!509845))

(declare-fun m!510007 () Bool)

(assert (=> d!81061 m!510007))

(assert (=> b!529296 d!81061))

(declare-fun d!81063 () Bool)

(assert (=> d!81063 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!48038 d!81063))

(declare-fun d!81079 () Bool)

(assert (=> d!81079 (= (array_inv!11910 a!3235) (bvsge (size!16478 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!48038 d!81079))

(declare-fun d!81081 () Bool)

(assert (=> d!81081 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529298 d!81081))

(declare-fun b!529526 () Bool)

(declare-fun e!308554 () Bool)

(declare-fun e!308556 () Bool)

(assert (=> b!529526 (= e!308554 e!308556)))

(declare-fun c!62427 () Bool)

(assert (=> b!529526 (= c!62427 (validKeyInArray!0 (select (arr!16114 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529527 () Bool)

(declare-fun e!308555 () Bool)

(declare-fun contains!2780 (List!10272 (_ BitVec 64)) Bool)

(assert (=> b!529527 (= e!308555 (contains!2780 Nil!10269 (select (arr!16114 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529528 () Bool)

(declare-fun call!31929 () Bool)

(assert (=> b!529528 (= e!308556 call!31929)))

(declare-fun d!81083 () Bool)

(declare-fun res!325294 () Bool)

(declare-fun e!308557 () Bool)

(assert (=> d!81083 (=> res!325294 e!308557)))

(assert (=> d!81083 (= res!325294 (bvsge #b00000000000000000000000000000000 (size!16478 a!3235)))))

(assert (=> d!81083 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10269) e!308557)))

(declare-fun b!529529 () Bool)

(assert (=> b!529529 (= e!308557 e!308554)))

(declare-fun res!325293 () Bool)

(assert (=> b!529529 (=> (not res!325293) (not e!308554))))

(assert (=> b!529529 (= res!325293 (not e!308555))))

(declare-fun res!325292 () Bool)

(assert (=> b!529529 (=> (not res!325292) (not e!308555))))

(assert (=> b!529529 (= res!325292 (validKeyInArray!0 (select (arr!16114 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31926 () Bool)

(assert (=> bm!31926 (= call!31929 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62427 (Cons!10268 (select (arr!16114 a!3235) #b00000000000000000000000000000000) Nil!10269) Nil!10269)))))

(declare-fun b!529530 () Bool)

(assert (=> b!529530 (= e!308556 call!31929)))

(assert (= (and d!81083 (not res!325294)) b!529529))

(assert (= (and b!529529 res!325292) b!529527))

(assert (= (and b!529529 res!325293) b!529526))

(assert (= (and b!529526 c!62427) b!529528))

(assert (= (and b!529526 (not c!62427)) b!529530))

(assert (= (or b!529528 b!529530) bm!31926))

(assert (=> b!529526 m!509927))

(assert (=> b!529526 m!509927))

(assert (=> b!529526 m!509949))

(assert (=> b!529527 m!509927))

(assert (=> b!529527 m!509927))

(declare-fun m!510045 () Bool)

(assert (=> b!529527 m!510045))

(assert (=> b!529529 m!509927))

(assert (=> b!529529 m!509927))

(assert (=> b!529529 m!509949))

(assert (=> bm!31926 m!509927))

(declare-fun m!510047 () Bool)

(assert (=> bm!31926 m!510047))

(assert (=> b!529292 d!81083))

(check-sat (not b!529374) (not b!529527) (not b!529423) (not d!81043) (not b!529477) (not bm!31916) (not d!81055) (not d!81061) (not b!529373) (not bm!31926) (not b!529352) (not bm!31917) (not b!529432) (not b!529529) (not d!81019) (not b!529383) (not d!81053) (not b!529526) (not b!529344) (not b!529384))
(check-sat)
