; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51672 () Bool)

(assert start!51672)

(declare-fun b!565199 () Bool)

(declare-fun res!356246 () Bool)

(declare-fun e!325447 () Bool)

(assert (=> b!565199 (=> (not res!356246) (not e!325447))))

(declare-datatypes ((array!35484 0))(
  ( (array!35485 (arr!17041 (Array (_ BitVec 32) (_ BitVec 64))) (size!17405 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35484)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565199 (= res!356246 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!325449 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!565200 () Bool)

(declare-datatypes ((SeekEntryResult!5446 0))(
  ( (MissingZero!5446 (index!24011 (_ BitVec 32))) (Found!5446 (index!24012 (_ BitVec 32))) (Intermediate!5446 (undefined!6258 Bool) (index!24013 (_ BitVec 32)) (x!53032 (_ BitVec 32))) (Undefined!5446) (MissingVacant!5446 (index!24014 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35484 (_ BitVec 32)) SeekEntryResult!5446)

(assert (=> b!565200 (= e!325449 (not (= (seekEntryOrOpen!0 (select (arr!17041 a!3118) j!142) a!3118 mask!3119) (Found!5446 j!142))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35484 (_ BitVec 32)) Bool)

(assert (=> b!565200 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17665 0))(
  ( (Unit!17666) )
))
(declare-fun lt!257839 () Unit!17665)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17665)

(assert (=> b!565200 (= lt!257839 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565201 () Bool)

(declare-fun res!356250 () Bool)

(assert (=> b!565201 (=> (not res!356250) (not e!325449))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35484 (_ BitVec 32)) SeekEntryResult!5446)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565201 (= res!356250 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) (select (arr!17041 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)) mask!3119)))))

(declare-fun b!565203 () Bool)

(declare-fun res!356247 () Bool)

(assert (=> b!565203 (=> (not res!356247) (not e!325447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565203 (= res!356247 (validKeyInArray!0 k0!1914))))

(declare-fun b!565204 () Bool)

(declare-fun res!356249 () Bool)

(assert (=> b!565204 (=> (not res!356249) (not e!325447))))

(assert (=> b!565204 (= res!356249 (and (= (size!17405 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17405 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17405 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565205 () Bool)

(declare-fun res!356251 () Bool)

(assert (=> b!565205 (=> (not res!356251) (not e!325449))))

(assert (=> b!565205 (= res!356251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565202 () Bool)

(assert (=> b!565202 (= e!325447 e!325449)))

(declare-fun res!356252 () Bool)

(assert (=> b!565202 (=> (not res!356252) (not e!325449))))

(declare-fun lt!257838 () SeekEntryResult!5446)

(assert (=> b!565202 (= res!356252 (or (= lt!257838 (MissingZero!5446 i!1132)) (= lt!257838 (MissingVacant!5446 i!1132))))))

(assert (=> b!565202 (= lt!257838 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!356253 () Bool)

(assert (=> start!51672 (=> (not res!356253) (not e!325447))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51672 (= res!356253 (validMask!0 mask!3119))))

(assert (=> start!51672 e!325447))

(assert (=> start!51672 true))

(declare-fun array_inv!12900 (array!35484) Bool)

(assert (=> start!51672 (array_inv!12900 a!3118)))

(declare-fun b!565206 () Bool)

(declare-fun res!356248 () Bool)

(assert (=> b!565206 (=> (not res!356248) (not e!325449))))

(declare-datatypes ((List!11028 0))(
  ( (Nil!11025) (Cons!11024 (h!12030 (_ BitVec 64)) (t!17248 List!11028)) )
))
(declare-fun arrayNoDuplicates!0 (array!35484 (_ BitVec 32) List!11028) Bool)

(assert (=> b!565206 (= res!356248 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11025))))

(declare-fun b!565207 () Bool)

(declare-fun res!356254 () Bool)

(assert (=> b!565207 (=> (not res!356254) (not e!325447))))

(assert (=> b!565207 (= res!356254 (validKeyInArray!0 (select (arr!17041 a!3118) j!142)))))

(assert (= (and start!51672 res!356253) b!565204))

(assert (= (and b!565204 res!356249) b!565207))

(assert (= (and b!565207 res!356254) b!565203))

(assert (= (and b!565203 res!356247) b!565199))

(assert (= (and b!565199 res!356246) b!565202))

(assert (= (and b!565202 res!356252) b!565205))

(assert (= (and b!565205 res!356251) b!565206))

(assert (= (and b!565206 res!356248) b!565201))

(assert (= (and b!565201 res!356250) b!565200))

(declare-fun m!543851 () Bool)

(assert (=> b!565205 m!543851))

(declare-fun m!543853 () Bool)

(assert (=> b!565200 m!543853))

(assert (=> b!565200 m!543853))

(declare-fun m!543855 () Bool)

(assert (=> b!565200 m!543855))

(declare-fun m!543857 () Bool)

(assert (=> b!565200 m!543857))

(declare-fun m!543859 () Bool)

(assert (=> b!565200 m!543859))

(declare-fun m!543861 () Bool)

(assert (=> b!565203 m!543861))

(declare-fun m!543863 () Bool)

(assert (=> start!51672 m!543863))

(declare-fun m!543865 () Bool)

(assert (=> start!51672 m!543865))

(declare-fun m!543867 () Bool)

(assert (=> b!565202 m!543867))

(declare-fun m!543869 () Bool)

(assert (=> b!565206 m!543869))

(declare-fun m!543871 () Bool)

(assert (=> b!565199 m!543871))

(assert (=> b!565207 m!543853))

(assert (=> b!565207 m!543853))

(declare-fun m!543873 () Bool)

(assert (=> b!565207 m!543873))

(assert (=> b!565201 m!543853))

(declare-fun m!543875 () Bool)

(assert (=> b!565201 m!543875))

(assert (=> b!565201 m!543853))

(declare-fun m!543877 () Bool)

(assert (=> b!565201 m!543877))

(declare-fun m!543879 () Bool)

(assert (=> b!565201 m!543879))

(assert (=> b!565201 m!543877))

(declare-fun m!543881 () Bool)

(assert (=> b!565201 m!543881))

(assert (=> b!565201 m!543875))

(assert (=> b!565201 m!543853))

(declare-fun m!543883 () Bool)

(assert (=> b!565201 m!543883))

(declare-fun m!543885 () Bool)

(assert (=> b!565201 m!543885))

(assert (=> b!565201 m!543877))

(assert (=> b!565201 m!543879))

(check-sat (not b!565203) (not start!51672) (not b!565199) (not b!565201) (not b!565205) (not b!565200) (not b!565202) (not b!565206) (not b!565207))
(check-sat)
(get-model)

(declare-fun b!565288 () Bool)

(declare-fun lt!257863 () SeekEntryResult!5446)

(assert (=> b!565288 (and (bvsge (index!24013 lt!257863) #b00000000000000000000000000000000) (bvslt (index!24013 lt!257863) (size!17405 a!3118)))))

(declare-fun res!356321 () Bool)

(assert (=> b!565288 (= res!356321 (= (select (arr!17041 a!3118) (index!24013 lt!257863)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!325488 () Bool)

(assert (=> b!565288 (=> res!356321 e!325488)))

(declare-fun e!325485 () SeekEntryResult!5446)

(declare-fun b!565289 () Bool)

(assert (=> b!565289 (= e!325485 (Intermediate!5446 true (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun e!325486 () SeekEntryResult!5446)

(declare-fun b!565290 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565290 (= e!325486 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!17041 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565291 () Bool)

(assert (=> b!565291 (and (bvsge (index!24013 lt!257863) #b00000000000000000000000000000000) (bvslt (index!24013 lt!257863) (size!17405 a!3118)))))

(assert (=> b!565291 (= e!325488 (= (select (arr!17041 a!3118) (index!24013 lt!257863)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84087 () Bool)

(declare-fun e!325487 () Bool)

(assert (=> d!84087 e!325487))

(declare-fun c!64833 () Bool)

(get-info :version)

(assert (=> d!84087 (= c!64833 (and ((_ is Intermediate!5446) lt!257863) (undefined!6258 lt!257863)))))

(assert (=> d!84087 (= lt!257863 e!325485)))

(declare-fun c!64832 () Bool)

(assert (=> d!84087 (= c!64832 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257862 () (_ BitVec 64))

(assert (=> d!84087 (= lt!257862 (select (arr!17041 a!3118) (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119)))))

(assert (=> d!84087 (validMask!0 mask!3119)))

(assert (=> d!84087 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) (select (arr!17041 a!3118) j!142) a!3118 mask!3119) lt!257863)))

(declare-fun b!565292 () Bool)

(assert (=> b!565292 (= e!325487 (bvsge (x!53032 lt!257863) #b01111111111111111111111111111110))))

(declare-fun b!565293 () Bool)

(assert (=> b!565293 (= e!325485 e!325486)))

(declare-fun c!64834 () Bool)

(assert (=> b!565293 (= c!64834 (or (= lt!257862 (select (arr!17041 a!3118) j!142)) (= (bvadd lt!257862 lt!257862) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565294 () Bool)

(declare-fun e!325484 () Bool)

(assert (=> b!565294 (= e!325487 e!325484)))

(declare-fun res!356319 () Bool)

(assert (=> b!565294 (= res!356319 (and ((_ is Intermediate!5446) lt!257863) (not (undefined!6258 lt!257863)) (bvslt (x!53032 lt!257863) #b01111111111111111111111111111110) (bvsge (x!53032 lt!257863) #b00000000000000000000000000000000) (bvsge (x!53032 lt!257863) #b00000000000000000000000000000000)))))

(assert (=> b!565294 (=> (not res!356319) (not e!325484))))

(declare-fun b!565295 () Bool)

(assert (=> b!565295 (= e!325486 (Intermediate!5446 false (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565296 () Bool)

(assert (=> b!565296 (and (bvsge (index!24013 lt!257863) #b00000000000000000000000000000000) (bvslt (index!24013 lt!257863) (size!17405 a!3118)))))

(declare-fun res!356320 () Bool)

(assert (=> b!565296 (= res!356320 (= (select (arr!17041 a!3118) (index!24013 lt!257863)) (select (arr!17041 a!3118) j!142)))))

(assert (=> b!565296 (=> res!356320 e!325488)))

(assert (=> b!565296 (= e!325484 e!325488)))

(assert (= (and d!84087 c!64832) b!565289))

(assert (= (and d!84087 (not c!64832)) b!565293))

(assert (= (and b!565293 c!64834) b!565295))

(assert (= (and b!565293 (not c!64834)) b!565290))

(assert (= (and d!84087 c!64833) b!565292))

(assert (= (and d!84087 (not c!64833)) b!565294))

(assert (= (and b!565294 res!356319) b!565296))

(assert (= (and b!565296 (not res!356320)) b!565288))

(assert (= (and b!565288 (not res!356321)) b!565291))

(assert (=> d!84087 m!543875))

(declare-fun m!543959 () Bool)

(assert (=> d!84087 m!543959))

(assert (=> d!84087 m!543863))

(declare-fun m!543961 () Bool)

(assert (=> b!565288 m!543961))

(assert (=> b!565291 m!543961))

(assert (=> b!565290 m!543875))

(declare-fun m!543963 () Bool)

(assert (=> b!565290 m!543963))

(assert (=> b!565290 m!543963))

(assert (=> b!565290 m!543853))

(declare-fun m!543965 () Bool)

(assert (=> b!565290 m!543965))

(assert (=> b!565296 m!543961))

(assert (=> b!565201 d!84087))

(declare-fun d!84093 () Bool)

(declare-fun lt!257872 () (_ BitVec 32))

(declare-fun lt!257871 () (_ BitVec 32))

(assert (=> d!84093 (= lt!257872 (bvmul (bvxor lt!257871 (bvlshr lt!257871 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84093 (= lt!257871 ((_ extract 31 0) (bvand (bvxor (select (arr!17041 a!3118) j!142) (bvlshr (select (arr!17041 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84093 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356322 (let ((h!12033 ((_ extract 31 0) (bvand (bvxor (select (arr!17041 a!3118) j!142) (bvlshr (select (arr!17041 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53036 (bvmul (bvxor h!12033 (bvlshr h!12033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53036 (bvlshr x!53036 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356322 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356322 #b00000000000000000000000000000000))))))

(assert (=> d!84093 (= (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) (bvand (bvxor lt!257872 (bvlshr lt!257872 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565201 d!84093))

(declare-fun lt!257874 () SeekEntryResult!5446)

(declare-fun b!565301 () Bool)

(assert (=> b!565301 (and (bvsge (index!24013 lt!257874) #b00000000000000000000000000000000) (bvslt (index!24013 lt!257874) (size!17405 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)))))))

(declare-fun res!356327 () Bool)

(assert (=> b!565301 (= res!356327 (= (select (arr!17041 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118))) (index!24013 lt!257874)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!325496 () Bool)

(assert (=> b!565301 (=> res!356327 e!325496)))

(declare-fun b!565302 () Bool)

(declare-fun e!325493 () SeekEntryResult!5446)

(assert (=> b!565302 (= e!325493 (Intermediate!5446 true (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565303 () Bool)

(declare-fun e!325494 () SeekEntryResult!5446)

(assert (=> b!565303 (= e!325494 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)) mask!3119))))

(declare-fun b!565304 () Bool)

(assert (=> b!565304 (and (bvsge (index!24013 lt!257874) #b00000000000000000000000000000000) (bvslt (index!24013 lt!257874) (size!17405 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)))))))

(assert (=> b!565304 (= e!325496 (= (select (arr!17041 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118))) (index!24013 lt!257874)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!84097 () Bool)

(declare-fun e!325495 () Bool)

(assert (=> d!84097 e!325495))

(declare-fun c!64837 () Bool)

(assert (=> d!84097 (= c!64837 (and ((_ is Intermediate!5446) lt!257874) (undefined!6258 lt!257874)))))

(assert (=> d!84097 (= lt!257874 e!325493)))

(declare-fun c!64836 () Bool)

(assert (=> d!84097 (= c!64836 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!257873 () (_ BitVec 64))

(assert (=> d!84097 (= lt!257873 (select (arr!17041 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118))) (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!84097 (validMask!0 mask!3119)))

(assert (=> d!84097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)) mask!3119) lt!257874)))

(declare-fun b!565305 () Bool)

(assert (=> b!565305 (= e!325495 (bvsge (x!53032 lt!257874) #b01111111111111111111111111111110))))

(declare-fun b!565306 () Bool)

(assert (=> b!565306 (= e!325493 e!325494)))

(declare-fun c!64838 () Bool)

(assert (=> b!565306 (= c!64838 (or (= lt!257873 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!257873 lt!257873) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565307 () Bool)

(declare-fun e!325492 () Bool)

(assert (=> b!565307 (= e!325495 e!325492)))

(declare-fun res!356325 () Bool)

(assert (=> b!565307 (= res!356325 (and ((_ is Intermediate!5446) lt!257874) (not (undefined!6258 lt!257874)) (bvslt (x!53032 lt!257874) #b01111111111111111111111111111110) (bvsge (x!53032 lt!257874) #b00000000000000000000000000000000) (bvsge (x!53032 lt!257874) #b00000000000000000000000000000000)))))

(assert (=> b!565307 (=> (not res!356325) (not e!325492))))

(declare-fun b!565308 () Bool)

(assert (=> b!565308 (= e!325494 (Intermediate!5446 false (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565309 () Bool)

(assert (=> b!565309 (and (bvsge (index!24013 lt!257874) #b00000000000000000000000000000000) (bvslt (index!24013 lt!257874) (size!17405 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118)))))))

(declare-fun res!356326 () Bool)

(assert (=> b!565309 (= res!356326 (= (select (arr!17041 (array!35485 (store (arr!17041 a!3118) i!1132 k0!1914) (size!17405 a!3118))) (index!24013 lt!257874)) (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!565309 (=> res!356326 e!325496)))

(assert (=> b!565309 (= e!325492 e!325496)))

(assert (= (and d!84097 c!64836) b!565302))

(assert (= (and d!84097 (not c!64836)) b!565306))

(assert (= (and b!565306 c!64838) b!565308))

(assert (= (and b!565306 (not c!64838)) b!565303))

(assert (= (and d!84097 c!64837) b!565305))

(assert (= (and d!84097 (not c!64837)) b!565307))

(assert (= (and b!565307 res!356325) b!565309))

(assert (= (and b!565309 (not res!356326)) b!565301))

(assert (= (and b!565301 (not res!356327)) b!565304))

(assert (=> d!84097 m!543879))

(declare-fun m!543979 () Bool)

(assert (=> d!84097 m!543979))

(assert (=> d!84097 m!543863))

(declare-fun m!543981 () Bool)

(assert (=> b!565301 m!543981))

(assert (=> b!565304 m!543981))

(assert (=> b!565303 m!543879))

(declare-fun m!543983 () Bool)

(assert (=> b!565303 m!543983))

(assert (=> b!565303 m!543983))

(assert (=> b!565303 m!543877))

(declare-fun m!543985 () Bool)

(assert (=> b!565303 m!543985))

(assert (=> b!565309 m!543981))

(assert (=> b!565201 d!84097))

(declare-fun d!84099 () Bool)

(declare-fun lt!257876 () (_ BitVec 32))

(declare-fun lt!257875 () (_ BitVec 32))

(assert (=> d!84099 (= lt!257876 (bvmul (bvxor lt!257875 (bvlshr lt!257875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84099 (= lt!257875 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84099 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356322 (let ((h!12033 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53036 (bvmul (bvxor h!12033 (bvlshr h!12033 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53036 (bvlshr x!53036 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356322 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356322 #b00000000000000000000000000000000))))))

(assert (=> d!84099 (= (toIndex!0 (select (store (arr!17041 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!257876 (bvlshr lt!257876 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565201 d!84099))

(declare-fun b!565334 () Bool)

(declare-fun e!325515 () Bool)

(declare-fun e!325516 () Bool)

(assert (=> b!565334 (= e!325515 e!325516)))

(declare-fun c!64847 () Bool)

(assert (=> b!565334 (= c!64847 (validKeyInArray!0 (select (arr!17041 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565335 () Bool)

(declare-fun call!32466 () Bool)

(assert (=> b!565335 (= e!325516 call!32466)))

(declare-fun bm!32463 () Bool)

(assert (=> bm!32463 (= call!32466 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64847 (Cons!11024 (select (arr!17041 a!3118) #b00000000000000000000000000000000) Nil!11025) Nil!11025)))))

(declare-fun b!565336 () Bool)

(assert (=> b!565336 (= e!325516 call!32466)))

(declare-fun b!565337 () Bool)

(declare-fun e!325518 () Bool)

(declare-fun contains!2836 (List!11028 (_ BitVec 64)) Bool)

(assert (=> b!565337 (= e!325518 (contains!2836 Nil!11025 (select (arr!17041 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565338 () Bool)

(declare-fun e!325517 () Bool)

(assert (=> b!565338 (= e!325517 e!325515)))

(declare-fun res!356340 () Bool)

(assert (=> b!565338 (=> (not res!356340) (not e!325515))))

(assert (=> b!565338 (= res!356340 (not e!325518))))

(declare-fun res!356339 () Bool)

(assert (=> b!565338 (=> (not res!356339) (not e!325518))))

(assert (=> b!565338 (= res!356339 (validKeyInArray!0 (select (arr!17041 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84101 () Bool)

(declare-fun res!356338 () Bool)

(assert (=> d!84101 (=> res!356338 e!325517)))

(assert (=> d!84101 (= res!356338 (bvsge #b00000000000000000000000000000000 (size!17405 a!3118)))))

(assert (=> d!84101 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11025) e!325517)))

(assert (= (and d!84101 (not res!356338)) b!565338))

(assert (= (and b!565338 res!356339) b!565337))

(assert (= (and b!565338 res!356340) b!565334))

(assert (= (and b!565334 c!64847) b!565335))

(assert (= (and b!565334 (not c!64847)) b!565336))

(assert (= (or b!565335 b!565336) bm!32463))

(declare-fun m!543987 () Bool)

(assert (=> b!565334 m!543987))

(assert (=> b!565334 m!543987))

(declare-fun m!543989 () Bool)

(assert (=> b!565334 m!543989))

(assert (=> bm!32463 m!543987))

(declare-fun m!543991 () Bool)

(assert (=> bm!32463 m!543991))

(assert (=> b!565337 m!543987))

(assert (=> b!565337 m!543987))

(declare-fun m!543993 () Bool)

(assert (=> b!565337 m!543993))

(assert (=> b!565338 m!543987))

(assert (=> b!565338 m!543987))

(assert (=> b!565338 m!543989))

(assert (=> b!565206 d!84101))

(declare-fun d!84103 () Bool)

(assert (=> d!84103 (= (validKeyInArray!0 (select (arr!17041 a!3118) j!142)) (and (not (= (select (arr!17041 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17041 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565207 d!84103))

(declare-fun b!565409 () Bool)

(declare-fun e!325559 () SeekEntryResult!5446)

(declare-fun lt!257921 () SeekEntryResult!5446)

(assert (=> b!565409 (= e!325559 (MissingZero!5446 (index!24013 lt!257921)))))

(declare-fun b!565410 () Bool)

(declare-fun e!325560 () SeekEntryResult!5446)

(assert (=> b!565410 (= e!325560 (Found!5446 (index!24013 lt!257921)))))

(declare-fun b!565411 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35484 (_ BitVec 32)) SeekEntryResult!5446)

(assert (=> b!565411 (= e!325559 (seekKeyOrZeroReturnVacant!0 (x!53032 lt!257921) (index!24013 lt!257921) (index!24013 lt!257921) k0!1914 a!3118 mask!3119))))

(declare-fun b!565412 () Bool)

(declare-fun e!325561 () SeekEntryResult!5446)

(assert (=> b!565412 (= e!325561 Undefined!5446)))

(declare-fun b!565413 () Bool)

(assert (=> b!565413 (= e!325561 e!325560)))

(declare-fun lt!257922 () (_ BitVec 64))

(assert (=> b!565413 (= lt!257922 (select (arr!17041 a!3118) (index!24013 lt!257921)))))

(declare-fun c!64873 () Bool)

(assert (=> b!565413 (= c!64873 (= lt!257922 k0!1914))))

(declare-fun d!84105 () Bool)

(declare-fun lt!257920 () SeekEntryResult!5446)

(assert (=> d!84105 (and (or ((_ is Undefined!5446) lt!257920) (not ((_ is Found!5446) lt!257920)) (and (bvsge (index!24012 lt!257920) #b00000000000000000000000000000000) (bvslt (index!24012 lt!257920) (size!17405 a!3118)))) (or ((_ is Undefined!5446) lt!257920) ((_ is Found!5446) lt!257920) (not ((_ is MissingZero!5446) lt!257920)) (and (bvsge (index!24011 lt!257920) #b00000000000000000000000000000000) (bvslt (index!24011 lt!257920) (size!17405 a!3118)))) (or ((_ is Undefined!5446) lt!257920) ((_ is Found!5446) lt!257920) ((_ is MissingZero!5446) lt!257920) (not ((_ is MissingVacant!5446) lt!257920)) (and (bvsge (index!24014 lt!257920) #b00000000000000000000000000000000) (bvslt (index!24014 lt!257920) (size!17405 a!3118)))) (or ((_ is Undefined!5446) lt!257920) (ite ((_ is Found!5446) lt!257920) (= (select (arr!17041 a!3118) (index!24012 lt!257920)) k0!1914) (ite ((_ is MissingZero!5446) lt!257920) (= (select (arr!17041 a!3118) (index!24011 lt!257920)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5446) lt!257920) (= (select (arr!17041 a!3118) (index!24014 lt!257920)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84105 (= lt!257920 e!325561)))

(declare-fun c!64872 () Bool)

(assert (=> d!84105 (= c!64872 (and ((_ is Intermediate!5446) lt!257921) (undefined!6258 lt!257921)))))

(assert (=> d!84105 (= lt!257921 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!84105 (validMask!0 mask!3119)))

(assert (=> d!84105 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!257920)))

(declare-fun b!565414 () Bool)

(declare-fun c!64874 () Bool)

(assert (=> b!565414 (= c!64874 (= lt!257922 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565414 (= e!325560 e!325559)))

(assert (= (and d!84105 c!64872) b!565412))

(assert (= (and d!84105 (not c!64872)) b!565413))

(assert (= (and b!565413 c!64873) b!565410))

(assert (= (and b!565413 (not c!64873)) b!565414))

(assert (= (and b!565414 c!64874) b!565409))

(assert (= (and b!565414 (not c!64874)) b!565411))

(declare-fun m!544031 () Bool)

(assert (=> b!565411 m!544031))

(declare-fun m!544033 () Bool)

(assert (=> b!565413 m!544033))

(declare-fun m!544035 () Bool)

(assert (=> d!84105 m!544035))

(declare-fun m!544037 () Bool)

(assert (=> d!84105 m!544037))

(declare-fun m!544039 () Bool)

(assert (=> d!84105 m!544039))

(declare-fun m!544041 () Bool)

(assert (=> d!84105 m!544041))

(assert (=> d!84105 m!544037))

(assert (=> d!84105 m!543863))

(declare-fun m!544045 () Bool)

(assert (=> d!84105 m!544045))

(assert (=> b!565202 d!84105))

(declare-fun d!84127 () Bool)

(assert (=> d!84127 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51672 d!84127))

(declare-fun d!84141 () Bool)

(assert (=> d!84141 (= (array_inv!12900 a!3118) (bvsge (size!17405 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51672 d!84141))

(declare-fun d!84143 () Bool)

(assert (=> d!84143 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565203 d!84143))

(declare-fun b!565451 () Bool)

(declare-fun e!325587 () Bool)

(declare-fun e!325588 () Bool)

(assert (=> b!565451 (= e!325587 e!325588)))

(declare-fun c!64887 () Bool)

(assert (=> b!565451 (= c!64887 (validKeyInArray!0 (select (arr!17041 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84145 () Bool)

(declare-fun res!356375 () Bool)

(assert (=> d!84145 (=> res!356375 e!325587)))

(assert (=> d!84145 (= res!356375 (bvsge #b00000000000000000000000000000000 (size!17405 a!3118)))))

(assert (=> d!84145 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325587)))

(declare-fun b!565452 () Bool)

(declare-fun e!325586 () Bool)

(declare-fun call!32473 () Bool)

(assert (=> b!565452 (= e!325586 call!32473)))

(declare-fun bm!32470 () Bool)

(assert (=> bm!32470 (= call!32473 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!565453 () Bool)

(assert (=> b!565453 (= e!325588 call!32473)))

(declare-fun b!565454 () Bool)

(assert (=> b!565454 (= e!325588 e!325586)))

(declare-fun lt!257942 () (_ BitVec 64))

(assert (=> b!565454 (= lt!257942 (select (arr!17041 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!257941 () Unit!17665)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35484 (_ BitVec 64) (_ BitVec 32)) Unit!17665)

(assert (=> b!565454 (= lt!257941 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257942 #b00000000000000000000000000000000))))

(assert (=> b!565454 (arrayContainsKey!0 a!3118 lt!257942 #b00000000000000000000000000000000)))

(declare-fun lt!257943 () Unit!17665)

(assert (=> b!565454 (= lt!257943 lt!257941)))

(declare-fun res!356374 () Bool)

(assert (=> b!565454 (= res!356374 (= (seekEntryOrOpen!0 (select (arr!17041 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5446 #b00000000000000000000000000000000)))))

(assert (=> b!565454 (=> (not res!356374) (not e!325586))))

(assert (= (and d!84145 (not res!356375)) b!565451))

(assert (= (and b!565451 c!64887) b!565454))

(assert (= (and b!565451 (not c!64887)) b!565453))

(assert (= (and b!565454 res!356374) b!565452))

(assert (= (or b!565452 b!565453) bm!32470))

(assert (=> b!565451 m!543987))

(assert (=> b!565451 m!543987))

(assert (=> b!565451 m!543989))

(declare-fun m!544073 () Bool)

(assert (=> bm!32470 m!544073))

(assert (=> b!565454 m!543987))

(declare-fun m!544075 () Bool)

(assert (=> b!565454 m!544075))

(declare-fun m!544077 () Bool)

(assert (=> b!565454 m!544077))

(assert (=> b!565454 m!543987))

(declare-fun m!544079 () Bool)

(assert (=> b!565454 m!544079))

(assert (=> b!565205 d!84145))

(declare-fun b!565455 () Bool)

(declare-fun e!325589 () SeekEntryResult!5446)

(declare-fun lt!257945 () SeekEntryResult!5446)

(assert (=> b!565455 (= e!325589 (MissingZero!5446 (index!24013 lt!257945)))))

(declare-fun b!565456 () Bool)

(declare-fun e!325590 () SeekEntryResult!5446)

(assert (=> b!565456 (= e!325590 (Found!5446 (index!24013 lt!257945)))))

(declare-fun b!565457 () Bool)

(assert (=> b!565457 (= e!325589 (seekKeyOrZeroReturnVacant!0 (x!53032 lt!257945) (index!24013 lt!257945) (index!24013 lt!257945) (select (arr!17041 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565458 () Bool)

(declare-fun e!325591 () SeekEntryResult!5446)

(assert (=> b!565458 (= e!325591 Undefined!5446)))

(declare-fun b!565459 () Bool)

(assert (=> b!565459 (= e!325591 e!325590)))

(declare-fun lt!257946 () (_ BitVec 64))

(assert (=> b!565459 (= lt!257946 (select (arr!17041 a!3118) (index!24013 lt!257945)))))

(declare-fun c!64889 () Bool)

(assert (=> b!565459 (= c!64889 (= lt!257946 (select (arr!17041 a!3118) j!142)))))

(declare-fun d!84147 () Bool)

(declare-fun lt!257944 () SeekEntryResult!5446)

(assert (=> d!84147 (and (or ((_ is Undefined!5446) lt!257944) (not ((_ is Found!5446) lt!257944)) (and (bvsge (index!24012 lt!257944) #b00000000000000000000000000000000) (bvslt (index!24012 lt!257944) (size!17405 a!3118)))) (or ((_ is Undefined!5446) lt!257944) ((_ is Found!5446) lt!257944) (not ((_ is MissingZero!5446) lt!257944)) (and (bvsge (index!24011 lt!257944) #b00000000000000000000000000000000) (bvslt (index!24011 lt!257944) (size!17405 a!3118)))) (or ((_ is Undefined!5446) lt!257944) ((_ is Found!5446) lt!257944) ((_ is MissingZero!5446) lt!257944) (not ((_ is MissingVacant!5446) lt!257944)) (and (bvsge (index!24014 lt!257944) #b00000000000000000000000000000000) (bvslt (index!24014 lt!257944) (size!17405 a!3118)))) (or ((_ is Undefined!5446) lt!257944) (ite ((_ is Found!5446) lt!257944) (= (select (arr!17041 a!3118) (index!24012 lt!257944)) (select (arr!17041 a!3118) j!142)) (ite ((_ is MissingZero!5446) lt!257944) (= (select (arr!17041 a!3118) (index!24011 lt!257944)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5446) lt!257944) (= (select (arr!17041 a!3118) (index!24014 lt!257944)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84147 (= lt!257944 e!325591)))

(declare-fun c!64888 () Bool)

(assert (=> d!84147 (= c!64888 (and ((_ is Intermediate!5446) lt!257945) (undefined!6258 lt!257945)))))

(assert (=> d!84147 (= lt!257945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17041 a!3118) j!142) mask!3119) (select (arr!17041 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84147 (validMask!0 mask!3119)))

(assert (=> d!84147 (= (seekEntryOrOpen!0 (select (arr!17041 a!3118) j!142) a!3118 mask!3119) lt!257944)))

(declare-fun b!565460 () Bool)

(declare-fun c!64890 () Bool)

(assert (=> b!565460 (= c!64890 (= lt!257946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565460 (= e!325590 e!325589)))

(assert (= (and d!84147 c!64888) b!565458))

(assert (= (and d!84147 (not c!64888)) b!565459))

(assert (= (and b!565459 c!64889) b!565456))

(assert (= (and b!565459 (not c!64889)) b!565460))

(assert (= (and b!565460 c!64890) b!565455))

(assert (= (and b!565460 (not c!64890)) b!565457))

(assert (=> b!565457 m!543853))

(declare-fun m!544081 () Bool)

(assert (=> b!565457 m!544081))

(declare-fun m!544083 () Bool)

(assert (=> b!565459 m!544083))

(declare-fun m!544085 () Bool)

(assert (=> d!84147 m!544085))

(assert (=> d!84147 m!543875))

(assert (=> d!84147 m!543853))

(assert (=> d!84147 m!543883))

(declare-fun m!544087 () Bool)

(assert (=> d!84147 m!544087))

(assert (=> d!84147 m!543853))

(assert (=> d!84147 m!543875))

(assert (=> d!84147 m!543863))

(declare-fun m!544089 () Bool)

(assert (=> d!84147 m!544089))

(assert (=> b!565200 d!84147))

(declare-fun b!565461 () Bool)

(declare-fun e!325593 () Bool)

(declare-fun e!325594 () Bool)

(assert (=> b!565461 (= e!325593 e!325594)))

(declare-fun c!64891 () Bool)

(assert (=> b!565461 (= c!64891 (validKeyInArray!0 (select (arr!17041 a!3118) j!142)))))

(declare-fun d!84149 () Bool)

(declare-fun res!356377 () Bool)

(assert (=> d!84149 (=> res!356377 e!325593)))

(assert (=> d!84149 (= res!356377 (bvsge j!142 (size!17405 a!3118)))))

(assert (=> d!84149 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325593)))

(declare-fun b!565462 () Bool)

(declare-fun e!325592 () Bool)

(declare-fun call!32474 () Bool)

(assert (=> b!565462 (= e!325592 call!32474)))

(declare-fun bm!32471 () Bool)

(assert (=> bm!32471 (= call!32474 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!565463 () Bool)

(assert (=> b!565463 (= e!325594 call!32474)))

(declare-fun b!565464 () Bool)

(assert (=> b!565464 (= e!325594 e!325592)))

(declare-fun lt!257948 () (_ BitVec 64))

(assert (=> b!565464 (= lt!257948 (select (arr!17041 a!3118) j!142))))

(declare-fun lt!257947 () Unit!17665)

(assert (=> b!565464 (= lt!257947 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257948 j!142))))

(assert (=> b!565464 (arrayContainsKey!0 a!3118 lt!257948 #b00000000000000000000000000000000)))

(declare-fun lt!257949 () Unit!17665)

(assert (=> b!565464 (= lt!257949 lt!257947)))

(declare-fun res!356376 () Bool)

(assert (=> b!565464 (= res!356376 (= (seekEntryOrOpen!0 (select (arr!17041 a!3118) j!142) a!3118 mask!3119) (Found!5446 j!142)))))

(assert (=> b!565464 (=> (not res!356376) (not e!325592))))

(assert (= (and d!84149 (not res!356377)) b!565461))

(assert (= (and b!565461 c!64891) b!565464))

(assert (= (and b!565461 (not c!64891)) b!565463))

(assert (= (and b!565464 res!356376) b!565462))

(assert (= (or b!565462 b!565463) bm!32471))

(assert (=> b!565461 m!543853))

(assert (=> b!565461 m!543853))

(assert (=> b!565461 m!543873))

(declare-fun m!544091 () Bool)

(assert (=> bm!32471 m!544091))

(assert (=> b!565464 m!543853))

(declare-fun m!544093 () Bool)

(assert (=> b!565464 m!544093))

(declare-fun m!544095 () Bool)

(assert (=> b!565464 m!544095))

(assert (=> b!565464 m!543853))

(assert (=> b!565464 m!543855))

(assert (=> b!565200 d!84149))

(declare-fun d!84151 () Bool)

(assert (=> d!84151 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257965 () Unit!17665)

(declare-fun choose!38 (array!35484 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17665)

(assert (=> d!84151 (= lt!257965 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84151 (validMask!0 mask!3119)))

(assert (=> d!84151 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!257965)))

(declare-fun bs!17577 () Bool)

(assert (= bs!17577 d!84151))

(assert (=> bs!17577 m!543857))

(declare-fun m!544127 () Bool)

(assert (=> bs!17577 m!544127))

(assert (=> bs!17577 m!543863))

(assert (=> b!565200 d!84151))

(declare-fun d!84159 () Bool)

(declare-fun res!356390 () Bool)

(declare-fun e!325618 () Bool)

(assert (=> d!84159 (=> res!356390 e!325618)))

(assert (=> d!84159 (= res!356390 (= (select (arr!17041 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84159 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!325618)))

(declare-fun b!565503 () Bool)

(declare-fun e!325619 () Bool)

(assert (=> b!565503 (= e!325618 e!325619)))

(declare-fun res!356391 () Bool)

(assert (=> b!565503 (=> (not res!356391) (not e!325619))))

(assert (=> b!565503 (= res!356391 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17405 a!3118)))))

(declare-fun b!565504 () Bool)

(assert (=> b!565504 (= e!325619 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84159 (not res!356390)) b!565503))

(assert (= (and b!565503 res!356391) b!565504))

(assert (=> d!84159 m!543987))

(declare-fun m!544129 () Bool)

(assert (=> b!565504 m!544129))

(assert (=> b!565199 d!84159))

(check-sat (not b!565454) (not b!565451) (not b!565303) (not b!565461) (not d!84147) (not b!565290) (not b!565457) (not bm!32470) (not b!565504) (not b!565338) (not b!565411) (not b!565337) (not d!84087) (not d!84151) (not bm!32463) (not d!84097) (not d!84105) (not b!565464) (not b!565334) (not bm!32471))
(check-sat)
