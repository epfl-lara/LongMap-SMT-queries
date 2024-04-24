; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33284 () Bool)

(assert start!33284)

(declare-fun b!331082 () Bool)

(declare-fun res!182533 () Bool)

(declare-fun e!203127 () Bool)

(assert (=> b!331082 (=> (not res!182533) (not e!203127))))

(declare-datatypes ((array!16905 0))(
  ( (array!16906 (arr!7993 (Array (_ BitVec 32) (_ BitVec 64))) (size!8345 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16905)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!331082 (= res!182533 (and (= (size!8345 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8345 a!3305))))))

(declare-fun b!331083 () Bool)

(declare-fun res!182535 () Bool)

(assert (=> b!331083 (=> (not res!182535) (not e!203127))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16905 (_ BitVec 32)) Bool)

(assert (=> b!331083 (= res!182535 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!331084 () Bool)

(declare-fun res!182541 () Bool)

(assert (=> b!331084 (=> (not res!182541) (not e!203127))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3089 0))(
  ( (MissingZero!3089 (index!14532 (_ BitVec 32))) (Found!3089 (index!14533 (_ BitVec 32))) (Intermediate!3089 (undefined!3901 Bool) (index!14534 (_ BitVec 32)) (x!32926 (_ BitVec 32))) (Undefined!3089) (MissingVacant!3089 (index!14535 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16905 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!331084 (= res!182541 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3089 i!1250)))))

(declare-fun b!331085 () Bool)

(declare-fun res!182538 () Bool)

(assert (=> b!331085 (=> (not res!182538) (not e!203127))))

(declare-fun arrayContainsKey!0 (array!16905 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!331085 (= res!182538 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!331086 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun lt!158742 () SeekEntryResult!3089)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun e!203125 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16905 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!331086 (= e!203125 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)) mask!3777) lt!158742)))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-datatypes ((Unit!10297 0))(
  ( (Unit!10298) )
))
(declare-fun lt!158740 () Unit!10297)

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!16905 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!10297)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331086 (= lt!158740 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777))))

(declare-fun b!331087 () Bool)

(declare-fun res!182540 () Bool)

(declare-fun e!203126 () Bool)

(assert (=> b!331087 (=> (not res!182540) (not e!203126))))

(assert (=> b!331087 (= res!182540 (and (= (select (arr!7993 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8345 a!3305))))))

(declare-fun b!331088 () Bool)

(declare-fun res!182534 () Bool)

(assert (=> b!331088 (=> (not res!182534) (not e!203127))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!331088 (= res!182534 (validKeyInArray!0 k0!2497))))

(declare-fun b!331089 () Bool)

(assert (=> b!331089 (= e!203127 e!203126)))

(declare-fun res!182539 () Bool)

(assert (=> b!331089 (=> (not res!182539) (not e!203126))))

(declare-fun lt!158741 () SeekEntryResult!3089)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!331089 (= res!182539 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158741))))

(assert (=> b!331089 (= lt!158741 (Intermediate!3089 false resIndex!58 resX!58))))

(declare-fun b!331081 () Bool)

(assert (=> b!331081 (= e!203126 e!203125)))

(declare-fun res!182537 () Bool)

(assert (=> b!331081 (=> (not res!182537) (not e!203125))))

