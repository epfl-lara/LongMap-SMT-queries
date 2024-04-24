; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32882 () Bool)

(assert start!32882)

(declare-fun b!328090 () Bool)

(declare-fun res!180732 () Bool)

(declare-fun e!201717 () Bool)

(assert (=> b!328090 (=> (not res!180732) (not e!201717))))

(declare-datatypes ((array!16791 0))(
  ( (array!16792 (arr!7945 (Array (_ BitVec 32) (_ BitVec 64))) (size!8297 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16791)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3041 0))(
  ( (MissingZero!3041 (index!14340 (_ BitVec 32))) (Found!3041 (index!14341 (_ BitVec 32))) (Intermediate!3041 (undefined!3853 Bool) (index!14342 (_ BitVec 32)) (x!32705 (_ BitVec 32))) (Undefined!3041) (MissingVacant!3041 (index!14343 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16791 (_ BitVec 32)) SeekEntryResult!3041)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328090 (= res!180732 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!3041 false resIndex!58 resX!58)))))

(declare-fun b!328091 () Bool)

(declare-fun res!180729 () Bool)

(assert (=> b!328091 (=> (not res!180729) (not e!201717))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328091 (= res!180729 (and (= (size!8297 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8297 a!3305))))))

(declare-fun b!328092 () Bool)

(declare-fun res!180730 () Bool)

(assert (=> b!328092 (=> (not res!180730) (not e!201717))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16791 (_ BitVec 32)) SeekEntryResult!3041)

(assert (=> b!328092 (= res!180730 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3041 i!1250)))))

(declare-fun b!328093 () Bool)

