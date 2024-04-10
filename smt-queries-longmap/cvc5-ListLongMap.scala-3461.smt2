; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48036 () Bool)

(assert start!48036)

(declare-fun b!529259 () Bool)

(declare-fun res!325152 () Bool)

(declare-fun e!308393 () Bool)

(assert (=> b!529259 (=> (not res!325152) (not e!308393))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33529 0))(
  ( (array!33530 (arr!16113 (Array (_ BitVec 32) (_ BitVec 64))) (size!16477 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33529)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529259 (= res!325152 (and (= (size!16477 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16477 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16477 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529260 () Bool)

(declare-fun e!308396 () Bool)

(declare-fun e!308395 () Bool)

(assert (=> b!529260 (= e!308396 (not e!308395))))

(declare-fun res!325148 () Bool)

(assert (=> b!529260 (=> res!325148 e!308395)))

(declare-datatypes ((SeekEntryResult!4580 0))(
  ( (MissingZero!4580 (index!20544 (_ BitVec 32))) (Found!4580 (index!20545 (_ BitVec 32))) (Intermediate!4580 (undefined!5392 Bool) (index!20546 (_ BitVec 32)) (x!49516 (_ BitVec 32))) (Undefined!4580) (MissingVacant!4580 (index!20547 (_ BitVec 32))) )
))
(declare-fun lt!243994 () SeekEntryResult!4580)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun lt!243992 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33529 (_ BitVec 32)) SeekEntryResult!4580)

(assert (=> b!529260 (= res!325148 (= lt!243994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243992 (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235)) mask!3524)))))

(declare-fun lt!243996 () (_ BitVec 32))

(assert (=> b!529260 (= lt!243994 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243996 (select (arr!16113 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529260 (= lt!243992 (toIndex!0 (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!529260 (= lt!243996 (toIndex!0 (select (arr!16113 a!3235) j!176) mask!3524))))

(declare-fun e!308397 () Bool)

(assert (=> b!529260 e!308397))

(declare-fun res!325155 () Bool)

(assert (=> b!529260 (=> (not res!325155) (not e!308397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33529 (_ BitVec 32)) Bool)

(assert (=> b!529260 (= res!325155 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16772 0))(
  ( (Unit!16773) )
))
(declare-fun lt!243993 () Unit!16772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16772)

(assert (=> b!529260 (= lt!243993 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529261 () Bool)

(declare-fun res!325150 () Bool)

(assert (=> b!529261 (=> (not res!325150) (not e!308396))))

(declare-datatypes ((List!10271 0))(
  ( (Nil!10268) (Cons!10267 (h!11204 (_ BitVec 64)) (t!16499 List!10271)) )
))
(declare-fun arrayNoDuplicates!0 (array!33529 (_ BitVec 32) List!10271) Bool)

(assert (=> b!529261 (= res!325150 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10268))))

(declare-fun b!529262 () Bool)

(declare-fun res!325153 () Bool)

(assert (=> b!529262 (=> (not res!325153) (not e!308393))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529262 (= res!325153 (validKeyInArray!0 k!2280))))

(declare-fun b!529263 () Bool)

(assert (=> b!529263 (= e!308393 e!308396)))

(declare-fun res!325149 () Bool)

(assert (=> b!529263 (=> (not res!325149) (not e!308396))))

(declare-fun lt!243995 () SeekEntryResult!4580)

(assert (=> b!529263 (= res!325149 (or (= lt!243995 (MissingZero!4580 i!1204)) (= lt!243995 (MissingVacant!4580 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33529 (_ BitVec 32)) SeekEntryResult!4580)

(assert (=> b!529263 (= lt!243995 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529264 () Bool)

(declare-fun res!325151 () Bool)

(assert (=> b!529264 (=> (not res!325151) (not e!308393))))

(assert (=> b!529264 (= res!325151 (validKeyInArray!0 (select (arr!16113 a!3235) j!176)))))

(declare-fun res!325154 () Bool)

(assert (=> start!48036 (=> (not res!325154) (not e!308393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48036 (= res!325154 (validMask!0 mask!3524))))

(assert (=> start!48036 e!308393))

(assert (=> start!48036 true))

(declare-fun array_inv!11909 (array!33529) Bool)

(assert (=> start!48036 (array_inv!11909 a!3235)))

(declare-fun b!529265 () Bool)

(declare-fun res!325156 () Bool)

(assert (=> b!529265 (=> (not res!325156) (not e!308396))))

(assert (=> b!529265 (= res!325156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529266 () Bool)

(declare-fun lt!243997 () Bool)

(assert (=> b!529266 (= e!308395 (or (and (not lt!243997) (undefined!5392 lt!243994)) (and (not lt!243997) (not (undefined!5392 lt!243994)))))))

(assert (=> b!529266 (= lt!243997 (not (is-Intermediate!4580 lt!243994)))))

(declare-fun b!529267 () Bool)

(declare-fun res!325157 () Bool)

(assert (=> b!529267 (=> (not res!325157) (not e!308393))))

(declare-fun arrayContainsKey!0 (array!33529 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529267 (= res!325157 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529268 () Bool)

(assert (=> b!529268 (= e!308397 (= (seekEntryOrOpen!0 (select (arr!16113 a!3235) j!176) a!3235 mask!3524) (Found!4580 j!176)))))

(assert (= (and start!48036 res!325154) b!529259))

(assert (= (and b!529259 res!325152) b!529264))

(assert (= (and b!529264 res!325151) b!529262))

(assert (= (and b!529262 res!325153) b!529267))

(assert (= (and b!529267 res!325157) b!529263))

(assert (= (and b!529263 res!325149) b!529265))

(assert (= (and b!529265 res!325156) b!529261))

(assert (= (and b!529261 res!325150) b!529260))

(assert (= (and b!529260 res!325155) b!529268))

(assert (= (and b!529260 (not res!325148)) b!529266))

(declare-fun m!509805 () Bool)

(assert (=> b!529263 m!509805))

(declare-fun m!509807 () Bool)

(assert (=> b!529265 m!509807))

(declare-fun m!509809 () Bool)

(assert (=> b!529260 m!509809))

(declare-fun m!509811 () Bool)

(assert (=> b!529260 m!509811))

(declare-fun m!509813 () Bool)

(assert (=> b!529260 m!509813))

(declare-fun m!509815 () Bool)

(assert (=> b!529260 m!509815))

(assert (=> b!529260 m!509809))

(declare-fun m!509817 () Bool)

(assert (=> b!529260 m!509817))

(declare-fun m!509819 () Bool)

(assert (=> b!529260 m!509819))

(assert (=> b!529260 m!509817))

(declare-fun m!509821 () Bool)

(assert (=> b!529260 m!509821))

(assert (=> b!529260 m!509809))

(declare-fun m!509823 () Bool)

(assert (=> b!529260 m!509823))

(assert (=> b!529260 m!509817))

(declare-fun m!509825 () Bool)

(assert (=> b!529260 m!509825))

(assert (=> b!529268 m!509817))

(assert (=> b!529268 m!509817))

(declare-fun m!509827 () Bool)

(assert (=> b!529268 m!509827))

(assert (=> b!529264 m!509817))

(assert (=> b!529264 m!509817))

(declare-fun m!509829 () Bool)

(assert (=> b!529264 m!509829))

(declare-fun m!509831 () Bool)

(assert (=> start!48036 m!509831))

(declare-fun m!509833 () Bool)

(assert (=> start!48036 m!509833))

(declare-fun m!509835 () Bool)

(assert (=> b!529267 m!509835))

(declare-fun m!509837 () Bool)

(assert (=> b!529261 m!509837))

(declare-fun m!509839 () Bool)

(assert (=> b!529262 m!509839))

(push 1)

(assert (not b!529263))

(assert (not b!529265))

(assert (not b!529264))

(assert (not start!48036))

(assert (not b!529262))

(assert (not b!529261))

(assert (not b!529268))

(assert (not b!529260))

(assert (not b!529267))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81027 () Bool)

(assert (=> d!81027 (= (validKeyInArray!0 (select (arr!16113 a!3235) j!176)) (and (not (= (select (arr!16113 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16113 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529264 d!81027))

(declare-fun d!81029 () Bool)

(assert (=> d!81029 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!48036 d!81029))

(declare-fun d!81045 () Bool)

(assert (=> d!81045 (= (array_inv!11909 a!3235) (bvsge (size!16477 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!48036 d!81045))

(declare-fun d!81047 () Bool)

(declare-fun lt!244075 () (_ BitVec 32))

(declare-fun lt!244074 () (_ BitVec 32))

(assert (=> d!81047 (= lt!244075 (bvmul (bvxor lt!244074 (bvlshr lt!244074 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81047 (= lt!244074 ((_ extract 31 0) (bvand (bvxor (select (arr!16113 a!3235) j!176) (bvlshr (select (arr!16113 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81047 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325245 (let ((h!11208 ((_ extract 31 0) (bvand (bvxor (select (arr!16113 a!3235) j!176) (bvlshr (select (arr!16113 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49520 (bvmul (bvxor h!11208 (bvlshr h!11208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49520 (bvlshr x!49520 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325245 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325245 #b00000000000000000000000000000000))))))

(assert (=> d!81047 (= (toIndex!0 (select (arr!16113 a!3235) j!176) mask!3524) (bvand (bvxor lt!244075 (bvlshr lt!244075 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529260 d!81047))

(declare-fun lt!244106 () SeekEntryResult!4580)

(declare-fun b!529480 () Bool)

(assert (=> b!529480 (and (bvsge (index!20546 lt!244106) #b00000000000000000000000000000000) (bvslt (index!20546 lt!244106) (size!16477 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235)))))))

(declare-fun e!308524 () Bool)

(assert (=> b!529480 (= e!308524 (= (select (arr!16113 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235))) (index!20546 lt!244106)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529481 () Bool)

(declare-fun e!308525 () Bool)

(assert (=> b!529481 (= e!308525 (bvsge (x!49516 lt!244106) #b01111111111111111111111111111110))))

(declare-fun b!529482 () Bool)

(assert (=> b!529482 (and (bvsge (index!20546 lt!244106) #b00000000000000000000000000000000) (bvslt (index!20546 lt!244106) (size!16477 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235)))))))

(declare-fun res!325273 () Bool)

(assert (=> b!529482 (= res!325273 (= (select (arr!16113 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235))) (index!20546 lt!244106)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529482 (=> res!325273 e!308524)))

(declare-fun b!529483 () Bool)

(declare-fun e!308526 () SeekEntryResult!4580)

(assert (=> b!529483 (= e!308526 (Intermediate!4580 false lt!243992 #b00000000000000000000000000000000))))

(declare-fun b!529484 () Bool)

(declare-fun e!308527 () SeekEntryResult!4580)

(assert (=> b!529484 (= e!308527 (Intermediate!4580 true lt!243992 #b00000000000000000000000000000000))))

(declare-fun d!81049 () Bool)

(assert (=> d!81049 e!308525))

(declare-fun c!62415 () Bool)

(assert (=> d!81049 (= c!62415 (and (is-Intermediate!4580 lt!244106) (undefined!5392 lt!244106)))))

(assert (=> d!81049 (= lt!244106 e!308527)))

(declare-fun c!62414 () Bool)

(assert (=> d!81049 (= c!62414 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!244105 () (_ BitVec 64))

(assert (=> d!81049 (= lt!244105 (select (arr!16113 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235))) lt!243992))))

(assert (=> d!81049 (validMask!0 mask!3524)))

(assert (=> d!81049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243992 (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235)) mask!3524) lt!244106)))

(declare-fun b!529485 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529485 (= e!308526 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243992 #b00000000000000000000000000000000 mask!3524) (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235)) mask!3524))))

(declare-fun b!529486 () Bool)

(assert (=> b!529486 (= e!308527 e!308526)))

(declare-fun c!62413 () Bool)

(assert (=> b!529486 (= c!62413 (or (= lt!244105 (select (store (arr!16113 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!244105 lt!244105) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529487 () Bool)

(declare-fun e!308528 () Bool)

(assert (=> b!529487 (= e!308525 e!308528)))

(declare-fun res!325274 () Bool)

(assert (=> b!529487 (= res!325274 (and (is-Intermediate!4580 lt!244106) (not (undefined!5392 lt!244106)) (bvslt (x!49516 lt!244106) #b01111111111111111111111111111110) (bvsge (x!49516 lt!244106) #b00000000000000000000000000000000) (bvsge (x!49516 lt!244106) #b00000000000000000000000000000000)))))

(assert (=> b!529487 (=> (not res!325274) (not e!308528))))

(declare-fun b!529488 () Bool)

(assert (=> b!529488 (and (bvsge (index!20546 lt!244106) #b00000000000000000000000000000000) (bvslt (index!20546 lt!244106) (size!16477 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235)))))))

(declare-fun res!325275 () Bool)

(assert (=> b!529488 (= res!325275 (= (select (arr!16113 (array!33530 (store (arr!16113 a!3235) i!1204 k!2280) (size!16477 a!3235))) (index!20546 lt!244106)) (select (store (arr!16113 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!529488 (=> res!325275 e!308524)))

(assert (=> b!529488 (= e!308528 e!308524)))

(assert (= (and d!81049 c!62414) b!529484))

(assert (= (and d!81049 (not c!62414)) b!529486))

(assert (= (and b!529486 c!62413) b!529483))

(assert (= (and b!529486 (not c!62413)) b!529485))

(assert (= (and d!81049 c!62415) b!529481))

(assert (= (and d!81049 (not c!62415)) b!529487))

(assert (= (and b!529487 res!325274) b!529488))

(assert (= (and b!529488 (not res!325275)) b!529482))

(assert (= (and b!529482 (not res!325273)) b!529480))

(declare-fun m!510009 () Bool)

(assert (=> b!529482 m!510009))

(assert (=> b!529488 m!510009))

(declare-fun m!510011 () Bool)

(assert (=> d!81049 m!510011))

(assert (=> d!81049 m!509831))

(assert (=> b!529480 m!510009))

(declare-fun m!510013 () Bool)

(assert (=> b!529485 m!510013))

(assert (=> b!529485 m!510013))

(assert (=> b!529485 m!509809))

(declare-fun m!510015 () Bool)

(assert (=> b!529485 m!510015))

(assert (=> b!529260 d!81049))

(declare-fun d!81065 () Bool)

(assert (=> d!81065 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!244109 () Unit!16772)

(declare-fun choose!38 (array!33529 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16772)

(assert (=> d!81065 (= lt!244109 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!81065 (validMask!0 mask!3524)))

(assert (=> d!81065 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!244109)))

(declare-fun bs!16574 () Bool)

(assert (= bs!16574 d!81065))

(assert (=> bs!16574 m!509821))

(declare-fun m!510017 () Bool)

(assert (=> bs!16574 m!510017))

(assert (=> bs!16574 m!509831))

(assert (=> b!529260 d!81065))

(declare-fun d!81067 () Bool)

(declare-fun lt!244111 () (_ BitVec 32))

(declare-fun lt!244110 () (_ BitVec 32))

(assert (=> d!81067 (= lt!244111 (bvmul (bvxor lt!244110 (bvlshr lt!244110 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81067 (= lt!244110 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81067 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325245 (let ((h!11208 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49520 (bvmul (bvxor h!11208 (bvlshr h!11208 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49520 (bvlshr x!49520 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325245 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325245 #b00000000000000000000000000000000))))))

(assert (=> d!81067 (= (toIndex!0 (select (store (arr!16113 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!244111 (bvlshr lt!244111 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529260 d!81067))

(declare-fun b!529489 () Bool)

(declare-fun lt!244113 () SeekEntryResult!4580)

(assert (=> b!529489 (and (bvsge (index!20546 lt!244113) #b00000000000000000000000000000000) (bvslt (index!20546 lt!244113) (size!16477 a!3235)))))

(declare-fun e!308529 () Bool)

(assert (=> b!529489 (= e!308529 (= (select (arr!16113 a!3235) (index!20546 lt!244113)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529490 () Bool)

(declare-fun e!308530 () Bool)

(assert (=> b!529490 (= e!308530 (bvsge (x!49516 lt!244113) #b01111111111111111111111111111110))))

(declare-fun b!529491 () Bool)

(assert (=> b!529491 (and (bvsge (index!20546 lt!244113) #b00000000000000000000000000000000) (bvslt (index!20546 lt!244113) (size!16477 a!3235)))))

(declare-fun res!325276 () Bool)

(assert (=> b!529491 (= res!325276 (= (select (arr!16113 a!3235) (index!20546 lt!244113)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529491 (=> res!325276 e!308529)))

(declare-fun b!529492 () Bool)

(declare-fun e!308531 () SeekEntryResult!4580)

(assert (=> b!529492 (= e!308531 (Intermediate!4580 false lt!243996 #b00000000000000000000000000000000))))

(declare-fun b!529493 () Bool)

(declare-fun e!308532 () SeekEntryResult!4580)

(assert (=> b!529493 (= e!308532 (Intermediate!4580 true lt!243996 #b00000000000000000000000000000000))))

(declare-fun d!81071 () Bool)

(assert (=> d!81071 e!308530))

(declare-fun c!62418 () Bool)

(assert (=> d!81071 (= c!62418 (and (is-Intermediate!4580 lt!244113) (undefined!5392 lt!244113)))))

(assert (=> d!81071 (= lt!244113 e!308532)))

(declare-fun c!62417 () Bool)

(assert (=> d!81071 (= c!62417 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!244112 () (_ BitVec 64))

(assert (=> d!81071 (= lt!244112 (select (arr!16113 a!3235) lt!243996))))

(assert (=> d!81071 (validMask!0 mask!3524)))

(assert (=> d!81071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243996 (select (arr!16113 a!3235) j!176) a!3235 mask!3524) lt!244113)))

(declare-fun b!529494 () Bool)

(assert (=> b!529494 (= e!308531 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!243996 #b00000000000000000000000000000000 mask!3524) (select (arr!16113 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529495 () Bool)

(assert (=> b!529495 (= e!308532 e!308531)))

(declare-fun c!62416 () Bool)

(assert (=> b!529495 (= c!62416 (or (= lt!244112 (select (arr!16113 a!3235) j!176)) (= (bvadd lt!244112 lt!244112) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529496 () Bool)

(declare-fun e!308533 () Bool)

(assert (=> b!529496 (= e!308530 e!308533)))

(declare-fun res!325277 () Bool)

(assert (=> b!529496 (= res!325277 (and (is-Intermediate!4580 lt!244113) (not (undefined!5392 lt!244113)) (bvslt (x!49516 lt!244113) #b01111111111111111111111111111110) (bvsge (x!49516 lt!244113) #b00000000000000000000000000000000) (bvsge (x!49516 lt!244113) #b00000000000000000000000000000000)))))

(assert (=> b!529496 (=> (not res!325277) (not e!308533))))

(declare-fun b!529497 () Bool)

(assert (=> b!529497 (and (bvsge (index!20546 lt!244113) #b00000000000000000000000000000000) (bvslt (index!20546 lt!244113) (size!16477 a!3235)))))

(declare-fun res!325278 () Bool)

(assert (=> b!529497 (= res!325278 (= (select (arr!16113 a!3235) (index!20546 lt!244113)) (select (arr!16113 a!3235) j!176)))))

(assert (=> b!529497 (=> res!325278 e!308529)))

(assert (=> b!529497 (= e!308533 e!308529)))

(assert (= (and d!81071 c!62417) b!529493))

(assert (= (and d!81071 (not c!62417)) b!529495))

(assert (= (and b!529495 c!62416) b!529492))

(assert (= (and b!529495 (not c!62416)) b!529494))

(assert (= (and d!81071 c!62418) b!529490))

(assert (= (and d!81071 (not c!62418)) b!529496))

(assert (= (and b!529496 res!325277) b!529497))

(assert (= (and b!529497 (not res!325278)) b!529491))

(assert (= (and b!529491 (not res!325276)) b!529489))

(declare-fun m!510019 () Bool)

(assert (=> b!529491 m!510019))

(assert (=> b!529497 m!510019))

(declare-fun m!510021 () Bool)

(assert (=> d!81071 m!510021))

(assert (=> d!81071 m!509831))

(assert (=> b!529489 m!510019))

(declare-fun m!510023 () Bool)

(assert (=> b!529494 m!510023))

(assert (=> b!529494 m!510023))

(assert (=> b!529494 m!509817))

(declare-fun m!510025 () Bool)

(assert (=> b!529494 m!510025))

(assert (=> b!529260 d!81071))

(declare-fun b!529531 () Bool)

(declare-fun e!308560 () Bool)

(declare-fun e!308558 () Bool)

(assert (=> b!529531 (= e!308560 e!308558)))

(declare-fun c!62428 () Bool)

(assert (=> b!529531 (= c!62428 (validKeyInArray!0 (select (arr!16113 a!3235) j!176)))))

(declare-fun b!529532 () Bool)

(declare-fun call!31930 () Bool)

(assert (=> b!529532 (= e!308558 call!31930)))

(declare-fun bm!31927 () Bool)

(assert (=> bm!31927 (= call!31930 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!529534 () Bool)

(declare-fun e!308559 () Bool)

(assert (=> b!529534 (= e!308559 call!31930)))

(declare-fun b!529533 () Bool)

(assert (=> b!529533 (= e!308558 e!308559)))

(declare-fun lt!244134 () (_ BitVec 64))

(assert (=> b!529533 (= lt!244134 (select (arr!16113 a!3235) j!176))))

(declare-fun lt!244132 () Unit!16772)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33529 (_ BitVec 64) (_ BitVec 32)) Unit!16772)

(assert (=> b!529533 (= lt!244132 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244134 j!176))))

(assert (=> b!529533 (arrayContainsKey!0 a!3235 lt!244134 #b00000000000000000000000000000000)))

(declare-fun lt!244133 () Unit!16772)

(assert (=> b!529533 (= lt!244133 lt!244132)))

(declare-fun res!325295 () Bool)

(assert (=> b!529533 (= res!325295 (= (seekEntryOrOpen!0 (select (arr!16113 a!3235) j!176) a!3235 mask!3524) (Found!4580 j!176)))))

(assert (=> b!529533 (=> (not res!325295) (not e!308559))))

(declare-fun d!81075 () Bool)

(declare-fun res!325296 () Bool)

(assert (=> d!81075 (=> res!325296 e!308560)))

(assert (=> d!81075 (= res!325296 (bvsge j!176 (size!16477 a!3235)))))

(assert (=> d!81075 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!308560)))

(assert (= (and d!81075 (not res!325296)) b!529531))

(assert (= (and b!529531 c!62428) b!529533))

(assert (= (and b!529531 (not c!62428)) b!529532))

(assert (= (and b!529533 res!325295) b!529534))

(assert (= (or b!529534 b!529532) bm!31927))

(assert (=> b!529531 m!509817))

(assert (=> b!529531 m!509817))

(assert (=> b!529531 m!509829))

(declare-fun m!510049 () Bool)

(assert (=> bm!31927 m!510049))

(assert (=> b!529533 m!509817))

(declare-fun m!510051 () Bool)

(assert (=> b!529533 m!510051))

(declare-fun m!510053 () Bool)

(assert (=> b!529533 m!510053))

(assert (=> b!529533 m!509817))

(assert (=> b!529533 m!509827))

(assert (=> b!529260 d!81075))

(declare-fun b!529535 () Bool)

(declare-fun e!308563 () Bool)

(declare-fun e!308561 () Bool)

(assert (=> b!529535 (= e!308563 e!308561)))

(declare-fun c!62429 () Bool)

(assert (=> b!529535 (= c!62429 (validKeyInArray!0 (select (arr!16113 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529536 () Bool)

(declare-fun call!31931 () Bool)

(assert (=> b!529536 (= e!308561 call!31931)))

(declare-fun bm!31928 () Bool)

(assert (=> bm!31928 (= call!31931 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!529538 () Bool)

(declare-fun e!308562 () Bool)

(assert (=> b!529538 (= e!308562 call!31931)))

(declare-fun b!529537 () Bool)

(assert (=> b!529537 (= e!308561 e!308562)))

(declare-fun lt!244137 () (_ BitVec 64))

(assert (=> b!529537 (= lt!244137 (select (arr!16113 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!244135 () Unit!16772)

(assert (=> b!529537 (= lt!244135 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244137 #b00000000000000000000000000000000))))

(assert (=> b!529537 (arrayContainsKey!0 a!3235 lt!244137 #b00000000000000000000000000000000)))

(declare-fun lt!244136 () Unit!16772)

(assert (=> b!529537 (= lt!244136 lt!244135)))

(declare-fun res!325297 () Bool)

(assert (=> b!529537 (= res!325297 (= (seekEntryOrOpen!0 (select (arr!16113 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4580 #b00000000000000000000000000000000)))))

(assert (=> b!529537 (=> (not res!325297) (not e!308562))))

(declare-fun d!81089 () Bool)

(declare-fun res!325298 () Bool)

(assert (=> d!81089 (=> res!325298 e!308563)))

(assert (=> d!81089 (= res!325298 (bvsge #b00000000000000000000000000000000 (size!16477 a!3235)))))

(assert (=> d!81089 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!308563)))

(assert (= (and d!81089 (not res!325298)) b!529535))

(assert (= (and b!529535 c!62429) b!529537))

(assert (= (and b!529535 (not c!62429)) b!529536))

(assert (= (and b!529537 res!325297) b!529538))

(assert (= (or b!529538 b!529536) bm!31928))

(declare-fun m!510055 () Bool)

(assert (=> b!529535 m!510055))

(assert (=> b!529535 m!510055))

(declare-fun m!510057 () Bool)

(assert (=> b!529535 m!510057))

(declare-fun m!510059 () Bool)

(assert (=> bm!31928 m!510059))

(assert (=> b!529537 m!510055))

(declare-fun m!510061 () Bool)

(assert (=> b!529537 m!510061))

(declare-fun m!510063 () Bool)

(assert (=> b!529537 m!510063))

(assert (=> b!529537 m!510055))

(declare-fun m!510065 () Bool)

(assert (=> b!529537 m!510065))

(assert (=> b!529265 d!81089))

(declare-fun d!81091 () Bool)

(declare-fun res!325303 () Bool)

(declare-fun e!308568 () Bool)

(assert (=> d!81091 (=> res!325303 e!308568)))

(assert (=> d!81091 (= res!325303 (= (select (arr!16113 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!81091 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!308568)))

(declare-fun b!529543 () Bool)

(declare-fun e!308569 () Bool)

(assert (=> b!529543 (= e!308568 e!308569)))

(declare-fun res!325304 () Bool)

(assert (=> b!529543 (=> (not res!325304) (not e!308569))))

(assert (=> b!529543 (= res!325304 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16477 a!3235)))))

(declare-fun b!529544 () Bool)

(assert (=> b!529544 (= e!308569 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81091 (not res!325303)) b!529543))

(assert (= (and b!529543 res!325304) b!529544))

(assert (=> d!81091 m!510055))

(declare-fun m!510067 () Bool)

(assert (=> b!529544 m!510067))

(assert (=> b!529267 d!81091))

(declare-fun bm!31931 () Bool)

(declare-fun call!31934 () Bool)

(declare-fun c!62432 () Bool)

(assert (=> bm!31931 (= call!31934 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62432 (Cons!10267 (select (arr!16113 a!3235) #b00000000000000000000000000000000) Nil!10268) Nil!10268)))))

(declare-fun b!529555 () Bool)

(declare-fun e!308581 () Bool)

(assert (=> b!529555 (= e!308581 call!31934)))

(declare-fun d!81093 () Bool)

(declare-fun res!325311 () Bool)

(declare-fun e!308580 () Bool)

(assert (=> d!81093 (=> res!325311 e!308580)))

(assert (=> d!81093 (= res!325311 (bvsge #b00000000000000000000000000000000 (size!16477 a!3235)))))

(assert (=> d!81093 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10268) e!308580)))

(declare-fun b!529556 () Bool)

(declare-fun e!308578 () Bool)

(assert (=> b!529556 (= e!308580 e!308578)))

(declare-fun res!325313 () Bool)

(assert (=> b!529556 (=> (not res!325313) (not e!308578))))

(declare-fun e!308579 () Bool)

(assert (=> b!529556 (= res!325313 (not e!308579))))

(declare-fun res!325312 () Bool)

(assert (=> b!529556 (=> (not res!325312) (not e!308579))))

(assert (=> b!529556 (= res!325312 (validKeyInArray!0 (select (arr!16113 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529557 () Bool)

(assert (=> b!529557 (= e!308578 e!308581)))

(assert (=> b!529557 (= c!62432 (validKeyInArray!0 (select (arr!16113 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529558 () Bool)

(declare-fun contains!2781 (List!10271 (_ BitVec 64)) Bool)

(assert (=> b!529558 (= e!308579 (contains!2781 Nil!10268 (select (arr!16113 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529559 () Bool)

(assert (=> b!529559 (= e!308581 call!31934)))

(assert (= (and d!81093 (not res!325311)) b!529556))

(assert (= (and b!529556 res!325312) b!529558))

(assert (= (and b!529556 res!325313) b!529557))

(assert (= (and b!529557 c!62432) b!529559))

(assert (= (and b!529557 (not c!62432)) b!529555))

(assert (= (or b!529559 b!529555) bm!31931))

(assert (=> bm!31931 m!510055))

(declare-fun m!510069 () Bool)

(assert (=> bm!31931 m!510069))

(assert (=> b!529556 m!510055))

(assert (=> b!529556 m!510055))

(assert (=> b!529556 m!510057))

(assert (=> b!529557 m!510055))

(assert (=> b!529557 m!510055))

(assert (=> b!529557 m!510057))

(assert (=> b!529558 m!510055))

(assert (=> b!529558 m!510055))

(declare-fun m!510071 () Bool)

(assert (=> b!529558 m!510071))

(assert (=> b!529261 d!81093))

(declare-fun b!529608 () Bool)

(declare-fun e!308608 () SeekEntryResult!4580)

(declare-fun lt!244158 () SeekEntryResult!4580)

(assert (=> b!529608 (= e!308608 (MissingZero!4580 (index!20546 lt!244158)))))

(declare-fun b!529609 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33529 (_ BitVec 32)) SeekEntryResult!4580)

(assert (=> b!529609 (= e!308608 (seekKeyOrZeroReturnVacant!0 (x!49516 lt!244158) (index!20546 lt!244158) (index!20546 lt!244158) k!2280 a!3235 mask!3524))))

(declare-fun b!529610 () Bool)

(declare-fun e!308609 () SeekEntryResult!4580)

(assert (=> b!529610 (= e!308609 Undefined!4580)))

(declare-fun d!81095 () Bool)

(declare-fun lt!244159 () SeekEntryResult!4580)

(assert (=> d!81095 (and (or (is-Undefined!4580 lt!244159) (not (is-Found!4580 lt!244159)) (and (bvsge (index!20545 lt!244159) #b00000000000000000000000000000000) (bvslt (index!20545 lt!244159) (size!16477 a!3235)))) (or (is-Undefined!4580 lt!244159) (is-Found!4580 lt!244159) (not (is-MissingZero!4580 lt!244159)) (and (bvsge (index!20544 lt!244159) #b00000000000000000000000000000000) (bvslt (index!20544 lt!244159) (size!16477 a!3235)))) (or (is-Undefined!4580 lt!244159) (is-Found!4580 lt!244159) (is-MissingZero!4580 lt!244159) (not (is-MissingVacant!4580 lt!244159)) (and (bvsge (index!20547 lt!244159) #b00000000000000000000000000000000) (bvslt (index!20547 lt!244159) (size!16477 a!3235)))) (or (is-Undefined!4580 lt!244159) (ite (is-Found!4580 lt!244159) (= (select (arr!16113 a!3235) (index!20545 lt!244159)) k!2280) (ite (is-MissingZero!4580 lt!244159) (= (select (arr!16113 a!3235) (index!20544 lt!244159)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4580 lt!244159) (= (select (arr!16113 a!3235) (index!20547 lt!244159)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81095 (= lt!244159 e!308609)))

(declare-fun c!62451 () Bool)

(assert (=> d!81095 (= c!62451 (and (is-Intermediate!4580 lt!244158) (undefined!5392 lt!244158)))))

(assert (=> d!81095 (= lt!244158 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!81095 (validMask!0 mask!3524)))

(assert (=> d!81095 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!244159)))

(declare-fun b!529611 () Bool)

(declare-fun e!308610 () SeekEntryResult!4580)

(assert (=> b!529611 (= e!308610 (Found!4580 (index!20546 lt!244158)))))

(declare-fun b!529612 () Bool)

(assert (=> b!529612 (= e!308609 e!308610)))

(declare-fun lt!244157 () (_ BitVec 64))

(assert (=> b!529612 (= lt!244157 (select (arr!16113 a!3235) (index!20546 lt!244158)))))

(declare-fun c!62453 () Bool)

(assert (=> b!529612 (= c!62453 (= lt!244157 k!2280))))

(declare-fun b!529613 () Bool)

(declare-fun c!62452 () Bool)

(assert (=> b!529613 (= c!62452 (= lt!244157 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529613 (= e!308610 e!308608)))

(assert (= (and d!81095 c!62451) b!529610))

(assert (= (and d!81095 (not c!62451)) b!529612))

(assert (= (and b!529612 c!62453) b!529611))

(assert (= (and b!529612 (not c!62453)) b!529613))

(assert (= (and b!529613 c!62452) b!529608))

(assert (= (and b!529613 (not c!62452)) b!529609))

(declare-fun m!510091 () Bool)

(assert (=> b!529609 m!510091))

(declare-fun m!510093 () Bool)

(assert (=> d!81095 m!510093))

(declare-fun m!510095 () Bool)

(assert (=> d!81095 m!510095))

(declare-fun m!510097 () Bool)

(assert (=> d!81095 m!510097))

(declare-fun m!510099 () Bool)

(assert (=> d!81095 m!510099))

(declare-fun m!510101 () Bool)

(assert (=> d!81095 m!510101))

(assert (=> d!81095 m!510097))

(assert (=> d!81095 m!509831))

(declare-fun m!510103 () Bool)

(assert (=> b!529612 m!510103))

(assert (=> b!529263 d!81095))

(declare-fun b!529614 () Bool)

(declare-fun e!308611 () SeekEntryResult!4580)

(declare-fun lt!244161 () SeekEntryResult!4580)

(assert (=> b!529614 (= e!308611 (MissingZero!4580 (index!20546 lt!244161)))))

(declare-fun b!529615 () Bool)

(assert (=> b!529615 (= e!308611 (seekKeyOrZeroReturnVacant!0 (x!49516 lt!244161) (index!20546 lt!244161) (index!20546 lt!244161) (select (arr!16113 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529616 () Bool)

(declare-fun e!308612 () SeekEntryResult!4580)

(assert (=> b!529616 (= e!308612 Undefined!4580)))

(declare-fun d!81103 () Bool)

(declare-fun lt!244162 () SeekEntryResult!4580)

(assert (=> d!81103 (and (or (is-Undefined!4580 lt!244162) (not (is-Found!4580 lt!244162)) (and (bvsge (index!20545 lt!244162) #b00000000000000000000000000000000) (bvslt (index!20545 lt!244162) (size!16477 a!3235)))) (or (is-Undefined!4580 lt!244162) (is-Found!4580 lt!244162) (not (is-MissingZero!4580 lt!244162)) (and (bvsge (index!20544 lt!244162) #b00000000000000000000000000000000) (bvslt (index!20544 lt!244162) (size!16477 a!3235)))) (or (is-Undefined!4580 lt!244162) (is-Found!4580 lt!244162) (is-MissingZero!4580 lt!244162) (not (is-MissingVacant!4580 lt!244162)) (and (bvsge (index!20547 lt!244162) #b00000000000000000000000000000000) (bvslt (index!20547 lt!244162) (size!16477 a!3235)))) (or (is-Undefined!4580 lt!244162) (ite (is-Found!4580 lt!244162) (= (select (arr!16113 a!3235) (index!20545 lt!244162)) (select (arr!16113 a!3235) j!176)) (ite (is-MissingZero!4580 lt!244162) (= (select (arr!16113 a!3235) (index!20544 lt!244162)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4580 lt!244162) (= (select (arr!16113 a!3235) (index!20547 lt!244162)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81103 (= lt!244162 e!308612)))

(declare-fun c!62454 () Bool)

(assert (=> d!81103 (= c!62454 (and (is-Intermediate!4580 lt!244161) (undefined!5392 lt!244161)))))

(assert (=> d!81103 (= lt!244161 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16113 a!3235) j!176) mask!3524) (select (arr!16113 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!81103 (validMask!0 mask!3524)))

(assert (=> d!81103 (= (seekEntryOrOpen!0 (select (arr!16113 a!3235) j!176) a!3235 mask!3524) lt!244162)))

(declare-fun b!529617 () Bool)

(declare-fun e!308613 () SeekEntryResult!4580)

(assert (=> b!529617 (= e!308613 (Found!4580 (index!20546 lt!244161)))))

(declare-fun b!529618 () Bool)

(assert (=> b!529618 (= e!308612 e!308613)))

(declare-fun lt!244160 () (_ BitVec 64))

(assert (=> b!529618 (= lt!244160 (select (arr!16113 a!3235) (index!20546 lt!244161)))))

(declare-fun c!62456 () Bool)

(assert (=> b!529618 (= c!62456 (= lt!244160 (select (arr!16113 a!3235) j!176)))))

(declare-fun b!529619 () Bool)

(declare-fun c!62455 () Bool)

(assert (=> b!529619 (= c!62455 (= lt!244160 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529619 (= e!308613 e!308611)))

(assert (= (and d!81103 c!62454) b!529616))

(assert (= (and d!81103 (not c!62454)) b!529618))

(assert (= (and b!529618 c!62456) b!529617))

(assert (= (and b!529618 (not c!62456)) b!529619))

(assert (= (and b!529619 c!62455) b!529614))

(assert (= (and b!529619 (not c!62455)) b!529615))

(assert (=> b!529615 m!509817))

(declare-fun m!510105 () Bool)

(assert (=> b!529615 m!510105))

(declare-fun m!510107 () Bool)

(assert (=> d!81103 m!510107))

(declare-fun m!510109 () Bool)

(assert (=> d!81103 m!510109))

(assert (=> d!81103 m!509819))

(assert (=> d!81103 m!509817))

(declare-fun m!510111 () Bool)

(assert (=> d!81103 m!510111))

(declare-fun m!510113 () Bool)

(assert (=> d!81103 m!510113))

(assert (=> d!81103 m!509817))

(assert (=> d!81103 m!509819))

(assert (=> d!81103 m!509831))

(declare-fun m!510115 () Bool)

(assert (=> b!529618 m!510115))

(assert (=> b!529268 d!81103))

(declare-fun d!81105 () Bool)

(assert (=> d!81105 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529262 d!81105))

(push 1)

