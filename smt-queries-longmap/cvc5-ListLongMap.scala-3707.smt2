; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50918 () Bool)

(assert start!50918)

(declare-fun b!556940 () Bool)

(declare-fun res!349174 () Bool)

(declare-fun e!320859 () Bool)

(assert (=> b!556940 (=> (not res!349174) (not e!320859))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556940 (= res!349174 (validKeyInArray!0 k!1914))))

(declare-fun b!556941 () Bool)

(declare-fun res!349171 () Bool)

(assert (=> b!556941 (=> (not res!349171) (not e!320859))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35086 0))(
  ( (array!35087 (arr!16851 (Array (_ BitVec 32) (_ BitVec 64))) (size!17215 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35086)

(assert (=> b!556941 (= res!349171 (and (= (size!17215 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17215 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17215 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!556942 () Bool)

(declare-fun e!320858 () Bool)

(assert (=> b!556942 (= e!320859 e!320858)))

(declare-fun res!349178 () Bool)

(assert (=> b!556942 (=> (not res!349178) (not e!320858))))

(declare-datatypes ((SeekEntryResult!5300 0))(
  ( (MissingZero!5300 (index!23427 (_ BitVec 32))) (Found!5300 (index!23428 (_ BitVec 32))) (Intermediate!5300 (undefined!6112 Bool) (index!23429 (_ BitVec 32)) (x!52324 (_ BitVec 32))) (Undefined!5300) (MissingVacant!5300 (index!23430 (_ BitVec 32))) )
))
(declare-fun lt!253095 () SeekEntryResult!5300)

(assert (=> b!556942 (= res!349178 (or (= lt!253095 (MissingZero!5300 i!1132)) (= lt!253095 (MissingVacant!5300 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35086 (_ BitVec 32)) SeekEntryResult!5300)

(assert (=> b!556942 (= lt!253095 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!556943 () Bool)

(declare-fun e!320855 () Bool)

(assert (=> b!556943 (= e!320858 e!320855)))

(declare-fun res!349169 () Bool)

(assert (=> b!556943 (=> (not res!349169) (not e!320855))))

(declare-fun lt!253093 () SeekEntryResult!5300)

(declare-fun lt!253094 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35086 (_ BitVec 32)) SeekEntryResult!5300)

(assert (=> b!556943 (= res!349169 (= lt!253093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253094 (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118)) mask!3119)))))

(declare-fun lt!253092 () (_ BitVec 32))

(assert (=> b!556943 (= lt!253093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253092 (select (arr!16851 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556943 (= lt!253094 (toIndex!0 (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!556943 (= lt!253092 (toIndex!0 (select (arr!16851 a!3118) j!142) mask!3119))))

(declare-fun b!556944 () Bool)

(declare-fun res!349172 () Bool)

(assert (=> b!556944 (=> (not res!349172) (not e!320859))))

(assert (=> b!556944 (= res!349172 (validKeyInArray!0 (select (arr!16851 a!3118) j!142)))))

(declare-fun b!556945 () Bool)

(declare-fun res!349177 () Bool)

(assert (=> b!556945 (=> (not res!349177) (not e!320858))))

(declare-datatypes ((List!10931 0))(
  ( (Nil!10928) (Cons!10927 (h!11915 (_ BitVec 64)) (t!17159 List!10931)) )
))
(declare-fun arrayNoDuplicates!0 (array!35086 (_ BitVec 32) List!10931) Bool)

(assert (=> b!556945 (= res!349177 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10928))))

(declare-fun res!349175 () Bool)

(assert (=> start!50918 (=> (not res!349175) (not e!320859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50918 (= res!349175 (validMask!0 mask!3119))))

(assert (=> start!50918 e!320859))

(assert (=> start!50918 true))

(declare-fun array_inv!12647 (array!35086) Bool)

(assert (=> start!50918 (array_inv!12647 a!3118)))

(declare-fun b!556946 () Bool)

(declare-fun res!349170 () Bool)

(assert (=> b!556946 (=> (not res!349170) (not e!320858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35086 (_ BitVec 32)) Bool)

(assert (=> b!556946 (= res!349170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556947 () Bool)

(declare-fun res!349176 () Bool)

(assert (=> b!556947 (=> (not res!349176) (not e!320859))))

(declare-fun arrayContainsKey!0 (array!35086 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556947 (= res!349176 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556948 () Bool)

(declare-fun e!320857 () Bool)

(assert (=> b!556948 (= e!320857 (= (seekEntryOrOpen!0 (select (arr!16851 a!3118) j!142) a!3118 mask!3119) (Found!5300 j!142)))))

(declare-fun b!556949 () Bool)

(assert (=> b!556949 (= e!320855 (not (or (not (is-Intermediate!5300 lt!253093)) (undefined!6112 lt!253093) (= (select (arr!16851 a!3118) (index!23429 lt!253093)) (select (arr!16851 a!3118) j!142)) (= (select (arr!16851 a!3118) (index!23429 lt!253093)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23429 lt!253093) #b00000000000000000000000000000000) (bvsge (index!23429 lt!253093) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52324 lt!253093) #b01111111111111111111111111111110) (bvsge (x!52324 lt!253093) #b00000000000000000000000000000000)))))))

(assert (=> b!556949 e!320857))

(declare-fun res!349173 () Bool)

(assert (=> b!556949 (=> (not res!349173) (not e!320857))))

(assert (=> b!556949 (= res!349173 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17374 0))(
  ( (Unit!17375) )
))
(declare-fun lt!253096 () Unit!17374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17374)

(assert (=> b!556949 (= lt!253096 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50918 res!349175) b!556941))

(assert (= (and b!556941 res!349171) b!556944))

(assert (= (and b!556944 res!349172) b!556940))

(assert (= (and b!556940 res!349174) b!556947))

(assert (= (and b!556947 res!349176) b!556942))

(assert (= (and b!556942 res!349178) b!556946))

(assert (= (and b!556946 res!349170) b!556945))

(assert (= (and b!556945 res!349177) b!556943))

(assert (= (and b!556943 res!349169) b!556949))

(assert (= (and b!556949 res!349173) b!556948))

(declare-fun m!534897 () Bool)

(assert (=> b!556945 m!534897))

(declare-fun m!534899 () Bool)

(assert (=> b!556942 m!534899))

(declare-fun m!534901 () Bool)

(assert (=> b!556949 m!534901))

(declare-fun m!534903 () Bool)

(assert (=> b!556949 m!534903))

(declare-fun m!534905 () Bool)

(assert (=> b!556949 m!534905))

(declare-fun m!534907 () Bool)

(assert (=> b!556949 m!534907))

(declare-fun m!534909 () Bool)

(assert (=> start!50918 m!534909))

(declare-fun m!534911 () Bool)

(assert (=> start!50918 m!534911))

(declare-fun m!534913 () Bool)

(assert (=> b!556947 m!534913))

(assert (=> b!556948 m!534903))

(assert (=> b!556948 m!534903))

(declare-fun m!534915 () Bool)

(assert (=> b!556948 m!534915))

(assert (=> b!556943 m!534903))

(declare-fun m!534917 () Bool)

(assert (=> b!556943 m!534917))

(assert (=> b!556943 m!534903))

(declare-fun m!534919 () Bool)

(assert (=> b!556943 m!534919))

(assert (=> b!556943 m!534919))

(declare-fun m!534921 () Bool)

(assert (=> b!556943 m!534921))

(declare-fun m!534923 () Bool)

(assert (=> b!556943 m!534923))

(assert (=> b!556943 m!534903))

(declare-fun m!534925 () Bool)

(assert (=> b!556943 m!534925))

(assert (=> b!556943 m!534919))

(declare-fun m!534927 () Bool)

(assert (=> b!556943 m!534927))

(declare-fun m!534929 () Bool)

(assert (=> b!556946 m!534929))

(assert (=> b!556944 m!534903))

(assert (=> b!556944 m!534903))

(declare-fun m!534931 () Bool)

(assert (=> b!556944 m!534931))

(declare-fun m!534933 () Bool)

(assert (=> b!556940 m!534933))

(push 1)

(assert (not b!556940))

(assert (not b!556945))

(assert (not start!50918))

(assert (not b!556946))

(assert (not b!556947))

(assert (not b!556949))

(assert (not b!556942))

(assert (not b!556948))

(assert (not b!556943))

(assert (not b!556944))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!557054 () Bool)

(declare-fun e!320917 () Bool)

(declare-fun call!32354 () Bool)

(assert (=> b!557054 (= e!320917 call!32354)))

(declare-fun d!83381 () Bool)

(declare-fun res!349257 () Bool)

(declare-fun e!320918 () Bool)

(assert (=> d!83381 (=> res!349257 e!320918)))

(assert (=> d!83381 (= res!349257 (bvsge #b00000000000000000000000000000000 (size!17215 a!3118)))))

(assert (=> d!83381 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!320918)))

(declare-fun bm!32351 () Bool)

(assert (=> bm!32351 (= call!32354 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557055 () Bool)

(declare-fun e!320916 () Bool)

(assert (=> b!557055 (= e!320917 e!320916)))

(declare-fun lt!253143 () (_ BitVec 64))

(assert (=> b!557055 (= lt!253143 (select (arr!16851 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253141 () Unit!17374)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35086 (_ BitVec 64) (_ BitVec 32)) Unit!17374)

(assert (=> b!557055 (= lt!253141 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253143 #b00000000000000000000000000000000))))

(assert (=> b!557055 (arrayContainsKey!0 a!3118 lt!253143 #b00000000000000000000000000000000)))

(declare-fun lt!253142 () Unit!17374)

(assert (=> b!557055 (= lt!253142 lt!253141)))

(declare-fun res!349256 () Bool)

(assert (=> b!557055 (= res!349256 (= (seekEntryOrOpen!0 (select (arr!16851 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5300 #b00000000000000000000000000000000)))))

(assert (=> b!557055 (=> (not res!349256) (not e!320916))))

(declare-fun b!557056 () Bool)

(assert (=> b!557056 (= e!320916 call!32354)))

(declare-fun b!557057 () Bool)

(assert (=> b!557057 (= e!320918 e!320917)))

(declare-fun c!64238 () Bool)

(assert (=> b!557057 (= c!64238 (validKeyInArray!0 (select (arr!16851 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83381 (not res!349257)) b!557057))

(assert (= (and b!557057 c!64238) b!557055))

(assert (= (and b!557057 (not c!64238)) b!557054))

(assert (= (and b!557055 res!349256) b!557056))

(assert (= (or b!557056 b!557054) bm!32351))

(declare-fun m!535027 () Bool)

(assert (=> bm!32351 m!535027))

(declare-fun m!535029 () Bool)

(assert (=> b!557055 m!535029))

(declare-fun m!535031 () Bool)

(assert (=> b!557055 m!535031))

(declare-fun m!535033 () Bool)

(assert (=> b!557055 m!535033))

(assert (=> b!557055 m!535029))

(declare-fun m!535035 () Bool)

(assert (=> b!557055 m!535035))

(assert (=> b!557057 m!535029))

(assert (=> b!557057 m!535029))

(declare-fun m!535037 () Bool)

(assert (=> b!557057 m!535037))

(assert (=> b!556946 d!83381))

(declare-fun d!83387 () Bool)

(assert (=> d!83387 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556940 d!83387))

(declare-fun d!83389 () Bool)

(declare-fun res!349270 () Bool)

(declare-fun e!320936 () Bool)

(assert (=> d!83389 (=> res!349270 e!320936)))

(assert (=> d!83389 (= res!349270 (bvsge #b00000000000000000000000000000000 (size!17215 a!3118)))))

(assert (=> d!83389 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10928) e!320936)))

(declare-fun b!557080 () Bool)

(declare-fun e!320939 () Bool)

(declare-fun e!320938 () Bool)

(assert (=> b!557080 (= e!320939 e!320938)))

(declare-fun c!64244 () Bool)

(assert (=> b!557080 (= c!64244 (validKeyInArray!0 (select (arr!16851 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557081 () Bool)

(assert (=> b!557081 (= e!320936 e!320939)))

(declare-fun res!349271 () Bool)

(assert (=> b!557081 (=> (not res!349271) (not e!320939))))

(declare-fun e!320937 () Bool)

(assert (=> b!557081 (= res!349271 (not e!320937))))

(declare-fun res!349272 () Bool)

(assert (=> b!557081 (=> (not res!349272) (not e!320937))))

(assert (=> b!557081 (= res!349272 (validKeyInArray!0 (select (arr!16851 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!557082 () Bool)

(declare-fun call!32360 () Bool)

(assert (=> b!557082 (= e!320938 call!32360)))

(declare-fun b!557083 () Bool)

(assert (=> b!557083 (= e!320938 call!32360)))

(declare-fun bm!32357 () Bool)

(assert (=> bm!32357 (= call!32360 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64244 (Cons!10927 (select (arr!16851 a!3118) #b00000000000000000000000000000000) Nil!10928) Nil!10928)))))

(declare-fun b!557084 () Bool)

(declare-fun contains!2849 (List!10931 (_ BitVec 64)) Bool)

(assert (=> b!557084 (= e!320937 (contains!2849 Nil!10928 (select (arr!16851 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83389 (not res!349270)) b!557081))

(assert (= (and b!557081 res!349272) b!557084))

(assert (= (and b!557081 res!349271) b!557080))

(assert (= (and b!557080 c!64244) b!557083))

(assert (= (and b!557080 (not c!64244)) b!557082))

(assert (= (or b!557083 b!557082) bm!32357))

(assert (=> b!557080 m!535029))

(assert (=> b!557080 m!535029))

(assert (=> b!557080 m!535037))

(assert (=> b!557081 m!535029))

(assert (=> b!557081 m!535029))

(assert (=> b!557081 m!535037))

(assert (=> bm!32357 m!535029))

(declare-fun m!535051 () Bool)

(assert (=> bm!32357 m!535051))

(assert (=> b!557084 m!535029))

(assert (=> b!557084 m!535029))

(declare-fun m!535053 () Bool)

(assert (=> b!557084 m!535053))

(assert (=> b!556945 d!83389))

(declare-fun d!83399 () Bool)

(assert (=> d!83399 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50918 d!83399))

(declare-fun d!83407 () Bool)

(assert (=> d!83407 (= (array_inv!12647 a!3118) (bvsge (size!17215 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50918 d!83407))

(declare-fun d!83409 () Bool)

(assert (=> d!83409 (= (validKeyInArray!0 (select (arr!16851 a!3118) j!142)) (and (not (= (select (arr!16851 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16851 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!556944 d!83409))

(declare-fun b!557113 () Bool)

(declare-fun e!320959 () Bool)

(declare-fun call!32365 () Bool)

(assert (=> b!557113 (= e!320959 call!32365)))

(declare-fun d!83411 () Bool)

(declare-fun res!349282 () Bool)

(declare-fun e!320960 () Bool)

(assert (=> d!83411 (=> res!349282 e!320960)))

(assert (=> d!83411 (= res!349282 (bvsge j!142 (size!17215 a!3118)))))

(assert (=> d!83411 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!320960)))

(declare-fun bm!32362 () Bool)

(assert (=> bm!32362 (= call!32365 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!557114 () Bool)

(declare-fun e!320958 () Bool)

(assert (=> b!557114 (= e!320959 e!320958)))

(declare-fun lt!253184 () (_ BitVec 64))

(assert (=> b!557114 (= lt!253184 (select (arr!16851 a!3118) j!142))))

(declare-fun lt!253182 () Unit!17374)

(assert (=> b!557114 (= lt!253182 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253184 j!142))))

(assert (=> b!557114 (arrayContainsKey!0 a!3118 lt!253184 #b00000000000000000000000000000000)))

(declare-fun lt!253183 () Unit!17374)

(assert (=> b!557114 (= lt!253183 lt!253182)))

(declare-fun res!349281 () Bool)

(assert (=> b!557114 (= res!349281 (= (seekEntryOrOpen!0 (select (arr!16851 a!3118) j!142) a!3118 mask!3119) (Found!5300 j!142)))))

(assert (=> b!557114 (=> (not res!349281) (not e!320958))))

(declare-fun b!557115 () Bool)

(assert (=> b!557115 (= e!320958 call!32365)))

(declare-fun b!557116 () Bool)

(assert (=> b!557116 (= e!320960 e!320959)))

(declare-fun c!64255 () Bool)

(assert (=> b!557116 (= c!64255 (validKeyInArray!0 (select (arr!16851 a!3118) j!142)))))

(assert (= (and d!83411 (not res!349282)) b!557116))

(assert (= (and b!557116 c!64255) b!557114))

(assert (= (and b!557116 (not c!64255)) b!557113))

(assert (= (and b!557114 res!349281) b!557115))

(assert (= (or b!557115 b!557113) bm!32362))

(declare-fun m!535075 () Bool)

(assert (=> bm!32362 m!535075))

(assert (=> b!557114 m!534903))

(declare-fun m!535077 () Bool)

(assert (=> b!557114 m!535077))

(declare-fun m!535079 () Bool)

(assert (=> b!557114 m!535079))

(assert (=> b!557114 m!534903))

(assert (=> b!557114 m!534915))

(assert (=> b!557116 m!534903))

(assert (=> b!557116 m!534903))

(assert (=> b!557116 m!534931))

(assert (=> b!556949 d!83411))

(declare-fun d!83413 () Bool)

(assert (=> d!83413 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253190 () Unit!17374)

(declare-fun choose!38 (array!35086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17374)

(assert (=> d!83413 (= lt!253190 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83413 (validMask!0 mask!3119)))

(assert (=> d!83413 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253190)))

(declare-fun bs!17348 () Bool)

(assert (= bs!17348 d!83413))

(assert (=> bs!17348 m!534905))

(declare-fun m!535095 () Bool)

(assert (=> bs!17348 m!535095))

(assert (=> bs!17348 m!534909))

(assert (=> b!556949 d!83413))

(declare-fun b!557184 () Bool)

(declare-fun lt!253211 () SeekEntryResult!5300)

(assert (=> b!557184 (and (bvsge (index!23429 lt!253211) #b00000000000000000000000000000000) (bvslt (index!23429 lt!253211) (size!17215 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118)))))))

(declare-fun res!349308 () Bool)

(assert (=> b!557184 (= res!349308 (= (select (arr!16851 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118))) (index!23429 lt!253211)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321005 () Bool)

(assert (=> b!557184 (=> res!349308 e!321005)))

(declare-fun b!557185 () Bool)

(declare-fun e!321004 () SeekEntryResult!5300)

(assert (=> b!557185 (= e!321004 (Intermediate!5300 true lt!253094 #b00000000000000000000000000000000))))

(declare-fun b!557186 () Bool)

(declare-fun e!321007 () SeekEntryResult!5300)

(assert (=> b!557186 (= e!321004 e!321007)))

(declare-fun c!64280 () Bool)

(declare-fun lt!253210 () (_ BitVec 64))

(assert (=> b!557186 (= c!64280 (or (= lt!253210 (select (store (arr!16851 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253210 lt!253210) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557187 () Bool)

(declare-fun e!321006 () Bool)

(assert (=> b!557187 (= e!321006 (bvsge (x!52324 lt!253211) #b01111111111111111111111111111110))))

(declare-fun b!557188 () Bool)

(assert (=> b!557188 (and (bvsge (index!23429 lt!253211) #b00000000000000000000000000000000) (bvslt (index!23429 lt!253211) (size!17215 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118)))))))

(declare-fun res!349306 () Bool)

(assert (=> b!557188 (= res!349306 (= (select (arr!16851 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118))) (index!23429 lt!253211)) (select (store (arr!16851 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!557188 (=> res!349306 e!321005)))

(declare-fun e!321008 () Bool)

(assert (=> b!557188 (= e!321008 e!321005)))

(declare-fun b!557189 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!557189 (= e!321007 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253094 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118)) mask!3119))))

(declare-fun b!557190 () Bool)

(assert (=> b!557190 (and (bvsge (index!23429 lt!253211) #b00000000000000000000000000000000) (bvslt (index!23429 lt!253211) (size!17215 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118)))))))

(assert (=> b!557190 (= e!321005 (= (select (arr!16851 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118))) (index!23429 lt!253211)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83417 () Bool)

(assert (=> d!83417 e!321006))

(declare-fun c!64279 () Bool)

(assert (=> d!83417 (= c!64279 (and (is-Intermediate!5300 lt!253211) (undefined!6112 lt!253211)))))

(assert (=> d!83417 (= lt!253211 e!321004)))

(declare-fun c!64278 () Bool)

(assert (=> d!83417 (= c!64278 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83417 (= lt!253210 (select (arr!16851 (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118))) lt!253094))))

(assert (=> d!83417 (validMask!0 mask!3119)))

(assert (=> d!83417 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253094 (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) (array!35087 (store (arr!16851 a!3118) i!1132 k!1914) (size!17215 a!3118)) mask!3119) lt!253211)))

(declare-fun b!557191 () Bool)

(assert (=> b!557191 (= e!321006 e!321008)))

(declare-fun res!349307 () Bool)

(assert (=> b!557191 (= res!349307 (and (is-Intermediate!5300 lt!253211) (not (undefined!6112 lt!253211)) (bvslt (x!52324 lt!253211) #b01111111111111111111111111111110) (bvsge (x!52324 lt!253211) #b00000000000000000000000000000000) (bvsge (x!52324 lt!253211) #b00000000000000000000000000000000)))))

(assert (=> b!557191 (=> (not res!349307) (not e!321008))))

(declare-fun b!557192 () Bool)

(assert (=> b!557192 (= e!321007 (Intermediate!5300 false lt!253094 #b00000000000000000000000000000000))))

(assert (= (and d!83417 c!64278) b!557185))

(assert (= (and d!83417 (not c!64278)) b!557186))

(assert (= (and b!557186 c!64280) b!557192))

(assert (= (and b!557186 (not c!64280)) b!557189))

(assert (= (and d!83417 c!64279) b!557187))

(assert (= (and d!83417 (not c!64279)) b!557191))

(assert (= (and b!557191 res!349307) b!557188))

(assert (= (and b!557188 (not res!349306)) b!557184))

(assert (= (and b!557184 (not res!349308)) b!557190))

(declare-fun m!535125 () Bool)

(assert (=> b!557188 m!535125))

(declare-fun m!535127 () Bool)

(assert (=> b!557189 m!535127))

(assert (=> b!557189 m!535127))

(assert (=> b!557189 m!534919))

(declare-fun m!535129 () Bool)

(assert (=> b!557189 m!535129))

(assert (=> b!557190 m!535125))

(declare-fun m!535131 () Bool)

(assert (=> d!83417 m!535131))

(assert (=> d!83417 m!534909))

(assert (=> b!557184 m!535125))

(assert (=> b!556943 d!83417))

(declare-fun b!557193 () Bool)

(declare-fun lt!253213 () SeekEntryResult!5300)

(assert (=> b!557193 (and (bvsge (index!23429 lt!253213) #b00000000000000000000000000000000) (bvslt (index!23429 lt!253213) (size!17215 a!3118)))))

(declare-fun res!349311 () Bool)

(assert (=> b!557193 (= res!349311 (= (select (arr!16851 a!3118) (index!23429 lt!253213)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321010 () Bool)

(assert (=> b!557193 (=> res!349311 e!321010)))

(declare-fun b!557194 () Bool)

(declare-fun e!321009 () SeekEntryResult!5300)

(assert (=> b!557194 (= e!321009 (Intermediate!5300 true lt!253092 #b00000000000000000000000000000000))))

(declare-fun b!557195 () Bool)

(declare-fun e!321012 () SeekEntryResult!5300)

(assert (=> b!557195 (= e!321009 e!321012)))

(declare-fun c!64283 () Bool)

(declare-fun lt!253212 () (_ BitVec 64))

(assert (=> b!557195 (= c!64283 (or (= lt!253212 (select (arr!16851 a!3118) j!142)) (= (bvadd lt!253212 lt!253212) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!557196 () Bool)

(declare-fun e!321011 () Bool)

(assert (=> b!557196 (= e!321011 (bvsge (x!52324 lt!253213) #b01111111111111111111111111111110))))

(declare-fun b!557197 () Bool)

(assert (=> b!557197 (and (bvsge (index!23429 lt!253213) #b00000000000000000000000000000000) (bvslt (index!23429 lt!253213) (size!17215 a!3118)))))

(declare-fun res!349309 () Bool)

(assert (=> b!557197 (= res!349309 (= (select (arr!16851 a!3118) (index!23429 lt!253213)) (select (arr!16851 a!3118) j!142)))))

(assert (=> b!557197 (=> res!349309 e!321010)))

(declare-fun e!321013 () Bool)

(assert (=> b!557197 (= e!321013 e!321010)))

(declare-fun b!557198 () Bool)

(assert (=> b!557198 (= e!321012 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253092 #b00000000000000000000000000000000 mask!3119) (select (arr!16851 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557199 () Bool)

(assert (=> b!557199 (and (bvsge (index!23429 lt!253213) #b00000000000000000000000000000000) (bvslt (index!23429 lt!253213) (size!17215 a!3118)))))

(assert (=> b!557199 (= e!321010 (= (select (arr!16851 a!3118) (index!23429 lt!253213)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!83433 () Bool)

(assert (=> d!83433 e!321011))

(declare-fun c!64282 () Bool)

(assert (=> d!83433 (= c!64282 (and (is-Intermediate!5300 lt!253213) (undefined!6112 lt!253213)))))

(assert (=> d!83433 (= lt!253213 e!321009)))

(declare-fun c!64281 () Bool)

(assert (=> d!83433 (= c!64281 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83433 (= lt!253212 (select (arr!16851 a!3118) lt!253092))))

(assert (=> d!83433 (validMask!0 mask!3119)))

(assert (=> d!83433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253092 (select (arr!16851 a!3118) j!142) a!3118 mask!3119) lt!253213)))

(declare-fun b!557200 () Bool)

(assert (=> b!557200 (= e!321011 e!321013)))

(declare-fun res!349310 () Bool)

(assert (=> b!557200 (= res!349310 (and (is-Intermediate!5300 lt!253213) (not (undefined!6112 lt!253213)) (bvslt (x!52324 lt!253213) #b01111111111111111111111111111110) (bvsge (x!52324 lt!253213) #b00000000000000000000000000000000) (bvsge (x!52324 lt!253213) #b00000000000000000000000000000000)))))

(assert (=> b!557200 (=> (not res!349310) (not e!321013))))

(declare-fun b!557201 () Bool)

(assert (=> b!557201 (= e!321012 (Intermediate!5300 false lt!253092 #b00000000000000000000000000000000))))

(assert (= (and d!83433 c!64281) b!557194))

(assert (= (and d!83433 (not c!64281)) b!557195))

(assert (= (and b!557195 c!64283) b!557201))

(assert (= (and b!557195 (not c!64283)) b!557198))

(assert (= (and d!83433 c!64282) b!557196))

(assert (= (and d!83433 (not c!64282)) b!557200))

(assert (= (and b!557200 res!349310) b!557197))

(assert (= (and b!557197 (not res!349309)) b!557193))

(assert (= (and b!557193 (not res!349311)) b!557199))

(declare-fun m!535133 () Bool)

(assert (=> b!557197 m!535133))

(declare-fun m!535135 () Bool)

(assert (=> b!557198 m!535135))

(assert (=> b!557198 m!535135))

(assert (=> b!557198 m!534903))

(declare-fun m!535137 () Bool)

(assert (=> b!557198 m!535137))

(assert (=> b!557199 m!535133))

(declare-fun m!535139 () Bool)

(assert (=> d!83433 m!535139))

(assert (=> d!83433 m!534909))

(assert (=> b!557193 m!535133))

(assert (=> b!556943 d!83433))

(declare-fun d!83435 () Bool)

(declare-fun lt!253227 () (_ BitVec 32))

(declare-fun lt!253226 () (_ BitVec 32))

(assert (=> d!83435 (= lt!253227 (bvmul (bvxor lt!253226 (bvlshr lt!253226 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83435 (= lt!253226 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83435 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349318 (let ((h!11919 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52331 (bvmul (bvxor h!11919 (bvlshr h!11919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52331 (bvlshr x!52331 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349318 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349318 #b00000000000000000000000000000000))))))

(assert (=> d!83435 (= (toIndex!0 (select (store (arr!16851 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!253227 (bvlshr lt!253227 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556943 d!83435))

(declare-fun d!83449 () Bool)

(declare-fun lt!253229 () (_ BitVec 32))

(declare-fun lt!253228 () (_ BitVec 32))

(assert (=> d!83449 (= lt!253229 (bvmul (bvxor lt!253228 (bvlshr lt!253228 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83449 (= lt!253228 ((_ extract 31 0) (bvand (bvxor (select (arr!16851 a!3118) j!142) (bvlshr (select (arr!16851 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83449 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!349318 (let ((h!11919 ((_ extract 31 0) (bvand (bvxor (select (arr!16851 a!3118) j!142) (bvlshr (select (arr!16851 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52331 (bvmul (bvxor h!11919 (bvlshr h!11919 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52331 (bvlshr x!52331 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!349318 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!349318 #b00000000000000000000000000000000))))))

(assert (=> d!83449 (= (toIndex!0 (select (arr!16851 a!3118) j!142) mask!3119) (bvand (bvxor lt!253229 (bvlshr lt!253229 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!556943 d!83449))

(declare-fun lt!253251 () SeekEntryResult!5300)

(declare-fun e!321065 () SeekEntryResult!5300)

(declare-fun b!557283 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35086 (_ BitVec 32)) SeekEntryResult!5300)

(assert (=> b!557283 (= e!321065 (seekKeyOrZeroReturnVacant!0 (x!52324 lt!253251) (index!23429 lt!253251) (index!23429 lt!253251) (select (arr!16851 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!557284 () Bool)

(declare-fun e!321066 () SeekEntryResult!5300)

(declare-fun e!321064 () SeekEntryResult!5300)

(assert (=> b!557284 (= e!321066 e!321064)))

(declare-fun lt!253252 () (_ BitVec 64))

(assert (=> b!557284 (= lt!253252 (select (arr!16851 a!3118) (index!23429 lt!253251)))))

(declare-fun c!64313 () Bool)

(assert (=> b!557284 (= c!64313 (= lt!253252 (select (arr!16851 a!3118) j!142)))))

(declare-fun b!557285 () Bool)

(declare-fun c!64312 () Bool)

(assert (=> b!557285 (= c!64312 (= lt!253252 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557285 (= e!321064 e!321065)))

(declare-fun b!557286 () Bool)

(assert (=> b!557286 (= e!321064 (Found!5300 (index!23429 lt!253251)))))

(declare-fun d!83451 () Bool)

(declare-fun lt!253250 () SeekEntryResult!5300)

(assert (=> d!83451 (and (or (is-Undefined!5300 lt!253250) (not (is-Found!5300 lt!253250)) (and (bvsge (index!23428 lt!253250) #b00000000000000000000000000000000) (bvslt (index!23428 lt!253250) (size!17215 a!3118)))) (or (is-Undefined!5300 lt!253250) (is-Found!5300 lt!253250) (not (is-MissingZero!5300 lt!253250)) (and (bvsge (index!23427 lt!253250) #b00000000000000000000000000000000) (bvslt (index!23427 lt!253250) (size!17215 a!3118)))) (or (is-Undefined!5300 lt!253250) (is-Found!5300 lt!253250) (is-MissingZero!5300 lt!253250) (not (is-MissingVacant!5300 lt!253250)) (and (bvsge (index!23430 lt!253250) #b00000000000000000000000000000000) (bvslt (index!23430 lt!253250) (size!17215 a!3118)))) (or (is-Undefined!5300 lt!253250) (ite (is-Found!5300 lt!253250) (= (select (arr!16851 a!3118) (index!23428 lt!253250)) (select (arr!16851 a!3118) j!142)) (ite (is-MissingZero!5300 lt!253250) (= (select (arr!16851 a!3118) (index!23427 lt!253250)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5300 lt!253250) (= (select (arr!16851 a!3118) (index!23430 lt!253250)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83451 (= lt!253250 e!321066)))

(declare-fun c!64311 () Bool)

(assert (=> d!83451 (= c!64311 (and (is-Intermediate!5300 lt!253251) (undefined!6112 lt!253251)))))

(assert (=> d!83451 (= lt!253251 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16851 a!3118) j!142) mask!3119) (select (arr!16851 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83451 (validMask!0 mask!3119)))

(assert (=> d!83451 (= (seekEntryOrOpen!0 (select (arr!16851 a!3118) j!142) a!3118 mask!3119) lt!253250)))

(declare-fun b!557287 () Bool)

(assert (=> b!557287 (= e!321066 Undefined!5300)))

(declare-fun b!557288 () Bool)

(assert (=> b!557288 (= e!321065 (MissingZero!5300 (index!23429 lt!253251)))))

(assert (= (and d!83451 c!64311) b!557287))

(assert (= (and d!83451 (not c!64311)) b!557284))

(assert (= (and b!557284 c!64313) b!557286))

(assert (= (and b!557284 (not c!64313)) b!557285))

(assert (= (and b!557285 c!64312) b!557288))

(assert (= (and b!557285 (not c!64312)) b!557283))

(assert (=> b!557283 m!534903))

(declare-fun m!535187 () Bool)

(assert (=> b!557283 m!535187))

(declare-fun m!535189 () Bool)

(assert (=> b!557284 m!535189))

(assert (=> d!83451 m!534917))

(assert (=> d!83451 m!534903))

(declare-fun m!535191 () Bool)

(assert (=> d!83451 m!535191))

(assert (=> d!83451 m!534909))

(assert (=> d!83451 m!534903))

(assert (=> d!83451 m!534917))

(declare-fun m!535193 () Bool)

(assert (=> d!83451 m!535193))

(declare-fun m!535195 () Bool)

(assert (=> d!83451 m!535195))

(declare-fun m!535197 () Bool)

(assert (=> d!83451 m!535197))

(assert (=> b!556948 d!83451))

(declare-fun e!321068 () SeekEntryResult!5300)

(declare-fun lt!253254 () SeekEntryResult!5300)

(declare-fun b!557289 () Bool)

(assert (=> b!557289 (= e!321068 (seekKeyOrZeroReturnVacant!0 (x!52324 lt!253254) (index!23429 lt!253254) (index!23429 lt!253254) k!1914 a!3118 mask!3119))))

(declare-fun b!557290 () Bool)

(declare-fun e!321069 () SeekEntryResult!5300)

(declare-fun e!321067 () SeekEntryResult!5300)

(assert (=> b!557290 (= e!321069 e!321067)))

(declare-fun lt!253255 () (_ BitVec 64))

(assert (=> b!557290 (= lt!253255 (select (arr!16851 a!3118) (index!23429 lt!253254)))))

(declare-fun c!64316 () Bool)

(assert (=> b!557290 (= c!64316 (= lt!253255 k!1914))))

(declare-fun b!557291 () Bool)

(declare-fun c!64315 () Bool)

(assert (=> b!557291 (= c!64315 (= lt!253255 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!557291 (= e!321067 e!321068)))

(declare-fun b!557292 () Bool)

(assert (=> b!557292 (= e!321067 (Found!5300 (index!23429 lt!253254)))))

(declare-fun d!83465 () Bool)

(declare-fun lt!253253 () SeekEntryResult!5300)

(assert (=> d!83465 (and (or (is-Undefined!5300 lt!253253) (not (is-Found!5300 lt!253253)) (and (bvsge (index!23428 lt!253253) #b00000000000000000000000000000000) (bvslt (index!23428 lt!253253) (size!17215 a!3118)))) (or (is-Undefined!5300 lt!253253) (is-Found!5300 lt!253253) (not (is-MissingZero!5300 lt!253253)) (and (bvsge (index!23427 lt!253253) #b00000000000000000000000000000000) (bvslt (index!23427 lt!253253) (size!17215 a!3118)))) (or (is-Undefined!5300 lt!253253) (is-Found!5300 lt!253253) (is-MissingZero!5300 lt!253253) (not (is-MissingVacant!5300 lt!253253)) (and (bvsge (index!23430 lt!253253) #b00000000000000000000000000000000) (bvslt (index!23430 lt!253253) (size!17215 a!3118)))) (or (is-Undefined!5300 lt!253253) (ite (is-Found!5300 lt!253253) (= (select (arr!16851 a!3118) (index!23428 lt!253253)) k!1914) (ite (is-MissingZero!5300 lt!253253) (= (select (arr!16851 a!3118) (index!23427 lt!253253)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5300 lt!253253) (= (select (arr!16851 a!3118) (index!23430 lt!253253)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83465 (= lt!253253 e!321069)))

(declare-fun c!64314 () Bool)

(assert (=> d!83465 (= c!64314 (and (is-Intermediate!5300 lt!253254) (undefined!6112 lt!253254)))))

(assert (=> d!83465 (= lt!253254 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83465 (validMask!0 mask!3119)))

(assert (=> d!83465 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!253253)))

(declare-fun b!557293 () Bool)

(assert (=> b!557293 (= e!321069 Undefined!5300)))

(declare-fun b!557294 () Bool)

(assert (=> b!557294 (= e!321068 (MissingZero!5300 (index!23429 lt!253254)))))

(assert (= (and d!83465 c!64314) b!557293))

(assert (= (and d!83465 (not c!64314)) b!557290))

(assert (= (and b!557290 c!64316) b!557292))

(assert (= (and b!557290 (not c!64316)) b!557291))

(assert (= (and b!557291 c!64315) b!557294))

(assert (= (and b!557291 (not c!64315)) b!557289))

(declare-fun m!535199 () Bool)

(assert (=> b!557289 m!535199))

(declare-fun m!535201 () Bool)

(assert (=> b!557290 m!535201))

(declare-fun m!535203 () Bool)

(assert (=> d!83465 m!535203))

(declare-fun m!535205 () Bool)

(assert (=> d!83465 m!535205))

(assert (=> d!83465 m!534909))

(assert (=> d!83465 m!535203))

(declare-fun m!535207 () Bool)

(assert (=> d!83465 m!535207))

(declare-fun m!535209 () Bool)

(assert (=> d!83465 m!535209))

(declare-fun m!535211 () Bool)

(assert (=> d!83465 m!535211))

(assert (=> b!556942 d!83465))

(declare-fun d!83467 () Bool)

(declare-fun res!349345 () Bool)

(declare-fun e!321074 () Bool)

(assert (=> d!83467 (=> res!349345 e!321074)))

(assert (=> d!83467 (= res!349345 (= (select (arr!16851 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83467 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!321074)))

(declare-fun b!557299 () Bool)

(declare-fun e!321075 () Bool)

(assert (=> b!557299 (= e!321074 e!321075)))

(declare-fun res!349346 () Bool)

(assert (=> b!557299 (=> (not res!349346) (not e!321075))))

(assert (=> b!557299 (= res!349346 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17215 a!3118)))))

(declare-fun b!557300 () Bool)

(assert (=> b!557300 (= e!321075 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83467 (not res!349345)) b!557299))

(assert (= (and b!557299 res!349346) b!557300))

(assert (=> d!83467 m!535029))

(declare-fun m!535213 () Bool)

(assert (=> b!557300 m!535213))

(assert (=> b!556947 d!83467))

(push 1)

