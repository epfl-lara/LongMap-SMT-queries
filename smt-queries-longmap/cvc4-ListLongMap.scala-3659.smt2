; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50514 () Bool)

(assert start!50514)

(declare-fun b!552224 () Bool)

(declare-fun e!318651 () Bool)

(declare-fun e!318654 () Bool)

(assert (=> b!552224 (= e!318651 e!318654)))

(declare-fun res!344823 () Bool)

(assert (=> b!552224 (=> (not res!344823) (not e!318654))))

(declare-datatypes ((SeekEntryResult!5158 0))(
  ( (MissingZero!5158 (index!22859 (_ BitVec 32))) (Found!5158 (index!22860 (_ BitVec 32))) (Intermediate!5158 (undefined!5970 Bool) (index!22861 (_ BitVec 32)) (x!51786 (_ BitVec 32))) (Undefined!5158) (MissingVacant!5158 (index!22862 (_ BitVec 32))) )
))
(declare-fun lt!251075 () SeekEntryResult!5158)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552224 (= res!344823 (or (= lt!251075 (MissingZero!5158 i!1132)) (= lt!251075 (MissingVacant!5158 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-datatypes ((array!34796 0))(
  ( (array!34797 (arr!16709 (Array (_ BitVec 32) (_ BitVec 64))) (size!17073 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34796)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34796 (_ BitVec 32)) SeekEntryResult!5158)

(assert (=> b!552224 (= lt!251075 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552225 () Bool)

(declare-fun e!318652 () Bool)

(assert (=> b!552225 (= e!318654 e!318652)))

(declare-fun res!344828 () Bool)

(assert (=> b!552225 (=> (not res!344828) (not e!318652))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!251077 () (_ BitVec 32))

(declare-fun lt!251074 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34796 (_ BitVec 32)) SeekEntryResult!5158)

(assert (=> b!552225 (= res!344828 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251074 (select (arr!16709 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251077 (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552225 (= lt!251077 (toIndex!0 (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!552225 (= lt!251074 (toIndex!0 (select (arr!16709 a!3118) j!142) mask!3119))))

(declare-fun b!552226 () Bool)

(declare-fun res!344827 () Bool)

(assert (=> b!552226 (=> (not res!344827) (not e!318654))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34796 (_ BitVec 32)) Bool)

(assert (=> b!552226 (= res!344827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552227 () Bool)

(declare-fun res!344819 () Bool)

(assert (=> b!552227 (=> (not res!344819) (not e!318651))))

(assert (=> b!552227 (= res!344819 (and (= (size!17073 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17073 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17073 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552228 () Bool)

(assert (=> b!552228 (= e!318652 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!251077 #b00000000000000000000000000000000) (bvslt lt!251077 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!318650 () Bool)

(assert (=> b!552228 e!318650))

(declare-fun res!344821 () Bool)

(assert (=> b!552228 (=> (not res!344821) (not e!318650))))

(assert (=> b!552228 (= res!344821 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17090 0))(
  ( (Unit!17091) )
))
(declare-fun lt!251076 () Unit!17090)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17090)

(assert (=> b!552228 (= lt!251076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!344822 () Bool)

(assert (=> start!50514 (=> (not res!344822) (not e!318651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50514 (= res!344822 (validMask!0 mask!3119))))

(assert (=> start!50514 e!318651))

(assert (=> start!50514 true))

(declare-fun array_inv!12505 (array!34796) Bool)

(assert (=> start!50514 (array_inv!12505 a!3118)))

(declare-fun b!552229 () Bool)

(declare-fun res!344825 () Bool)

(assert (=> b!552229 (=> (not res!344825) (not e!318651))))

(declare-fun arrayContainsKey!0 (array!34796 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552229 (= res!344825 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552230 () Bool)

(declare-fun res!344826 () Bool)

(assert (=> b!552230 (=> (not res!344826) (not e!318651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552230 (= res!344826 (validKeyInArray!0 (select (arr!16709 a!3118) j!142)))))

(declare-fun b!552231 () Bool)

(declare-fun res!344824 () Bool)

(assert (=> b!552231 (=> (not res!344824) (not e!318654))))

(declare-datatypes ((List!10789 0))(
  ( (Nil!10786) (Cons!10785 (h!11767 (_ BitVec 64)) (t!17017 List!10789)) )
))
(declare-fun arrayNoDuplicates!0 (array!34796 (_ BitVec 32) List!10789) Bool)

(assert (=> b!552231 (= res!344824 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10786))))

(declare-fun b!552232 () Bool)

(assert (=> b!552232 (= e!318650 (= (seekEntryOrOpen!0 (select (arr!16709 a!3118) j!142) a!3118 mask!3119) (Found!5158 j!142)))))

(declare-fun b!552233 () Bool)

(declare-fun res!344820 () Bool)

(assert (=> b!552233 (=> (not res!344820) (not e!318651))))

(assert (=> b!552233 (= res!344820 (validKeyInArray!0 k!1914))))

(assert (= (and start!50514 res!344822) b!552227))

(assert (= (and b!552227 res!344819) b!552230))

(assert (= (and b!552230 res!344826) b!552233))

(assert (= (and b!552233 res!344820) b!552229))

(assert (= (and b!552229 res!344825) b!552224))

(assert (= (and b!552224 res!344823) b!552226))

(assert (= (and b!552226 res!344827) b!552231))

(assert (= (and b!552231 res!344824) b!552225))

(assert (= (and b!552225 res!344828) b!552228))

(assert (= (and b!552228 res!344821) b!552232))

(declare-fun m!529215 () Bool)

(assert (=> b!552231 m!529215))

(declare-fun m!529217 () Bool)

(assert (=> b!552232 m!529217))

(assert (=> b!552232 m!529217))

(declare-fun m!529219 () Bool)

(assert (=> b!552232 m!529219))

(declare-fun m!529221 () Bool)

(assert (=> b!552226 m!529221))

(declare-fun m!529223 () Bool)

(assert (=> b!552233 m!529223))

(assert (=> b!552230 m!529217))

(assert (=> b!552230 m!529217))

(declare-fun m!529225 () Bool)

(assert (=> b!552230 m!529225))

(assert (=> b!552225 m!529217))

(declare-fun m!529227 () Bool)

(assert (=> b!552225 m!529227))

(assert (=> b!552225 m!529217))

(assert (=> b!552225 m!529217))

(declare-fun m!529229 () Bool)

(assert (=> b!552225 m!529229))

(declare-fun m!529231 () Bool)

(assert (=> b!552225 m!529231))

(assert (=> b!552225 m!529231))

(declare-fun m!529233 () Bool)

(assert (=> b!552225 m!529233))

(declare-fun m!529235 () Bool)

(assert (=> b!552225 m!529235))

(assert (=> b!552225 m!529231))

(declare-fun m!529237 () Bool)

(assert (=> b!552225 m!529237))

(declare-fun m!529239 () Bool)

(assert (=> b!552228 m!529239))

(declare-fun m!529241 () Bool)

(assert (=> b!552228 m!529241))

(declare-fun m!529243 () Bool)

(assert (=> start!50514 m!529243))

(declare-fun m!529245 () Bool)

(assert (=> start!50514 m!529245))

(declare-fun m!529247 () Bool)

(assert (=> b!552229 m!529247))

(declare-fun m!529249 () Bool)

(assert (=> b!552224 m!529249))

(push 1)

(assert (not b!552225))

(assert (not b!552229))

(assert (not b!552224))

(assert (not b!552232))

(assert (not b!552231))

(assert (not b!552226))

(assert (not b!552228))

(assert (not b!552233))

(assert (not start!50514))

(assert (not b!552230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83109 () Bool)

(declare-fun res!344859 () Bool)

(declare-fun e!318709 () Bool)

(assert (=> d!83109 (=> res!344859 e!318709)))

(assert (=> d!83109 (= res!344859 (bvsge j!142 (size!17073 a!3118)))))

(assert (=> d!83109 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318709)))

(declare-fun call!32315 () Bool)

(declare-fun bm!32312 () Bool)

(assert (=> bm!32312 (= call!32315 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552321 () Bool)

(declare-fun e!318710 () Bool)

(assert (=> b!552321 (= e!318710 call!32315)))

(declare-fun b!552322 () Bool)

(declare-fun e!318711 () Bool)

(assert (=> b!552322 (= e!318711 call!32315)))

(declare-fun b!552323 () Bool)

(assert (=> b!552323 (= e!318709 e!318711)))

(declare-fun c!64067 () Bool)

(assert (=> b!552323 (= c!64067 (validKeyInArray!0 (select (arr!16709 a!3118) j!142)))))

(declare-fun b!552324 () Bool)

(assert (=> b!552324 (= e!318711 e!318710)))

(declare-fun lt!251105 () (_ BitVec 64))

(assert (=> b!552324 (= lt!251105 (select (arr!16709 a!3118) j!142))))

(declare-fun lt!251104 () Unit!17090)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34796 (_ BitVec 64) (_ BitVec 32)) Unit!17090)

(assert (=> b!552324 (= lt!251104 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251105 j!142))))

(assert (=> b!552324 (arrayContainsKey!0 a!3118 lt!251105 #b00000000000000000000000000000000)))

(declare-fun lt!251106 () Unit!17090)

(assert (=> b!552324 (= lt!251106 lt!251104)))

(declare-fun res!344858 () Bool)

(assert (=> b!552324 (= res!344858 (= (seekEntryOrOpen!0 (select (arr!16709 a!3118) j!142) a!3118 mask!3119) (Found!5158 j!142)))))

(assert (=> b!552324 (=> (not res!344858) (not e!318710))))

(assert (= (and d!83109 (not res!344859)) b!552323))

(assert (= (and b!552323 c!64067) b!552324))

(assert (= (and b!552323 (not c!64067)) b!552322))

(assert (= (and b!552324 res!344858) b!552321))

(assert (= (or b!552321 b!552322) bm!32312))

(declare-fun m!529305 () Bool)

(assert (=> bm!32312 m!529305))

(assert (=> b!552323 m!529217))

(assert (=> b!552323 m!529217))

(assert (=> b!552323 m!529225))

(assert (=> b!552324 m!529217))

(declare-fun m!529307 () Bool)

(assert (=> b!552324 m!529307))

(declare-fun m!529309 () Bool)

(assert (=> b!552324 m!529309))

(assert (=> b!552324 m!529217))

(assert (=> b!552324 m!529219))

(assert (=> b!552228 d!83109))

(declare-fun d!83121 () Bool)

(assert (=> d!83121 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!251127 () Unit!17090)

(declare-fun choose!38 (array!34796 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17090)

(assert (=> d!83121 (= lt!251127 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83121 (validMask!0 mask!3119)))

(assert (=> d!83121 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!251127)))

(declare-fun bs!17197 () Bool)

(assert (= bs!17197 d!83121))

(assert (=> bs!17197 m!529239))

(declare-fun m!529311 () Bool)

(assert (=> bs!17197 m!529311))

(assert (=> bs!17197 m!529243))

(assert (=> b!552228 d!83121))

(declare-fun d!83131 () Bool)

(declare-fun res!344877 () Bool)

(declare-fun e!318733 () Bool)

(assert (=> d!83131 (=> res!344877 e!318733)))

(assert (=> d!83131 (= res!344877 (= (select (arr!16709 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83131 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!318733)))

(declare-fun b!552351 () Bool)

(declare-fun e!318734 () Bool)

(assert (=> b!552351 (= e!318733 e!318734)))

(declare-fun res!344878 () Bool)

(assert (=> b!552351 (=> (not res!344878) (not e!318734))))

(assert (=> b!552351 (= res!344878 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17073 a!3118)))))

(declare-fun b!552352 () Bool)

(assert (=> b!552352 (= e!318734 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83131 (not res!344877)) b!552351))

(assert (= (and b!552351 res!344878) b!552352))

(declare-fun m!529323 () Bool)

(assert (=> d!83131 m!529323))

(declare-fun m!529325 () Bool)

(assert (=> b!552352 m!529325))

(assert (=> b!552229 d!83131))

(declare-fun b!552412 () Bool)

(declare-fun c!64092 () Bool)

(declare-fun lt!251156 () (_ BitVec 64))

(assert (=> b!552412 (= c!64092 (= lt!251156 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318776 () SeekEntryResult!5158)

(declare-fun e!318777 () SeekEntryResult!5158)

(assert (=> b!552412 (= e!318776 e!318777)))

(declare-fun d!83137 () Bool)

(declare-fun lt!251155 () SeekEntryResult!5158)

(assert (=> d!83137 (and (or (is-Undefined!5158 lt!251155) (not (is-Found!5158 lt!251155)) (and (bvsge (index!22860 lt!251155) #b00000000000000000000000000000000) (bvslt (index!22860 lt!251155) (size!17073 a!3118)))) (or (is-Undefined!5158 lt!251155) (is-Found!5158 lt!251155) (not (is-MissingZero!5158 lt!251155)) (and (bvsge (index!22859 lt!251155) #b00000000000000000000000000000000) (bvslt (index!22859 lt!251155) (size!17073 a!3118)))) (or (is-Undefined!5158 lt!251155) (is-Found!5158 lt!251155) (is-MissingZero!5158 lt!251155) (not (is-MissingVacant!5158 lt!251155)) (and (bvsge (index!22862 lt!251155) #b00000000000000000000000000000000) (bvslt (index!22862 lt!251155) (size!17073 a!3118)))) (or (is-Undefined!5158 lt!251155) (ite (is-Found!5158 lt!251155) (= (select (arr!16709 a!3118) (index!22860 lt!251155)) (select (arr!16709 a!3118) j!142)) (ite (is-MissingZero!5158 lt!251155) (= (select (arr!16709 a!3118) (index!22859 lt!251155)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5158 lt!251155) (= (select (arr!16709 a!3118) (index!22862 lt!251155)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318775 () SeekEntryResult!5158)

(assert (=> d!83137 (= lt!251155 e!318775)))

(declare-fun c!64090 () Bool)

(declare-fun lt!251157 () SeekEntryResult!5158)

(assert (=> d!83137 (= c!64090 (and (is-Intermediate!5158 lt!251157) (undefined!5970 lt!251157)))))

(assert (=> d!83137 (= lt!251157 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16709 a!3118) j!142) mask!3119) (select (arr!16709 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83137 (validMask!0 mask!3119)))

(assert (=> d!83137 (= (seekEntryOrOpen!0 (select (arr!16709 a!3118) j!142) a!3118 mask!3119) lt!251155)))

(declare-fun b!552413 () Bool)

(assert (=> b!552413 (= e!318777 (MissingZero!5158 (index!22861 lt!251157)))))

(declare-fun b!552414 () Bool)

(assert (=> b!552414 (= e!318775 e!318776)))

(assert (=> b!552414 (= lt!251156 (select (arr!16709 a!3118) (index!22861 lt!251157)))))

(declare-fun c!64091 () Bool)

(assert (=> b!552414 (= c!64091 (= lt!251156 (select (arr!16709 a!3118) j!142)))))

(declare-fun b!552415 () Bool)

(assert (=> b!552415 (= e!318775 Undefined!5158)))

(declare-fun b!552416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34796 (_ BitVec 32)) SeekEntryResult!5158)

(assert (=> b!552416 (= e!318777 (seekKeyOrZeroReturnVacant!0 (x!51786 lt!251157) (index!22861 lt!251157) (index!22861 lt!251157) (select (arr!16709 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!552417 () Bool)

(assert (=> b!552417 (= e!318776 (Found!5158 (index!22861 lt!251157)))))

(assert (= (and d!83137 c!64090) b!552415))

(assert (= (and d!83137 (not c!64090)) b!552414))

(assert (= (and b!552414 c!64091) b!552417))

(assert (= (and b!552414 (not c!64091)) b!552412))

(assert (= (and b!552412 c!64092) b!552413))

(assert (= (and b!552412 (not c!64092)) b!552416))

(assert (=> d!83137 m!529217))

(assert (=> d!83137 m!529227))

(declare-fun m!529357 () Bool)

(assert (=> d!83137 m!529357))

(assert (=> d!83137 m!529227))

(assert (=> d!83137 m!529217))

(declare-fun m!529359 () Bool)

(assert (=> d!83137 m!529359))

(assert (=> d!83137 m!529243))

(declare-fun m!529361 () Bool)

(assert (=> d!83137 m!529361))

(declare-fun m!529363 () Bool)

(assert (=> d!83137 m!529363))

(declare-fun m!529365 () Bool)

(assert (=> b!552414 m!529365))

(assert (=> b!552416 m!529217))

(declare-fun m!529367 () Bool)

(assert (=> b!552416 m!529367))

(assert (=> b!552232 d!83137))

(declare-fun d!83155 () Bool)

(assert (=> d!83155 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552233 d!83155))

(declare-fun b!552464 () Bool)

(declare-fun e!318805 () Bool)

(declare-fun contains!2844 (List!10789 (_ BitVec 64)) Bool)

(assert (=> b!552464 (= e!318805 (contains!2844 Nil!10786 (select (arr!16709 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552465 () Bool)

(declare-fun e!318808 () Bool)

(declare-fun call!32328 () Bool)

(assert (=> b!552465 (= e!318808 call!32328)))

(declare-fun b!552466 () Bool)

(assert (=> b!552466 (= e!318808 call!32328)))

(declare-fun bm!32325 () Bool)

(declare-fun c!64110 () Bool)

(assert (=> bm!32325 (= call!32328 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64110 (Cons!10785 (select (arr!16709 a!3118) #b00000000000000000000000000000000) Nil!10786) Nil!10786)))))

(declare-fun d!83159 () Bool)

(declare-fun res!344917 () Bool)

(declare-fun e!318807 () Bool)

(assert (=> d!83159 (=> res!344917 e!318807)))

(assert (=> d!83159 (= res!344917 (bvsge #b00000000000000000000000000000000 (size!17073 a!3118)))))

(assert (=> d!83159 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10786) e!318807)))

(declare-fun b!552467 () Bool)

(declare-fun e!318806 () Bool)

(assert (=> b!552467 (= e!318806 e!318808)))

(assert (=> b!552467 (= c!64110 (validKeyInArray!0 (select (arr!16709 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552468 () Bool)

(assert (=> b!552468 (= e!318807 e!318806)))

(declare-fun res!344919 () Bool)

(assert (=> b!552468 (=> (not res!344919) (not e!318806))))

(assert (=> b!552468 (= res!344919 (not e!318805))))

(declare-fun res!344918 () Bool)

(assert (=> b!552468 (=> (not res!344918) (not e!318805))))

(assert (=> b!552468 (= res!344918 (validKeyInArray!0 (select (arr!16709 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83159 (not res!344917)) b!552468))

(assert (= (and b!552468 res!344918) b!552464))

(assert (= (and b!552468 res!344919) b!552467))

(assert (= (and b!552467 c!64110) b!552465))

(assert (= (and b!552467 (not c!64110)) b!552466))

(assert (= (or b!552465 b!552466) bm!32325))

(assert (=> b!552464 m!529323))

(assert (=> b!552464 m!529323))

(declare-fun m!529379 () Bool)

(assert (=> b!552464 m!529379))

(assert (=> bm!32325 m!529323))

(declare-fun m!529385 () Bool)

(assert (=> bm!32325 m!529385))

(assert (=> b!552467 m!529323))

(assert (=> b!552467 m!529323))

(declare-fun m!529389 () Bool)

(assert (=> b!552467 m!529389))

(assert (=> b!552468 m!529323))

(assert (=> b!552468 m!529323))

(assert (=> b!552468 m!529389))

(assert (=> b!552231 d!83159))

(declare-fun d!83163 () Bool)

(declare-fun res!344921 () Bool)

(declare-fun e!318811 () Bool)

(assert (=> d!83163 (=> res!344921 e!318811)))

(assert (=> d!83163 (= res!344921 (bvsge #b00000000000000000000000000000000 (size!17073 a!3118)))))

(assert (=> d!83163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318811)))

(declare-fun bm!32326 () Bool)

(declare-fun call!32329 () Bool)

(assert (=> bm!32326 (= call!32329 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552475 () Bool)

(declare-fun e!318812 () Bool)

(assert (=> b!552475 (= e!318812 call!32329)))

(declare-fun b!552476 () Bool)

(declare-fun e!318814 () Bool)

(assert (=> b!552476 (= e!318814 call!32329)))

(declare-fun b!552477 () Bool)

(assert (=> b!552477 (= e!318811 e!318814)))

(declare-fun c!64114 () Bool)

(assert (=> b!552477 (= c!64114 (validKeyInArray!0 (select (arr!16709 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552478 () Bool)

(assert (=> b!552478 (= e!318814 e!318812)))

(declare-fun lt!251183 () (_ BitVec 64))

(assert (=> b!552478 (= lt!251183 (select (arr!16709 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!251182 () Unit!17090)

(assert (=> b!552478 (= lt!251182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251183 #b00000000000000000000000000000000))))

(assert (=> b!552478 (arrayContainsKey!0 a!3118 lt!251183 #b00000000000000000000000000000000)))

(declare-fun lt!251184 () Unit!17090)

(assert (=> b!552478 (= lt!251184 lt!251182)))

(declare-fun res!344920 () Bool)

(assert (=> b!552478 (= res!344920 (= (seekEntryOrOpen!0 (select (arr!16709 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5158 #b00000000000000000000000000000000)))))

(assert (=> b!552478 (=> (not res!344920) (not e!318812))))

(assert (= (and d!83163 (not res!344921)) b!552477))

(assert (= (and b!552477 c!64114) b!552478))

(assert (= (and b!552477 (not c!64114)) b!552476))

(assert (= (and b!552478 res!344920) b!552475))

(assert (= (or b!552475 b!552476) bm!32326))

(declare-fun m!529395 () Bool)

(assert (=> bm!32326 m!529395))

(assert (=> b!552477 m!529323))

(assert (=> b!552477 m!529323))

(assert (=> b!552477 m!529389))

(assert (=> b!552478 m!529323))

(declare-fun m!529397 () Bool)

(assert (=> b!552478 m!529397))

(declare-fun m!529399 () Bool)

(assert (=> b!552478 m!529399))

(assert (=> b!552478 m!529323))

(declare-fun m!529405 () Bool)

(assert (=> b!552478 m!529405))

(assert (=> b!552226 d!83163))

(declare-fun d!83167 () Bool)

(assert (=> d!83167 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50514 d!83167))

(declare-fun d!83173 () Bool)

(assert (=> d!83173 (= (array_inv!12505 a!3118) (bvsge (size!17073 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50514 d!83173))

(declare-fun b!552479 () Bool)

(declare-fun c!64117 () Bool)

(declare-fun lt!251186 () (_ BitVec 64))

(assert (=> b!552479 (= c!64117 (= lt!251186 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318816 () SeekEntryResult!5158)

(declare-fun e!318817 () SeekEntryResult!5158)

(assert (=> b!552479 (= e!318816 e!318817)))

(declare-fun d!83177 () Bool)

(declare-fun lt!251185 () SeekEntryResult!5158)

(assert (=> d!83177 (and (or (is-Undefined!5158 lt!251185) (not (is-Found!5158 lt!251185)) (and (bvsge (index!22860 lt!251185) #b00000000000000000000000000000000) (bvslt (index!22860 lt!251185) (size!17073 a!3118)))) (or (is-Undefined!5158 lt!251185) (is-Found!5158 lt!251185) (not (is-MissingZero!5158 lt!251185)) (and (bvsge (index!22859 lt!251185) #b00000000000000000000000000000000) (bvslt (index!22859 lt!251185) (size!17073 a!3118)))) (or (is-Undefined!5158 lt!251185) (is-Found!5158 lt!251185) (is-MissingZero!5158 lt!251185) (not (is-MissingVacant!5158 lt!251185)) (and (bvsge (index!22862 lt!251185) #b00000000000000000000000000000000) (bvslt (index!22862 lt!251185) (size!17073 a!3118)))) (or (is-Undefined!5158 lt!251185) (ite (is-Found!5158 lt!251185) (= (select (arr!16709 a!3118) (index!22860 lt!251185)) k!1914) (ite (is-MissingZero!5158 lt!251185) (= (select (arr!16709 a!3118) (index!22859 lt!251185)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5158 lt!251185) (= (select (arr!16709 a!3118) (index!22862 lt!251185)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!318815 () SeekEntryResult!5158)

(assert (=> d!83177 (= lt!251185 e!318815)))

(declare-fun c!64115 () Bool)

(declare-fun lt!251187 () SeekEntryResult!5158)

(assert (=> d!83177 (= c!64115 (and (is-Intermediate!5158 lt!251187) (undefined!5970 lt!251187)))))

(assert (=> d!83177 (= lt!251187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83177 (validMask!0 mask!3119)))

(assert (=> d!83177 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!251185)))

(declare-fun b!552480 () Bool)

(assert (=> b!552480 (= e!318817 (MissingZero!5158 (index!22861 lt!251187)))))

(declare-fun b!552481 () Bool)

(assert (=> b!552481 (= e!318815 e!318816)))

(assert (=> b!552481 (= lt!251186 (select (arr!16709 a!3118) (index!22861 lt!251187)))))

(declare-fun c!64116 () Bool)

(assert (=> b!552481 (= c!64116 (= lt!251186 k!1914))))

(declare-fun b!552482 () Bool)

(assert (=> b!552482 (= e!318815 Undefined!5158)))

(declare-fun b!552483 () Bool)

(assert (=> b!552483 (= e!318817 (seekKeyOrZeroReturnVacant!0 (x!51786 lt!251187) (index!22861 lt!251187) (index!22861 lt!251187) k!1914 a!3118 mask!3119))))

(declare-fun b!552484 () Bool)

(assert (=> b!552484 (= e!318816 (Found!5158 (index!22861 lt!251187)))))

(assert (= (and d!83177 c!64115) b!552482))

(assert (= (and d!83177 (not c!64115)) b!552481))

(assert (= (and b!552481 c!64116) b!552484))

(assert (= (and b!552481 (not c!64116)) b!552479))

(assert (= (and b!552479 c!64117) b!552480))

(assert (= (and b!552479 (not c!64117)) b!552483))

(declare-fun m!529417 () Bool)

(assert (=> d!83177 m!529417))

(declare-fun m!529419 () Bool)

(assert (=> d!83177 m!529419))

(assert (=> d!83177 m!529417))

(declare-fun m!529421 () Bool)

(assert (=> d!83177 m!529421))

(assert (=> d!83177 m!529243))

(declare-fun m!529423 () Bool)

(assert (=> d!83177 m!529423))

(declare-fun m!529425 () Bool)

(assert (=> d!83177 m!529425))

(declare-fun m!529427 () Bool)

(assert (=> b!552481 m!529427))

(declare-fun m!529429 () Bool)

(assert (=> b!552483 m!529429))

(assert (=> b!552224 d!83177))

(declare-fun d!83181 () Bool)

(assert (=> d!83181 (= (validKeyInArray!0 (select (arr!16709 a!3118) j!142)) (and (not (= (select (arr!16709 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16709 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552230 d!83181))

(declare-fun b!552507 () Bool)

(declare-fun e!318831 () Bool)

(declare-fun e!318834 () Bool)

(assert (=> b!552507 (= e!318831 e!318834)))

(declare-fun res!344931 () Bool)

(declare-fun lt!251196 () SeekEntryResult!5158)

(assert (=> b!552507 (= res!344931 (and (is-Intermediate!5158 lt!251196) (not (undefined!5970 lt!251196)) (bvslt (x!51786 lt!251196) #b01111111111111111111111111111110) (bvsge (x!51786 lt!251196) #b00000000000000000000000000000000) (bvsge (x!51786 lt!251196) #b00000000000000000000000000000000)))))

(assert (=> b!552507 (=> (not res!344931) (not e!318834))))

(declare-fun d!83183 () Bool)

(assert (=> d!83183 e!318831))

(declare-fun c!64127 () Bool)

(assert (=> d!83183 (= c!64127 (and (is-Intermediate!5158 lt!251196) (undefined!5970 lt!251196)))))

(declare-fun e!318832 () SeekEntryResult!5158)

(assert (=> d!83183 (= lt!251196 e!318832)))

(declare-fun c!64125 () Bool)

(assert (=> d!83183 (= c!64125 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!251195 () (_ BitVec 64))

(assert (=> d!83183 (= lt!251195 (select (arr!16709 a!3118) lt!251074))))

(assert (=> d!83183 (validMask!0 mask!3119)))

(assert (=> d!83183 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251074 (select (arr!16709 a!3118) j!142) a!3118 mask!3119) lt!251196)))

(declare-fun b!552508 () Bool)

(declare-fun e!318835 () SeekEntryResult!5158)

(assert (=> b!552508 (= e!318835 (Intermediate!5158 false lt!251074 #b00000000000000000000000000000000))))

(declare-fun b!552509 () Bool)

(assert (=> b!552509 (= e!318832 (Intermediate!5158 true lt!251074 #b00000000000000000000000000000000))))

(declare-fun b!552510 () Bool)

(assert (=> b!552510 (= e!318831 (bvsge (x!51786 lt!251196) #b01111111111111111111111111111110))))

(declare-fun b!552511 () Bool)

(assert (=> b!552511 (= e!318832 e!318835)))

(declare-fun c!64126 () Bool)

(assert (=> b!552511 (= c!64126 (or (= lt!251195 (select (arr!16709 a!3118) j!142)) (= (bvadd lt!251195 lt!251195) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552512 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552512 (= e!318835 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251074 #b00000000000000000000000000000000 mask!3119) (select (arr!16709 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!552513 () Bool)

(assert (=> b!552513 (and (bvsge (index!22861 lt!251196) #b00000000000000000000000000000000) (bvslt (index!22861 lt!251196) (size!17073 a!3118)))))

(declare-fun res!344930 () Bool)

(assert (=> b!552513 (= res!344930 (= (select (arr!16709 a!3118) (index!22861 lt!251196)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318833 () Bool)

(assert (=> b!552513 (=> res!344930 e!318833)))

(declare-fun b!552514 () Bool)

(assert (=> b!552514 (and (bvsge (index!22861 lt!251196) #b00000000000000000000000000000000) (bvslt (index!22861 lt!251196) (size!17073 a!3118)))))

(assert (=> b!552514 (= e!318833 (= (select (arr!16709 a!3118) (index!22861 lt!251196)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552515 () Bool)

(assert (=> b!552515 (and (bvsge (index!22861 lt!251196) #b00000000000000000000000000000000) (bvslt (index!22861 lt!251196) (size!17073 a!3118)))))

(declare-fun res!344932 () Bool)

(assert (=> b!552515 (= res!344932 (= (select (arr!16709 a!3118) (index!22861 lt!251196)) (select (arr!16709 a!3118) j!142)))))

(assert (=> b!552515 (=> res!344932 e!318833)))

(assert (=> b!552515 (= e!318834 e!318833)))

(assert (= (and d!83183 c!64125) b!552509))

(assert (= (and d!83183 (not c!64125)) b!552511))

(assert (= (and b!552511 c!64126) b!552508))

(assert (= (and b!552511 (not c!64126)) b!552512))

(assert (= (and d!83183 c!64127) b!552510))

(assert (= (and d!83183 (not c!64127)) b!552507))

(assert (= (and b!552507 res!344931) b!552515))

(assert (= (and b!552515 (not res!344932)) b!552513))

(assert (= (and b!552513 (not res!344930)) b!552514))

(declare-fun m!529439 () Bool)

(assert (=> d!83183 m!529439))

(assert (=> d!83183 m!529243))

(declare-fun m!529441 () Bool)

(assert (=> b!552513 m!529441))

(assert (=> b!552514 m!529441))

(assert (=> b!552515 m!529441))

(declare-fun m!529443 () Bool)

(assert (=> b!552512 m!529443))

(assert (=> b!552512 m!529443))

(assert (=> b!552512 m!529217))

(declare-fun m!529445 () Bool)

(assert (=> b!552512 m!529445))

(assert (=> b!552225 d!83183))

(declare-fun b!552516 () Bool)

(declare-fun e!318836 () Bool)

(declare-fun e!318839 () Bool)

(assert (=> b!552516 (= e!318836 e!318839)))

(declare-fun res!344934 () Bool)

(declare-fun lt!251198 () SeekEntryResult!5158)

(assert (=> b!552516 (= res!344934 (and (is-Intermediate!5158 lt!251198) (not (undefined!5970 lt!251198)) (bvslt (x!51786 lt!251198) #b01111111111111111111111111111110) (bvsge (x!51786 lt!251198) #b00000000000000000000000000000000) (bvsge (x!51786 lt!251198) #b00000000000000000000000000000000)))))

(assert (=> b!552516 (=> (not res!344934) (not e!318839))))

(declare-fun d!83187 () Bool)

(assert (=> d!83187 e!318836))

(declare-fun c!64130 () Bool)

(assert (=> d!83187 (= c!64130 (and (is-Intermediate!5158 lt!251198) (undefined!5970 lt!251198)))))

(declare-fun e!318837 () SeekEntryResult!5158)

(assert (=> d!83187 (= lt!251198 e!318837)))

(declare-fun c!64128 () Bool)

(assert (=> d!83187 (= c!64128 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!251197 () (_ BitVec 64))

(assert (=> d!83187 (= lt!251197 (select (arr!16709 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118))) lt!251077))))

(assert (=> d!83187 (validMask!0 mask!3119)))

(assert (=> d!83187 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251077 (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118)) mask!3119) lt!251198)))

(declare-fun b!552517 () Bool)

(declare-fun e!318840 () SeekEntryResult!5158)

(assert (=> b!552517 (= e!318840 (Intermediate!5158 false lt!251077 #b00000000000000000000000000000000))))

(declare-fun b!552518 () Bool)

(assert (=> b!552518 (= e!318837 (Intermediate!5158 true lt!251077 #b00000000000000000000000000000000))))

(declare-fun b!552519 () Bool)

(assert (=> b!552519 (= e!318836 (bvsge (x!51786 lt!251198) #b01111111111111111111111111111110))))

(declare-fun b!552520 () Bool)

(assert (=> b!552520 (= e!318837 e!318840)))

(declare-fun c!64129 () Bool)

(assert (=> b!552520 (= c!64129 (or (= lt!251197 (select (store (arr!16709 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!251197 lt!251197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552521 () Bool)

(assert (=> b!552521 (= e!318840 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251077 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118)) mask!3119))))

(declare-fun b!552522 () Bool)

(assert (=> b!552522 (and (bvsge (index!22861 lt!251198) #b00000000000000000000000000000000) (bvslt (index!22861 lt!251198) (size!17073 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118)))))))

(declare-fun res!344933 () Bool)

(assert (=> b!552522 (= res!344933 (= (select (arr!16709 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118))) (index!22861 lt!251198)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318838 () Bool)

(assert (=> b!552522 (=> res!344933 e!318838)))

(declare-fun b!552523 () Bool)

(assert (=> b!552523 (and (bvsge (index!22861 lt!251198) #b00000000000000000000000000000000) (bvslt (index!22861 lt!251198) (size!17073 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118)))))))

(assert (=> b!552523 (= e!318838 (= (select (arr!16709 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118))) (index!22861 lt!251198)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552524 () Bool)

(assert (=> b!552524 (and (bvsge (index!22861 lt!251198) #b00000000000000000000000000000000) (bvslt (index!22861 lt!251198) (size!17073 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118)))))))

(declare-fun res!344935 () Bool)

(assert (=> b!552524 (= res!344935 (= (select (arr!16709 (array!34797 (store (arr!16709 a!3118) i!1132 k!1914) (size!17073 a!3118))) (index!22861 lt!251198)) (select (store (arr!16709 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!552524 (=> res!344935 e!318838)))

(assert (=> b!552524 (= e!318839 e!318838)))

(assert (= (and d!83187 c!64128) b!552518))

(assert (= (and d!83187 (not c!64128)) b!552520))

(assert (= (and b!552520 c!64129) b!552517))

(assert (= (and b!552520 (not c!64129)) b!552521))

(assert (= (and d!83187 c!64130) b!552519))

(assert (= (and d!83187 (not c!64130)) b!552516))

(assert (= (and b!552516 res!344934) b!552524))

(assert (= (and b!552524 (not res!344935)) b!552522))

(assert (= (and b!552522 (not res!344933)) b!552523))

(declare-fun m!529447 () Bool)

(assert (=> d!83187 m!529447))

(assert (=> d!83187 m!529243))

(declare-fun m!529449 () Bool)

(assert (=> b!552522 m!529449))

(assert (=> b!552523 m!529449))

(assert (=> b!552524 m!529449))

(declare-fun m!529451 () Bool)

(assert (=> b!552521 m!529451))

(assert (=> b!552521 m!529451))

(assert (=> b!552521 m!529231))

(declare-fun m!529453 () Bool)

(assert (=> b!552521 m!529453))

(assert (=> b!552225 d!83187))

(declare-fun d!83189 () Bool)

(declare-fun lt!251204 () (_ BitVec 32))

(declare-fun lt!251203 () (_ BitVec 32))

(assert (=> d!83189 (= lt!251204 (bvmul (bvxor lt!251203 (bvlshr lt!251203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83189 (= lt!251203 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83189 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344936 (let ((h!11770 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51792 (bvmul (bvxor h!11770 (bvlshr h!11770 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51792 (bvlshr x!51792 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344936 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344936 #b00000000000000000000000000000000))))))

(assert (=> d!83189 (= (toIndex!0 (select (store (arr!16709 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!251204 (bvlshr lt!251204 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552225 d!83189))

(declare-fun d!83191 () Bool)

(declare-fun lt!251206 () (_ BitVec 32))

(declare-fun lt!251205 () (_ BitVec 32))

(assert (=> d!83191 (= lt!251206 (bvmul (bvxor lt!251205 (bvlshr lt!251205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83191 (= lt!251205 ((_ extract 31 0) (bvand (bvxor (select (arr!16709 a!3118) j!142) (bvlshr (select (arr!16709 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83191 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344936 (let ((h!11770 ((_ extract 31 0) (bvand (bvxor (select (arr!16709 a!3118) j!142) (bvlshr (select (arr!16709 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51792 (bvmul (bvxor h!11770 (bvlshr h!11770 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51792 (bvlshr x!51792 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344936 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344936 #b00000000000000000000000000000000))))))

(assert (=> d!83191 (= (toIndex!0 (select (arr!16709 a!3118) j!142) mask!3119) (bvand (bvxor lt!251206 (bvlshr lt!251206 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552225 d!83191))

(push 1)

