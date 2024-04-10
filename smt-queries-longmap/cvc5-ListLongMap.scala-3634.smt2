; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50132 () Bool)

(assert start!50132)

(declare-fun b!549055 () Bool)

(declare-fun res!342291 () Bool)

(declare-fun e!317142 () Bool)

(assert (=> b!549055 (=> (not res!342291) (not e!317142))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34630 0))(
  ( (array!34631 (arr!16632 (Array (_ BitVec 32) (_ BitVec 64))) (size!16996 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34630)

(assert (=> b!549055 (= res!342291 (and (= (size!16996 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16996 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16996 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!549056 () Bool)

(declare-fun e!317141 () Bool)

(declare-fun lt!249994 () (_ BitVec 32))

(assert (=> b!549056 (= e!317141 (and (bvsge mask!3119 #b00000000000000000000000000000000) (or (bvslt lt!249994 #b00000000000000000000000000000000) (bvsge lt!249994 (bvadd #b00000000000000000000000000000001 mask!3119)))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!549056 (= lt!249994 (toIndex!0 (select (store (arr!16632 a!3118) i!1132 k!1914) j!142) mask!3119))))

(declare-fun b!549057 () Bool)

(declare-fun res!342288 () Bool)

(assert (=> b!549057 (=> (not res!342288) (not e!317141))))

(declare-datatypes ((List!10712 0))(
  ( (Nil!10709) (Cons!10708 (h!11678 (_ BitVec 64)) (t!16940 List!10712)) )
))
(declare-fun arrayNoDuplicates!0 (array!34630 (_ BitVec 32) List!10712) Bool)

(assert (=> b!549057 (= res!342288 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10709))))

(declare-fun res!342292 () Bool)

(assert (=> start!50132 (=> (not res!342292) (not e!317142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50132 (= res!342292 (validMask!0 mask!3119))))

(assert (=> start!50132 e!317142))

(assert (=> start!50132 true))

(declare-fun array_inv!12428 (array!34630) Bool)

(assert (=> start!50132 (array_inv!12428 a!3118)))

(declare-fun b!549058 () Bool)

(declare-fun res!342287 () Bool)

(assert (=> b!549058 (=> (not res!342287) (not e!317142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!549058 (= res!342287 (validKeyInArray!0 (select (arr!16632 a!3118) j!142)))))

(declare-fun b!549059 () Bool)

(declare-fun res!342290 () Bool)

(assert (=> b!549059 (=> (not res!342290) (not e!317142))))

(assert (=> b!549059 (= res!342290 (validKeyInArray!0 k!1914))))

(declare-fun b!549060 () Bool)

(declare-fun res!342286 () Bool)

(assert (=> b!549060 (=> (not res!342286) (not e!317142))))

(declare-fun arrayContainsKey!0 (array!34630 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!549060 (= res!342286 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!549061 () Bool)

(assert (=> b!549061 (= e!317142 e!317141)))

(declare-fun res!342293 () Bool)

(assert (=> b!549061 (=> (not res!342293) (not e!317141))))

(declare-datatypes ((SeekEntryResult!5081 0))(
  ( (MissingZero!5081 (index!22551 (_ BitVec 32))) (Found!5081 (index!22552 (_ BitVec 32))) (Intermediate!5081 (undefined!5893 Bool) (index!22553 (_ BitVec 32)) (x!51488 (_ BitVec 32))) (Undefined!5081) (MissingVacant!5081 (index!22554 (_ BitVec 32))) )
))
(declare-fun lt!249993 () SeekEntryResult!5081)

(assert (=> b!549061 (= res!342293 (or (= lt!249993 (MissingZero!5081 i!1132)) (= lt!249993 (MissingVacant!5081 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34630 (_ BitVec 32)) SeekEntryResult!5081)

(assert (=> b!549061 (= lt!249993 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!549062 () Bool)

(declare-fun res!342289 () Bool)

(assert (=> b!549062 (=> (not res!342289) (not e!317141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34630 (_ BitVec 32)) Bool)

(assert (=> b!549062 (= res!342289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50132 res!342292) b!549055))

(assert (= (and b!549055 res!342291) b!549058))

(assert (= (and b!549058 res!342287) b!549059))

(assert (= (and b!549059 res!342290) b!549060))

(assert (= (and b!549060 res!342286) b!549061))

(assert (= (and b!549061 res!342293) b!549062))

(assert (= (and b!549062 res!342289) b!549057))

(assert (= (and b!549057 res!342288) b!549056))

(declare-fun m!525963 () Bool)

(assert (=> b!549061 m!525963))

(declare-fun m!525965 () Bool)

(assert (=> b!549056 m!525965))

(declare-fun m!525967 () Bool)

(assert (=> b!549056 m!525967))

(assert (=> b!549056 m!525967))

(declare-fun m!525969 () Bool)

(assert (=> b!549056 m!525969))

(declare-fun m!525971 () Bool)

(assert (=> start!50132 m!525971))

(declare-fun m!525973 () Bool)

(assert (=> start!50132 m!525973))

(declare-fun m!525975 () Bool)

(assert (=> b!549058 m!525975))

(assert (=> b!549058 m!525975))

(declare-fun m!525977 () Bool)

(assert (=> b!549058 m!525977))

(declare-fun m!525979 () Bool)

(assert (=> b!549059 m!525979))

(declare-fun m!525981 () Bool)

(assert (=> b!549060 m!525981))

(declare-fun m!525983 () Bool)

(assert (=> b!549057 m!525983))

(declare-fun m!525985 () Bool)

(assert (=> b!549062 m!525985))

(push 1)

(assert (not b!549058))

(assert (not b!549057))

(assert (not b!549062))

(assert (not start!50132))

(assert (not b!549060))

(assert (not b!549056))

(assert (not b!549061))

(assert (not b!549059))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!82731 () Bool)

(assert (=> d!82731 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50132 d!82731))

(declare-fun d!82735 () Bool)

(assert (=> d!82735 (= (array_inv!12428 a!3118) (bvsge (size!16996 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50132 d!82735))

(declare-fun d!82737 () Bool)

(assert (=> d!82737 (= (validKeyInArray!0 (select (arr!16632 a!3118) j!142)) (and (not (= (select (arr!16632 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16632 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!549058 d!82737))

(declare-fun d!82741 () Bool)

(declare-fun lt!250027 () (_ BitVec 32))

(declare-fun lt!250026 () (_ BitVec 32))

(assert (=> d!82741 (= lt!250027 (bvmul (bvxor lt!250026 (bvlshr lt!250026 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!82741 (= lt!250026 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16632 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16632 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!82741 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!342352 (let ((h!11682 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16632 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16632 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51492 (bvmul (bvxor h!11682 (bvlshr h!11682 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51492 (bvlshr x!51492 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!342352 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!342352 #b00000000000000000000000000000000))))))

(assert (=> d!82741 (= (toIndex!0 (select (store (arr!16632 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!250027 (bvlshr lt!250027 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!549056 d!82741))

(declare-fun d!82749 () Bool)

(declare-fun res!342370 () Bool)

(declare-fun e!317202 () Bool)

(assert (=> d!82749 (=> res!342370 e!317202)))

(assert (=> d!82749 (= res!342370 (bvsge #b00000000000000000000000000000000 (size!16996 a!3118)))))

(assert (=> d!82749 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10709) e!317202)))

(declare-fun b!549168 () Bool)

(declare-fun e!317205 () Bool)

(declare-fun e!317204 () Bool)

(assert (=> b!549168 (= e!317205 e!317204)))

(declare-fun c!63730 () Bool)

(assert (=> b!549168 (= c!63730 (validKeyInArray!0 (select (arr!16632 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32233 () Bool)

(declare-fun call!32236 () Bool)

(assert (=> bm!32233 (= call!32236 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63730 (Cons!10708 (select (arr!16632 a!3118) #b00000000000000000000000000000000) Nil!10709) Nil!10709)))))

(declare-fun b!549169 () Bool)

(assert (=> b!549169 (= e!317204 call!32236)))

(declare-fun b!549170 () Bool)

(assert (=> b!549170 (= e!317202 e!317205)))

(declare-fun res!342371 () Bool)

(assert (=> b!549170 (=> (not res!342371) (not e!317205))))

(declare-fun e!317203 () Bool)

(assert (=> b!549170 (= res!342371 (not e!317203))))

(declare-fun res!342369 () Bool)

(assert (=> b!549170 (=> (not res!342369) (not e!317203))))

(assert (=> b!549170 (= res!342369 (validKeyInArray!0 (select (arr!16632 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!549171 () Bool)

(declare-fun contains!2831 (List!10712 (_ BitVec 64)) Bool)

(assert (=> b!549171 (= e!317203 (contains!2831 Nil!10709 (select (arr!16632 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!549172 () Bool)

(assert (=> b!549172 (= e!317204 call!32236)))

(assert (= (and d!82749 (not res!342370)) b!549170))

(assert (= (and b!549170 res!342369) b!549171))

(assert (= (and b!549170 res!342371) b!549168))

(assert (= (and b!549168 c!63730) b!549169))

(assert (= (and b!549168 (not c!63730)) b!549172))

(assert (= (or b!549169 b!549172) bm!32233))

(declare-fun m!526059 () Bool)

(assert (=> b!549168 m!526059))

(assert (=> b!549168 m!526059))

(declare-fun m!526061 () Bool)

(assert (=> b!549168 m!526061))

(assert (=> bm!32233 m!526059))

(declare-fun m!526063 () Bool)

(assert (=> bm!32233 m!526063))

(assert (=> b!549170 m!526059))

(assert (=> b!549170 m!526059))

(assert (=> b!549170 m!526061))

(assert (=> b!549171 m!526059))

(assert (=> b!549171 m!526059))

(declare-fun m!526065 () Bool)

(assert (=> b!549171 m!526065))

(assert (=> b!549057 d!82749))

(declare-fun b!549197 () Bool)

(declare-fun e!317222 () Bool)

(declare-fun call!32240 () Bool)

(assert (=> b!549197 (= e!317222 call!32240)))

(declare-fun bm!32237 () Bool)

(assert (=> bm!32237 (= call!32240 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!549198 () Bool)

(declare-fun e!317223 () Bool)

(assert (=> b!549198 (= e!317222 e!317223)))

(declare-fun lt!250050 () (_ BitVec 64))

(assert (=> b!549198 (= lt!250050 (select (arr!16632 a!3118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16980 0))(
  ( (Unit!16981) )
))
(declare-fun lt!250051 () Unit!16980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34630 (_ BitVec 64) (_ BitVec 32)) Unit!16980)

(assert (=> b!549198 (= lt!250051 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250050 #b00000000000000000000000000000000))))

(assert (=> b!549198 (arrayContainsKey!0 a!3118 lt!250050 #b00000000000000000000000000000000)))

(declare-fun lt!250049 () Unit!16980)

(assert (=> b!549198 (= lt!250049 lt!250051)))

(declare-fun res!342379 () Bool)

(assert (=> b!549198 (= res!342379 (= (seekEntryOrOpen!0 (select (arr!16632 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5081 #b00000000000000000000000000000000)))))

(assert (=> b!549198 (=> (not res!342379) (not e!317223))))

(declare-fun d!82751 () Bool)

(declare-fun res!342378 () Bool)

(declare-fun e!317221 () Bool)

(assert (=> d!82751 (=> res!342378 e!317221)))

(assert (=> d!82751 (= res!342378 (bvsge #b00000000000000000000000000000000 (size!16996 a!3118)))))

(assert (=> d!82751 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!317221)))

(declare-fun b!549199 () Bool)

(assert (=> b!549199 (= e!317221 e!317222)))

(declare-fun c!63740 () Bool)

(assert (=> b!549199 (= c!63740 (validKeyInArray!0 (select (arr!16632 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!549200 () Bool)

(assert (=> b!549200 (= e!317223 call!32240)))

(assert (= (and d!82751 (not res!342378)) b!549199))

(assert (= (and b!549199 c!63740) b!549198))

(assert (= (and b!549199 (not c!63740)) b!549197))

(assert (= (and b!549198 res!342379) b!549200))

(assert (= (or b!549200 b!549197) bm!32237))

(declare-fun m!526079 () Bool)

(assert (=> bm!32237 m!526079))

(assert (=> b!549198 m!526059))

(declare-fun m!526081 () Bool)

(assert (=> b!549198 m!526081))

(declare-fun m!526083 () Bool)

(assert (=> b!549198 m!526083))

(assert (=> b!549198 m!526059))

(declare-fun m!526085 () Bool)

(assert (=> b!549198 m!526085))

(assert (=> b!549199 m!526059))

(assert (=> b!549199 m!526059))

(assert (=> b!549199 m!526061))

(assert (=> b!549062 d!82751))

(declare-fun d!82755 () Bool)

(declare-fun res!342384 () Bool)

(declare-fun e!317231 () Bool)

(assert (=> d!82755 (=> res!342384 e!317231)))

(assert (=> d!82755 (= res!342384 (= (select (arr!16632 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!82755 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!317231)))

(declare-fun b!549211 () Bool)

(declare-fun e!317232 () Bool)

(assert (=> b!549211 (= e!317231 e!317232)))

(declare-fun res!342385 () Bool)

(assert (=> b!549211 (=> (not res!342385) (not e!317232))))

(assert (=> b!549211 (= res!342385 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16996 a!3118)))))

(declare-fun b!549212 () Bool)

(assert (=> b!549212 (= e!317232 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!82755 (not res!342384)) b!549211))

(assert (= (and b!549211 res!342385) b!549212))

(assert (=> d!82755 m!526059))

(declare-fun m!526101 () Bool)

(assert (=> b!549212 m!526101))

(assert (=> b!549060 d!82755))

(declare-fun d!82763 () Bool)

(declare-fun lt!250077 () SeekEntryResult!5081)

(assert (=> d!82763 (and (or (is-Undefined!5081 lt!250077) (not (is-Found!5081 lt!250077)) (and (bvsge (index!22552 lt!250077) #b00000000000000000000000000000000) (bvslt (index!22552 lt!250077) (size!16996 a!3118)))) (or (is-Undefined!5081 lt!250077) (is-Found!5081 lt!250077) (not (is-MissingZero!5081 lt!250077)) (and (bvsge (index!22551 lt!250077) #b00000000000000000000000000000000) (bvslt (index!22551 lt!250077) (size!16996 a!3118)))) (or (is-Undefined!5081 lt!250077) (is-Found!5081 lt!250077) (is-MissingZero!5081 lt!250077) (not (is-MissingVacant!5081 lt!250077)) (and (bvsge (index!22554 lt!250077) #b00000000000000000000000000000000) (bvslt (index!22554 lt!250077) (size!16996 a!3118)))) (or (is-Undefined!5081 lt!250077) (ite (is-Found!5081 lt!250077) (= (select (arr!16632 a!3118) (index!22552 lt!250077)) k!1914) (ite (is-MissingZero!5081 lt!250077) (= (select (arr!16632 a!3118) (index!22551 lt!250077)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5081 lt!250077) (= (select (arr!16632 a!3118) (index!22554 lt!250077)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!317267 () SeekEntryResult!5081)

(assert (=> d!82763 (= lt!250077 e!317267)))

(declare-fun c!63758 () Bool)

(declare-fun lt!250076 () SeekEntryResult!5081)

(assert (=> d!82763 (= c!63758 (and (is-Intermediate!5081 lt!250076) (undefined!5893 lt!250076)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34630 (_ BitVec 32)) SeekEntryResult!5081)

(assert (=> d!82763 (= lt!250076 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!82763 (validMask!0 mask!3119)))

(assert (=> d!82763 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!250077)))

(declare-fun b!549258 () Bool)

(assert (=> b!549258 (= e!317267 Undefined!5081)))

(declare-fun e!317268 () SeekEntryResult!5081)

(declare-fun b!549259 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34630 (_ BitVec 32)) SeekEntryResult!5081)

(assert (=> b!549259 (= e!317268 (seekKeyOrZeroReturnVacant!0 (x!51488 lt!250076) (index!22553 lt!250076) (index!22553 lt!250076) k!1914 a!3118 mask!3119))))

(declare-fun b!549260 () Bool)

(declare-fun e!317266 () SeekEntryResult!5081)

(assert (=> b!549260 (= e!317266 (Found!5081 (index!22553 lt!250076)))))

(declare-fun b!549261 () Bool)

(assert (=> b!549261 (= e!317268 (MissingZero!5081 (index!22553 lt!250076)))))

(declare-fun b!549262 () Bool)

(assert (=> b!549262 (= e!317267 e!317266)))

(declare-fun lt!250078 () (_ BitVec 64))

(assert (=> b!549262 (= lt!250078 (select (arr!16632 a!3118) (index!22553 lt!250076)))))

(declare-fun c!63756 () Bool)

(assert (=> b!549262 (= c!63756 (= lt!250078 k!1914))))

(declare-fun b!549263 () Bool)

(declare-fun c!63757 () Bool)

(assert (=> b!549263 (= c!63757 (= lt!250078 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!549263 (= e!317266 e!317268)))

(assert (= (and d!82763 c!63758) b!549258))

(assert (= (and d!82763 (not c!63758)) b!549262))

(assert (= (and b!549262 c!63756) b!549260))

(assert (= (and b!549262 (not c!63756)) b!549263))

(assert (= (and b!549263 c!63757) b!549261))

(assert (= (and b!549263 (not c!63757)) b!549259))

(declare-fun m!526117 () Bool)

(assert (=> d!82763 m!526117))

(assert (=> d!82763 m!525971))

(declare-fun m!526119 () Bool)

(assert (=> d!82763 m!526119))

(declare-fun m!526121 () Bool)

(assert (=> d!82763 m!526121))

(declare-fun m!526123 () Bool)

(assert (=> d!82763 m!526123))

(assert (=> d!82763 m!526121))

(declare-fun m!526125 () Bool)

(assert (=> d!82763 m!526125))

(declare-fun m!526127 () Bool)

(assert (=> b!549259 m!526127))

(declare-fun m!526129 () Bool)

(assert (=> b!549262 m!526129))

(assert (=> b!549061 d!82763))

(declare-fun d!82777 () Bool)

(assert (=> d!82777 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!549059 d!82777))

(push 1)

(assert (not d!82763))

(assert (not b!549212))

(assert (not bm!32237))

(assert (not bm!32233))

(assert (not b!549198))

(assert (not b!549199))

(assert (not b!549168))

(assert (not b!549259))

(assert (not b!549170))

(assert (not b!549171))

(check-sat)

(pop 1)

(push 1)

(check-sat)

