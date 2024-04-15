; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63932 () Bool)

(assert start!63932)

(declare-fun b!718215 () Bool)

(declare-fun res!480838 () Bool)

(declare-fun e!403174 () Bool)

(assert (=> b!718215 (=> (not res!480838) (not e!403174))))

(declare-datatypes ((array!40689 0))(
  ( (array!40690 (arr!19472 (Array (_ BitVec 32) (_ BitVec 64))) (size!19893 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40689)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718215 (= res!480838 (and (= (size!19893 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19893 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19893 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718217 () Bool)

(declare-fun e!403173 () Bool)

(assert (=> b!718217 (= e!403174 e!403173)))

(declare-fun res!480835 () Bool)

(assert (=> b!718217 (=> (not res!480835) (not e!403173))))

(declare-datatypes ((SeekEntryResult!7069 0))(
  ( (MissingZero!7069 (index!30644 (_ BitVec 32))) (Found!7069 (index!30645 (_ BitVec 32))) (Intermediate!7069 (undefined!7881 Bool) (index!30646 (_ BitVec 32)) (x!61668 (_ BitVec 32))) (Undefined!7069) (MissingVacant!7069 (index!30647 (_ BitVec 32))) )
))
(declare-fun lt!319129 () SeekEntryResult!7069)

(assert (=> b!718217 (= res!480835 (or (= lt!319129 (MissingZero!7069 i!1173)) (= lt!319129 (MissingVacant!7069 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40689 (_ BitVec 32)) SeekEntryResult!7069)

(assert (=> b!718217 (= lt!319129 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718218 () Bool)

(declare-fun res!480841 () Bool)

(assert (=> b!718218 (=> (not res!480841) (not e!403173))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40689 (_ BitVec 32)) Bool)

(assert (=> b!718218 (= res!480841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718219 () Bool)

(declare-fun lt!319130 () (_ BitVec 32))

(assert (=> b!718219 (= e!403173 (and (bvsge mask!3328 #b00000000000000000000000000000000) (or (bvslt lt!319130 #b00000000000000000000000000000000) (bvsge lt!319130 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718219 (= lt!319130 (toIndex!0 (select (arr!19472 a!3186) j!159) mask!3328))))

(declare-fun b!718216 () Bool)

(declare-fun res!480843 () Bool)

(assert (=> b!718216 (=> (not res!480843) (not e!403173))))

(declare-datatypes ((List!13513 0))(
  ( (Nil!13510) (Cons!13509 (h!14554 (_ BitVec 64)) (t!19819 List!13513)) )
))
(declare-fun arrayNoDuplicates!0 (array!40689 (_ BitVec 32) List!13513) Bool)

(assert (=> b!718216 (= res!480843 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13510))))

(declare-fun res!480840 () Bool)

(assert (=> start!63932 (=> (not res!480840) (not e!403174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63932 (= res!480840 (validMask!0 mask!3328))))

(assert (=> start!63932 e!403174))

(assert (=> start!63932 true))

(declare-fun array_inv!15355 (array!40689) Bool)

(assert (=> start!63932 (array_inv!15355 a!3186)))

(declare-fun b!718220 () Bool)

(declare-fun res!480839 () Bool)

(assert (=> b!718220 (=> (not res!480839) (not e!403174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718220 (= res!480839 (validKeyInArray!0 (select (arr!19472 a!3186) j!159)))))

(declare-fun b!718221 () Bool)

(declare-fun res!480836 () Bool)

(assert (=> b!718221 (=> (not res!480836) (not e!403174))))

(assert (=> b!718221 (= res!480836 (validKeyInArray!0 k0!2102))))

(declare-fun b!718222 () Bool)

(declare-fun res!480842 () Bool)

(assert (=> b!718222 (=> (not res!480842) (not e!403173))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718222 (= res!480842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19893 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19893 a!3186))))))

(declare-fun b!718223 () Bool)

(declare-fun res!480837 () Bool)

(assert (=> b!718223 (=> (not res!480837) (not e!403174))))

(declare-fun arrayContainsKey!0 (array!40689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718223 (= res!480837 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63932 res!480840) b!718215))

(assert (= (and b!718215 res!480838) b!718220))

(assert (= (and b!718220 res!480839) b!718221))

(assert (= (and b!718221 res!480836) b!718223))

(assert (= (and b!718223 res!480837) b!718217))

(assert (= (and b!718217 res!480835) b!718218))

(assert (= (and b!718218 res!480841) b!718216))

(assert (= (and b!718216 res!480843) b!718222))

(assert (= (and b!718222 res!480842) b!718219))

(declare-fun m!673343 () Bool)

(assert (=> b!718221 m!673343))

(declare-fun m!673345 () Bool)

(assert (=> b!718217 m!673345))

(declare-fun m!673347 () Bool)

(assert (=> start!63932 m!673347))

(declare-fun m!673349 () Bool)

(assert (=> start!63932 m!673349))

(declare-fun m!673351 () Bool)

(assert (=> b!718216 m!673351))

(declare-fun m!673353 () Bool)

(assert (=> b!718223 m!673353))

(declare-fun m!673355 () Bool)

(assert (=> b!718218 m!673355))

(declare-fun m!673357 () Bool)

(assert (=> b!718219 m!673357))

(assert (=> b!718219 m!673357))

(declare-fun m!673359 () Bool)

(assert (=> b!718219 m!673359))

(assert (=> b!718220 m!673357))

(assert (=> b!718220 m!673357))

(declare-fun m!673361 () Bool)

(assert (=> b!718220 m!673361))

(check-sat (not start!63932) (not b!718216) (not b!718218) (not b!718221) (not b!718217) (not b!718223) (not b!718219) (not b!718220))
(check-sat)
(get-model)

(declare-fun b!718306 () Bool)

(declare-fun e!403214 () SeekEntryResult!7069)

(declare-fun e!403215 () SeekEntryResult!7069)

(assert (=> b!718306 (= e!403214 e!403215)))

(declare-fun lt!319149 () (_ BitVec 64))

(declare-fun lt!319150 () SeekEntryResult!7069)

(assert (=> b!718306 (= lt!319149 (select (arr!19472 a!3186) (index!30646 lt!319150)))))

(declare-fun c!79066 () Bool)

(assert (=> b!718306 (= c!79066 (= lt!319149 k0!2102))))

(declare-fun b!718307 () Bool)

(declare-fun e!403213 () SeekEntryResult!7069)

(assert (=> b!718307 (= e!403213 (MissingZero!7069 (index!30646 lt!319150)))))

(declare-fun d!98819 () Bool)

(declare-fun lt!319151 () SeekEntryResult!7069)

(get-info :version)

(assert (=> d!98819 (and (or ((_ is Undefined!7069) lt!319151) (not ((_ is Found!7069) lt!319151)) (and (bvsge (index!30645 lt!319151) #b00000000000000000000000000000000) (bvslt (index!30645 lt!319151) (size!19893 a!3186)))) (or ((_ is Undefined!7069) lt!319151) ((_ is Found!7069) lt!319151) (not ((_ is MissingZero!7069) lt!319151)) (and (bvsge (index!30644 lt!319151) #b00000000000000000000000000000000) (bvslt (index!30644 lt!319151) (size!19893 a!3186)))) (or ((_ is Undefined!7069) lt!319151) ((_ is Found!7069) lt!319151) ((_ is MissingZero!7069) lt!319151) (not ((_ is MissingVacant!7069) lt!319151)) (and (bvsge (index!30647 lt!319151) #b00000000000000000000000000000000) (bvslt (index!30647 lt!319151) (size!19893 a!3186)))) (or ((_ is Undefined!7069) lt!319151) (ite ((_ is Found!7069) lt!319151) (= (select (arr!19472 a!3186) (index!30645 lt!319151)) k0!2102) (ite ((_ is MissingZero!7069) lt!319151) (= (select (arr!19472 a!3186) (index!30644 lt!319151)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7069) lt!319151) (= (select (arr!19472 a!3186) (index!30647 lt!319151)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!98819 (= lt!319151 e!403214)))

(declare-fun c!79065 () Bool)

(assert (=> d!98819 (= c!79065 (and ((_ is Intermediate!7069) lt!319150) (undefined!7881 lt!319150)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40689 (_ BitVec 32)) SeekEntryResult!7069)

(assert (=> d!98819 (= lt!319150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!98819 (validMask!0 mask!3328)))

(assert (=> d!98819 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319151)))

(declare-fun b!718308 () Bool)

(assert (=> b!718308 (= e!403215 (Found!7069 (index!30646 lt!319150)))))

(declare-fun b!718309 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40689 (_ BitVec 32)) SeekEntryResult!7069)

(assert (=> b!718309 (= e!403213 (seekKeyOrZeroReturnVacant!0 (x!61668 lt!319150) (index!30646 lt!319150) (index!30646 lt!319150) k0!2102 a!3186 mask!3328))))

(declare-fun b!718310 () Bool)

(assert (=> b!718310 (= e!403214 Undefined!7069)))

(declare-fun b!718311 () Bool)

(declare-fun c!79067 () Bool)

(assert (=> b!718311 (= c!79067 (= lt!319149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!718311 (= e!403215 e!403213)))

(assert (= (and d!98819 c!79065) b!718310))

(assert (= (and d!98819 (not c!79065)) b!718306))

(assert (= (and b!718306 c!79066) b!718308))

(assert (= (and b!718306 (not c!79066)) b!718311))

(assert (= (and b!718311 c!79067) b!718307))

(assert (= (and b!718311 (not c!79067)) b!718309))

(declare-fun m!673407 () Bool)

(assert (=> b!718306 m!673407))

(declare-fun m!673409 () Bool)

(assert (=> d!98819 m!673409))

(declare-fun m!673411 () Bool)

(assert (=> d!98819 m!673411))

(declare-fun m!673413 () Bool)

(assert (=> d!98819 m!673413))

(declare-fun m!673415 () Bool)

(assert (=> d!98819 m!673415))

(assert (=> d!98819 m!673347))

(assert (=> d!98819 m!673411))

(declare-fun m!673417 () Bool)

(assert (=> d!98819 m!673417))

(declare-fun m!673419 () Bool)

(assert (=> b!718309 m!673419))

(assert (=> b!718217 d!98819))

(declare-fun d!98829 () Bool)

(declare-fun res!480919 () Bool)

(declare-fun e!403224 () Bool)

(assert (=> d!98829 (=> res!480919 e!403224)))

(assert (=> d!98829 (= res!480919 (= (select (arr!19472 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!98829 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403224)))

(declare-fun b!718321 () Bool)

(declare-fun e!403225 () Bool)

(assert (=> b!718321 (= e!403224 e!403225)))

(declare-fun res!480920 () Bool)

(assert (=> b!718321 (=> (not res!480920) (not e!403225))))

(assert (=> b!718321 (= res!480920 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19893 a!3186)))))

(declare-fun b!718322 () Bool)

(assert (=> b!718322 (= e!403225 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!98829 (not res!480919)) b!718321))

(assert (= (and b!718321 res!480920) b!718322))

(declare-fun m!673429 () Bool)

(assert (=> d!98829 m!673429))

(declare-fun m!673431 () Bool)

(assert (=> b!718322 m!673431))

(assert (=> b!718223 d!98829))

(declare-fun d!98835 () Bool)

(declare-fun res!480934 () Bool)

(declare-fun e!403246 () Bool)

(assert (=> d!98835 (=> res!480934 e!403246)))

(assert (=> d!98835 (= res!480934 (bvsge #b00000000000000000000000000000000 (size!19893 a!3186)))))

(assert (=> d!98835 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403246)))

(declare-fun b!718346 () Bool)

(declare-fun e!403244 () Bool)

(declare-fun e!403245 () Bool)

(assert (=> b!718346 (= e!403244 e!403245)))

(declare-fun lt!319172 () (_ BitVec 64))

(assert (=> b!718346 (= lt!319172 (select (arr!19472 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24630 0))(
  ( (Unit!24631) )
))
(declare-fun lt!319170 () Unit!24630)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40689 (_ BitVec 64) (_ BitVec 32)) Unit!24630)

(assert (=> b!718346 (= lt!319170 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319172 #b00000000000000000000000000000000))))

(assert (=> b!718346 (arrayContainsKey!0 a!3186 lt!319172 #b00000000000000000000000000000000)))

(declare-fun lt!319171 () Unit!24630)

(assert (=> b!718346 (= lt!319171 lt!319170)))

(declare-fun res!480935 () Bool)

(assert (=> b!718346 (= res!480935 (= (seekEntryOrOpen!0 (select (arr!19472 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7069 #b00000000000000000000000000000000)))))

(assert (=> b!718346 (=> (not res!480935) (not e!403245))))

(declare-fun bm!34711 () Bool)

(declare-fun call!34714 () Bool)

(assert (=> bm!34711 (= call!34714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!718347 () Bool)

(assert (=> b!718347 (= e!403245 call!34714)))

(declare-fun b!718348 () Bool)

(assert (=> b!718348 (= e!403246 e!403244)))

(declare-fun c!79074 () Bool)

(assert (=> b!718348 (= c!79074 (validKeyInArray!0 (select (arr!19472 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718349 () Bool)

(assert (=> b!718349 (= e!403244 call!34714)))

(assert (= (and d!98835 (not res!480934)) b!718348))

(assert (= (and b!718348 c!79074) b!718346))

(assert (= (and b!718348 (not c!79074)) b!718349))

(assert (= (and b!718346 res!480935) b!718347))

(assert (= (or b!718347 b!718349) bm!34711))

(assert (=> b!718346 m!673429))

(declare-fun m!673439 () Bool)

(assert (=> b!718346 m!673439))

(declare-fun m!673441 () Bool)

(assert (=> b!718346 m!673441))

(assert (=> b!718346 m!673429))

(declare-fun m!673443 () Bool)

(assert (=> b!718346 m!673443))

(declare-fun m!673445 () Bool)

(assert (=> bm!34711 m!673445))

(assert (=> b!718348 m!673429))

(assert (=> b!718348 m!673429))

(declare-fun m!673447 () Bool)

(assert (=> b!718348 m!673447))

(assert (=> b!718218 d!98835))

(declare-fun d!98845 () Bool)

(assert (=> d!98845 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63932 d!98845))

(declare-fun d!98847 () Bool)

(assert (=> d!98847 (= (array_inv!15355 a!3186) (bvsge (size!19893 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63932 d!98847))

(declare-fun d!98849 () Bool)

(declare-fun lt!319196 () (_ BitVec 32))

(declare-fun lt!319195 () (_ BitVec 32))

(assert (=> d!98849 (= lt!319196 (bvmul (bvxor lt!319195 (bvlshr lt!319195 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!98849 (= lt!319195 ((_ extract 31 0) (bvand (bvxor (select (arr!19472 a!3186) j!159) (bvlshr (select (arr!19472 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!98849 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!480936 (let ((h!14559 ((_ extract 31 0) (bvand (bvxor (select (arr!19472 a!3186) j!159) (bvlshr (select (arr!19472 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!61673 (bvmul (bvxor h!14559 (bvlshr h!14559 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!61673 (bvlshr x!61673 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!480936 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!480936 #b00000000000000000000000000000000))))))

(assert (=> d!98849 (= (toIndex!0 (select (arr!19472 a!3186) j!159) mask!3328) (bvand (bvxor lt!319196 (bvlshr lt!319196 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!718219 d!98849))

(declare-fun d!98857 () Bool)

(assert (=> d!98857 (= (validKeyInArray!0 (select (arr!19472 a!3186) j!159)) (and (not (= (select (arr!19472 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19472 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718220 d!98857))

(declare-fun d!98859 () Bool)

(assert (=> d!98859 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718221 d!98859))

(declare-fun b!718414 () Bool)

(declare-fun e!403288 () Bool)

(declare-fun e!403290 () Bool)

(assert (=> b!718414 (= e!403288 e!403290)))

(declare-fun res!480956 () Bool)

(assert (=> b!718414 (=> (not res!480956) (not e!403290))))

(declare-fun e!403289 () Bool)

(assert (=> b!718414 (= res!480956 (not e!403289))))

(declare-fun res!480955 () Bool)

(assert (=> b!718414 (=> (not res!480955) (not e!403289))))

(assert (=> b!718414 (= res!480955 (validKeyInArray!0 (select (arr!19472 a!3186) #b00000000000000000000000000000000)))))

(declare-fun d!98861 () Bool)

(declare-fun res!480957 () Bool)

(assert (=> d!98861 (=> res!480957 e!403288)))

(assert (=> d!98861 (= res!480957 (bvsge #b00000000000000000000000000000000 (size!19893 a!3186)))))

(assert (=> d!98861 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13510) e!403288)))

(declare-fun b!718415 () Bool)

(declare-fun contains!4022 (List!13513 (_ BitVec 64)) Bool)

(assert (=> b!718415 (= e!403289 (contains!4022 Nil!13510 (select (arr!19472 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718416 () Bool)

(declare-fun e!403291 () Bool)

(declare-fun call!34720 () Bool)

(assert (=> b!718416 (= e!403291 call!34720)))

(declare-fun b!718417 () Bool)

(assert (=> b!718417 (= e!403291 call!34720)))

(declare-fun bm!34717 () Bool)

(declare-fun c!79098 () Bool)

(assert (=> bm!34717 (= call!34720 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79098 (Cons!13509 (select (arr!19472 a!3186) #b00000000000000000000000000000000) Nil!13510) Nil!13510)))))

(declare-fun b!718418 () Bool)

(assert (=> b!718418 (= e!403290 e!403291)))

(assert (=> b!718418 (= c!79098 (validKeyInArray!0 (select (arr!19472 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!98861 (not res!480957)) b!718414))

(assert (= (and b!718414 res!480955) b!718415))

(assert (= (and b!718414 res!480956) b!718418))

(assert (= (and b!718418 c!79098) b!718416))

(assert (= (and b!718418 (not c!79098)) b!718417))

(assert (= (or b!718416 b!718417) bm!34717))

(assert (=> b!718414 m!673429))

(assert (=> b!718414 m!673429))

(assert (=> b!718414 m!673447))

(assert (=> b!718415 m!673429))

(assert (=> b!718415 m!673429))

(declare-fun m!673487 () Bool)

(assert (=> b!718415 m!673487))

(assert (=> bm!34717 m!673429))

(declare-fun m!673489 () Bool)

(assert (=> bm!34717 m!673489))

(assert (=> b!718418 m!673429))

(assert (=> b!718418 m!673429))

(assert (=> b!718418 m!673447))

(assert (=> b!718216 d!98861))

(check-sat (not bm!34711) (not bm!34717) (not b!718348) (not b!718414) (not b!718346) (not b!718418) (not d!98819) (not b!718322) (not b!718309) (not b!718415))
(check-sat)
