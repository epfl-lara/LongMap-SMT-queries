; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122510 () Bool)

(assert start!122510)

(declare-fun res!954781 () Bool)

(declare-fun e!802988 () Bool)

(assert (=> start!122510 (=> (not res!954781) (not e!802988))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122510 (= res!954781 (validMask!0 mask!2608))))

(assert (=> start!122510 e!802988))

(assert (=> start!122510 true))

(declare-datatypes ((array!96867 0))(
  ( (array!96868 (arr!46753 (Array (_ BitVec 32) (_ BitVec 64))) (size!47305 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96867)

(declare-fun array_inv!35986 (array!96867) Bool)

(assert (=> start!122510 (array_inv!35986 a!2831)))

(declare-fun b!1419209 () Bool)

(declare-fun res!954783 () Bool)

(assert (=> b!1419209 (=> (not res!954783) (not e!802988))))

(declare-datatypes ((List!33341 0))(
  ( (Nil!33338) (Cons!33337 (h!34636 (_ BitVec 64)) (t!48027 List!33341)) )
))
(declare-fun arrayNoDuplicates!0 (array!96867 (_ BitVec 32) List!33341) Bool)

(assert (=> b!1419209 (= res!954783 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33338))))

(declare-fun b!1419210 () Bool)

(declare-fun res!954780 () Bool)

(assert (=> b!1419210 (=> (not res!954780) (not e!802988))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11065 0))(
  ( (MissingZero!11065 (index!46652 (_ BitVec 32))) (Found!11065 (index!46653 (_ BitVec 32))) (Intermediate!11065 (undefined!11877 Bool) (index!46654 (_ BitVec 32)) (x!128314 (_ BitVec 32))) (Undefined!11065) (MissingVacant!11065 (index!46655 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96867 (_ BitVec 32)) SeekEntryResult!11065)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419210 (= res!954780 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608) (select (arr!46753 a!2831) j!81) a!2831 mask!2608) (Intermediate!11065 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1419211 () Bool)

(declare-fun res!954785 () Bool)

(assert (=> b!1419211 (=> (not res!954785) (not e!802988))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1419211 (= res!954785 (validKeyInArray!0 (select (arr!46753 a!2831) j!81)))))

(declare-fun b!1419212 () Bool)

(declare-fun lt!625562 () (_ BitVec 32))

(assert (=> b!1419212 (= e!802988 (and (bvsge mask!2608 #b00000000000000000000000000000000) (or (bvslt lt!625562 #b00000000000000000000000000000000) (bvsge lt!625562 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1419212 (= lt!625562 (toIndex!0 (select (store (arr!46753 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608))))

(declare-fun b!1419213 () Bool)

(declare-fun res!954787 () Bool)

(assert (=> b!1419213 (=> (not res!954787) (not e!802988))))

(assert (=> b!1419213 (= res!954787 (and (= (size!47305 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47305 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47305 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1419214 () Bool)

(declare-fun res!954784 () Bool)

(assert (=> b!1419214 (=> (not res!954784) (not e!802988))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1419214 (= res!954784 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47305 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47305 a!2831))))))

(declare-fun b!1419215 () Bool)

(declare-fun res!954786 () Bool)

(assert (=> b!1419215 (=> (not res!954786) (not e!802988))))

(assert (=> b!1419215 (= res!954786 (validKeyInArray!0 (select (arr!46753 a!2831) i!982)))))

(declare-fun b!1419216 () Bool)

(declare-fun res!954782 () Bool)

(assert (=> b!1419216 (=> (not res!954782) (not e!802988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96867 (_ BitVec 32)) Bool)

(assert (=> b!1419216 (= res!954782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122510 res!954781) b!1419213))

(assert (= (and b!1419213 res!954787) b!1419215))

(assert (= (and b!1419215 res!954786) b!1419211))

(assert (= (and b!1419211 res!954785) b!1419216))

(assert (= (and b!1419216 res!954782) b!1419209))

(assert (= (and b!1419209 res!954783) b!1419214))

(assert (= (and b!1419214 res!954784) b!1419210))

(assert (= (and b!1419210 res!954780) b!1419212))

(declare-fun m!1309257 () Bool)

(assert (=> b!1419216 m!1309257))

(declare-fun m!1309259 () Bool)

(assert (=> b!1419215 m!1309259))

(assert (=> b!1419215 m!1309259))

(declare-fun m!1309261 () Bool)

(assert (=> b!1419215 m!1309261))

(declare-fun m!1309263 () Bool)

(assert (=> start!122510 m!1309263))

(declare-fun m!1309265 () Bool)

(assert (=> start!122510 m!1309265))

(declare-fun m!1309267 () Bool)

(assert (=> b!1419211 m!1309267))

(assert (=> b!1419211 m!1309267))

(declare-fun m!1309269 () Bool)

(assert (=> b!1419211 m!1309269))

(declare-fun m!1309271 () Bool)

(assert (=> b!1419209 m!1309271))

(assert (=> b!1419210 m!1309267))

(assert (=> b!1419210 m!1309267))

(declare-fun m!1309273 () Bool)

(assert (=> b!1419210 m!1309273))

(assert (=> b!1419210 m!1309273))

(assert (=> b!1419210 m!1309267))

(declare-fun m!1309275 () Bool)

(assert (=> b!1419210 m!1309275))

(declare-fun m!1309277 () Bool)

(assert (=> b!1419212 m!1309277))

(declare-fun m!1309279 () Bool)

(assert (=> b!1419212 m!1309279))

(assert (=> b!1419212 m!1309279))

(declare-fun m!1309281 () Bool)

(assert (=> b!1419212 m!1309281))

(check-sat (not b!1419215) (not b!1419212) (not b!1419209) (not b!1419211) (not b!1419210) (not start!122510) (not b!1419216))
(check-sat)
(get-model)

(declare-fun d!152857 () Bool)

(assert (=> d!152857 (= (validKeyInArray!0 (select (arr!46753 a!2831) j!81)) (and (not (= (select (arr!46753 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46753 a!2831) j!81) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419211 d!152857))

(declare-fun d!152859 () Bool)

(declare-fun lt!625574 () (_ BitVec 32))

(declare-fun lt!625573 () (_ BitVec 32))

(assert (=> d!152859 (= lt!625574 (bvmul (bvxor lt!625573 (bvlshr lt!625573 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152859 (= lt!625573 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46753 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46753 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152859 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954836 (let ((h!34639 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46753 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (bvlshr (select (store (arr!46753 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128317 (bvmul (bvxor h!34639 (bvlshr h!34639 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128317 (bvlshr x!128317 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954836 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954836 #b00000000000000000000000000000000))))))

(assert (=> d!152859 (= (toIndex!0 (select (store (arr!46753 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (bvand (bvxor lt!625574 (bvlshr lt!625574 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419212 d!152859))

(declare-fun d!152861 () Bool)

(assert (=> d!152861 (= (validKeyInArray!0 (select (arr!46753 a!2831) i!982)) (and (not (= (select (arr!46753 a!2831) i!982) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46753 a!2831) i!982) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1419215 d!152861))

(declare-fun b!1419298 () Bool)

(declare-fun e!803026 () Bool)

(declare-fun e!803023 () Bool)

(assert (=> b!1419298 (= e!803026 e!803023)))

(declare-fun res!954852 () Bool)

(declare-fun lt!625579 () SeekEntryResult!11065)

(get-info :version)

(assert (=> b!1419298 (= res!954852 (and ((_ is Intermediate!11065) lt!625579) (not (undefined!11877 lt!625579)) (bvslt (x!128314 lt!625579) #b01111111111111111111111111111110) (bvsge (x!128314 lt!625579) #b00000000000000000000000000000000) (bvsge (x!128314 lt!625579) #b00000000000000000000000000000000)))))

(assert (=> b!1419298 (=> (not res!954852) (not e!803023))))

(declare-fun b!1419299 () Bool)

(assert (=> b!1419299 (and (bvsge (index!46654 lt!625579) #b00000000000000000000000000000000) (bvslt (index!46654 lt!625579) (size!47305 a!2831)))))

(declare-fun res!954854 () Bool)

(assert (=> b!1419299 (= res!954854 (= (select (arr!46753 a!2831) (index!46654 lt!625579)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!803025 () Bool)

(assert (=> b!1419299 (=> res!954854 e!803025)))

(declare-fun b!1419300 () Bool)

(assert (=> b!1419300 (and (bvsge (index!46654 lt!625579) #b00000000000000000000000000000000) (bvslt (index!46654 lt!625579) (size!47305 a!2831)))))

(assert (=> b!1419300 (= e!803025 (= (select (arr!46753 a!2831) (index!46654 lt!625579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1419301 () Bool)

(assert (=> b!1419301 (and (bvsge (index!46654 lt!625579) #b00000000000000000000000000000000) (bvslt (index!46654 lt!625579) (size!47305 a!2831)))))

(declare-fun res!954853 () Bool)

(assert (=> b!1419301 (= res!954853 (= (select (arr!46753 a!2831) (index!46654 lt!625579)) (select (arr!46753 a!2831) j!81)))))

(assert (=> b!1419301 (=> res!954853 e!803025)))

(assert (=> b!1419301 (= e!803023 e!803025)))

(declare-fun b!1419302 () Bool)

(declare-fun e!803024 () SeekEntryResult!11065)

(declare-fun e!803027 () SeekEntryResult!11065)

(assert (=> b!1419302 (= e!803024 e!803027)))

(declare-fun c!131711 () Bool)

(declare-fun lt!625580 () (_ BitVec 64))

(assert (=> b!1419302 (= c!131711 (or (= lt!625580 (select (arr!46753 a!2831) j!81)) (= (bvadd lt!625580 lt!625580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1419303 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1419303 (= e!803027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608) #b00000000000000000000000000000000 mask!2608) (select (arr!46753 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1419304 () Bool)

(assert (=> b!1419304 (= e!803026 (bvsge (x!128314 lt!625579) #b01111111111111111111111111111110))))

(declare-fun b!1419305 () Bool)

(assert (=> b!1419305 (= e!803027 (Intermediate!11065 false (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(declare-fun d!152863 () Bool)

(assert (=> d!152863 e!803026))

(declare-fun c!131713 () Bool)

(assert (=> d!152863 (= c!131713 (and ((_ is Intermediate!11065) lt!625579) (undefined!11877 lt!625579)))))

(assert (=> d!152863 (= lt!625579 e!803024)))

(declare-fun c!131712 () Bool)

(assert (=> d!152863 (= c!131712 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!152863 (= lt!625580 (select (arr!46753 a!2831) (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608)))))

(assert (=> d!152863 (validMask!0 mask!2608)))

(assert (=> d!152863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608) (select (arr!46753 a!2831) j!81) a!2831 mask!2608) lt!625579)))

(declare-fun b!1419306 () Bool)

(assert (=> b!1419306 (= e!803024 (Intermediate!11065 true (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608) #b00000000000000000000000000000000))))

(assert (= (and d!152863 c!131712) b!1419306))

(assert (= (and d!152863 (not c!131712)) b!1419302))

(assert (= (and b!1419302 c!131711) b!1419305))

(assert (= (and b!1419302 (not c!131711)) b!1419303))

(assert (= (and d!152863 c!131713) b!1419304))

(assert (= (and d!152863 (not c!131713)) b!1419298))

(assert (= (and b!1419298 res!954852) b!1419301))

(assert (= (and b!1419301 (not res!954853)) b!1419299))

(assert (= (and b!1419299 (not res!954854)) b!1419300))

(assert (=> b!1419303 m!1309273))

(declare-fun m!1309343 () Bool)

(assert (=> b!1419303 m!1309343))

(assert (=> b!1419303 m!1309343))

(assert (=> b!1419303 m!1309267))

(declare-fun m!1309345 () Bool)

(assert (=> b!1419303 m!1309345))

(declare-fun m!1309347 () Bool)

(assert (=> b!1419301 m!1309347))

(assert (=> b!1419299 m!1309347))

(assert (=> b!1419300 m!1309347))

(assert (=> d!152863 m!1309273))

(declare-fun m!1309349 () Bool)

(assert (=> d!152863 m!1309349))

(assert (=> d!152863 m!1309263))

(assert (=> b!1419210 d!152863))

(declare-fun d!152875 () Bool)

(declare-fun lt!625582 () (_ BitVec 32))

(declare-fun lt!625581 () (_ BitVec 32))

(assert (=> d!152875 (= lt!625582 (bvmul (bvxor lt!625581 (bvlshr lt!625581 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!152875 (= lt!625581 ((_ extract 31 0) (bvand (bvxor (select (arr!46753 a!2831) j!81) (bvlshr (select (arr!46753 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!152875 (and (bvsge mask!2608 #b00000000000000000000000000000000) (let ((res!954836 (let ((h!34639 ((_ extract 31 0) (bvand (bvxor (select (arr!46753 a!2831) j!81) (bvlshr (select (arr!46753 a!2831) j!81) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!128317 (bvmul (bvxor h!34639 (bvlshr h!34639 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!128317 (bvlshr x!128317 #b00000000000000000000000000001101)) mask!2608))))) (and (bvslt res!954836 (bvadd mask!2608 #b00000000000000000000000000000001)) (bvsge res!954836 #b00000000000000000000000000000000))))))

(assert (=> d!152875 (= (toIndex!0 (select (arr!46753 a!2831) j!81) mask!2608) (bvand (bvxor lt!625582 (bvlshr lt!625582 #b00000000000000000000000000001101)) mask!2608))))

(assert (=> b!1419210 d!152875))

(declare-fun b!1419369 () Bool)

(declare-fun e!803064 () Bool)

(declare-fun call!67289 () Bool)

(assert (=> b!1419369 (= e!803064 call!67289)))

(declare-fun b!1419370 () Bool)

(declare-fun e!803065 () Bool)

(assert (=> b!1419370 (= e!803064 e!803065)))

(declare-fun lt!625602 () (_ BitVec 64))

(assert (=> b!1419370 (= lt!625602 (select (arr!46753 a!2831) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!47919 0))(
  ( (Unit!47920) )
))
(declare-fun lt!625601 () Unit!47919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!96867 (_ BitVec 64) (_ BitVec 32)) Unit!47919)

(assert (=> b!1419370 (= lt!625601 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2831 lt!625602 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!96867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1419370 (arrayContainsKey!0 a!2831 lt!625602 #b00000000000000000000000000000000)))

(declare-fun lt!625603 () Unit!47919)

(assert (=> b!1419370 (= lt!625603 lt!625601)))

(declare-fun res!954878 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96867 (_ BitVec 32)) SeekEntryResult!11065)

(assert (=> b!1419370 (= res!954878 (= (seekEntryOrOpen!0 (select (arr!46753 a!2831) #b00000000000000000000000000000000) a!2831 mask!2608) (Found!11065 #b00000000000000000000000000000000)))))

(assert (=> b!1419370 (=> (not res!954878) (not e!803065))))

(declare-fun b!1419371 () Bool)

(declare-fun e!803066 () Bool)

(assert (=> b!1419371 (= e!803066 e!803064)))

(declare-fun c!131734 () Bool)

(assert (=> b!1419371 (= c!131734 (validKeyInArray!0 (select (arr!46753 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419372 () Bool)

(assert (=> b!1419372 (= e!803065 call!67289)))

(declare-fun d!152877 () Bool)

(declare-fun res!954879 () Bool)

(assert (=> d!152877 (=> res!954879 e!803066)))

(assert (=> d!152877 (= res!954879 (bvsge #b00000000000000000000000000000000 (size!47305 a!2831)))))

(assert (=> d!152877 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!803066)))

(declare-fun bm!67286 () Bool)

(assert (=> bm!67286 (= call!67289 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2831 mask!2608))))

(assert (= (and d!152877 (not res!954879)) b!1419371))

(assert (= (and b!1419371 c!131734) b!1419370))

(assert (= (and b!1419371 (not c!131734)) b!1419369))

(assert (= (and b!1419370 res!954878) b!1419372))

(assert (= (or b!1419372 b!1419369) bm!67286))

(declare-fun m!1309359 () Bool)

(assert (=> b!1419370 m!1309359))

(declare-fun m!1309363 () Bool)

(assert (=> b!1419370 m!1309363))

(declare-fun m!1309365 () Bool)

(assert (=> b!1419370 m!1309365))

(assert (=> b!1419370 m!1309359))

(declare-fun m!1309369 () Bool)

(assert (=> b!1419370 m!1309369))

(assert (=> b!1419371 m!1309359))

(assert (=> b!1419371 m!1309359))

(declare-fun m!1309375 () Bool)

(assert (=> b!1419371 m!1309375))

(declare-fun m!1309377 () Bool)

(assert (=> bm!67286 m!1309377))

(assert (=> b!1419216 d!152877))

(declare-fun bm!67292 () Bool)

(declare-fun call!67295 () Bool)

(declare-fun c!131740 () Bool)

(assert (=> bm!67292 (= call!67295 (arrayNoDuplicates!0 a!2831 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!131740 (Cons!33337 (select (arr!46753 a!2831) #b00000000000000000000000000000000) Nil!33338) Nil!33338)))))

(declare-fun b!1419398 () Bool)

(declare-fun e!803090 () Bool)

(declare-fun e!803087 () Bool)

(assert (=> b!1419398 (= e!803090 e!803087)))

(assert (=> b!1419398 (= c!131740 (validKeyInArray!0 (select (arr!46753 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419399 () Bool)

(assert (=> b!1419399 (= e!803087 call!67295)))

(declare-fun b!1419400 () Bool)

(assert (=> b!1419400 (= e!803087 call!67295)))

(declare-fun b!1419401 () Bool)

(declare-fun e!803088 () Bool)

(assert (=> b!1419401 (= e!803088 e!803090)))

(declare-fun res!954898 () Bool)

(assert (=> b!1419401 (=> (not res!954898) (not e!803090))))

(declare-fun e!803089 () Bool)

(assert (=> b!1419401 (= res!954898 (not e!803089))))

(declare-fun res!954897 () Bool)

(assert (=> b!1419401 (=> (not res!954897) (not e!803089))))

(assert (=> b!1419401 (= res!954897 (validKeyInArray!0 (select (arr!46753 a!2831) #b00000000000000000000000000000000)))))

(declare-fun b!1419402 () Bool)

(declare-fun contains!9806 (List!33341 (_ BitVec 64)) Bool)

(assert (=> b!1419402 (= e!803089 (contains!9806 Nil!33338 (select (arr!46753 a!2831) #b00000000000000000000000000000000)))))

(declare-fun d!152881 () Bool)

(declare-fun res!954896 () Bool)

(assert (=> d!152881 (=> res!954896 e!803088)))

(assert (=> d!152881 (= res!954896 (bvsge #b00000000000000000000000000000000 (size!47305 a!2831)))))

(assert (=> d!152881 (= (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33338) e!803088)))

(assert (= (and d!152881 (not res!954896)) b!1419401))

(assert (= (and b!1419401 res!954897) b!1419402))

(assert (= (and b!1419401 res!954898) b!1419398))

(assert (= (and b!1419398 c!131740) b!1419399))

(assert (= (and b!1419398 (not c!131740)) b!1419400))

(assert (= (or b!1419399 b!1419400) bm!67292))

(assert (=> bm!67292 m!1309359))

(declare-fun m!1309385 () Bool)

(assert (=> bm!67292 m!1309385))

(assert (=> b!1419398 m!1309359))

(assert (=> b!1419398 m!1309359))

(assert (=> b!1419398 m!1309375))

(assert (=> b!1419401 m!1309359))

(assert (=> b!1419401 m!1309359))

(assert (=> b!1419401 m!1309375))

(assert (=> b!1419402 m!1309359))

(assert (=> b!1419402 m!1309359))

(declare-fun m!1309389 () Bool)

(assert (=> b!1419402 m!1309389))

(assert (=> b!1419209 d!152881))

(declare-fun d!152895 () Bool)

(assert (=> d!152895 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122510 d!152895))

(declare-fun d!152903 () Bool)

(assert (=> d!152903 (= (array_inv!35986 a!2831) (bvsge (size!47305 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122510 d!152903))

(check-sat (not bm!67286) (not bm!67292) (not b!1419371) (not b!1419370) (not b!1419402) (not d!152863) (not b!1419401) (not b!1419303) (not b!1419398))
(check-sat)
