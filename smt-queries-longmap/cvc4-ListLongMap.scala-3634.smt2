; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50136 () Bool)

(assert start!50136)

(declare-fun b!549103 () Bool)

(declare-fun res!342340 () Bool)

(declare-fun e!317160 () Bool)

(assert (=> b!549103 (=> (not res!342340) (not e!317160))))

(declare-datatypes ((array!34634 0))(
  ( (array!34635 (arr!16634 (Array (_ BitVec 32) (_ BitVec 64))) (size!16998 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34634)

(declare-datatypes ((List!10714 0))(
  ( (Nil!10711) (Cons!10710 (h!11680 (_ BitVec 64)) (t!16942 List!10714)) )
))
(declare-fun arrayNoDuplicates!0 (array!34634 (_ BitVec 32) List!10714) Bool)

(assert (=> b!549103 (= res!342340 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10711))))

(declare-fun b!549104 () Bool)

(declare-fun res!342339 () Bool)

(declare-fun e!317158 () Bool)

(assert (=> b!549104 (=> (not res!342339) (not e!317158))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!549104 (= res!342339 (and (= (size!16998 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16998 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16998 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549105 () Bool)

(declare-fun lt!250005 () (_ BitVec 32))

(assert (=> b!549105 (= e!317160 (and (bvsge mask!3119 #b00000000000000000000000000000000) (or (bvslt lt!250005 #b00000000000000000000000000000000) (bvsge lt!250005 (bvadd #b00000000000000000000000000000001 mask!3119)))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549105 (= lt!250005 (toIndex!0 (select (store (arr!16634 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun res!342338 () Bool)

(assert (=> start!50136 (=> (not res!342338) (not e!317158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50136 (= res!342338 (validMask!0 mask!3119))))

(assert (=> start!50136 e!317158))

(assert (=> start!50136 true))

(declare-fun array_inv!12430 (array!34634) Bool)

(assert (=> start!50136 (array_inv!12430 a!3118)))

(declare-fun b!549106 () Bool)

(assert (=> b!549106 (= e!317158 e!317160)))

(declare-fun res!342341 () Bool)

(assert (=> b!549106 (=> (not res!342341) (not e!317160))))

(declare-datatypes ((SeekEntryResult!5083 0))(
  ( (MissingZero!5083 (index!22559 (_ BitVec 32))) (Found!5083 (index!22560 (_ BitVec 32))) (Intermediate!5083 (undefined!5895 Bool) (index!22561 (_ BitVec 32)) (x!51490 (_ BitVec 32))) (Undefined!5083) (MissingVacant!5083 (index!22562 (_ BitVec 32))) )
))
(declare-fun lt!250006 () SeekEntryResult!5083)

(assert (=> b!549106 (= res!342341 (or (= lt!250006 (MissingZero!5083 i!1132)) (= lt!250006 (MissingVacant!5083 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34634 (_ BitVec 32)) SeekEntryResult!5083)

(assert (=> b!549106 (= lt!250006 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549107 () Bool)

(declare-fun res!342336 () Bool)

(assert (=> b!549107 (=> (not res!342336) (not e!317158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549107 (= res!342336 (validKeyInArray!0 k!1914))))

(declare-fun b!549108 () Bool)

(declare-fun res!342335 () Bool)

(assert (=> b!549108 (=> (not res!342335) (not e!317158))))

(declare-fun arrayContainsKey!0 (array!34634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549108 (= res!342335 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549109 () Bool)

(declare-fun res!342334 () Bool)

(assert (=> b!549109 (=> (not res!342334) (not e!317158))))

(assert (=> b!549109 (= res!342334 (validKeyInArray!0 (select (arr!16634 a!3118) j!142)))))

(declare-fun b!549110 () Bool)

(declare-fun res!342337 () Bool)

(assert (=> b!549110 (=> (not res!342337) (not e!317160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34634 (_ BitVec 32)) Bool)

(assert (=> b!549110 (= res!342337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50136 res!342338) b!549104))

(assert (= (and b!549104 res!342339) b!549109))

(assert (= (and b!549109 res!342334) b!549107))

(assert (= (and b!549107 res!342336) b!549108))

(assert (= (and b!549108 res!342335) b!549106))

(assert (= (and b!549106 res!342341) b!549110))

(assert (= (and b!549110 res!342337) b!549103))

(assert (= (and b!549103 res!342340) b!549105))

(declare-fun m!526011 () Bool)

(assert (=> b!549108 m!526011))

(declare-fun m!526013 () Bool)

(assert (=> b!549105 m!526013))

(declare-fun m!526015 () Bool)

(assert (=> b!549105 m!526015))

(assert (=> b!549105 m!526015))

(declare-fun m!526017 () Bool)

(assert (=> b!549105 m!526017))

(declare-fun m!526019 () Bool)

(assert (=> b!549110 m!526019))

(declare-fun m!526021 () Bool)

(assert (=> b!549107 m!526021))

(declare-fun m!526023 () Bool)

(assert (=> b!549103 m!526023))

(declare-fun m!526025 () Bool)

(assert (=> start!50136 m!526025))

(declare-fun m!526027 () Bool)

(assert (=> start!50136 m!526027))

(declare-fun m!526029 () Bool)

(assert (=> b!549109 m!526029))

(assert (=> b!549109 m!526029))

(declare-fun m!526031 () Bool)

(assert (=> b!549109 m!526031))

(declare-fun m!526033 () Bool)

(assert (=> b!549106 m!526033))

(push 1)

(assert (not b!549108))

(assert (not b!549110))

(assert (not b!549106))

(assert (not start!50136))

(assert (not b!549109))

(assert (not b!549105))

(assert (not b!549103))

(assert (not b!549107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!549139 () Bool)

(declare-fun e!317180 () Bool)

(declare-fun e!317178 () Bool)

(assert (=> b!549139 (= e!317180 e!317178)))

(declare-fun c!63725 () Bool)

(assert (=> b!549139 (= c!63725 (validKeyInArray!0 (select (arr!16634 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!549140 () Bool)

(declare-fun call!32231 () Bool)

(assert (=> b!549140 (= e!317178 call!32231)))

(declare-fun bm!32228 () Bool)

(assert (=> bm!32228 (= call!32231 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63725 (Cons!10710 (select (arr!16634 a!3118) #b00000000000000000000000000000000) Nil!10711) Nil!10711)))))

(declare-fun b!549141 () Bool)

(declare-fun e!317179 () Bool)

(declare-fun contains!2830 (List!10714 (_ BitVec 64)) Bool)

(assert (=> b!549141 (= e!317179 (contains!2830 Nil!10711 (select (arr!16634 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!82733 () Bool)

(declare-fun res!342348 () Bool)

(declare-fun e!317181 () Bool)

(assert (=> d!82733 (=> res!342348 e!317181)))

(assert (=> d!82733 (= res!342348 (bvsge #b00000000000000000000000000000000 (size!16998 a!3118)))))

(assert (=> d!82733 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10711) e!317181)))

(declare-fun b!549142 () Bool)

(assert (=> b!549142 (= e!317181 e!317180)))

(declare-fun res!342350 () Bool)

(assert (=> b!549142 (=> (not res!342350) (not e!317180))))

(assert (=> b!549142 (= res!342350 (not e!317179))))

(declare-fun res!342349 () Bool)

(assert (=> b!549142 (=> (not res!342349) (not e!317179))))

(assert (=> b!549142 (= res!342349 (validKeyInArray!0 (select (arr!16634 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!549143 () Bool)

(assert (=> b!549143 (= e!317178 call!32231)))

(assert (= (and d!82733 (not res!342348)) b!549142))

(assert (= (and b!549142 res!342349) b!549141))

(assert (= (and b!549142 res!342350) b!549139))

(assert (= (and b!549139 c!63725) b!549140))

(assert (= (and b!549139 (not c!63725)) b!549143))

(assert (= (or b!549140 b!549143) bm!32228))

(declare-fun m!526049 () Bool)

(assert (=> b!549139 m!526049))

(assert (=> b!549139 m!526049))

(declare-fun m!526051 () Bool)

(assert (=> b!549139 m!526051))

(assert (=> bm!32228 m!526049))

(declare-fun m!526053 () Bool)

(assert (=> bm!32228 m!526053))

(assert (=> b!549141 m!526049))

(assert (=> b!549141 m!526049))

(declare-fun m!526055 () Bool)

(assert (=> b!549141 m!526055))

(assert (=> b!549142 m!526049))

(assert (=> b!549142 m!526049))

(assert (=> b!549142 m!526051))

(assert (=> b!549103 d!82733))

(declare-fun d!82743 () Bool)

(declare-fun res!342357 () Bool)

(declare-fun e!317186 () Bool)

(assert (=> d!82743 (=> res!342357 e!317186)))

(assert (=> d!82743 (= res!342357 (= (select (arr!16634 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82743 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!317186)))

(declare-fun b!549148 () Bool)

(declare-fun e!317187 () Bool)

(assert (=> b!549148 (= e!317186 e!317187)))

(declare-fun res!342358 () Bool)

(assert (=> b!549148 (=> (not res!342358) (not e!317187))))

(assert (=> b!549148 (= res!342358 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16998 a!3118)))))

(declare-fun b!549149 () Bool)

(assert (=> b!549149 (= e!317187 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82743 (not res!342357)) b!549148))

(assert (= (and b!549148 res!342358) b!549149))

(assert (=> d!82743 m!526049))

(declare-fun m!526057 () Bool)

(assert (=> b!549149 m!526057))

(assert (=> b!549108 d!82743))

(declare-fun e!317225 () SeekEntryResult!5083)

(declare-fun b!549201 () Bool)

(declare-fun lt!250053 () SeekEntryResult!5083)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34634 (_ BitVec 32)) SeekEntryResult!5083)

(assert (=> b!549201 (= e!317225 (seekKeyOrZeroReturnVacant!0 (x!51490 lt!250053) (index!22561 lt!250053) (index!22561 lt!250053) k!1914 a!3118 mask!3119))))

(declare-fun b!549202 () Bool)

(declare-fun c!63741 () Bool)

(declare-fun lt!250054 () (_ BitVec 64))

(assert (=> b!549202 (= c!63741 (= lt!250054 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!317226 () SeekEntryResult!5083)

(assert (=> b!549202 (= e!317226 e!317225)))

(declare-fun b!549203 () Bool)

(assert (=> b!549203 (= e!317225 (MissingZero!5083 (index!22561 lt!250053)))))

(declare-fun b!549204 () Bool)

(declare-fun e!317224 () SeekEntryResult!5083)

(assert (=> b!549204 (= e!317224 e!317226)))

(assert (=> b!549204 (= lt!250054 (select (arr!16634 a!3118) (index!22561 lt!250053)))))

(declare-fun c!63742 () Bool)

(assert (=> b!549204 (= c!63742 (= lt!250054 k!1914))))

(declare-fun b!549205 () Bool)

(assert (=> b!549205 (= e!317226 (Found!5083 (index!22561 lt!250053)))))

(declare-fun b!549206 () Bool)

(assert (=> b!549206 (= e!317224 Undefined!5083)))

(declare-fun d!82745 () Bool)

(declare-fun lt!250052 () SeekEntryResult!5083)

(assert (=> d!82745 (and (or (is-Undefined!5083 lt!250052) (not (is-Found!5083 lt!250052)) (and (bvsge (index!22560 lt!250052) #b00000000000000000000000000000000) (bvslt (index!22560 lt!250052) (size!16998 a!3118)))) (or (is-Undefined!5083 lt!250052) (is-Found!5083 lt!250052) (not (is-MissingZero!5083 lt!250052)) (and (bvsge (index!22559 lt!250052) #b00000000000000000000000000000000) (bvslt (index!22559 lt!250052) (size!16998 a!3118)))) (or (is-Undefined!5083 lt!250052) (is-Found!5083 lt!250052) (is-MissingZero!5083 lt!250052) (not (is-MissingVacant!5083 lt!250052)) (and (bvsge (index!22562 lt!250052) #b00000000000000000000000000000000) (bvslt (index!22562 lt!250052) (size!16998 a!3118)))) (or (is-Undefined!5083 lt!250052) (ite (is-Found!5083 lt!250052) (= (select (arr!16634 a!3118) (index!22560 lt!250052)) k!1914) (ite (is-MissingZero!5083 lt!250052) (= (select (arr!16634 a!3118) (index!22559 lt!250052)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5083 lt!250052) (= (select (arr!16634 a!3118) (index!22562 lt!250052)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!82745 (= lt!250052 e!317224)))

(declare-fun c!63743 () Bool)

(assert (=> d!82745 (= c!63743 (and (is-Intermediate!5083 lt!250053) (undefined!5895 lt!250053)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34634 (_ BitVec 32)) SeekEntryResult!5083)

(assert (=> d!82745 (= lt!250053 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82745 (validMask!0 mask!3119)))

(assert (=> d!82745 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!250052)))

(assert (= (and d!82745 c!63743) b!549206))

(assert (= (and d!82745 (not c!63743)) b!549204))

(assert (= (and b!549204 c!63742) b!549205))

(assert (= (and b!549204 (not c!63742)) b!549202))

(assert (= (and b!549202 c!63741) b!549203))

(assert (= (and b!549202 (not c!63741)) b!549201))

(declare-fun m!526087 () Bool)

(assert (=> b!549201 m!526087))

(declare-fun m!526089 () Bool)

(assert (=> b!549204 m!526089))

(assert (=> d!82745 m!526025))

(declare-fun m!526091 () Bool)

(assert (=> d!82745 m!526091))

(declare-fun m!526093 () Bool)

(assert (=> d!82745 m!526093))

(declare-fun m!526095 () Bool)

(assert (=> d!82745 m!526095))

(declare-fun m!526097 () Bool)

(assert (=> d!82745 m!526097))

(assert (=> d!82745 m!526095))

(declare-fun m!526099 () Bool)

(assert (=> d!82745 m!526099))

(assert (=> b!549106 d!82745))

(declare-fun d!82757 () Bool)

(assert (=> d!82757 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!549107 d!82757))

(declare-fun d!82765 () Bool)

(declare-fun lt!250060 () (_ BitVec 32))

(declare-fun lt!250059 () (_ BitVec 32))

(assert (=> d!82765 (= lt!250060 (bvmul (bvxor lt!250059 (bvlshr lt!250059 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82765 (= lt!250059 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16634 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16634 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82765 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!342386 (let ((h!11683 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16634 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16634 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51493 (bvmul (bvxor h!11683 (bvlshr h!11683 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51493 (bvlshr x!51493 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!342386 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!342386 #b00000000000000000000000000000000))))))

(assert (=> d!82765 (= (toIndex!0 (select (store (arr!16634 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!250060 (bvlshr lt!250060 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!549105 d!82765))

(declare-fun d!82773 () Bool)

(declare-fun res!342406 () Bool)

(declare-fun e!317259 () Bool)

(assert (=> d!82773 (=> res!342406 e!317259)))

(assert (=> d!82773 (= res!342406 (bvsge #b00000000000000000000000000000000 (size!16998 a!3118)))))

(assert (=> d!82773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317259)))

(declare-fun b!549242 () Bool)

(declare-fun e!317257 () Bool)

(assert (=> b!549242 (= e!317259 e!317257)))

(declare-fun c!63749 () Bool)

(assert (=> b!549242 (= c!63749 (validKeyInArray!0 (select (arr!16634 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32243 () Bool)

(declare-fun call!32246 () Bool)

(assert (=> bm!32243 (= call!32246 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!549243 () Bool)

(declare-fun e!317258 () Bool)

(assert (=> b!549243 (= e!317257 e!317258)))

(declare-fun lt!250068 () (_ BitVec 64))

(assert (=> b!549243 (= lt!250068 (select (arr!16634 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16982 0))(
  ( (Unit!16983) )
))
(declare-fun lt!250067 () Unit!16982)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34634 (_ BitVec 64) (_ BitVec 32)) Unit!16982)

(assert (=> b!549243 (= lt!250067 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250068 #b00000000000000000000000000000000))))

(assert (=> b!549243 (arrayContainsKey!0 a!3118 lt!250068 #b00000000000000000000000000000000)))

(declare-fun lt!250069 () Unit!16982)

(assert (=> b!549243 (= lt!250069 lt!250067)))

(declare-fun res!342407 () Bool)

(assert (=> b!549243 (= res!342407 (= (seekEntryOrOpen!0 (select (arr!16634 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5083 #b00000000000000000000000000000000)))))

(assert (=> b!549243 (=> (not res!342407) (not e!317258))))

(declare-fun b!549244 () Bool)

(assert (=> b!549244 (= e!317258 call!32246)))

(declare-fun b!549245 () Bool)

(assert (=> b!549245 (= e!317257 call!32246)))

(assert (= (and d!82773 (not res!342406)) b!549242))

(assert (= (and b!549242 c!63749) b!549243))

(assert (= (and b!549242 (not c!63749)) b!549245))

(assert (= (and b!549243 res!342407) b!549244))

(assert (= (or b!549244 b!549245) bm!32243))

(assert (=> b!549242 m!526049))

(assert (=> b!549242 m!526049))

(assert (=> b!549242 m!526051))

(declare-fun m!526109 () Bool)

(assert (=> bm!32243 m!526109))

(assert (=> b!549243 m!526049))

(declare-fun m!526111 () Bool)

(assert (=> b!549243 m!526111))

(declare-fun m!526113 () Bool)

(assert (=> b!549243 m!526113))

(assert (=> b!549243 m!526049))

(declare-fun m!526115 () Bool)

(assert (=> b!549243 m!526115))

(assert (=> b!549110 d!82773))

(declare-fun d!82775 () Bool)

(assert (=> d!82775 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50136 d!82775))

(declare-fun d!82779 () Bool)

(assert (=> d!82779 (= (array_inv!12430 a!3118) (bvsge (size!16998 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50136 d!82779))

(declare-fun d!82781 () Bool)

(assert (=> d!82781 (= (validKeyInArray!0 (select (arr!16634 a!3118) j!142)) (and (not (= (select (arr!16634 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16634 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!549109 d!82781))

(push 1)