(assert (=> b!328093 (= e!201717 (or (bvslt resIndex!58 #b00000000000000000000000000000000) (bvsge resIndex!58 (size!8297 a!3305))))))

(declare-fun b!328094 () Bool)

(declare-fun res!180733 () Bool)

(assert (=> b!328094 (=> (not res!180733) (not e!201717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16791 (_ BitVec 32)) Bool)

(assert (=> b!328094 (= res!180733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328095 () Bool)

(declare-fun res!180734 () Bool)

(assert (=> b!328095 (=> (not res!180734) (not e!201717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328095 (= res!180734 (validKeyInArray!0 k0!2497))))

(declare-fun b!328089 () Bool)

(declare-fun res!180735 () Bool)

(assert (=> b!328089 (=> (not res!180735) (not e!201717))))

(declare-fun arrayContainsKey!0 (array!16791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328089 (= res!180735 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun res!180731 () Bool)

(assert (=> start!32882 (=> (not res!180731) (not e!201717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32882 (= res!180731 (validMask!0 mask!3777))))

(assert (=> start!32882 e!201717))

(declare-fun array_inv!5895 (array!16791) Bool)

(assert (=> start!32882 (array_inv!5895 a!3305)))

(assert (=> start!32882 true))

(assert (= (and start!32882 res!180731) b!328091))

(assert (= (and b!328091 res!180729) b!328095))

(assert (= (and b!328095 res!180734) b!328089))

(assert (= (and b!328089 res!180735) b!328092))

(assert (= (and b!328092 res!180730) b!328094))

(assert (= (and b!328094 res!180733) b!328090))

(assert (= (and b!328090 res!180732) b!328093))

(declare-fun m!334441 () Bool)

(assert (=> b!328094 m!334441))

(declare-fun m!334443 () Bool)

(assert (=> b!328090 m!334443))

(assert (=> b!328090 m!334443))

(declare-fun m!334445 () Bool)

(assert (=> b!328090 m!334445))

(declare-fun m!334447 () Bool)

(assert (=> start!32882 m!334447))

(declare-fun m!334449 () Bool)

(assert (=> start!32882 m!334449))

(declare-fun m!334451 () Bool)

(assert (=> b!328089 m!334451))

(declare-fun m!334453 () Bool)

(assert (=> b!328092 m!334453))

(declare-fun m!334455 () Bool)

(assert (=> b!328095 m!334455))

(check-sat (not b!328095) (not b!328094) (not b!328089) (not b!328090) (not start!32882) (not b!328092))
(check-sat)
(get-model)

(declare-fun d!70009 () Bool)

(declare-fun res!180786 () Bool)

(declare-fun e!201744 () Bool)

(assert (=> d!70009 (=> res!180786 e!201744)))

(assert (=> d!70009 (= res!180786 (bvsge #b00000000000000000000000000000000 (size!8297 a!3305)))))

(assert (=> d!70009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777) e!201744)))

(declare-fun bm!26102 () Bool)

(declare-fun call!26105 () Bool)

(assert (=> bm!26102 (= call!26105 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3305 mask!3777))))

(declare-fun b!328154 () Bool)

(declare-fun e!201743 () Bool)

(assert (=> b!328154 (= e!201744 e!201743)))

(declare-fun c!51319 () Bool)

(assert (=> b!328154 (= c!51319 (validKeyInArray!0 (select (arr!7945 a!3305) #b00000000000000000000000000000000)))))

(declare-fun b!328155 () Bool)

(declare-fun e!201742 () Bool)

(assert (=> b!328155 (= e!201742 call!26105)))

(declare-fun b!328156 () Bool)

(assert (=> b!328156 (= e!201743 e!201742)))

(declare-fun lt!157846 () (_ BitVec 64))

(assert (=> b!328156 (= lt!157846 (select (arr!7945 a!3305) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!10150 0))(
  ( (Unit!10151) )
))
(declare-fun lt!157847 () Unit!10150)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16791 (_ BitVec 64) (_ BitVec 32)) Unit!10150)

(assert (=> b!328156 (= lt!157847 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3305 lt!157846 #b00000000000000000000000000000000))))

(assert (=> b!328156 (arrayContainsKey!0 a!3305 lt!157846 #b00000000000000000000000000000000)))

(declare-fun lt!157848 () Unit!10150)

(assert (=> b!328156 (= lt!157848 lt!157847)))

(declare-fun res!180787 () Bool)

(assert (=> b!328156 (= res!180787 (= (seekEntryOrOpen!0 (select (arr!7945 a!3305) #b00000000000000000000000000000000) a!3305 mask!3777) (Found!3041 #b00000000000000000000000000000000)))))

(assert (=> b!328156 (=> (not res!180787) (not e!201742))))

(declare-fun b!328157 () Bool)

(assert (=> b!328157 (= e!201743 call!26105)))

(assert (= (and d!70009 (not res!180786)) b!328154))

(assert (= (and b!328154 c!51319) b!328156))

(assert (= (and b!328154 (not c!51319)) b!328157))

(assert (= (and b!328156 res!180787) b!328155))

(assert (= (or b!328155 b!328157) bm!26102))

(declare-fun m!334489 () Bool)

(assert (=> bm!26102 m!334489))

(declare-fun m!334491 () Bool)

(assert (=> b!328154 m!334491))

(assert (=> b!328154 m!334491))

(declare-fun m!334493 () Bool)

(assert (=> b!328154 m!334493))

(assert (=> b!328156 m!334491))

(declare-fun m!334495 () Bool)

(assert (=> b!328156 m!334495))

(declare-fun m!334497 () Bool)

(assert (=> b!328156 m!334497))

(assert (=> b!328156 m!334491))

(declare-fun m!334499 () Bool)

(assert (=> b!328156 m!334499))

(assert (=> b!328094 d!70009))

(declare-fun b!328225 () Bool)

(declare-fun lt!157866 () SeekEntryResult!3041)

(assert (=> b!328225 (and (bvsge (index!14342 lt!157866) #b00000000000000000000000000000000) (bvslt (index!14342 lt!157866) (size!8297 a!3305)))))

(declare-fun res!180812 () Bool)

(assert (=> b!328225 (= res!180812 (= (select (arr!7945 a!3305) (index!14342 lt!157866)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!201786 () Bool)

(assert (=> b!328225 (=> res!180812 e!201786)))

(declare-fun b!328226 () Bool)

(declare-fun e!201787 () SeekEntryResult!3041)

(declare-fun e!201785 () SeekEntryResult!3041)

(assert (=> b!328226 (= e!201787 e!201785)))

(declare-fun c!51344 () Bool)

(declare-fun lt!157867 () (_ BitVec 64))

(assert (=> b!328226 (= c!51344 (or (= lt!157867 k0!2497) (= (bvadd lt!157867 lt!157867) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!328227 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328227 (= e!201785 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2497 mask!3777) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3777) k0!2497 a!3305 mask!3777))))

(declare-fun b!328228 () Bool)

(declare-fun e!201783 () Bool)

(assert (=> b!328228 (= e!201783 (bvsge (x!32705 lt!157866) #b01111111111111111111111111111110))))

(declare-fun d!70017 () Bool)

(assert (=> d!70017 e!201783))

(declare-fun c!51343 () Bool)

(get-info :version)

(assert (=> d!70017 (= c!51343 (and ((_ is Intermediate!3041) lt!157866) (undefined!3853 lt!157866)))))

(assert (=> d!70017 (= lt!157866 e!201787)))

(declare-fun c!51342 () Bool)

(assert (=> d!70017 (= c!51342 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!70017 (= lt!157867 (select (arr!7945 a!3305) (toIndex!0 k0!2497 mask!3777)))))

(assert (=> d!70017 (validMask!0 mask!3777)))

(assert (=> d!70017 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!157866)))

(declare-fun b!328229 () Bool)

(assert (=> b!328229 (= e!201787 (Intermediate!3041 true (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328230 () Bool)

(assert (=> b!328230 (and (bvsge (index!14342 lt!157866) #b00000000000000000000000000000000) (bvslt (index!14342 lt!157866) (size!8297 a!3305)))))

(declare-fun res!180814 () Bool)

(assert (=> b!328230 (= res!180814 (= (select (arr!7945 a!3305) (index!14342 lt!157866)) k0!2497))))

(assert (=> b!328230 (=> res!180814 e!201786)))

(declare-fun e!201784 () Bool)

(assert (=> b!328230 (= e!201784 e!201786)))

(declare-fun b!328231 () Bool)

(assert (=> b!328231 (= e!201783 e!201784)))

(declare-fun res!180813 () Bool)

(assert (=> b!328231 (= res!180813 (and ((_ is Intermediate!3041) lt!157866) (not (undefined!3853 lt!157866)) (bvslt (x!32705 lt!157866) #b01111111111111111111111111111110) (bvsge (x!32705 lt!157866) #b00000000000000000000000000000000) (bvsge (x!32705 lt!157866) #b00000000000000000000000000000000)))))

(assert (=> b!328231 (=> (not res!180813) (not e!201784))))

(declare-fun b!328232 () Bool)

(assert (=> b!328232 (= e!201785 (Intermediate!3041 false (toIndex!0 k0!2497 mask!3777) #b00000000000000000000000000000000))))

(declare-fun b!328233 () Bool)

(assert (=> b!328233 (and (bvsge (index!14342 lt!157866) #b00000000000000000000000000000000) (bvslt (index!14342 lt!157866) (size!8297 a!3305)))))

(assert (=> b!328233 (= e!201786 (= (select (arr!7945 a!3305) (index!14342 lt!157866)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!70017 c!51342) b!328229))

(assert (= (and d!70017 (not c!51342)) b!328226))

(assert (= (and b!328226 c!51344) b!328232))

(assert (= (and b!328226 (not c!51344)) b!328227))

(assert (= (and d!70017 c!51343) b!328228))

(assert (= (and d!70017 (not c!51343)) b!328231))

(assert (= (and b!328231 res!180813) b!328230))

(assert (= (and b!328230 (not res!180814)) b!328225))

(assert (= (and b!328225 (not res!180812)) b!328233))

(assert (=> b!328227 m!334443))

(declare-fun m!334521 () Bool)

(assert (=> b!328227 m!334521))

(assert (=> b!328227 m!334521))

(declare-fun m!334523 () Bool)

(assert (=> b!328227 m!334523))

(declare-fun m!334525 () Bool)

(assert (=> b!328230 m!334525))

(assert (=> b!328225 m!334525))

(assert (=> b!328233 m!334525))

(assert (=> d!70017 m!334443))

(declare-fun m!334527 () Bool)

(assert (=> d!70017 m!334527))

(assert (=> d!70017 m!334447))

(assert (=> b!328090 d!70017))

(declare-fun d!70023 () Bool)

(declare-fun lt!157881 () (_ BitVec 32))

(declare-fun lt!157880 () (_ BitVec 32))

(assert (=> d!70023 (= lt!157881 (bvmul (bvxor lt!157880 (bvlshr lt!157880 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!70023 (= lt!157880 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!70023 (and (bvsge mask!3777 #b00000000000000000000000000000000) (let ((res!180815 (let ((h!5319 ((_ extract 31 0) (bvand (bvxor k0!2497 (bvlshr k0!2497 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!32712 (bvmul (bvxor h!5319 (bvlshr h!5319 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!32712 (bvlshr x!32712 #b00000000000000000000000000001101)) mask!3777))))) (and (bvslt res!180815 (bvadd mask!3777 #b00000000000000000000000000000001)) (bvsge res!180815 #b00000000000000000000000000000000))))))

(assert (=> d!70023 (= (toIndex!0 k0!2497 mask!3777) (bvand (bvxor lt!157881 (bvlshr lt!157881 #b00000000000000000000000000001101)) mask!3777))))

(assert (=> b!328090 d!70023))

(declare-fun d!70029 () Bool)

(assert (=> d!70029 (= (validKeyInArray!0 k0!2497) (and (not (= k0!2497 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2497 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!328095 d!70029))

(declare-fun d!70031 () Bool)

(assert (=> d!70031 (= (validMask!0 mask!3777) (and (or (= mask!3777 #b00000000000000000000000000000111) (= mask!3777 #b00000000000000000000000000001111) (= mask!3777 #b00000000000000000000000000011111) (= mask!3777 #b00000000000000000000000000111111) (= mask!3777 #b00000000000000000000000001111111) (= mask!3777 #b00000000000000000000000011111111) (= mask!3777 #b00000000000000000000000111111111) (= mask!3777 #b00000000000000000000001111111111) (= mask!3777 #b00000000000000000000011111111111) (= mask!3777 #b00000000000000000000111111111111) (= mask!3777 #b00000000000000000001111111111111) (= mask!3777 #b00000000000000000011111111111111) (= mask!3777 #b00000000000000000111111111111111) (= mask!3777 #b00000000000000001111111111111111) (= mask!3777 #b00000000000000011111111111111111) (= mask!3777 #b00000000000000111111111111111111) (= mask!3777 #b00000000000001111111111111111111) (= mask!3777 #b00000000000011111111111111111111) (= mask!3777 #b00000000000111111111111111111111) (= mask!3777 #b00000000001111111111111111111111) (= mask!3777 #b00000000011111111111111111111111) (= mask!3777 #b00000000111111111111111111111111) (= mask!3777 #b00000001111111111111111111111111) (= mask!3777 #b00000011111111111111111111111111) (= mask!3777 #b00000111111111111111111111111111) (= mask!3777 #b00001111111111111111111111111111) (= mask!3777 #b00011111111111111111111111111111) (= mask!3777 #b00111111111111111111111111111111)) (bvsle mask!3777 #b00111111111111111111111111111111)))))

(assert (=> start!32882 d!70031))

(declare-fun d!70039 () Bool)

(assert (=> d!70039 (= (array_inv!5895 a!3305) (bvsge (size!8297 a!3305) #b00000000000000000000000000000000))))

(assert (=> start!32882 d!70039))

(declare-fun d!70041 () Bool)

(declare-fun res!180836 () Bool)

(declare-fun e!201812 () Bool)

(assert (=> d!70041 (=> res!180836 e!201812)))

(assert (=> d!70041 (= res!180836 (= (select (arr!7945 a!3305) #b00000000000000000000000000000000) k0!2497))))

(assert (=> d!70041 (= (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000) e!201812)))

(declare-fun b!328265 () Bool)

(declare-fun e!201813 () Bool)

(assert (=> b!328265 (= e!201812 e!201813)))

(declare-fun res!180837 () Bool)

(assert (=> b!328265 (=> (not res!180837) (not e!201813))))

(assert (=> b!328265 (= res!180837 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!8297 a!3305)))))

(declare-fun b!328266 () Bool)

(assert (=> b!328266 (= e!201813 (arrayContainsKey!0 a!3305 k0!2497 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!70041 (not res!180836)) b!328265))

(assert (= (and b!328265 res!180837) b!328266))

(assert (=> d!70041 m!334491))

(declare-fun m!334551 () Bool)

(assert (=> b!328266 m!334551))

(assert (=> b!328089 d!70041))

(declare-fun b!328309 () Bool)

(declare-fun e!201836 () SeekEntryResult!3041)

(declare-fun lt!157920 () SeekEntryResult!3041)

(assert (=> b!328309 (= e!201836 (MissingZero!3041 (index!14342 lt!157920)))))

(declare-fun b!328310 () Bool)

(declare-fun e!201835 () SeekEntryResult!3041)

(assert (=> b!328310 (= e!201835 Undefined!3041)))

(declare-fun b!328311 () Bool)

(declare-fun e!201837 () SeekEntryResult!3041)

(assert (=> b!328311 (= e!201837 (Found!3041 (index!14342 lt!157920)))))

(declare-fun b!328313 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16791 (_ BitVec 32)) SeekEntryResult!3041)

(assert (=> b!328313 (= e!201836 (seekKeyOrZeroReturnVacant!0 (x!32705 lt!157920) (index!14342 lt!157920) (index!14342 lt!157920) k0!2497 a!3305 mask!3777))))

(declare-fun b!328314 () Bool)

(declare-fun c!51374 () Bool)

(declare-fun lt!157918 () (_ BitVec 64))

(assert (=> b!328314 (= c!51374 (= lt!157918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!328314 (= e!201837 e!201836)))

(declare-fun b!328312 () Bool)

(assert (=> b!328312 (= e!201835 e!201837)))

(assert (=> b!328312 (= lt!157918 (select (arr!7945 a!3305) (index!14342 lt!157920)))))

(declare-fun c!51372 () Bool)

(assert (=> b!328312 (= c!51372 (= lt!157918 k0!2497))))

(declare-fun d!70043 () Bool)

(declare-fun lt!157919 () SeekEntryResult!3041)

(assert (=> d!70043 (and (or ((_ is Undefined!3041) lt!157919) (not ((_ is Found!3041) lt!157919)) (and (bvsge (index!14341 lt!157919) #b00000000000000000000000000000000) (bvslt (index!14341 lt!157919) (size!8297 a!3305)))) (or ((_ is Undefined!3041) lt!157919) ((_ is Found!3041) lt!157919) (not ((_ is MissingZero!3041) lt!157919)) (and (bvsge (index!14340 lt!157919) #b00000000000000000000000000000000) (bvslt (index!14340 lt!157919) (size!8297 a!3305)))) (or ((_ is Undefined!3041) lt!157919) ((_ is Found!3041) lt!157919) ((_ is MissingZero!3041) lt!157919) (not ((_ is MissingVacant!3041) lt!157919)) (and (bvsge (index!14343 lt!157919) #b00000000000000000000000000000000) (bvslt (index!14343 lt!157919) (size!8297 a!3305)))) (or ((_ is Undefined!3041) lt!157919) (ite ((_ is Found!3041) lt!157919) (= (select (arr!7945 a!3305) (index!14341 lt!157919)) k0!2497) (ite ((_ is MissingZero!3041) lt!157919) (= (select (arr!7945 a!3305) (index!14340 lt!157919)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3041) lt!157919) (= (select (arr!7945 a!3305) (index!14343 lt!157919)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!70043 (= lt!157919 e!201835)))

(declare-fun c!51373 () Bool)

(assert (=> d!70043 (= c!51373 (and ((_ is Intermediate!3041) lt!157920) (undefined!3853 lt!157920)))))

(assert (=> d!70043 (= lt!157920 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777))))

(assert (=> d!70043 (validMask!0 mask!3777)))

(assert (=> d!70043 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) lt!157919)))

(assert (= (and d!70043 c!51373) b!328310))

(assert (= (and d!70043 (not c!51373)) b!328312))

(assert (= (and b!328312 c!51372) b!328311))

(assert (= (and b!328312 (not c!51372)) b!328314))

(assert (= (and b!328314 c!51374) b!328309))

(assert (= (and b!328314 (not c!51374)) b!328313))

(declare-fun m!334563 () Bool)

(assert (=> b!328313 m!334563))

(declare-fun m!334565 () Bool)

(assert (=> b!328312 m!334565))

(declare-fun m!334567 () Bool)

(assert (=> d!70043 m!334567))

(assert (=> d!70043 m!334447))

(assert (=> d!70043 m!334443))

(assert (=> d!70043 m!334445))

(assert (=> d!70043 m!334443))

(declare-fun m!334569 () Bool)

(assert (=> d!70043 m!334569))

(declare-fun m!334571 () Bool)

(assert (=> d!70043 m!334571))

(assert (=> b!328092 d!70043))

(check-sat (not b!328313) (not b!328154) (not b!328266) (not bm!26102) (not b!328156) (not d!70017) (not d!70043) (not b!328227))
(check-sat)
