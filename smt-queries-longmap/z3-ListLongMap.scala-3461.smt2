; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48026 () Bool)

(assert start!48026)

(declare-fun b!529198 () Bool)

(declare-fun res!325143 () Bool)

(declare-fun e!308356 () Bool)

(assert (=> b!529198 (=> (not res!325143) (not e!308356))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529198 (= res!325143 (validKeyInArray!0 k0!2280))))

(declare-fun b!529199 () Bool)

(declare-fun res!325148 () Bool)

(assert (=> b!529199 (=> (not res!325148) (not e!308356))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33520 0))(
  ( (array!33521 (arr!16108 (Array (_ BitVec 32) (_ BitVec 64))) (size!16472 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33520)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!529199 (= res!325148 (and (= (size!16472 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16472 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16472 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!308358 () Bool)

(declare-fun b!529200 () Bool)

(declare-datatypes ((SeekEntryResult!4531 0))(
  ( (MissingZero!4531 (index!20348 (_ BitVec 32))) (Found!4531 (index!20349 (_ BitVec 32))) (Intermediate!4531 (undefined!5343 Bool) (index!20350 (_ BitVec 32)) (x!49464 (_ BitVec 32))) (Undefined!4531) (MissingVacant!4531 (index!20351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33520 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!529200 (= e!308358 (= (seekEntryOrOpen!0 (select (arr!16108 a!3235) j!176) a!3235 mask!3524) (Found!4531 j!176)))))

(declare-fun b!529201 () Bool)

(declare-fun e!308357 () Bool)

(assert (=> b!529201 (= e!308356 e!308357)))

(declare-fun res!325146 () Bool)

(assert (=> b!529201 (=> (not res!325146) (not e!308357))))

(declare-fun lt!244008 () SeekEntryResult!4531)

(assert (=> b!529201 (= res!325146 (or (= lt!244008 (MissingZero!4531 i!1204)) (= lt!244008 (MissingVacant!4531 i!1204))))))

(assert (=> b!529201 (= lt!244008 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!325142 () Bool)

(assert (=> start!48026 (=> (not res!325142) (not e!308356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48026 (= res!325142 (validMask!0 mask!3524))))

(assert (=> start!48026 e!308356))

(assert (=> start!48026 true))

(declare-fun array_inv!11967 (array!33520) Bool)

(assert (=> start!48026 (array_inv!11967 a!3235)))

(declare-fun b!529202 () Bool)

(declare-fun res!325144 () Bool)

(assert (=> b!529202 (=> (not res!325144) (not e!308357))))

(declare-datatypes ((List!10173 0))(
  ( (Nil!10170) (Cons!10169 (h!11106 (_ BitVec 64)) (t!16393 List!10173)) )
))
(declare-fun arrayNoDuplicates!0 (array!33520 (_ BitVec 32) List!10173) Bool)

(assert (=> b!529202 (= res!325144 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10170))))

(declare-fun b!529203 () Bool)

(declare-fun res!325145 () Bool)

(assert (=> b!529203 (=> (not res!325145) (not e!308357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33520 (_ BitVec 32)) Bool)

(assert (=> b!529203 (= res!325145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529204 () Bool)

(declare-fun e!308355 () Bool)

(assert (=> b!529204 (= e!308357 (not e!308355))))

(declare-fun res!325141 () Bool)

(assert (=> b!529204 (=> res!325141 e!308355)))

(declare-fun lt!244007 () (_ BitVec 32))

(declare-fun lt!244006 () SeekEntryResult!4531)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33520 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!529204 (= res!325141 (= lt!244006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244007 (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)) mask!3524)))))

(declare-fun lt!244004 () (_ BitVec 32))

(assert (=> b!529204 (= lt!244006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244004 (select (arr!16108 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529204 (= lt!244007 (toIndex!0 (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!529204 (= lt!244004 (toIndex!0 (select (arr!16108 a!3235) j!176) mask!3524))))

(assert (=> b!529204 e!308358))

(declare-fun res!325150 () Bool)

(assert (=> b!529204 (=> (not res!325150) (not e!308358))))

(assert (=> b!529204 (= res!325150 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16735 0))(
  ( (Unit!16736) )
))
(declare-fun lt!244009 () Unit!16735)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16735)

(assert (=> b!529204 (= lt!244009 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529205 () Bool)

(declare-fun res!325149 () Bool)

(assert (=> b!529205 (=> (not res!325149) (not e!308356))))

(declare-fun arrayContainsKey!0 (array!33520 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529205 (= res!325149 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529206 () Bool)

(declare-fun lt!244005 () Bool)

(assert (=> b!529206 (= e!308355 (or (and (not lt!244005) (undefined!5343 lt!244006)) (and (not lt!244005) (not (undefined!5343 lt!244006)))))))

(get-info :version)

(assert (=> b!529206 (= lt!244005 (not ((_ is Intermediate!4531) lt!244006)))))

(declare-fun b!529207 () Bool)

(declare-fun res!325147 () Bool)

(assert (=> b!529207 (=> (not res!325147) (not e!308356))))

(assert (=> b!529207 (= res!325147 (validKeyInArray!0 (select (arr!16108 a!3235) j!176)))))

(assert (= (and start!48026 res!325142) b!529199))

(assert (= (and b!529199 res!325148) b!529207))

(assert (= (and b!529207 res!325147) b!529198))

(assert (= (and b!529198 res!325143) b!529205))

(assert (= (and b!529205 res!325149) b!529201))

(assert (= (and b!529201 res!325146) b!529203))

(assert (= (and b!529203 res!325145) b!529202))

(assert (= (and b!529202 res!325144) b!529204))

(assert (= (and b!529204 res!325150) b!529200))

(assert (= (and b!529204 (not res!325141)) b!529206))

(declare-fun m!509989 () Bool)

(assert (=> b!529207 m!509989))

(assert (=> b!529207 m!509989))

(declare-fun m!509991 () Bool)

(assert (=> b!529207 m!509991))

(declare-fun m!509993 () Bool)

(assert (=> b!529198 m!509993))

(declare-fun m!509995 () Bool)

(assert (=> start!48026 m!509995))

(declare-fun m!509997 () Bool)

(assert (=> start!48026 m!509997))

(declare-fun m!509999 () Bool)

(assert (=> b!529201 m!509999))

(declare-fun m!510001 () Bool)

(assert (=> b!529202 m!510001))

(assert (=> b!529204 m!509989))

(declare-fun m!510003 () Bool)

(assert (=> b!529204 m!510003))

(declare-fun m!510005 () Bool)

(assert (=> b!529204 m!510005))

(declare-fun m!510007 () Bool)

(assert (=> b!529204 m!510007))

(assert (=> b!529204 m!509989))

(declare-fun m!510009 () Bool)

(assert (=> b!529204 m!510009))

(assert (=> b!529204 m!509989))

(declare-fun m!510011 () Bool)

(assert (=> b!529204 m!510011))

(assert (=> b!529204 m!510007))

(declare-fun m!510013 () Bool)

(assert (=> b!529204 m!510013))

(declare-fun m!510015 () Bool)

(assert (=> b!529204 m!510015))

(assert (=> b!529204 m!510007))

(declare-fun m!510017 () Bool)

(assert (=> b!529204 m!510017))

(declare-fun m!510019 () Bool)

(assert (=> b!529203 m!510019))

(assert (=> b!529200 m!509989))

(assert (=> b!529200 m!509989))

(declare-fun m!510021 () Bool)

(assert (=> b!529200 m!510021))

(declare-fun m!510023 () Bool)

(assert (=> b!529205 m!510023))

(check-sat (not b!529207) (not b!529200) (not b!529202) (not b!529203) (not start!48026) (not b!529205) (not b!529201) (not b!529198) (not b!529204))
(check-sat)
(get-model)

(declare-fun d!81051 () Bool)

(assert (=> d!81051 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529198 d!81051))

(declare-fun b!529276 () Bool)

(declare-fun e!308395 () Bool)

(declare-fun e!308396 () Bool)

(assert (=> b!529276 (= e!308395 e!308396)))

(declare-fun lt!244052 () (_ BitVec 64))

(assert (=> b!529276 (= lt!244052 (select (arr!16108 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!244053 () Unit!16735)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33520 (_ BitVec 64) (_ BitVec 32)) Unit!16735)

(assert (=> b!529276 (= lt!244053 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244052 #b00000000000000000000000000000000))))

(assert (=> b!529276 (arrayContainsKey!0 a!3235 lt!244052 #b00000000000000000000000000000000)))

(declare-fun lt!244054 () Unit!16735)

(assert (=> b!529276 (= lt!244054 lt!244053)))

(declare-fun res!325215 () Bool)

(assert (=> b!529276 (= res!325215 (= (seekEntryOrOpen!0 (select (arr!16108 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4531 #b00000000000000000000000000000000)))))

(assert (=> b!529276 (=> (not res!325215) (not e!308396))))

(declare-fun b!529277 () Bool)

(declare-fun call!31902 () Bool)

(assert (=> b!529277 (= e!308396 call!31902)))

(declare-fun b!529278 () Bool)

(declare-fun e!308397 () Bool)

(assert (=> b!529278 (= e!308397 e!308395)))

(declare-fun c!62339 () Bool)

(assert (=> b!529278 (= c!62339 (validKeyInArray!0 (select (arr!16108 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!81053 () Bool)

(declare-fun res!325216 () Bool)

(assert (=> d!81053 (=> res!325216 e!308397)))

(assert (=> d!81053 (= res!325216 (bvsge #b00000000000000000000000000000000 (size!16472 a!3235)))))

(assert (=> d!81053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!308397)))

(declare-fun b!529279 () Bool)

(assert (=> b!529279 (= e!308395 call!31902)))

(declare-fun bm!31899 () Bool)

(assert (=> bm!31899 (= call!31902 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!81053 (not res!325216)) b!529278))

(assert (= (and b!529278 c!62339) b!529276))

(assert (= (and b!529278 (not c!62339)) b!529279))

(assert (= (and b!529276 res!325215) b!529277))

(assert (= (or b!529277 b!529279) bm!31899))

(declare-fun m!510097 () Bool)

(assert (=> b!529276 m!510097))

(declare-fun m!510099 () Bool)

(assert (=> b!529276 m!510099))

(declare-fun m!510101 () Bool)

(assert (=> b!529276 m!510101))

(assert (=> b!529276 m!510097))

(declare-fun m!510103 () Bool)

(assert (=> b!529276 m!510103))

(assert (=> b!529278 m!510097))

(assert (=> b!529278 m!510097))

(declare-fun m!510105 () Bool)

(assert (=> b!529278 m!510105))

(declare-fun m!510107 () Bool)

(assert (=> bm!31899 m!510107))

(assert (=> b!529203 d!81053))

(declare-fun d!81055 () Bool)

(declare-fun lt!244060 () (_ BitVec 32))

(declare-fun lt!244059 () (_ BitVec 32))

(assert (=> d!81055 (= lt!244060 (bvmul (bvxor lt!244059 (bvlshr lt!244059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81055 (= lt!244059 ((_ extract 31 0) (bvand (bvxor (select (arr!16108 a!3235) j!176) (bvlshr (select (arr!16108 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81055 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325217 (let ((h!11109 ((_ extract 31 0) (bvand (bvxor (select (arr!16108 a!3235) j!176) (bvlshr (select (arr!16108 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49467 (bvmul (bvxor h!11109 (bvlshr h!11109 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49467 (bvlshr x!49467 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325217 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325217 #b00000000000000000000000000000000))))))

(assert (=> d!81055 (= (toIndex!0 (select (arr!16108 a!3235) j!176) mask!3524) (bvand (bvxor lt!244060 (bvlshr lt!244060 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529204 d!81055))

(declare-fun b!529280 () Bool)

(declare-fun e!308398 () Bool)

(declare-fun e!308399 () Bool)

(assert (=> b!529280 (= e!308398 e!308399)))

(declare-fun lt!244061 () (_ BitVec 64))

(assert (=> b!529280 (= lt!244061 (select (arr!16108 a!3235) j!176))))

(declare-fun lt!244062 () Unit!16735)

(assert (=> b!529280 (= lt!244062 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!244061 j!176))))

(assert (=> b!529280 (arrayContainsKey!0 a!3235 lt!244061 #b00000000000000000000000000000000)))

(declare-fun lt!244063 () Unit!16735)

(assert (=> b!529280 (= lt!244063 lt!244062)))

(declare-fun res!325218 () Bool)

(assert (=> b!529280 (= res!325218 (= (seekEntryOrOpen!0 (select (arr!16108 a!3235) j!176) a!3235 mask!3524) (Found!4531 j!176)))))

(assert (=> b!529280 (=> (not res!325218) (not e!308399))))

(declare-fun b!529281 () Bool)

(declare-fun call!31903 () Bool)

(assert (=> b!529281 (= e!308399 call!31903)))

(declare-fun b!529282 () Bool)

(declare-fun e!308400 () Bool)

(assert (=> b!529282 (= e!308400 e!308398)))

(declare-fun c!62340 () Bool)

(assert (=> b!529282 (= c!62340 (validKeyInArray!0 (select (arr!16108 a!3235) j!176)))))

(declare-fun d!81057 () Bool)

(declare-fun res!325219 () Bool)

(assert (=> d!81057 (=> res!325219 e!308400)))

(assert (=> d!81057 (= res!325219 (bvsge j!176 (size!16472 a!3235)))))

(assert (=> d!81057 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!308400)))

(declare-fun b!529283 () Bool)

(assert (=> b!529283 (= e!308398 call!31903)))

(declare-fun bm!31900 () Bool)

(assert (=> bm!31900 (= call!31903 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(assert (= (and d!81057 (not res!325219)) b!529282))

(assert (= (and b!529282 c!62340) b!529280))

(assert (= (and b!529282 (not c!62340)) b!529283))

(assert (= (and b!529280 res!325218) b!529281))

(assert (= (or b!529281 b!529283) bm!31900))

(assert (=> b!529280 m!509989))

(declare-fun m!510109 () Bool)

(assert (=> b!529280 m!510109))

(declare-fun m!510111 () Bool)

(assert (=> b!529280 m!510111))

(assert (=> b!529280 m!509989))

(assert (=> b!529280 m!510021))

(assert (=> b!529282 m!509989))

(assert (=> b!529282 m!509989))

(assert (=> b!529282 m!509991))

(declare-fun m!510113 () Bool)

(assert (=> bm!31900 m!510113))

(assert (=> b!529204 d!81057))

(declare-fun d!81059 () Bool)

(declare-fun lt!244065 () (_ BitVec 32))

(declare-fun lt!244064 () (_ BitVec 32))

(assert (=> d!81059 (= lt!244065 (bvmul (bvxor lt!244064 (bvlshr lt!244064 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81059 (= lt!244064 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81059 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!325217 (let ((h!11109 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49467 (bvmul (bvxor h!11109 (bvlshr h!11109 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49467 (bvlshr x!49467 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!325217 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!325217 #b00000000000000000000000000000000))))))

(assert (=> d!81059 (= (toIndex!0 (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!244065 (bvlshr lt!244065 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!529204 d!81059))

(declare-fun lt!244077 () SeekEntryResult!4531)

(declare-fun b!529302 () Bool)

(assert (=> b!529302 (and (bvsge (index!20350 lt!244077) #b00000000000000000000000000000000) (bvslt (index!20350 lt!244077) (size!16472 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)))))))

(declare-fun res!325227 () Bool)

(assert (=> b!529302 (= res!325227 (= (select (arr!16108 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235))) (index!20350 lt!244077)) (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!308412 () Bool)

(assert (=> b!529302 (=> res!325227 e!308412)))

(declare-fun e!308415 () Bool)

(assert (=> b!529302 (= e!308415 e!308412)))

(declare-fun b!529304 () Bool)

(declare-fun e!308413 () SeekEntryResult!4531)

(assert (=> b!529304 (= e!308413 (Intermediate!4531 true lt!244007 #b00000000000000000000000000000000))))

(declare-fun b!529305 () Bool)

(declare-fun e!308414 () SeekEntryResult!4531)

(assert (=> b!529305 (= e!308413 e!308414)))

(declare-fun lt!244076 () (_ BitVec 64))

(declare-fun c!62347 () Bool)

(assert (=> b!529305 (= c!62347 (or (= lt!244076 (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!244076 lt!244076) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529306 () Bool)

(assert (=> b!529306 (and (bvsge (index!20350 lt!244077) #b00000000000000000000000000000000) (bvslt (index!20350 lt!244077) (size!16472 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)))))))

(declare-fun res!325228 () Bool)

(assert (=> b!529306 (= res!325228 (= (select (arr!16108 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235))) (index!20350 lt!244077)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529306 (=> res!325228 e!308412)))

(declare-fun b!529307 () Bool)

(declare-fun e!308411 () Bool)

(assert (=> b!529307 (= e!308411 e!308415)))

(declare-fun res!325229 () Bool)

(assert (=> b!529307 (= res!325229 (and ((_ is Intermediate!4531) lt!244077) (not (undefined!5343 lt!244077)) (bvslt (x!49464 lt!244077) #b01111111111111111111111111111110) (bvsge (x!49464 lt!244077) #b00000000000000000000000000000000) (bvsge (x!49464 lt!244077) #b00000000000000000000000000000000)))))

(assert (=> b!529307 (=> (not res!325229) (not e!308415))))

(declare-fun b!529308 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529308 (= e!308414 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!244007 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)) mask!3524))))

(declare-fun b!529303 () Bool)

(assert (=> b!529303 (= e!308411 (bvsge (x!49464 lt!244077) #b01111111111111111111111111111110))))

(declare-fun d!81061 () Bool)

(assert (=> d!81061 e!308411))

(declare-fun c!62349 () Bool)

(assert (=> d!81061 (= c!62349 (and ((_ is Intermediate!4531) lt!244077) (undefined!5343 lt!244077)))))

(assert (=> d!81061 (= lt!244077 e!308413)))

(declare-fun c!62348 () Bool)

(assert (=> d!81061 (= c!62348 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81061 (= lt!244076 (select (arr!16108 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235))) lt!244007))))

(assert (=> d!81061 (validMask!0 mask!3524)))

(assert (=> d!81061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244007 (select (store (arr!16108 a!3235) i!1204 k0!2280) j!176) (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)) mask!3524) lt!244077)))

(declare-fun b!529309 () Bool)

(assert (=> b!529309 (and (bvsge (index!20350 lt!244077) #b00000000000000000000000000000000) (bvslt (index!20350 lt!244077) (size!16472 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235)))))))

(assert (=> b!529309 (= e!308412 (= (select (arr!16108 (array!33521 (store (arr!16108 a!3235) i!1204 k0!2280) (size!16472 a!3235))) (index!20350 lt!244077)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529310 () Bool)

(assert (=> b!529310 (= e!308414 (Intermediate!4531 false lt!244007 #b00000000000000000000000000000000))))

(assert (= (and d!81061 c!62348) b!529304))

(assert (= (and d!81061 (not c!62348)) b!529305))

(assert (= (and b!529305 c!62347) b!529310))

(assert (= (and b!529305 (not c!62347)) b!529308))

(assert (= (and d!81061 c!62349) b!529303))

(assert (= (and d!81061 (not c!62349)) b!529307))

(assert (= (and b!529307 res!325229) b!529302))

(assert (= (and b!529302 (not res!325227)) b!529306))

(assert (= (and b!529306 (not res!325228)) b!529309))

(declare-fun m!510115 () Bool)

(assert (=> b!529309 m!510115))

(assert (=> b!529306 m!510115))

(assert (=> b!529302 m!510115))

(declare-fun m!510117 () Bool)

(assert (=> d!81061 m!510117))

(assert (=> d!81061 m!509995))

(declare-fun m!510119 () Bool)

(assert (=> b!529308 m!510119))

(assert (=> b!529308 m!510119))

(assert (=> b!529308 m!510007))

(declare-fun m!510121 () Bool)

(assert (=> b!529308 m!510121))

(assert (=> b!529204 d!81061))

(declare-fun b!529311 () Bool)

(declare-fun lt!244079 () SeekEntryResult!4531)

(assert (=> b!529311 (and (bvsge (index!20350 lt!244079) #b00000000000000000000000000000000) (bvslt (index!20350 lt!244079) (size!16472 a!3235)))))

(declare-fun res!325230 () Bool)

(assert (=> b!529311 (= res!325230 (= (select (arr!16108 a!3235) (index!20350 lt!244079)) (select (arr!16108 a!3235) j!176)))))

(declare-fun e!308417 () Bool)

(assert (=> b!529311 (=> res!325230 e!308417)))

(declare-fun e!308420 () Bool)

(assert (=> b!529311 (= e!308420 e!308417)))

(declare-fun b!529313 () Bool)

(declare-fun e!308418 () SeekEntryResult!4531)

(assert (=> b!529313 (= e!308418 (Intermediate!4531 true lt!244004 #b00000000000000000000000000000000))))

(declare-fun b!529314 () Bool)

(declare-fun e!308419 () SeekEntryResult!4531)

(assert (=> b!529314 (= e!308418 e!308419)))

(declare-fun lt!244078 () (_ BitVec 64))

(declare-fun c!62350 () Bool)

(assert (=> b!529314 (= c!62350 (or (= lt!244078 (select (arr!16108 a!3235) j!176)) (= (bvadd lt!244078 lt!244078) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529315 () Bool)

(assert (=> b!529315 (and (bvsge (index!20350 lt!244079) #b00000000000000000000000000000000) (bvslt (index!20350 lt!244079) (size!16472 a!3235)))))

(declare-fun res!325231 () Bool)

(assert (=> b!529315 (= res!325231 (= (select (arr!16108 a!3235) (index!20350 lt!244079)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!529315 (=> res!325231 e!308417)))

(declare-fun b!529316 () Bool)

(declare-fun e!308416 () Bool)

(assert (=> b!529316 (= e!308416 e!308420)))

(declare-fun res!325232 () Bool)

(assert (=> b!529316 (= res!325232 (and ((_ is Intermediate!4531) lt!244079) (not (undefined!5343 lt!244079)) (bvslt (x!49464 lt!244079) #b01111111111111111111111111111110) (bvsge (x!49464 lt!244079) #b00000000000000000000000000000000) (bvsge (x!49464 lt!244079) #b00000000000000000000000000000000)))))

(assert (=> b!529316 (=> (not res!325232) (not e!308420))))

(declare-fun b!529317 () Bool)

(assert (=> b!529317 (= e!308419 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!244004 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!16108 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!529312 () Bool)

(assert (=> b!529312 (= e!308416 (bvsge (x!49464 lt!244079) #b01111111111111111111111111111110))))

(declare-fun d!81069 () Bool)

(assert (=> d!81069 e!308416))

(declare-fun c!62352 () Bool)

(assert (=> d!81069 (= c!62352 (and ((_ is Intermediate!4531) lt!244079) (undefined!5343 lt!244079)))))

(assert (=> d!81069 (= lt!244079 e!308418)))

(declare-fun c!62351 () Bool)

(assert (=> d!81069 (= c!62351 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!81069 (= lt!244078 (select (arr!16108 a!3235) lt!244004))))

(assert (=> d!81069 (validMask!0 mask!3524)))

(assert (=> d!81069 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244004 (select (arr!16108 a!3235) j!176) a!3235 mask!3524) lt!244079)))

(declare-fun b!529318 () Bool)

(assert (=> b!529318 (and (bvsge (index!20350 lt!244079) #b00000000000000000000000000000000) (bvslt (index!20350 lt!244079) (size!16472 a!3235)))))

(assert (=> b!529318 (= e!308417 (= (select (arr!16108 a!3235) (index!20350 lt!244079)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!529319 () Bool)

(assert (=> b!529319 (= e!308419 (Intermediate!4531 false lt!244004 #b00000000000000000000000000000000))))

(assert (= (and d!81069 c!62351) b!529313))

(assert (= (and d!81069 (not c!62351)) b!529314))

(assert (= (and b!529314 c!62350) b!529319))

(assert (= (and b!529314 (not c!62350)) b!529317))

(assert (= (and d!81069 c!62352) b!529312))

(assert (= (and d!81069 (not c!62352)) b!529316))

(assert (= (and b!529316 res!325232) b!529311))

(assert (= (and b!529311 (not res!325230)) b!529315))

(assert (= (and b!529315 (not res!325231)) b!529318))

(declare-fun m!510123 () Bool)

(assert (=> b!529318 m!510123))

(assert (=> b!529315 m!510123))

(assert (=> b!529311 m!510123))

(declare-fun m!510125 () Bool)

(assert (=> d!81069 m!510125))

(assert (=> d!81069 m!509995))

(declare-fun m!510127 () Bool)

(assert (=> b!529317 m!510127))

(assert (=> b!529317 m!510127))

(assert (=> b!529317 m!509989))

(declare-fun m!510129 () Bool)

(assert (=> b!529317 m!510129))

(assert (=> b!529204 d!81069))

(declare-fun d!81071 () Bool)

(assert (=> d!81071 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!244100 () Unit!16735)

(declare-fun choose!38 (array!33520 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16735)

(assert (=> d!81071 (= lt!244100 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!81071 (validMask!0 mask!3524)))

(assert (=> d!81071 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!244100)))

(declare-fun bs!16589 () Bool)

(assert (= bs!16589 d!81071))

(assert (=> bs!16589 m!510011))

(declare-fun m!510131 () Bool)

(assert (=> bs!16589 m!510131))

(assert (=> bs!16589 m!509995))

(assert (=> b!529204 d!81071))

(declare-fun b!529372 () Bool)

(declare-fun e!308457 () Bool)

(declare-fun e!308459 () Bool)

(assert (=> b!529372 (= e!308457 e!308459)))

(declare-fun res!325252 () Bool)

(assert (=> b!529372 (=> (not res!325252) (not e!308459))))

(declare-fun e!308456 () Bool)

(assert (=> b!529372 (= res!325252 (not e!308456))))

(declare-fun res!325251 () Bool)

(assert (=> b!529372 (=> (not res!325251) (not e!308456))))

(assert (=> b!529372 (= res!325251 (validKeyInArray!0 (select (arr!16108 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!81073 () Bool)

(declare-fun res!325253 () Bool)

(assert (=> d!81073 (=> res!325253 e!308457)))

(assert (=> d!81073 (= res!325253 (bvsge #b00000000000000000000000000000000 (size!16472 a!3235)))))

(assert (=> d!81073 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10170) e!308457)))

(declare-fun bm!31906 () Bool)

(declare-fun call!31909 () Bool)

(declare-fun c!62370 () Bool)

(assert (=> bm!31906 (= call!31909 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!62370 (Cons!10169 (select (arr!16108 a!3235) #b00000000000000000000000000000000) Nil!10170) Nil!10170)))))

(declare-fun b!529373 () Bool)

(declare-fun e!308458 () Bool)

(assert (=> b!529373 (= e!308459 e!308458)))

(assert (=> b!529373 (= c!62370 (validKeyInArray!0 (select (arr!16108 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529374 () Bool)

(declare-fun contains!2757 (List!10173 (_ BitVec 64)) Bool)

(assert (=> b!529374 (= e!308456 (contains!2757 Nil!10170 (select (arr!16108 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!529375 () Bool)

(assert (=> b!529375 (= e!308458 call!31909)))

(declare-fun b!529376 () Bool)

(assert (=> b!529376 (= e!308458 call!31909)))

(assert (= (and d!81073 (not res!325253)) b!529372))

(assert (= (and b!529372 res!325251) b!529374))

(assert (= (and b!529372 res!325252) b!529373))

(assert (= (and b!529373 c!62370) b!529375))

(assert (= (and b!529373 (not c!62370)) b!529376))

(assert (= (or b!529375 b!529376) bm!31906))

(assert (=> b!529372 m!510097))

(assert (=> b!529372 m!510097))

(assert (=> b!529372 m!510105))

(assert (=> bm!31906 m!510097))

(declare-fun m!510171 () Bool)

(assert (=> bm!31906 m!510171))

(assert (=> b!529373 m!510097))

(assert (=> b!529373 m!510097))

(assert (=> b!529373 m!510105))

(assert (=> b!529374 m!510097))

(assert (=> b!529374 m!510097))

(declare-fun m!510173 () Bool)

(assert (=> b!529374 m!510173))

(assert (=> b!529202 d!81073))

(declare-fun d!81091 () Bool)

(assert (=> d!81091 (= (validKeyInArray!0 (select (arr!16108 a!3235) j!176)) (and (not (= (select (arr!16108 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16108 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!529207 d!81091))

(declare-fun b!529443 () Bool)

(declare-fun c!62395 () Bool)

(declare-fun lt!244128 () (_ BitVec 64))

(assert (=> b!529443 (= c!62395 (= lt!244128 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!308497 () SeekEntryResult!4531)

(declare-fun e!308498 () SeekEntryResult!4531)

(assert (=> b!529443 (= e!308497 e!308498)))

(declare-fun b!529444 () Bool)

(declare-fun lt!244129 () SeekEntryResult!4531)

(assert (=> b!529444 (= e!308497 (Found!4531 (index!20350 lt!244129)))))

(declare-fun b!529445 () Bool)

(declare-fun e!308496 () SeekEntryResult!4531)

(assert (=> b!529445 (= e!308496 e!308497)))

(assert (=> b!529445 (= lt!244128 (select (arr!16108 a!3235) (index!20350 lt!244129)))))

(declare-fun c!62397 () Bool)

(assert (=> b!529445 (= c!62397 (= lt!244128 k0!2280))))

(declare-fun d!81093 () Bool)

(declare-fun lt!244127 () SeekEntryResult!4531)

(assert (=> d!81093 (and (or ((_ is Undefined!4531) lt!244127) (not ((_ is Found!4531) lt!244127)) (and (bvsge (index!20349 lt!244127) #b00000000000000000000000000000000) (bvslt (index!20349 lt!244127) (size!16472 a!3235)))) (or ((_ is Undefined!4531) lt!244127) ((_ is Found!4531) lt!244127) (not ((_ is MissingZero!4531) lt!244127)) (and (bvsge (index!20348 lt!244127) #b00000000000000000000000000000000) (bvslt (index!20348 lt!244127) (size!16472 a!3235)))) (or ((_ is Undefined!4531) lt!244127) ((_ is Found!4531) lt!244127) ((_ is MissingZero!4531) lt!244127) (not ((_ is MissingVacant!4531) lt!244127)) (and (bvsge (index!20351 lt!244127) #b00000000000000000000000000000000) (bvslt (index!20351 lt!244127) (size!16472 a!3235)))) (or ((_ is Undefined!4531) lt!244127) (ite ((_ is Found!4531) lt!244127) (= (select (arr!16108 a!3235) (index!20349 lt!244127)) k0!2280) (ite ((_ is MissingZero!4531) lt!244127) (= (select (arr!16108 a!3235) (index!20348 lt!244127)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4531) lt!244127) (= (select (arr!16108 a!3235) (index!20351 lt!244127)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81093 (= lt!244127 e!308496)))

(declare-fun c!62396 () Bool)

(assert (=> d!81093 (= c!62396 (and ((_ is Intermediate!4531) lt!244129) (undefined!5343 lt!244129)))))

(assert (=> d!81093 (= lt!244129 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!81093 (validMask!0 mask!3524)))

(assert (=> d!81093 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!244127)))

(declare-fun b!529446 () Bool)

(assert (=> b!529446 (= e!308496 Undefined!4531)))

(declare-fun b!529447 () Bool)

(assert (=> b!529447 (= e!308498 (MissingZero!4531 (index!20350 lt!244129)))))

(declare-fun b!529448 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33520 (_ BitVec 32)) SeekEntryResult!4531)

(assert (=> b!529448 (= e!308498 (seekKeyOrZeroReturnVacant!0 (x!49464 lt!244129) (index!20350 lt!244129) (index!20350 lt!244129) k0!2280 a!3235 mask!3524))))

(assert (= (and d!81093 c!62396) b!529446))

(assert (= (and d!81093 (not c!62396)) b!529445))

(assert (= (and b!529445 c!62397) b!529444))

(assert (= (and b!529445 (not c!62397)) b!529443))

(assert (= (and b!529443 c!62395) b!529447))

(assert (= (and b!529443 (not c!62395)) b!529448))

(declare-fun m!510191 () Bool)

(assert (=> b!529445 m!510191))

(declare-fun m!510193 () Bool)

(assert (=> d!81093 m!510193))

(assert (=> d!81093 m!510193))

(declare-fun m!510195 () Bool)

(assert (=> d!81093 m!510195))

(declare-fun m!510197 () Bool)

(assert (=> d!81093 m!510197))

(declare-fun m!510199 () Bool)

(assert (=> d!81093 m!510199))

(assert (=> d!81093 m!509995))

(declare-fun m!510201 () Bool)

(assert (=> d!81093 m!510201))

(declare-fun m!510203 () Bool)

(assert (=> b!529448 m!510203))

(assert (=> b!529201 d!81093))

(declare-fun d!81099 () Bool)

(assert (=> d!81099 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!48026 d!81099))

(declare-fun d!81105 () Bool)

(assert (=> d!81105 (= (array_inv!11967 a!3235) (bvsge (size!16472 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!48026 d!81105))

(declare-fun b!529464 () Bool)

(declare-fun c!62403 () Bool)

(declare-fun lt!244145 () (_ BitVec 64))

(assert (=> b!529464 (= c!62403 (= lt!244145 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!308509 () SeekEntryResult!4531)

(declare-fun e!308510 () SeekEntryResult!4531)

(assert (=> b!529464 (= e!308509 e!308510)))

(declare-fun b!529465 () Bool)

(declare-fun lt!244146 () SeekEntryResult!4531)

(assert (=> b!529465 (= e!308509 (Found!4531 (index!20350 lt!244146)))))

(declare-fun b!529466 () Bool)

(declare-fun e!308508 () SeekEntryResult!4531)

(assert (=> b!529466 (= e!308508 e!308509)))

(assert (=> b!529466 (= lt!244145 (select (arr!16108 a!3235) (index!20350 lt!244146)))))

(declare-fun c!62405 () Bool)

(assert (=> b!529466 (= c!62405 (= lt!244145 (select (arr!16108 a!3235) j!176)))))

(declare-fun d!81107 () Bool)

(declare-fun lt!244144 () SeekEntryResult!4531)

(assert (=> d!81107 (and (or ((_ is Undefined!4531) lt!244144) (not ((_ is Found!4531) lt!244144)) (and (bvsge (index!20349 lt!244144) #b00000000000000000000000000000000) (bvslt (index!20349 lt!244144) (size!16472 a!3235)))) (or ((_ is Undefined!4531) lt!244144) ((_ is Found!4531) lt!244144) (not ((_ is MissingZero!4531) lt!244144)) (and (bvsge (index!20348 lt!244144) #b00000000000000000000000000000000) (bvslt (index!20348 lt!244144) (size!16472 a!3235)))) (or ((_ is Undefined!4531) lt!244144) ((_ is Found!4531) lt!244144) ((_ is MissingZero!4531) lt!244144) (not ((_ is MissingVacant!4531) lt!244144)) (and (bvsge (index!20351 lt!244144) #b00000000000000000000000000000000) (bvslt (index!20351 lt!244144) (size!16472 a!3235)))) (or ((_ is Undefined!4531) lt!244144) (ite ((_ is Found!4531) lt!244144) (= (select (arr!16108 a!3235) (index!20349 lt!244144)) (select (arr!16108 a!3235) j!176)) (ite ((_ is MissingZero!4531) lt!244144) (= (select (arr!16108 a!3235) (index!20348 lt!244144)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4531) lt!244144) (= (select (arr!16108 a!3235) (index!20351 lt!244144)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81107 (= lt!244144 e!308508)))

(declare-fun c!62404 () Bool)

(assert (=> d!81107 (= c!62404 (and ((_ is Intermediate!4531) lt!244146) (undefined!5343 lt!244146)))))

(assert (=> d!81107 (= lt!244146 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16108 a!3235) j!176) mask!3524) (select (arr!16108 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!81107 (validMask!0 mask!3524)))

(assert (=> d!81107 (= (seekEntryOrOpen!0 (select (arr!16108 a!3235) j!176) a!3235 mask!3524) lt!244144)))

(declare-fun b!529467 () Bool)

(assert (=> b!529467 (= e!308508 Undefined!4531)))

(declare-fun b!529468 () Bool)

(assert (=> b!529468 (= e!308510 (MissingZero!4531 (index!20350 lt!244146)))))

(declare-fun b!529469 () Bool)

(assert (=> b!529469 (= e!308510 (seekKeyOrZeroReturnVacant!0 (x!49464 lt!244146) (index!20350 lt!244146) (index!20350 lt!244146) (select (arr!16108 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!81107 c!62404) b!529467))

(assert (= (and d!81107 (not c!62404)) b!529466))

(assert (= (and b!529466 c!62405) b!529465))

(assert (= (and b!529466 (not c!62405)) b!529464))

(assert (= (and b!529464 c!62403) b!529468))

(assert (= (and b!529464 (not c!62403)) b!529469))

(declare-fun m!510213 () Bool)

(assert (=> b!529466 m!510213))

(assert (=> d!81107 m!509989))

(assert (=> d!81107 m!510009))

(assert (=> d!81107 m!510009))

(assert (=> d!81107 m!509989))

(declare-fun m!510215 () Bool)

(assert (=> d!81107 m!510215))

(declare-fun m!510217 () Bool)

(assert (=> d!81107 m!510217))

(declare-fun m!510219 () Bool)

(assert (=> d!81107 m!510219))

(assert (=> d!81107 m!509995))

(declare-fun m!510221 () Bool)

(assert (=> d!81107 m!510221))

(assert (=> b!529469 m!509989))

(declare-fun m!510223 () Bool)

(assert (=> b!529469 m!510223))

(assert (=> b!529200 d!81107))

(declare-fun d!81109 () Bool)

(declare-fun res!325286 () Bool)

(declare-fun e!308520 () Bool)

(assert (=> d!81109 (=> res!325286 e!308520)))

(assert (=> d!81109 (= res!325286 (= (select (arr!16108 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!81109 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!308520)))

(declare-fun b!529480 () Bool)

(declare-fun e!308521 () Bool)

(assert (=> b!529480 (= e!308520 e!308521)))

(declare-fun res!325287 () Bool)

(assert (=> b!529480 (=> (not res!325287) (not e!308521))))

(assert (=> b!529480 (= res!325287 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16472 a!3235)))))

(declare-fun b!529481 () Bool)

(assert (=> b!529481 (= e!308521 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81109 (not res!325286)) b!529480))

(assert (= (and b!529480 res!325287) b!529481))

(assert (=> d!81109 m!510097))

(declare-fun m!510231 () Bool)

(assert (=> b!529481 m!510231))

(assert (=> b!529205 d!81109))

(check-sat (not b!529282) (not bm!31900) (not b!529276) (not b!529448) (not bm!31899) (not b!529308) (not b!529280) (not b!529317) (not d!81093) (not b!529278) (not b!529373) (not b!529374) (not d!81071) (not b!529481) (not d!81069) (not d!81061) (not b!529372) (not bm!31906) (not d!81107) (not b!529469))
(check-sat)