(assert (=> b!331081 (= res!182537 (and (= lt!158742 lt!158741) (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7993 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (=> b!331081 (= lt!158742 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(declare-fun res!182536 () Bool)

(assert (=> start!33284 (=> (not res!182536) (not e!203127))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33284 (= res!182536 (validMask!0 mask!3777))))

(assert (=> start!33284 e!203127))

(declare-fun array_inv!5943 (array!16905) Bool)

(assert (=> start!33284 (array_inv!5943 a!3305)))

(assert (=> start!33284 true))

(assert (= (and start!33284 res!182536) b!331082))

(assert (= (and b!331082 res!182533) b!331088))

(assert (= (and b!331088 res!182534) b!331085))

(assert (= (and b!331085 res!182538) b!331084))

(assert (= (and b!331084 res!182541) b!331083))

(assert (= (and b!331083 res!182535) b!331089))

(assert (= (and b!331089 res!182539) b!331087))

(assert (= (and b!331087 res!182540) b!331081))

(assert (= (and b!331081 res!182537) b!331086))

(declare-fun m!336349 () Bool)

(assert (=> b!331087 m!336349))

(declare-fun m!336351 () Bool)

(assert (=> b!331081 m!336351))

(declare-fun m!336353 () Bool)

(assert (=> b!331081 m!336353))

(declare-fun m!336355 () Bool)

(assert (=> b!331083 m!336355))

(declare-fun m!336357 () Bool)

(assert (=> b!331086 m!336357))

(declare-fun m!336359 () Bool)

(assert (=> b!331086 m!336359))

(declare-fun m!336361 () Bool)

(assert (=> b!331086 m!336361))

(assert (=> b!331086 m!336361))

(declare-fun m!336363 () Bool)

(assert (=> b!331086 m!336363))

(declare-fun m!336365 () Bool)

(assert (=> start!33284 m!336365))

(declare-fun m!336367 () Bool)

(assert (=> start!33284 m!336367))

(declare-fun m!336369 () Bool)

(assert (=> b!331085 m!336369))

(declare-fun m!336371 () Bool)

(assert (=> b!331088 m!336371))

(declare-fun m!336373 () Bool)

(assert (=> b!331084 m!336373))

(declare-fun m!336375 () Bool)

(assert (=> b!331089 m!336375))

(assert (=> b!331089 m!336375))

(declare-fun m!336377 () Bool)

(assert (=> b!331089 m!336377))

(check-sat (not b!331088) (not b!331086) (not b!331083) (not b!331085) (not start!33284) (not b!331084) (not b!331089) (not b!331081))
(check-sat)
(get-model)

(declare-fun b!331162 () Bool)

(declare-fun e!203163 () SeekEntryResult!3089)

(assert (=> b!331162 (= e!203163 (Intermediate!3089 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!331164 () Bool)

(declare-fun lt!158765 () SeekEntryResult!3089)

(assert (=> b!331164 (and (bvsge (index!14534 lt!158765) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158765) (size!8345 a!3305)))))

(declare-fun res!182603 () Bool)

(assert (=> b!331164 (= res!182603 (= (select (arr!7993 a!3305) (index!14534 lt!158765)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203166 () Bool)

(assert (=> b!331164 (=> res!182603 e!203166)))

(declare-fun b!331165 () Bool)

(assert (=> b!331165 (and (bvsge (index!14534 lt!158765) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158765) (size!8345 a!3305)))))

(declare-fun res!182602 () Bool)

(assert (=> b!331165 (= res!182602 (= (select (arr!7993 a!3305) (index!14534 lt!158765)) k0!2497))))

(assert (=> b!331165 (=> res!182602 e!203166)))

(declare-fun e!203162 () Bool)

(assert (=> b!331165 (= e!203162 e!203166)))

(declare-fun b!331166 () Bool)

(declare-fun e!203165 () SeekEntryResult!3089)

(assert (=> b!331166 (= e!203165 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!331167 () Bool)

(declare-fun e!203164 () Bool)

(assert (=> b!331167 (= e!203164 (bvsge (x!32926 lt!158765) #b01111111111111111111111111111110))))

(declare-fun b!331168 () Bool)

(assert (=> b!331168 (and (bvsge (index!14534 lt!158765) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158765) (size!8345 a!3305)))))

(assert (=> b!331168 (= e!203166 (= (select (arr!7993 a!3305) (index!14534 lt!158765)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331169 () Bool)

(assert (=> b!331169 (= e!203163 e!203165)))

(declare-fun c!51924 () Bool)

(declare-fun lt!158766 () (_ BitVec 64))

(assert (=> b!331169 (= c!51924 (or (= lt!158766 k0!2497) (= (bvadd lt!158766 lt!158766) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331170 () Bool)

(assert (=> b!331170 (= e!203164 e!203162)))

(declare-fun res!182604 () Bool)

(get-info :version)

(assert (=> b!331170 (= res!182604 (and ((_ is Intermediate!3089) lt!158765) (not (undefined!3901 lt!158765)) (bvslt (x!32926 lt!158765) #b01111111111111111111111111111110) (bvsge (x!32926 lt!158765) #b00000000000000000000000000000000) (bvsge (x!32926 lt!158765) #b00000000000000000000000000000000)))))

(assert (=> b!331170 (=> (not res!182604) (not e!203162))))

(declare-fun b!331163 () Bool)

(assert (=> b!331163 (= e!203165 (Intermediate!3089 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun d!70401 () Bool)

(assert (=> d!70401 e!203164))

(declare-fun c!51926 () Bool)

(assert (=> d!70401 (= c!51926 (and ((_ is Intermediate!3089) lt!158765) (undefined!3901 lt!158765)))))

(assert (=> d!70401 (= lt!158765 e!203163)))

(declare-fun c!51925 () Bool)

(assert (=> d!70401 (= c!51925 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70401 (= lt!158766 (select (arr!7993 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70401 (validMask!0 mask!3777)))

(assert (=> d!70401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158765)))

(assert (= (and d!70401 c!51925) b!331162))

(assert (= (and d!70401 (not c!51925)) b!331169))

(assert (= (and b!331169 c!51924) b!331163))

(assert (= (and b!331169 (not c!51924)) b!331166))

(assert (= (and d!70401 c!51926) b!331167))

(assert (= (and d!70401 (not c!51926)) b!331170))

(assert (= (and b!331170 res!182604) b!331165))

(assert (= (and b!331165 (not res!182602)) b!331164))

(assert (= (and b!331164 (not res!182603)) b!331168))

(declare-fun m!336439 () Bool)

(assert (=> b!331164 m!336439))

(assert (=> b!331165 m!336439))

(assert (=> b!331166 m!336375))

(declare-fun m!336441 () Bool)

(assert (=> b!331166 m!336441))

(assert (=> b!331166 m!336441))

(declare-fun m!336443 () Bool)

(assert (=> b!331166 m!336443))

(assert (=> d!70401 m!336375))

(declare-fun m!336445 () Bool)

(assert (=> d!70401 m!336445))

(assert (=> d!70401 m!336365))

(assert (=> b!331168 m!336439))

(assert (=> b!331089 d!70401))

(declare-fun d!70403 () Bool)

(declare-fun lt!158772 () (_ BitVec 32))

(declare-fun lt!158771 () (_ BitVec 32))

(assert (=> d!70403 (= lt!158772 (bvmul (bvxor lt!158771 (bvlshr lt!158771 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70403 (= lt!158771 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70403 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!182605 (let ((h!5336 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32930 (bvmul (bvxor h!5336 (bvlshr h!5336 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32930 (bvlshr x!32930 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!182605 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!182605 #b00000000000000000000000000000000))))))

(assert (=> d!70403 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!158772 (bvlshr lt!158772 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!331089 d!70403))

(declare-fun d!70409 () Bool)

(assert (=> d!70409 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!33284 d!70409))

(declare-fun d!70411 () Bool)

(assert (=> d!70411 (= (array_inv!5943 a!3305) (bvsge (size!8345 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!33284 d!70411))

(declare-fun b!331252 () Bool)

(declare-fun e!203215 () SeekEntryResult!3089)

(assert (=> b!331252 (= e!203215 Undefined!3089)))

(declare-fun b!331253 () Bool)

(declare-fun c!51956 () Bool)

(declare-fun lt!158801 () (_ BitVec 64))

(assert (=> b!331253 (= c!51956 (= lt!158801 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203214 () SeekEntryResult!3089)

(declare-fun e!203216 () SeekEntryResult!3089)

(assert (=> b!331253 (= e!203214 e!203216)))

(declare-fun b!331254 () Bool)

(declare-fun lt!158800 () SeekEntryResult!3089)

(assert (=> b!331254 (= e!203216 (MissingZero!3089 (index!14534 lt!158800)))))

(declare-fun b!331255 () Bool)

(assert (=> b!331255 (= e!203214 (Found!3089 (index!14534 lt!158800)))))

(declare-fun d!70413 () Bool)

(declare-fun lt!158799 () SeekEntryResult!3089)

(assert (=> d!70413 (and (or ((_ is Undefined!3089) lt!158799) (not ((_ is Found!3089) lt!158799)) (and (bvsge (index!14533 lt!158799) #b00000000000000000000000000000000) (bvslt (index!14533 lt!158799) (size!8345 a!3305)))) (or ((_ is Undefined!3089) lt!158799) ((_ is Found!3089) lt!158799) (not ((_ is MissingZero!3089) lt!158799)) (and (bvsge (index!14532 lt!158799) #b00000000000000000000000000000000) (bvslt (index!14532 lt!158799) (size!8345 a!3305)))) (or ((_ is Undefined!3089) lt!158799) ((_ is Found!3089) lt!158799) ((_ is MissingZero!3089) lt!158799) (not ((_ is MissingVacant!3089) lt!158799)) (and (bvsge (index!14535 lt!158799) #b00000000000000000000000000000000) (bvslt (index!14535 lt!158799) (size!8345 a!3305)))) (or ((_ is Undefined!3089) lt!158799) (ite ((_ is Found!3089) lt!158799) (= (select (arr!7993 a!3305) (index!14533 lt!158799)) k0!2497) (ite ((_ is MissingZero!3089) lt!158799) (= (select (arr!7993 a!3305) (index!14532 lt!158799)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3089) lt!158799) (= (select (arr!7993 a!3305) (index!14535 lt!158799)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70413 (= lt!158799 e!203215)))

(declare-fun c!51955 () Bool)

(assert (=> d!70413 (= c!51955 (and ((_ is Intermediate!3089) lt!158800) (undefined!3901 lt!158800)))))

(assert (=> d!70413 (= lt!158800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70413 (validMask!0 mask!3777)))

(assert (=> d!70413 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!158799)))

(declare-fun b!331256 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16905 (_ BitVec 32)) SeekEntryResult!3089)

(assert (=> b!331256 (= e!203216 (seekKeyOrZeroReturnVacant!0 (x!32926 lt!158800) (index!14534 lt!158800) (index!14534 lt!158800) k0!2497 a!3305 mask!3777))))

(declare-fun b!331257 () Bool)

(assert (=> b!331257 (= e!203215 e!203214)))

(assert (=> b!331257 (= lt!158801 (select (arr!7993 a!3305) (index!14534 lt!158800)))))

(declare-fun c!51954 () Bool)

(assert (=> b!331257 (= c!51954 (= lt!158801 k0!2497))))

(assert (= (and d!70413 c!51955) b!331252))

(assert (= (and d!70413 (not c!51955)) b!331257))

(assert (= (and b!331257 c!51954) b!331255))

(assert (= (and b!331257 (not c!51954)) b!331253))

(assert (= (and b!331253 c!51956) b!331254))

(assert (= (and b!331253 (not c!51956)) b!331256))

(assert (=> d!70413 m!336375))

(declare-fun m!336473 () Bool)

(assert (=> d!70413 m!336473))

(assert (=> d!70413 m!336365))

(declare-fun m!336475 () Bool)

(assert (=> d!70413 m!336475))

(assert (=> d!70413 m!336375))

(assert (=> d!70413 m!336377))

(declare-fun m!336477 () Bool)

(assert (=> d!70413 m!336477))

(declare-fun m!336479 () Bool)

(assert (=> b!331256 m!336479))

(declare-fun m!336481 () Bool)

(assert (=> b!331257 m!336481))

(assert (=> b!331084 d!70413))

(declare-fun bm!26161 () Bool)

(declare-fun call!26164 () Bool)

(assert (=> bm!26161 (= call!26164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun d!70425 () Bool)

(declare-fun res!182647 () Bool)

(declare-fun e!203247 () Bool)

(assert (=> d!70425 (=> res!182647 e!203247)))

(assert (=> d!70425 (= res!182647 (bvsge #b00000000000000000000000000000000 (size!8345 a!3305)))))

(assert (=> d!70425 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!203247)))

(declare-fun b!331307 () Bool)

(declare-fun e!203249 () Bool)

(assert (=> b!331307 (= e!203249 call!26164)))

(declare-fun b!331308 () Bool)

(declare-fun e!203248 () Bool)

(assert (=> b!331308 (= e!203248 call!26164)))

(declare-fun b!331309 () Bool)

(assert (=> b!331309 (= e!203249 e!203248)))

(declare-fun lt!158827 () (_ BitVec 64))

(assert (=> b!331309 (= lt!158827 (select (arr!7993 a!3305) #b00000000000000000000000000000000))))

(declare-fun lt!158828 () Unit!10297)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16905 (_ BitVec 64) (_ BitVec 32)) Unit!10297)

(assert (=> b!331309 (= lt!158828 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!158827 #b00000000000000000000000000000000))))

(assert (=> b!331309 (arrayContainsKey!0 a!3305 lt!158827 #b00000000000000000000000000000000)))

(declare-fun lt!158829 () Unit!10297)

(assert (=> b!331309 (= lt!158829 lt!158828)))

(declare-fun res!182648 () Bool)

(assert (=> b!331309 (= res!182648 (= (seekEntryOrOpen!0 (select (arr!7993 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3089 #b00000000000000000000000000000000)))))

(assert (=> b!331309 (=> (not res!182648) (not e!203248))))

(declare-fun b!331310 () Bool)

(assert (=> b!331310 (= e!203247 e!203249)))

(declare-fun c!51975 () Bool)

(assert (=> b!331310 (= c!51975 (validKeyInArray!0 (select (arr!7993 a!3305) #b00000000000000000000000000000000)))))

(assert (= (and d!70425 (not res!182647)) b!331310))

(assert (= (and b!331310 c!51975) b!331309))

(assert (= (and b!331310 (not c!51975)) b!331307))

(assert (= (and b!331309 res!182648) b!331308))

(assert (= (or b!331308 b!331307) bm!26161))

(declare-fun m!336499 () Bool)

(assert (=> bm!26161 m!336499))

(declare-fun m!336501 () Bool)

(assert (=> b!331309 m!336501))

(declare-fun m!336503 () Bool)

(assert (=> b!331309 m!336503))

(declare-fun m!336505 () Bool)

(assert (=> b!331309 m!336505))

(assert (=> b!331309 m!336501))

(declare-fun m!336507 () Bool)

(assert (=> b!331309 m!336507))

(assert (=> b!331310 m!336501))

(assert (=> b!331310 m!336501))

(declare-fun m!336509 () Bool)

(assert (=> b!331310 m!336509))

(assert (=> b!331083 d!70425))

(declare-fun d!70433 () Bool)

(assert (=> d!70433 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!331088 d!70433))

(declare-fun b!331311 () Bool)

(declare-fun e!203251 () SeekEntryResult!3089)

(assert (=> b!331311 (= e!203251 (Intermediate!3089 true index!1840 x!1490))))

(declare-fun b!331313 () Bool)

(declare-fun lt!158832 () SeekEntryResult!3089)

(assert (=> b!331313 (and (bvsge (index!14534 lt!158832) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158832) (size!8345 a!3305)))))

(declare-fun res!182650 () Bool)

(assert (=> b!331313 (= res!182650 (= (select (arr!7993 a!3305) (index!14534 lt!158832)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203254 () Bool)

(assert (=> b!331313 (=> res!182650 e!203254)))

(declare-fun b!331314 () Bool)

(assert (=> b!331314 (and (bvsge (index!14534 lt!158832) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158832) (size!8345 a!3305)))))

(declare-fun res!182649 () Bool)

(assert (=> b!331314 (= res!182649 (= (select (arr!7993 a!3305) (index!14534 lt!158832)) k0!2497))))

(assert (=> b!331314 (=> res!182649 e!203254)))

(declare-fun e!203250 () Bool)

(assert (=> b!331314 (= e!203250 e!203254)))

(declare-fun b!331315 () Bool)

(declare-fun e!203253 () SeekEntryResult!3089)

(assert (=> b!331315 (= e!203253 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!331316 () Bool)

(declare-fun e!203252 () Bool)

(assert (=> b!331316 (= e!203252 (bvsge (x!32926 lt!158832) #b01111111111111111111111111111110))))

(declare-fun b!331317 () Bool)

(assert (=> b!331317 (and (bvsge (index!14534 lt!158832) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158832) (size!8345 a!3305)))))

(assert (=> b!331317 (= e!203254 (= (select (arr!7993 a!3305) (index!14534 lt!158832)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331318 () Bool)

(assert (=> b!331318 (= e!203251 e!203253)))

(declare-fun c!51976 () Bool)

(declare-fun lt!158833 () (_ BitVec 64))

(assert (=> b!331318 (= c!51976 (or (= lt!158833 k0!2497) (= (bvadd lt!158833 lt!158833) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331319 () Bool)

(assert (=> b!331319 (= e!203252 e!203250)))

(declare-fun res!182651 () Bool)

(assert (=> b!331319 (= res!182651 (and ((_ is Intermediate!3089) lt!158832) (not (undefined!3901 lt!158832)) (bvslt (x!32926 lt!158832) #b01111111111111111111111111111110) (bvsge (x!32926 lt!158832) #b00000000000000000000000000000000) (bvsge (x!32926 lt!158832) x!1490)))))

(assert (=> b!331319 (=> (not res!182651) (not e!203250))))

(declare-fun b!331312 () Bool)

(assert (=> b!331312 (= e!203253 (Intermediate!3089 false index!1840 x!1490))))

(declare-fun d!70435 () Bool)

(assert (=> d!70435 e!203252))

(declare-fun c!51978 () Bool)

(assert (=> d!70435 (= c!51978 (and ((_ is Intermediate!3089) lt!158832) (undefined!3901 lt!158832)))))

(assert (=> d!70435 (= lt!158832 e!203251)))

(declare-fun c!51977 () Bool)

(assert (=> d!70435 (= c!51977 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70435 (= lt!158833 (select (arr!7993 a!3305) index!1840))))

(assert (=> d!70435 (validMask!0 mask!3777)))

(assert (=> d!70435 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158832)))

(assert (= (and d!70435 c!51977) b!331311))

(assert (= (and d!70435 (not c!51977)) b!331318))

(assert (= (and b!331318 c!51976) b!331312))

(assert (= (and b!331318 (not c!51976)) b!331315))

(assert (= (and d!70435 c!51978) b!331316))

(assert (= (and d!70435 (not c!51978)) b!331319))

(assert (= (and b!331319 res!182651) b!331314))

(assert (= (and b!331314 (not res!182649)) b!331313))

(assert (= (and b!331313 (not res!182650)) b!331317))

(declare-fun m!336511 () Bool)

(assert (=> b!331313 m!336511))

(assert (=> b!331314 m!336511))

(declare-fun m!336513 () Bool)

(assert (=> b!331315 m!336513))

(assert (=> b!331315 m!336513))

(declare-fun m!336515 () Bool)

(assert (=> b!331315 m!336515))

(assert (=> d!70435 m!336351))

(assert (=> d!70435 m!336365))

(assert (=> b!331317 m!336511))

(assert (=> b!331081 d!70435))

(declare-fun b!331322 () Bool)

(declare-fun e!203258 () SeekEntryResult!3089)

(assert (=> b!331322 (= e!203258 (Intermediate!3089 true index!1840 x!1490))))

(declare-fun b!331324 () Bool)

(declare-fun lt!158834 () SeekEntryResult!3089)

(assert (=> b!331324 (and (bvsge (index!14534 lt!158834) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158834) (size!8345 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)))))))

(declare-fun res!182655 () Bool)

(assert (=> b!331324 (= res!182655 (= (select (arr!7993 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305))) (index!14534 lt!158834)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!203261 () Bool)

(assert (=> b!331324 (=> res!182655 e!203261)))

(declare-fun b!331325 () Bool)

(assert (=> b!331325 (and (bvsge (index!14534 lt!158834) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158834) (size!8345 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)))))))

(declare-fun res!182654 () Bool)

(assert (=> b!331325 (= res!182654 (= (select (arr!7993 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305))) (index!14534 lt!158834)) k0!2497))))

(assert (=> b!331325 (=> res!182654 e!203261)))

(declare-fun e!203257 () Bool)

(assert (=> b!331325 (= e!203257 e!203261)))

(declare-fun e!203260 () SeekEntryResult!3089)

(declare-fun b!331326 () Bool)

(assert (=> b!331326 (= e!203260 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1490 #b00000000000000000000000000000001) (nextIndex!0 index!1840 (bvadd x!1490 #b00000000000000000000000000000001) mask!3777) k0!2497 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)) mask!3777))))

(declare-fun b!331327 () Bool)

(declare-fun e!203259 () Bool)

(assert (=> b!331327 (= e!203259 (bvsge (x!32926 lt!158834) #b01111111111111111111111111111110))))

(declare-fun b!331328 () Bool)

(assert (=> b!331328 (and (bvsge (index!14534 lt!158834) #b00000000000000000000000000000000) (bvslt (index!14534 lt!158834) (size!8345 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)))))))

(assert (=> b!331328 (= e!203261 (= (select (arr!7993 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305))) (index!14534 lt!158834)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!331329 () Bool)

(assert (=> b!331329 (= e!203258 e!203260)))

(declare-fun c!51979 () Bool)

(declare-fun lt!158835 () (_ BitVec 64))

(assert (=> b!331329 (= c!51979 (or (= lt!158835 k0!2497) (= (bvadd lt!158835 lt!158835) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!331330 () Bool)

(assert (=> b!331330 (= e!203259 e!203257)))

(declare-fun res!182656 () Bool)

(assert (=> b!331330 (= res!182656 (and ((_ is Intermediate!3089) lt!158834) (not (undefined!3901 lt!158834)) (bvslt (x!32926 lt!158834) #b01111111111111111111111111111110) (bvsge (x!32926 lt!158834) #b00000000000000000000000000000000) (bvsge (x!32926 lt!158834) x!1490)))))

(assert (=> b!331330 (=> (not res!182656) (not e!203257))))

(declare-fun b!331323 () Bool)

(assert (=> b!331323 (= e!203260 (Intermediate!3089 false index!1840 x!1490))))

(declare-fun d!70437 () Bool)

(assert (=> d!70437 e!203259))

(declare-fun c!51981 () Bool)

(assert (=> d!70437 (= c!51981 (and ((_ is Intermediate!3089) lt!158834) (undefined!3901 lt!158834)))))

(assert (=> d!70437 (= lt!158834 e!203258)))

(declare-fun c!51980 () Bool)

(assert (=> d!70437 (= c!51980 (bvsge x!1490 #b01111111111111111111111111111110))))

(assert (=> d!70437 (= lt!158835 (select (arr!7993 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305))) index!1840))))

(assert (=> d!70437 (validMask!0 mask!3777)))

(assert (=> d!70437 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)) mask!3777) lt!158834)))

(assert (= (and d!70437 c!51980) b!331322))

(assert (= (and d!70437 (not c!51980)) b!331329))

(assert (= (and b!331329 c!51979) b!331323))

(assert (= (and b!331329 (not c!51979)) b!331326))

(assert (= (and d!70437 c!51981) b!331327))

(assert (= (and d!70437 (not c!51981)) b!331330))

(assert (= (and b!331330 res!182656) b!331325))

(assert (= (and b!331325 (not res!182654)) b!331324))

(assert (= (and b!331324 (not res!182655)) b!331328))

(declare-fun m!336517 () Bool)

(assert (=> b!331324 m!336517))

(assert (=> b!331325 m!336517))

(assert (=> b!331326 m!336513))

(assert (=> b!331326 m!336513))

(declare-fun m!336519 () Bool)

(assert (=> b!331326 m!336519))

(declare-fun m!336521 () Bool)

(assert (=> d!70437 m!336521))

(assert (=> d!70437 m!336365))

(assert (=> b!331328 m!336517))

(assert (=> b!331086 d!70437))

(declare-fun b!331418 () Bool)

(declare-fun e!203315 () Unit!10297)

(declare-fun Unit!10311 () Unit!10297)

(assert (=> b!331418 (= e!203315 Unit!10311)))

(declare-fun c!52022 () Bool)

(declare-fun b!331419 () Bool)

(assert (=> b!331419 (= c!52022 (or (= (select (arr!7993 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7993 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!203313 () Unit!10297)

(assert (=> b!331419 (= e!203315 e!203313)))

(declare-fun call!26182 () (_ BitVec 32))

(declare-fun bm!26179 () Bool)

(assert (=> bm!26179 (= call!26182 (nextIndex!0 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) mask!3777))))

(declare-fun e!203314 () Unit!10297)

(declare-fun b!331420 () Bool)

(assert (=> b!331420 (= e!203314 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001) call!26182 resIndex!58 resX!58 mask!3777))))

(declare-fun b!331421 () Bool)

(declare-fun e!203312 () (_ BitVec 32))

(assert (=> b!331421 (= e!203312 call!26182)))

(declare-fun d!70439 () Bool)

(declare-fun e!203316 () Bool)

(assert (=> d!70439 e!203316))

(declare-fun res!182672 () Bool)

(assert (=> d!70439 (=> (not res!182672) (not e!203316))))

(assert (=> d!70439 (= res!182672 (and (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8345 a!3305))))))

(declare-fun lt!158883 () Unit!10297)

(assert (=> d!70439 (= lt!158883 e!203314)))

(declare-fun c!52018 () Bool)

(assert (=> d!70439 (= c!52018 (= (bvadd #b00000000000000000000000000000001 x!1490) resX!58))))

(assert (=> d!70439 (validMask!0 mask!3777)))

(assert (=> d!70439 (= (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3305 i!1250 k0!2497 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58 resX!58 mask!3777) lt!158883)))

(declare-fun call!26183 () SeekEntryResult!3089)

(declare-fun bm!26180 () Bool)

(assert (=> bm!26180 (= call!26183 (seekKeyOrZeroOrLongMinValue!0 (ite c!52022 (bvadd #b00000000000000000000000000000001 x!1490) (bvadd #b00000000000000000000000000000001 x!1490 #b00000000000000000000000000000001)) e!203312 k0!2497 a!3305 mask!3777))))

(declare-fun c!52019 () Bool)

(assert (=> bm!26180 (= c!52019 c!52022)))

(declare-fun b!331422 () Bool)

(assert (=> b!331422 false))

(declare-fun e!203317 () Unit!10297)

(declare-fun Unit!10312 () Unit!10297)

(assert (=> b!331422 (= e!203317 Unit!10312)))

(declare-fun b!331423 () Bool)

(declare-fun Unit!10313 () Unit!10297)

(assert (=> b!331423 (= e!203313 Unit!10313)))

(declare-fun c!52021 () Bool)

(assert (=> b!331423 (= c!52021 ((_ is Intermediate!3089) call!26183))))

(declare-fun lt!158886 () Unit!10297)

(assert (=> b!331423 (= lt!158886 e!203317)))

(assert (=> b!331423 false))

(declare-fun b!331424 () Bool)

(declare-fun Unit!10314 () Unit!10297)

(assert (=> b!331424 (= e!203317 Unit!10314)))

(declare-fun b!331425 () Bool)

(declare-fun Unit!10315 () Unit!10297)

(assert (=> b!331425 (= e!203314 Unit!10315)))

(declare-fun c!52020 () Bool)

(assert (=> b!331425 (= c!52020 (not (= resIndex!58 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))))

(declare-fun lt!158885 () Unit!10297)

(assert (=> b!331425 (= lt!158885 e!203315)))

(assert (=> b!331425 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resIndex!58)))

(declare-fun lt!158884 () Unit!10297)

(declare-fun Unit!10316 () Unit!10297)

(assert (=> b!331425 (= lt!158884 Unit!10316)))

(assert (=> b!331425 (= (select (arr!7993 a!3305) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777)) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!331426 () Bool)

(declare-fun Unit!10317 () Unit!10297)

(assert (=> b!331426 (= e!203313 Unit!10317)))

(assert (=> b!331426 (= call!26183 (Intermediate!3089 false (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) resX!58))))

(declare-fun lt!158887 () Unit!10297)

(declare-fun Unit!10318 () Unit!10297)

(assert (=> b!331426 (= lt!158887 Unit!10318)))

(assert (=> b!331426 false))

(declare-fun b!331427 () Bool)

(assert (=> b!331427 (= e!203316 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 (array!16906 (store (arr!7993 a!3305) i!1250 k0!2497) (size!8345 a!3305)) mask!3777) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun b!331428 () Bool)

(assert (=> b!331428 (= e!203312 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (= (and d!70439 c!52018) b!331425))

(assert (= (and d!70439 (not c!52018)) b!331420))

(assert (= (and b!331425 c!52020) b!331419))

(assert (= (and b!331425 (not c!52020)) b!331418))

(assert (= (and b!331419 c!52022) b!331426))

(assert (= (and b!331419 (not c!52022)) b!331423))

(assert (= (and b!331423 c!52021) b!331424))

(assert (= (and b!331423 (not c!52021)) b!331422))

(assert (= (or b!331426 b!331423) bm!26180))

(assert (= (and bm!26180 c!52019) b!331428))

(assert (= (and bm!26180 (not c!52019)) b!331421))

(assert (= (or b!331421 b!331420) bm!26179))

(assert (= (and d!70439 res!182672) b!331427))

(assert (=> b!331427 m!336357))

(assert (=> b!331427 m!336361))

(declare-fun m!336567 () Bool)

(assert (=> b!331427 m!336567))

(assert (=> b!331427 m!336361))

(declare-fun m!336569 () Bool)

(assert (=> b!331427 m!336569))

(assert (=> d!70439 m!336365))

(declare-fun m!336571 () Bool)

(assert (=> bm!26180 m!336571))

(assert (=> bm!26179 m!336361))

(declare-fun m!336573 () Bool)

(assert (=> bm!26179 m!336573))

(declare-fun m!336575 () Bool)

(assert (=> b!331420 m!336575))

(assert (=> b!331419 m!336361))

(declare-fun m!336577 () Bool)

(assert (=> b!331419 m!336577))

(assert (=> b!331425 m!336361))

(assert (=> b!331425 m!336577))

(assert (=> b!331086 d!70439))

(declare-fun d!70455 () Bool)

(declare-fun lt!158890 () (_ BitVec 32))

(assert (=> d!70455 (and (bvsge lt!158890 #b00000000000000000000000000000000) (bvslt lt!158890 (bvadd mask!3777 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!70455 (= lt!158890 (choose!52 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(assert (=> d!70455 (validMask!0 mask!3777)))

(assert (=> d!70455 (= (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) lt!158890)))

(declare-fun bs!11462 () Bool)

(assert (= bs!11462 d!70455))

(declare-fun m!336579 () Bool)

(assert (=> bs!11462 m!336579))

(assert (=> bs!11462 m!336365))

(assert (=> b!331086 d!70455))

(declare-fun d!70457 () Bool)

(declare-fun res!182677 () Bool)

(declare-fun e!203328 () Bool)

(assert (=> d!70457 (=> res!182677 e!203328)))

(assert (=> d!70457 (= res!182677 (= (select (arr!7993 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70457 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!203328)))

(declare-fun b!331445 () Bool)

(declare-fun e!203329 () Bool)

(assert (=> b!331445 (= e!203328 e!203329)))

(declare-fun res!182678 () Bool)

(assert (=> b!331445 (=> (not res!182678) (not e!203329))))

(assert (=> b!331445 (= res!182678 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8345 a!3305)))))

(declare-fun b!331446 () Bool)

(assert (=> b!331446 (= e!203329 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70457 (not res!182677)) b!331445))

(assert (= (and b!331445 res!182678) b!331446))

(assert (=> d!70457 m!336501))

(declare-fun m!336581 () Bool)

(assert (=> b!331446 m!336581))

(assert (=> b!331085 d!70457))

(check-sat (not d!70435) (not d!70437) (not d!70413) (not bm!26161) (not b!331446) (not b!331326) (not b!331420) (not bm!26179) (not d!70455) (not b!331427) (not d!70439) (not b!331309) (not b!331315) (not d!70401) (not b!331256) (not b!331166) (not bm!26180) (not b!331310))
(check-sat)
