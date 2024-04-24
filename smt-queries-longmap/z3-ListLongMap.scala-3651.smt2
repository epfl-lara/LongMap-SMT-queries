; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50388 () Bool)

(assert start!50388)

(declare-fun e!318082 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!551062 () Bool)

(declare-datatypes ((array!34731 0))(
  ( (array!34732 (arr!16678 (Array (_ BitVec 32) (_ BitVec 64))) (size!17042 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34731)

(declare-datatypes ((SeekEntryResult!5083 0))(
  ( (MissingZero!5083 (index!22559 (_ BitVec 32))) (Found!5083 (index!22560 (_ BitVec 32))) (Intermediate!5083 (undefined!5895 Bool) (index!22561 (_ BitVec 32)) (x!51638 (_ BitVec 32))) (Undefined!5083) (MissingVacant!5083 (index!22562 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34731 (_ BitVec 32)) SeekEntryResult!5083)

(assert (=> b!551062 (= e!318082 (= (seekEntryOrOpen!0 (select (arr!16678 a!3118) j!142) a!3118 mask!3119) (Found!5083 j!142)))))

(declare-fun b!551063 () Bool)

(declare-fun e!318083 () Bool)

(declare-fun e!318081 () Bool)

(assert (=> b!551063 (= e!318083 e!318081)))

(declare-fun res!343918 () Bool)

(assert (=> b!551063 (=> (not res!343918) (not e!318081))))

(declare-fun lt!250749 () SeekEntryResult!5083)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551063 (= res!343918 (or (= lt!250749 (MissingZero!5083 i!1132)) (= lt!250749 (MissingVacant!5083 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!551063 (= lt!250749 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!551064 () Bool)

(declare-fun res!343920 () Bool)

(assert (=> b!551064 (=> (not res!343920) (not e!318083))))

(declare-fun arrayContainsKey!0 (array!34731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551064 (= res!343920 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551065 () Bool)

(declare-fun e!318080 () Bool)

(declare-fun lt!250748 () (_ BitVec 32))

(assert (=> b!551065 (= e!318080 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!250748 #b00000000000000000000000000000000) (bvslt lt!250748 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!551065 e!318082))

(declare-fun res!343924 () Bool)

(assert (=> b!551065 (=> (not res!343924) (not e!318082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34731 (_ BitVec 32)) Bool)

(assert (=> b!551065 (= res!343924 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17011 0))(
  ( (Unit!17012) )
))
(declare-fun lt!250750 () Unit!17011)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17011)

(assert (=> b!551065 (= lt!250750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!343927 () Bool)

(assert (=> start!50388 (=> (not res!343927) (not e!318083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50388 (= res!343927 (validMask!0 mask!3119))))

(assert (=> start!50388 e!318083))

(assert (=> start!50388 true))

(declare-fun array_inv!12537 (array!34731) Bool)

(assert (=> start!50388 (array_inv!12537 a!3118)))

(declare-fun b!551066 () Bool)

(declare-fun res!343922 () Bool)

(assert (=> b!551066 (=> (not res!343922) (not e!318081))))

(declare-datatypes ((List!10665 0))(
  ( (Nil!10662) (Cons!10661 (h!11640 (_ BitVec 64)) (t!16885 List!10665)) )
))
(declare-fun arrayNoDuplicates!0 (array!34731 (_ BitVec 32) List!10665) Bool)

(assert (=> b!551066 (= res!343922 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10662))))

(declare-fun b!551067 () Bool)

(declare-fun res!343923 () Bool)

(assert (=> b!551067 (=> (not res!343923) (not e!318083))))

(assert (=> b!551067 (= res!343923 (and (= (size!17042 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17042 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17042 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551068 () Bool)

(declare-fun res!343919 () Bool)

(assert (=> b!551068 (=> (not res!343919) (not e!318081))))

(assert (=> b!551068 (= res!343919 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551069 () Bool)

(assert (=> b!551069 (= e!318081 e!318080)))

(declare-fun res!343926 () Bool)

(assert (=> b!551069 (=> (not res!343926) (not e!318080))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34731 (_ BitVec 32)) SeekEntryResult!5083)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551069 (= res!343926 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250748 (select (arr!16678 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)) mask!3119)))))

(assert (=> b!551069 (= lt!250748 (toIndex!0 (select (arr!16678 a!3118) j!142) mask!3119))))

(declare-fun b!551070 () Bool)

(declare-fun res!343925 () Bool)

(assert (=> b!551070 (=> (not res!343925) (not e!318083))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551070 (= res!343925 (validKeyInArray!0 (select (arr!16678 a!3118) j!142)))))

(declare-fun b!551071 () Bool)

(declare-fun res!343921 () Bool)

(assert (=> b!551071 (=> (not res!343921) (not e!318083))))

(assert (=> b!551071 (= res!343921 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50388 res!343927) b!551067))

(assert (= (and b!551067 res!343923) b!551070))

(assert (= (and b!551070 res!343925) b!551071))

(assert (= (and b!551071 res!343921) b!551064))

(assert (= (and b!551064 res!343920) b!551063))

(assert (= (and b!551063 res!343918) b!551068))

(assert (= (and b!551068 res!343919) b!551066))

(assert (= (and b!551066 res!343922) b!551069))

(assert (= (and b!551069 res!343926) b!551065))

(assert (= (and b!551065 res!343924) b!551062))

(declare-fun m!528215 () Bool)

(assert (=> b!551066 m!528215))

(declare-fun m!528217 () Bool)

(assert (=> b!551070 m!528217))

(assert (=> b!551070 m!528217))

(declare-fun m!528219 () Bool)

(assert (=> b!551070 m!528219))

(declare-fun m!528221 () Bool)

(assert (=> b!551063 m!528221))

(declare-fun m!528223 () Bool)

(assert (=> start!50388 m!528223))

(declare-fun m!528225 () Bool)

(assert (=> start!50388 m!528225))

(assert (=> b!551062 m!528217))

(assert (=> b!551062 m!528217))

(declare-fun m!528227 () Bool)

(assert (=> b!551062 m!528227))

(assert (=> b!551069 m!528217))

(declare-fun m!528229 () Bool)

(assert (=> b!551069 m!528229))

(assert (=> b!551069 m!528217))

(declare-fun m!528231 () Bool)

(assert (=> b!551069 m!528231))

(assert (=> b!551069 m!528217))

(declare-fun m!528233 () Bool)

(assert (=> b!551069 m!528233))

(declare-fun m!528235 () Bool)

(assert (=> b!551069 m!528235))

(assert (=> b!551069 m!528233))

(declare-fun m!528237 () Bool)

(assert (=> b!551069 m!528237))

(declare-fun m!528239 () Bool)

(assert (=> b!551069 m!528239))

(assert (=> b!551069 m!528233))

(assert (=> b!551069 m!528235))

(declare-fun m!528241 () Bool)

(assert (=> b!551068 m!528241))

(declare-fun m!528243 () Bool)

(assert (=> b!551064 m!528243))

(declare-fun m!528245 () Bool)

(assert (=> b!551071 m!528245))

(declare-fun m!528247 () Bool)

(assert (=> b!551065 m!528247))

(declare-fun m!528249 () Bool)

(assert (=> b!551065 m!528249))

(check-sat (not start!50388) (not b!551069) (not b!551066) (not b!551062) (not b!551064) (not b!551068) (not b!551065) (not b!551070) (not b!551071) (not b!551063))
(check-sat)
(get-model)

(declare-fun b!551140 () Bool)

(declare-fun e!318123 () Bool)

(declare-fun e!318122 () Bool)

(assert (=> b!551140 (= e!318123 e!318122)))

(declare-fun c!63908 () Bool)

(assert (=> b!551140 (= c!63908 (validKeyInArray!0 (select (arr!16678 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83017 () Bool)

(declare-fun res!343993 () Bool)

(assert (=> d!83017 (=> res!343993 e!318123)))

(assert (=> d!83017 (= res!343993 (bvsge #b00000000000000000000000000000000 (size!17042 a!3118)))))

(assert (=> d!83017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318123)))

(declare-fun b!551141 () Bool)

(declare-fun e!318121 () Bool)

(assert (=> b!551141 (= e!318122 e!318121)))

(declare-fun lt!250777 () (_ BitVec 64))

(assert (=> b!551141 (= lt!250777 (select (arr!16678 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250776 () Unit!17011)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34731 (_ BitVec 64) (_ BitVec 32)) Unit!17011)

(assert (=> b!551141 (= lt!250776 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250777 #b00000000000000000000000000000000))))

(assert (=> b!551141 (arrayContainsKey!0 a!3118 lt!250777 #b00000000000000000000000000000000)))

(declare-fun lt!250775 () Unit!17011)

(assert (=> b!551141 (= lt!250775 lt!250776)))

(declare-fun res!343992 () Bool)

(assert (=> b!551141 (= res!343992 (= (seekEntryOrOpen!0 (select (arr!16678 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5083 #b00000000000000000000000000000000)))))

(assert (=> b!551141 (=> (not res!343992) (not e!318121))))

(declare-fun bm!32271 () Bool)

(declare-fun call!32274 () Bool)

(assert (=> bm!32271 (= call!32274 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551142 () Bool)

(assert (=> b!551142 (= e!318122 call!32274)))

(declare-fun b!551143 () Bool)

(assert (=> b!551143 (= e!318121 call!32274)))

(assert (= (and d!83017 (not res!343993)) b!551140))

(assert (= (and b!551140 c!63908) b!551141))

(assert (= (and b!551140 (not c!63908)) b!551142))

(assert (= (and b!551141 res!343992) b!551143))

(assert (= (or b!551143 b!551142) bm!32271))

(declare-fun m!528323 () Bool)

(assert (=> b!551140 m!528323))

(assert (=> b!551140 m!528323))

(declare-fun m!528325 () Bool)

(assert (=> b!551140 m!528325))

(assert (=> b!551141 m!528323))

(declare-fun m!528327 () Bool)

(assert (=> b!551141 m!528327))

(declare-fun m!528329 () Bool)

(assert (=> b!551141 m!528329))

(assert (=> b!551141 m!528323))

(declare-fun m!528331 () Bool)

(assert (=> b!551141 m!528331))

(declare-fun m!528333 () Bool)

(assert (=> bm!32271 m!528333))

(assert (=> b!551068 d!83017))

(declare-fun lt!250786 () SeekEntryResult!5083)

(declare-fun e!318137 () SeekEntryResult!5083)

(declare-fun b!551162 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34731 (_ BitVec 32)) SeekEntryResult!5083)

(assert (=> b!551162 (= e!318137 (seekKeyOrZeroReturnVacant!0 (x!51638 lt!250786) (index!22561 lt!250786) (index!22561 lt!250786) (select (arr!16678 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551163 () Bool)

(declare-fun e!318136 () SeekEntryResult!5083)

(assert (=> b!551163 (= e!318136 Undefined!5083)))

(declare-fun b!551164 () Bool)

(assert (=> b!551164 (= e!318137 (MissingZero!5083 (index!22561 lt!250786)))))

(declare-fun b!551165 () Bool)

(declare-fun e!318138 () SeekEntryResult!5083)

(assert (=> b!551165 (= e!318138 (Found!5083 (index!22561 lt!250786)))))

(declare-fun b!551167 () Bool)

(assert (=> b!551167 (= e!318136 e!318138)))

(declare-fun lt!250785 () (_ BitVec 64))

(assert (=> b!551167 (= lt!250785 (select (arr!16678 a!3118) (index!22561 lt!250786)))))

(declare-fun c!63915 () Bool)

(assert (=> b!551167 (= c!63915 (= lt!250785 (select (arr!16678 a!3118) j!142)))))

(declare-fun d!83019 () Bool)

(declare-fun lt!250784 () SeekEntryResult!5083)

(get-info :version)

(assert (=> d!83019 (and (or ((_ is Undefined!5083) lt!250784) (not ((_ is Found!5083) lt!250784)) (and (bvsge (index!22560 lt!250784) #b00000000000000000000000000000000) (bvslt (index!22560 lt!250784) (size!17042 a!3118)))) (or ((_ is Undefined!5083) lt!250784) ((_ is Found!5083) lt!250784) (not ((_ is MissingZero!5083) lt!250784)) (and (bvsge (index!22559 lt!250784) #b00000000000000000000000000000000) (bvslt (index!22559 lt!250784) (size!17042 a!3118)))) (or ((_ is Undefined!5083) lt!250784) ((_ is Found!5083) lt!250784) ((_ is MissingZero!5083) lt!250784) (not ((_ is MissingVacant!5083) lt!250784)) (and (bvsge (index!22562 lt!250784) #b00000000000000000000000000000000) (bvslt (index!22562 lt!250784) (size!17042 a!3118)))) (or ((_ is Undefined!5083) lt!250784) (ite ((_ is Found!5083) lt!250784) (= (select (arr!16678 a!3118) (index!22560 lt!250784)) (select (arr!16678 a!3118) j!142)) (ite ((_ is MissingZero!5083) lt!250784) (= (select (arr!16678 a!3118) (index!22559 lt!250784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5083) lt!250784) (= (select (arr!16678 a!3118) (index!22562 lt!250784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83019 (= lt!250784 e!318136)))

(declare-fun c!63916 () Bool)

(assert (=> d!83019 (= c!63916 (and ((_ is Intermediate!5083) lt!250786) (undefined!5895 lt!250786)))))

(assert (=> d!83019 (= lt!250786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16678 a!3118) j!142) mask!3119) (select (arr!16678 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83019 (validMask!0 mask!3119)))

(assert (=> d!83019 (= (seekEntryOrOpen!0 (select (arr!16678 a!3118) j!142) a!3118 mask!3119) lt!250784)))

(declare-fun b!551166 () Bool)

(declare-fun c!63917 () Bool)

(assert (=> b!551166 (= c!63917 (= lt!250785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551166 (= e!318138 e!318137)))

(assert (= (and d!83019 c!63916) b!551163))

(assert (= (and d!83019 (not c!63916)) b!551167))

(assert (= (and b!551167 c!63915) b!551165))

(assert (= (and b!551167 (not c!63915)) b!551166))

(assert (= (and b!551166 c!63917) b!551164))

(assert (= (and b!551166 (not c!63917)) b!551162))

(assert (=> b!551162 m!528217))

(declare-fun m!528339 () Bool)

(assert (=> b!551162 m!528339))

(declare-fun m!528341 () Bool)

(assert (=> b!551167 m!528341))

(assert (=> d!83019 m!528223))

(declare-fun m!528343 () Bool)

(assert (=> d!83019 m!528343))

(assert (=> d!83019 m!528217))

(assert (=> d!83019 m!528229))

(declare-fun m!528345 () Bool)

(assert (=> d!83019 m!528345))

(assert (=> d!83019 m!528229))

(assert (=> d!83019 m!528217))

(declare-fun m!528347 () Bool)

(assert (=> d!83019 m!528347))

(declare-fun m!528349 () Bool)

(assert (=> d!83019 m!528349))

(assert (=> b!551062 d!83019))

(declare-fun d!83027 () Bool)

(assert (=> d!83027 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50388 d!83027))

(declare-fun d!83031 () Bool)

(assert (=> d!83031 (= (array_inv!12537 a!3118) (bvsge (size!17042 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50388 d!83031))

(declare-fun d!83033 () Bool)

(declare-fun res!344004 () Bool)

(declare-fun e!318158 () Bool)

(assert (=> d!83033 (=> res!344004 e!318158)))

(assert (=> d!83033 (= res!344004 (= (select (arr!16678 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83033 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318158)))

(declare-fun b!551202 () Bool)

(declare-fun e!318159 () Bool)

(assert (=> b!551202 (= e!318158 e!318159)))

(declare-fun res!344005 () Bool)

(assert (=> b!551202 (=> (not res!344005) (not e!318159))))

(assert (=> b!551202 (= res!344005 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17042 a!3118)))))

(declare-fun b!551203 () Bool)

(assert (=> b!551203 (= e!318159 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83033 (not res!344004)) b!551202))

(assert (= (and b!551202 res!344005) b!551203))

(assert (=> d!83033 m!528323))

(declare-fun m!528365 () Bool)

(assert (=> b!551203 m!528365))

(assert (=> b!551064 d!83033))

(declare-fun b!551276 () Bool)

(declare-fun e!318212 () Bool)

(declare-fun lt!250825 () SeekEntryResult!5083)

(assert (=> b!551276 (= e!318212 (bvsge (x!51638 lt!250825) #b01111111111111111111111111111110))))

(declare-fun b!551277 () Bool)

(declare-fun e!318211 () SeekEntryResult!5083)

(assert (=> b!551277 (= e!318211 (Intermediate!5083 false lt!250748 #b00000000000000000000000000000000))))

(declare-fun b!551278 () Bool)

(declare-fun e!318213 () SeekEntryResult!5083)

(assert (=> b!551278 (= e!318213 (Intermediate!5083 true lt!250748 #b00000000000000000000000000000000))))

(declare-fun b!551279 () Bool)

(assert (=> b!551279 (and (bvsge (index!22561 lt!250825) #b00000000000000000000000000000000) (bvslt (index!22561 lt!250825) (size!17042 a!3118)))))

(declare-fun res!344037 () Bool)

(assert (=> b!551279 (= res!344037 (= (select (arr!16678 a!3118) (index!22561 lt!250825)) (select (arr!16678 a!3118) j!142)))))

(declare-fun e!318210 () Bool)

(assert (=> b!551279 (=> res!344037 e!318210)))

(declare-fun e!318209 () Bool)

(assert (=> b!551279 (= e!318209 e!318210)))

(declare-fun b!551280 () Bool)

(assert (=> b!551280 (= e!318213 e!318211)))

(declare-fun lt!250824 () (_ BitVec 64))

(declare-fun c!63955 () Bool)

(assert (=> b!551280 (= c!63955 (or (= lt!250824 (select (arr!16678 a!3118) j!142)) (= (bvadd lt!250824 lt!250824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83035 () Bool)

(assert (=> d!83035 e!318212))

(declare-fun c!63954 () Bool)

(assert (=> d!83035 (= c!63954 (and ((_ is Intermediate!5083) lt!250825) (undefined!5895 lt!250825)))))

(assert (=> d!83035 (= lt!250825 e!318213)))

(declare-fun c!63956 () Bool)

(assert (=> d!83035 (= c!63956 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83035 (= lt!250824 (select (arr!16678 a!3118) lt!250748))))

(assert (=> d!83035 (validMask!0 mask!3119)))

(assert (=> d!83035 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!250748 (select (arr!16678 a!3118) j!142) a!3118 mask!3119) lt!250825)))

(declare-fun b!551281 () Bool)

(assert (=> b!551281 (= e!318212 e!318209)))

(declare-fun res!344036 () Bool)

(assert (=> b!551281 (= res!344036 (and ((_ is Intermediate!5083) lt!250825) (not (undefined!5895 lt!250825)) (bvslt (x!51638 lt!250825) #b01111111111111111111111111111110) (bvsge (x!51638 lt!250825) #b00000000000000000000000000000000) (bvsge (x!51638 lt!250825) #b00000000000000000000000000000000)))))

(assert (=> b!551281 (=> (not res!344036) (not e!318209))))

(declare-fun b!551282 () Bool)

(assert (=> b!551282 (and (bvsge (index!22561 lt!250825) #b00000000000000000000000000000000) (bvslt (index!22561 lt!250825) (size!17042 a!3118)))))

(assert (=> b!551282 (= e!318210 (= (select (arr!16678 a!3118) (index!22561 lt!250825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!551283 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551283 (= e!318211 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!250748 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (arr!16678 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551284 () Bool)

(assert (=> b!551284 (and (bvsge (index!22561 lt!250825) #b00000000000000000000000000000000) (bvslt (index!22561 lt!250825) (size!17042 a!3118)))))

(declare-fun res!344038 () Bool)

(assert (=> b!551284 (= res!344038 (= (select (arr!16678 a!3118) (index!22561 lt!250825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551284 (=> res!344038 e!318210)))

(assert (= (and d!83035 c!63956) b!551278))

(assert (= (and d!83035 (not c!63956)) b!551280))

(assert (= (and b!551280 c!63955) b!551277))

(assert (= (and b!551280 (not c!63955)) b!551283))

(assert (= (and d!83035 c!63954) b!551276))

(assert (= (and d!83035 (not c!63954)) b!551281))

(assert (= (and b!551281 res!344036) b!551279))

(assert (= (and b!551279 (not res!344037)) b!551284))

(assert (= (and b!551284 (not res!344038)) b!551282))

(declare-fun m!528415 () Bool)

(assert (=> b!551284 m!528415))

(assert (=> b!551282 m!528415))

(declare-fun m!528417 () Bool)

(assert (=> d!83035 m!528417))

(assert (=> d!83035 m!528223))

(assert (=> b!551279 m!528415))

(declare-fun m!528419 () Bool)

(assert (=> b!551283 m!528419))

(assert (=> b!551283 m!528419))

(assert (=> b!551283 m!528217))

(declare-fun m!528421 () Bool)

(assert (=> b!551283 m!528421))

(assert (=> b!551069 d!83035))

(declare-fun b!551285 () Bool)

(declare-fun e!318217 () Bool)

(declare-fun lt!250827 () SeekEntryResult!5083)

(assert (=> b!551285 (= e!318217 (bvsge (x!51638 lt!250827) #b01111111111111111111111111111110))))

(declare-fun b!551286 () Bool)

(declare-fun e!318216 () SeekEntryResult!5083)

(assert (=> b!551286 (= e!318216 (Intermediate!5083 false (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551287 () Bool)

(declare-fun e!318218 () SeekEntryResult!5083)

(assert (=> b!551287 (= e!318218 (Intermediate!5083 true (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551288 () Bool)

(assert (=> b!551288 (and (bvsge (index!22561 lt!250827) #b00000000000000000000000000000000) (bvslt (index!22561 lt!250827) (size!17042 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)))))))

(declare-fun res!344040 () Bool)

(assert (=> b!551288 (= res!344040 (= (select (arr!16678 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118))) (index!22561 lt!250827)) (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!318215 () Bool)

(assert (=> b!551288 (=> res!344040 e!318215)))

(declare-fun e!318214 () Bool)

(assert (=> b!551288 (= e!318214 e!318215)))

(declare-fun b!551289 () Bool)

(assert (=> b!551289 (= e!318218 e!318216)))

(declare-fun c!63958 () Bool)

(declare-fun lt!250826 () (_ BitVec 64))

(assert (=> b!551289 (= c!63958 (or (= lt!250826 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!250826 lt!250826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83053 () Bool)

(assert (=> d!83053 e!318217))

(declare-fun c!63957 () Bool)

(assert (=> d!83053 (= c!63957 (and ((_ is Intermediate!5083) lt!250827) (undefined!5895 lt!250827)))))

(assert (=> d!83053 (= lt!250827 e!318218)))

(declare-fun c!63959 () Bool)

(assert (=> d!83053 (= c!63959 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83053 (= lt!250826 (select (arr!16678 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118))) (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!83053 (validMask!0 mask!3119)))

(assert (=> d!83053 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)) mask!3119) lt!250827)))

(declare-fun b!551290 () Bool)

(assert (=> b!551290 (= e!318217 e!318214)))

(declare-fun res!344039 () Bool)

(assert (=> b!551290 (= res!344039 (and ((_ is Intermediate!5083) lt!250827) (not (undefined!5895 lt!250827)) (bvslt (x!51638 lt!250827) #b01111111111111111111111111111110) (bvsge (x!51638 lt!250827) #b00000000000000000000000000000000) (bvsge (x!51638 lt!250827) #b00000000000000000000000000000000)))))

(assert (=> b!551290 (=> (not res!344039) (not e!318214))))

(declare-fun b!551291 () Bool)

(assert (=> b!551291 (and (bvsge (index!22561 lt!250827) #b00000000000000000000000000000000) (bvslt (index!22561 lt!250827) (size!17042 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)))))))

(assert (=> b!551291 (= e!318215 (= (select (arr!16678 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118))) (index!22561 lt!250827)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!551292 () Bool)

(assert (=> b!551292 (= e!318216 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3119) (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)) mask!3119))))

(declare-fun b!551293 () Bool)

(assert (=> b!551293 (and (bvsge (index!22561 lt!250827) #b00000000000000000000000000000000) (bvslt (index!22561 lt!250827) (size!17042 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118)))))))

(declare-fun res!344041 () Bool)

(assert (=> b!551293 (= res!344041 (= (select (arr!16678 (array!34732 (store (arr!16678 a!3118) i!1132 k0!1914) (size!17042 a!3118))) (index!22561 lt!250827)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551293 (=> res!344041 e!318215)))

(assert (= (and d!83053 c!63959) b!551287))

(assert (= (and d!83053 (not c!63959)) b!551289))

(assert (= (and b!551289 c!63958) b!551286))

(assert (= (and b!551289 (not c!63958)) b!551292))

(assert (= (and d!83053 c!63957) b!551285))

(assert (= (and d!83053 (not c!63957)) b!551290))

(assert (= (and b!551290 res!344039) b!551288))

(assert (= (and b!551288 (not res!344040)) b!551293))

(assert (= (and b!551293 (not res!344041)) b!551291))

(declare-fun m!528423 () Bool)

(assert (=> b!551293 m!528423))

(assert (=> b!551291 m!528423))

(assert (=> d!83053 m!528235))

(declare-fun m!528425 () Bool)

(assert (=> d!83053 m!528425))

(assert (=> d!83053 m!528223))

(assert (=> b!551288 m!528423))

(assert (=> b!551292 m!528235))

(declare-fun m!528427 () Bool)

(assert (=> b!551292 m!528427))

(assert (=> b!551292 m!528427))

(assert (=> b!551292 m!528233))

(declare-fun m!528429 () Bool)

(assert (=> b!551292 m!528429))

(assert (=> b!551069 d!83053))

(declare-fun d!83059 () Bool)

(declare-fun lt!250833 () (_ BitVec 32))

(declare-fun lt!250832 () (_ BitVec 32))

(assert (=> d!83059 (= lt!250833 (bvmul (bvxor lt!250832 (bvlshr lt!250832 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83059 (= lt!250832 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83059 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344042 (let ((h!11643 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51642 (bvmul (bvxor h!11643 (bvlshr h!11643 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51642 (bvlshr x!51642 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344042 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344042 #b00000000000000000000000000000000))))))

(assert (=> d!83059 (= (toIndex!0 (select (store (arr!16678 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!250833 (bvlshr lt!250833 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551069 d!83059))

(declare-fun d!83061 () Bool)

(declare-fun lt!250835 () (_ BitVec 32))

(declare-fun lt!250834 () (_ BitVec 32))

(assert (=> d!83061 (= lt!250835 (bvmul (bvxor lt!250834 (bvlshr lt!250834 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83061 (= lt!250834 ((_ extract 31 0) (bvand (bvxor (select (arr!16678 a!3118) j!142) (bvlshr (select (arr!16678 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83061 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344042 (let ((h!11643 ((_ extract 31 0) (bvand (bvxor (select (arr!16678 a!3118) j!142) (bvlshr (select (arr!16678 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51642 (bvmul (bvxor h!11643 (bvlshr h!11643 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51642 (bvlshr x!51642 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344042 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344042 #b00000000000000000000000000000000))))))

(assert (=> d!83061 (= (toIndex!0 (select (arr!16678 a!3118) j!142) mask!3119) (bvand (bvxor lt!250835 (bvlshr lt!250835 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551069 d!83061))

(declare-fun e!318222 () SeekEntryResult!5083)

(declare-fun lt!250838 () SeekEntryResult!5083)

(declare-fun b!551298 () Bool)

(assert (=> b!551298 (= e!318222 (seekKeyOrZeroReturnVacant!0 (x!51638 lt!250838) (index!22561 lt!250838) (index!22561 lt!250838) k0!1914 a!3118 mask!3119))))

(declare-fun b!551299 () Bool)

(declare-fun e!318221 () SeekEntryResult!5083)

(assert (=> b!551299 (= e!318221 Undefined!5083)))

(declare-fun b!551300 () Bool)

(assert (=> b!551300 (= e!318222 (MissingZero!5083 (index!22561 lt!250838)))))

(declare-fun b!551301 () Bool)

(declare-fun e!318223 () SeekEntryResult!5083)

(assert (=> b!551301 (= e!318223 (Found!5083 (index!22561 lt!250838)))))

(declare-fun b!551303 () Bool)

(assert (=> b!551303 (= e!318221 e!318223)))

(declare-fun lt!250837 () (_ BitVec 64))

(assert (=> b!551303 (= lt!250837 (select (arr!16678 a!3118) (index!22561 lt!250838)))))

(declare-fun c!63960 () Bool)

(assert (=> b!551303 (= c!63960 (= lt!250837 k0!1914))))

(declare-fun d!83063 () Bool)

(declare-fun lt!250836 () SeekEntryResult!5083)

(assert (=> d!83063 (and (or ((_ is Undefined!5083) lt!250836) (not ((_ is Found!5083) lt!250836)) (and (bvsge (index!22560 lt!250836) #b00000000000000000000000000000000) (bvslt (index!22560 lt!250836) (size!17042 a!3118)))) (or ((_ is Undefined!5083) lt!250836) ((_ is Found!5083) lt!250836) (not ((_ is MissingZero!5083) lt!250836)) (and (bvsge (index!22559 lt!250836) #b00000000000000000000000000000000) (bvslt (index!22559 lt!250836) (size!17042 a!3118)))) (or ((_ is Undefined!5083) lt!250836) ((_ is Found!5083) lt!250836) ((_ is MissingZero!5083) lt!250836) (not ((_ is MissingVacant!5083) lt!250836)) (and (bvsge (index!22562 lt!250836) #b00000000000000000000000000000000) (bvslt (index!22562 lt!250836) (size!17042 a!3118)))) (or ((_ is Undefined!5083) lt!250836) (ite ((_ is Found!5083) lt!250836) (= (select (arr!16678 a!3118) (index!22560 lt!250836)) k0!1914) (ite ((_ is MissingZero!5083) lt!250836) (= (select (arr!16678 a!3118) (index!22559 lt!250836)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5083) lt!250836) (= (select (arr!16678 a!3118) (index!22562 lt!250836)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83063 (= lt!250836 e!318221)))

(declare-fun c!63961 () Bool)

(assert (=> d!83063 (= c!63961 (and ((_ is Intermediate!5083) lt!250838) (undefined!5895 lt!250838)))))

(assert (=> d!83063 (= lt!250838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83063 (validMask!0 mask!3119)))

(assert (=> d!83063 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!250836)))

(declare-fun b!551302 () Bool)

(declare-fun c!63962 () Bool)

(assert (=> b!551302 (= c!63962 (= lt!250837 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!551302 (= e!318223 e!318222)))

(assert (= (and d!83063 c!63961) b!551299))

(assert (= (and d!83063 (not c!63961)) b!551303))

(assert (= (and b!551303 c!63960) b!551301))

(assert (= (and b!551303 (not c!63960)) b!551302))

(assert (= (and b!551302 c!63962) b!551300))

(assert (= (and b!551302 (not c!63962)) b!551298))

(declare-fun m!528431 () Bool)

(assert (=> b!551298 m!528431))

(declare-fun m!528433 () Bool)

(assert (=> b!551303 m!528433))

(assert (=> d!83063 m!528223))

(declare-fun m!528435 () Bool)

(assert (=> d!83063 m!528435))

(declare-fun m!528437 () Bool)

(assert (=> d!83063 m!528437))

(declare-fun m!528439 () Bool)

(assert (=> d!83063 m!528439))

(assert (=> d!83063 m!528437))

(declare-fun m!528441 () Bool)

(assert (=> d!83063 m!528441))

(declare-fun m!528443 () Bool)

(assert (=> d!83063 m!528443))

(assert (=> b!551063 d!83063))

(declare-fun b!551308 () Bool)

(declare-fun e!318230 () Bool)

(declare-fun e!318229 () Bool)

(assert (=> b!551308 (= e!318230 e!318229)))

(declare-fun c!63965 () Bool)

(assert (=> b!551308 (= c!63965 (validKeyInArray!0 (select (arr!16678 a!3118) j!142)))))

(declare-fun d!83065 () Bool)

(declare-fun res!344048 () Bool)

(assert (=> d!83065 (=> res!344048 e!318230)))

(assert (=> d!83065 (= res!344048 (bvsge j!142 (size!17042 a!3118)))))

(assert (=> d!83065 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318230)))

(declare-fun b!551309 () Bool)

(declare-fun e!318228 () Bool)

(assert (=> b!551309 (= e!318229 e!318228)))

(declare-fun lt!250847 () (_ BitVec 64))

(assert (=> b!551309 (= lt!250847 (select (arr!16678 a!3118) j!142))))

(declare-fun lt!250846 () Unit!17011)

(assert (=> b!551309 (= lt!250846 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250847 j!142))))

(assert (=> b!551309 (arrayContainsKey!0 a!3118 lt!250847 #b00000000000000000000000000000000)))

(declare-fun lt!250845 () Unit!17011)

(assert (=> b!551309 (= lt!250845 lt!250846)))

(declare-fun res!344047 () Bool)

(assert (=> b!551309 (= res!344047 (= (seekEntryOrOpen!0 (select (arr!16678 a!3118) j!142) a!3118 mask!3119) (Found!5083 j!142)))))

(assert (=> b!551309 (=> (not res!344047) (not e!318228))))

(declare-fun call!32286 () Bool)

(declare-fun bm!32283 () Bool)

(assert (=> bm!32283 (= call!32286 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!551310 () Bool)

(assert (=> b!551310 (= e!318229 call!32286)))

(declare-fun b!551311 () Bool)

(assert (=> b!551311 (= e!318228 call!32286)))

(assert (= (and d!83065 (not res!344048)) b!551308))

(assert (= (and b!551308 c!63965) b!551309))

(assert (= (and b!551308 (not c!63965)) b!551310))

(assert (= (and b!551309 res!344047) b!551311))

(assert (= (or b!551311 b!551310) bm!32283))

(assert (=> b!551308 m!528217))

(assert (=> b!551308 m!528217))

(assert (=> b!551308 m!528219))

(assert (=> b!551309 m!528217))

(declare-fun m!528445 () Bool)

(assert (=> b!551309 m!528445))

(declare-fun m!528447 () Bool)

(assert (=> b!551309 m!528447))

(assert (=> b!551309 m!528217))

(assert (=> b!551309 m!528227))

(declare-fun m!528449 () Bool)

(assert (=> bm!32283 m!528449))

(assert (=> b!551065 d!83065))

(declare-fun d!83067 () Bool)

(assert (=> d!83067 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250857 () Unit!17011)

(declare-fun choose!38 (array!34731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17011)

(assert (=> d!83067 (= lt!250857 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83067 (validMask!0 mask!3119)))

(assert (=> d!83067 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250857)))

(declare-fun bs!17187 () Bool)

(assert (= bs!17187 d!83067))

(assert (=> bs!17187 m!528247))

(declare-fun m!528459 () Bool)

(assert (=> bs!17187 m!528459))

(assert (=> bs!17187 m!528223))

(assert (=> b!551065 d!83067))

(declare-fun d!83071 () Bool)

(assert (=> d!83071 (= (validKeyInArray!0 (select (arr!16678 a!3118) j!142)) (and (not (= (select (arr!16678 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16678 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551070 d!83071))

(declare-fun b!551372 () Bool)

(declare-fun e!318273 () Bool)

(declare-fun e!318274 () Bool)

(assert (=> b!551372 (= e!318273 e!318274)))

(declare-fun res!344078 () Bool)

(assert (=> b!551372 (=> (not res!344078) (not e!318274))))

(declare-fun e!318272 () Bool)

(assert (=> b!551372 (= res!344078 (not e!318272))))

(declare-fun res!344079 () Bool)

(assert (=> b!551372 (=> (not res!344079) (not e!318272))))

(assert (=> b!551372 (= res!344079 (validKeyInArray!0 (select (arr!16678 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551373 () Bool)

(declare-fun e!318271 () Bool)

(assert (=> b!551373 (= e!318274 e!318271)))

(declare-fun c!63982 () Bool)

(assert (=> b!551373 (= c!63982 (validKeyInArray!0 (select (arr!16678 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551374 () Bool)

(declare-fun contains!2813 (List!10665 (_ BitVec 64)) Bool)

(assert (=> b!551374 (= e!318272 (contains!2813 Nil!10662 (select (arr!16678 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32288 () Bool)

(declare-fun call!32291 () Bool)

(assert (=> bm!32288 (= call!32291 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63982 (Cons!10661 (select (arr!16678 a!3118) #b00000000000000000000000000000000) Nil!10662) Nil!10662)))))

(declare-fun b!551375 () Bool)

(assert (=> b!551375 (= e!318271 call!32291)))

(declare-fun d!83075 () Bool)

(declare-fun res!344080 () Bool)

(assert (=> d!83075 (=> res!344080 e!318273)))

(assert (=> d!83075 (= res!344080 (bvsge #b00000000000000000000000000000000 (size!17042 a!3118)))))

(assert (=> d!83075 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10662) e!318273)))

(declare-fun b!551376 () Bool)

(assert (=> b!551376 (= e!318271 call!32291)))

(assert (= (and d!83075 (not res!344080)) b!551372))

(assert (= (and b!551372 res!344079) b!551374))

(assert (= (and b!551372 res!344078) b!551373))

(assert (= (and b!551373 c!63982) b!551376))

(assert (= (and b!551373 (not c!63982)) b!551375))

(assert (= (or b!551376 b!551375) bm!32288))

(assert (=> b!551372 m!528323))

(assert (=> b!551372 m!528323))

(assert (=> b!551372 m!528325))

(assert (=> b!551373 m!528323))

(assert (=> b!551373 m!528323))

(assert (=> b!551373 m!528325))

(assert (=> b!551374 m!528323))

(assert (=> b!551374 m!528323))

(declare-fun m!528487 () Bool)

(assert (=> b!551374 m!528487))

(assert (=> bm!32288 m!528323))

(declare-fun m!528489 () Bool)

(assert (=> bm!32288 m!528489))

(assert (=> b!551066 d!83075))

(declare-fun d!83085 () Bool)

(assert (=> d!83085 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551071 d!83085))

(check-sat (not b!551374) (not b!551141) (not d!83063) (not b!551140) (not b!551372) (not d!83019) (not bm!32271) (not d!83067) (not bm!32283) (not d!83035) (not b!551292) (not b!551308) (not b!551309) (not b!551203) (not b!551283) (not b!551298) (not bm!32288) (not b!551373) (not b!551162) (not d!83053))
(check-sat)
