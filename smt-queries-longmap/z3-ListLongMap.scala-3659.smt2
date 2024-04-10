; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50512 () Bool)

(assert start!50512)

(declare-fun b!552194 () Bool)

(declare-fun res!344797 () Bool)

(declare-fun e!318635 () Bool)

(assert (=> b!552194 (=> (not res!344797) (not e!318635))))

(declare-datatypes ((array!34794 0))(
  ( (array!34795 (arr!16708 (Array (_ BitVec 32) (_ BitVec 64))) (size!17072 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34794)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34794 (_ BitVec 32)) Bool)

(assert (=> b!552194 (= res!344797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552195 () Bool)

(declare-fun res!344796 () Bool)

(declare-fun e!318636 () Bool)

(assert (=> b!552195 (=> (not res!344796) (not e!318636))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34794 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552195 (= res!344796 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552196 () Bool)

(assert (=> b!552196 (= e!318636 e!318635)))

(declare-fun res!344798 () Bool)

(assert (=> b!552196 (=> (not res!344798) (not e!318635))))

(declare-datatypes ((SeekEntryResult!5157 0))(
  ( (MissingZero!5157 (index!22855 (_ BitVec 32))) (Found!5157 (index!22856 (_ BitVec 32))) (Intermediate!5157 (undefined!5969 Bool) (index!22857 (_ BitVec 32)) (x!51785 (_ BitVec 32))) (Undefined!5157) (MissingVacant!5157 (index!22858 (_ BitVec 32))) )
))
(declare-fun lt!251062 () SeekEntryResult!5157)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552196 (= res!344798 (or (= lt!251062 (MissingZero!5157 i!1132)) (= lt!251062 (MissingVacant!5157 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34794 (_ BitVec 32)) SeekEntryResult!5157)

(assert (=> b!552196 (= lt!251062 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!344790 () Bool)

(assert (=> start!50512 (=> (not res!344790) (not e!318636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50512 (= res!344790 (validMask!0 mask!3119))))

(assert (=> start!50512 e!318636))

(assert (=> start!50512 true))

(declare-fun array_inv!12504 (array!34794) Bool)

(assert (=> start!50512 (array_inv!12504 a!3118)))

(declare-fun b!552197 () Bool)

(declare-fun res!344793 () Bool)

(assert (=> b!552197 (=> (not res!344793) (not e!318636))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552197 (= res!344793 (and (= (size!17072 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17072 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17072 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552198 () Bool)

(declare-fun e!318637 () Bool)

(assert (=> b!552198 (= e!318635 e!318637)))

(declare-fun res!344789 () Bool)

(assert (=> b!552198 (=> (not res!344789) (not e!318637))))

(declare-fun lt!251063 () (_ BitVec 32))

(declare-fun lt!251065 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34794 (_ BitVec 32)) SeekEntryResult!5157)

(assert (=> b!552198 (= res!344789 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251065 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251063 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552198 (= lt!251063 (toIndex!0 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!552198 (= lt!251065 (toIndex!0 (select (arr!16708 a!3118) j!142) mask!3119))))

(declare-fun b!552199 () Bool)

(declare-fun res!344794 () Bool)

(assert (=> b!552199 (=> (not res!344794) (not e!318636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552199 (= res!344794 (validKeyInArray!0 k0!1914))))

(declare-fun b!552200 () Bool)

(declare-fun res!344792 () Bool)

(assert (=> b!552200 (=> (not res!344792) (not e!318636))))

(assert (=> b!552200 (= res!344792 (validKeyInArray!0 (select (arr!16708 a!3118) j!142)))))

(declare-fun b!552201 () Bool)

(declare-fun e!318639 () Bool)

(assert (=> b!552201 (= e!318639 (= (seekEntryOrOpen!0 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) (Found!5157 j!142)))))

(declare-fun b!552202 () Bool)

(assert (=> b!552202 (= e!318637 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!251063 #b00000000000000000000000000000000) (bvslt lt!251063 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!552202 e!318639))

(declare-fun res!344795 () Bool)

(assert (=> b!552202 (=> (not res!344795) (not e!318639))))

(assert (=> b!552202 (= res!344795 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17088 0))(
  ( (Unit!17089) )
))
(declare-fun lt!251064 () Unit!17088)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17088)

(assert (=> b!552202 (= lt!251064 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552203 () Bool)

(declare-fun res!344791 () Bool)

(assert (=> b!552203 (=> (not res!344791) (not e!318635))))

(declare-datatypes ((List!10788 0))(
  ( (Nil!10785) (Cons!10784 (h!11766 (_ BitVec 64)) (t!17016 List!10788)) )
))
(declare-fun arrayNoDuplicates!0 (array!34794 (_ BitVec 32) List!10788) Bool)

(assert (=> b!552203 (= res!344791 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10785))))

(assert (= (and start!50512 res!344790) b!552197))

(assert (= (and b!552197 res!344793) b!552200))

(assert (= (and b!552200 res!344792) b!552199))

(assert (= (and b!552199 res!344794) b!552195))

(assert (= (and b!552195 res!344796) b!552196))

(assert (= (and b!552196 res!344798) b!552194))

(assert (= (and b!552194 res!344797) b!552203))

(assert (= (and b!552203 res!344791) b!552198))

(assert (= (and b!552198 res!344789) b!552202))

(assert (= (and b!552202 res!344795) b!552201))

(declare-fun m!529179 () Bool)

(assert (=> b!552201 m!529179))

(assert (=> b!552201 m!529179))

(declare-fun m!529181 () Bool)

(assert (=> b!552201 m!529181))

(assert (=> b!552198 m!529179))

(declare-fun m!529183 () Bool)

(assert (=> b!552198 m!529183))

(declare-fun m!529185 () Bool)

(assert (=> b!552198 m!529185))

(declare-fun m!529187 () Bool)

(assert (=> b!552198 m!529187))

(assert (=> b!552198 m!529179))

(declare-fun m!529189 () Bool)

(assert (=> b!552198 m!529189))

(assert (=> b!552198 m!529179))

(assert (=> b!552198 m!529185))

(declare-fun m!529191 () Bool)

(assert (=> b!552198 m!529191))

(assert (=> b!552198 m!529185))

(declare-fun m!529193 () Bool)

(assert (=> b!552198 m!529193))

(declare-fun m!529195 () Bool)

(assert (=> b!552195 m!529195))

(declare-fun m!529197 () Bool)

(assert (=> b!552196 m!529197))

(declare-fun m!529199 () Bool)

(assert (=> b!552202 m!529199))

(declare-fun m!529201 () Bool)

(assert (=> b!552202 m!529201))

(declare-fun m!529203 () Bool)

(assert (=> b!552194 m!529203))

(declare-fun m!529205 () Bool)

(assert (=> b!552203 m!529205))

(declare-fun m!529207 () Bool)

(assert (=> start!50512 m!529207))

(declare-fun m!529209 () Bool)

(assert (=> start!50512 m!529209))

(assert (=> b!552200 m!529179))

(assert (=> b!552200 m!529179))

(declare-fun m!529211 () Bool)

(assert (=> b!552200 m!529211))

(declare-fun m!529213 () Bool)

(assert (=> b!552199 m!529213))

(check-sat (not b!552195) (not b!552199) (not b!552194) (not b!552203) (not b!552198) (not start!50512) (not b!552201) (not b!552196) (not b!552200) (not b!552202))
(check-sat)
(get-model)

(declare-fun b!552244 () Bool)

(declare-fun e!318664 () Bool)

(declare-fun call!32312 () Bool)

(assert (=> b!552244 (= e!318664 call!32312)))

(declare-fun b!552245 () Bool)

(declare-fun e!318665 () Bool)

(declare-fun e!318663 () Bool)

(assert (=> b!552245 (= e!318665 e!318663)))

(declare-fun res!344835 () Bool)

(assert (=> b!552245 (=> (not res!344835) (not e!318663))))

(declare-fun e!318666 () Bool)

(assert (=> b!552245 (= res!344835 (not e!318666))))

(declare-fun res!344837 () Bool)

(assert (=> b!552245 (=> (not res!344837) (not e!318666))))

(assert (=> b!552245 (= res!344837 (validKeyInArray!0 (select (arr!16708 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552246 () Bool)

(declare-fun contains!2842 (List!10788 (_ BitVec 64)) Bool)

(assert (=> b!552246 (= e!318666 (contains!2842 Nil!10785 (select (arr!16708 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552247 () Bool)

(assert (=> b!552247 (= e!318664 call!32312)))

(declare-fun b!552248 () Bool)

(assert (=> b!552248 (= e!318663 e!318664)))

(declare-fun c!64040 () Bool)

(assert (=> b!552248 (= c!64040 (validKeyInArray!0 (select (arr!16708 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83103 () Bool)

(declare-fun res!344836 () Bool)

(assert (=> d!83103 (=> res!344836 e!318665)))

(assert (=> d!83103 (= res!344836 (bvsge #b00000000000000000000000000000000 (size!17072 a!3118)))))

(assert (=> d!83103 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10785) e!318665)))

(declare-fun bm!32309 () Bool)

(assert (=> bm!32309 (= call!32312 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64040 (Cons!10784 (select (arr!16708 a!3118) #b00000000000000000000000000000000) Nil!10785) Nil!10785)))))

(assert (= (and d!83103 (not res!344836)) b!552245))

(assert (= (and b!552245 res!344837) b!552246))

(assert (= (and b!552245 res!344835) b!552248))

(assert (= (and b!552248 c!64040) b!552244))

(assert (= (and b!552248 (not c!64040)) b!552247))

(assert (= (or b!552244 b!552247) bm!32309))

(declare-fun m!529251 () Bool)

(assert (=> b!552245 m!529251))

(assert (=> b!552245 m!529251))

(declare-fun m!529253 () Bool)

(assert (=> b!552245 m!529253))

(assert (=> b!552246 m!529251))

(assert (=> b!552246 m!529251))

(declare-fun m!529255 () Bool)

(assert (=> b!552246 m!529255))

(assert (=> b!552248 m!529251))

(assert (=> b!552248 m!529251))

(assert (=> b!552248 m!529253))

(assert (=> bm!32309 m!529251))

(declare-fun m!529257 () Bool)

(assert (=> bm!32309 m!529257))

(assert (=> b!552203 d!83103))

(declare-fun b!552299 () Bool)

(declare-fun lt!251101 () SeekEntryResult!5157)

(assert (=> b!552299 (and (bvsge (index!22857 lt!251101) #b00000000000000000000000000000000) (bvslt (index!22857 lt!251101) (size!17072 a!3118)))))

(declare-fun res!344850 () Bool)

(assert (=> b!552299 (= res!344850 (= (select (arr!16708 a!3118) (index!22857 lt!251101)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318695 () Bool)

(assert (=> b!552299 (=> res!344850 e!318695)))

(declare-fun b!552300 () Bool)

(assert (=> b!552300 (and (bvsge (index!22857 lt!251101) #b00000000000000000000000000000000) (bvslt (index!22857 lt!251101) (size!17072 a!3118)))))

(assert (=> b!552300 (= e!318695 (= (select (arr!16708 a!3118) (index!22857 lt!251101)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552301 () Bool)

(declare-fun e!318693 () SeekEntryResult!5157)

(assert (=> b!552301 (= e!318693 (Intermediate!5157 true lt!251065 #b00000000000000000000000000000000))))

(declare-fun b!552302 () Bool)

(declare-fun e!318692 () SeekEntryResult!5157)

(assert (=> b!552302 (= e!318692 (Intermediate!5157 false lt!251065 #b00000000000000000000000000000000))))

(declare-fun b!552303 () Bool)

(declare-fun e!318698 () Bool)

(declare-fun e!318696 () Bool)

(assert (=> b!552303 (= e!318698 e!318696)))

(declare-fun res!344849 () Bool)

(get-info :version)

(assert (=> b!552303 (= res!344849 (and ((_ is Intermediate!5157) lt!251101) (not (undefined!5969 lt!251101)) (bvslt (x!51785 lt!251101) #b01111111111111111111111111111110) (bvsge (x!51785 lt!251101) #b00000000000000000000000000000000) (bvsge (x!51785 lt!251101) #b00000000000000000000000000000000)))))

(assert (=> b!552303 (=> (not res!344849) (not e!318696))))

(declare-fun b!552304 () Bool)

(assert (=> b!552304 (= e!318693 e!318692)))

(declare-fun c!64063 () Bool)

(declare-fun lt!251099 () (_ BitVec 64))

(assert (=> b!552304 (= c!64063 (or (= lt!251099 (select (arr!16708 a!3118) j!142)) (= (bvadd lt!251099 lt!251099) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552305 () Bool)

(assert (=> b!552305 (and (bvsge (index!22857 lt!251101) #b00000000000000000000000000000000) (bvslt (index!22857 lt!251101) (size!17072 a!3118)))))

(declare-fun res!344848 () Bool)

(assert (=> b!552305 (= res!344848 (= (select (arr!16708 a!3118) (index!22857 lt!251101)) (select (arr!16708 a!3118) j!142)))))

(assert (=> b!552305 (=> res!344848 e!318695)))

(assert (=> b!552305 (= e!318696 e!318695)))

(declare-fun b!552306 () Bool)

(assert (=> b!552306 (= e!318698 (bvsge (x!51785 lt!251101) #b01111111111111111111111111111110))))

(declare-fun d!83105 () Bool)

(assert (=> d!83105 e!318698))

(declare-fun c!64058 () Bool)

(assert (=> d!83105 (= c!64058 (and ((_ is Intermediate!5157) lt!251101) (undefined!5969 lt!251101)))))

(assert (=> d!83105 (= lt!251101 e!318693)))

(declare-fun c!64062 () Bool)

(assert (=> d!83105 (= c!64062 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83105 (= lt!251099 (select (arr!16708 a!3118) lt!251065))))

(assert (=> d!83105 (validMask!0 mask!3119)))

(assert (=> d!83105 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251065 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) lt!251101)))

(declare-fun b!552307 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552307 (= e!318692 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251065 #b00000000000000000000000000000000 mask!3119) (select (arr!16708 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83105 c!64062) b!552301))

(assert (= (and d!83105 (not c!64062)) b!552304))

(assert (= (and b!552304 c!64063) b!552302))

(assert (= (and b!552304 (not c!64063)) b!552307))

(assert (= (and d!83105 c!64058) b!552306))

(assert (= (and d!83105 (not c!64058)) b!552303))

(assert (= (and b!552303 res!344849) b!552305))

(assert (= (and b!552305 (not res!344848)) b!552299))

(assert (= (and b!552299 (not res!344850)) b!552300))

(declare-fun m!529285 () Bool)

(assert (=> b!552305 m!529285))

(declare-fun m!529287 () Bool)

(assert (=> d!83105 m!529287))

(assert (=> d!83105 m!529207))

(declare-fun m!529289 () Bool)

(assert (=> b!552307 m!529289))

(assert (=> b!552307 m!529289))

(assert (=> b!552307 m!529179))

(declare-fun m!529291 () Bool)

(assert (=> b!552307 m!529291))

(assert (=> b!552300 m!529285))

(assert (=> b!552299 m!529285))

(assert (=> b!552198 d!83105))

(declare-fun lt!251103 () SeekEntryResult!5157)

(declare-fun b!552308 () Bool)

(assert (=> b!552308 (and (bvsge (index!22857 lt!251103) #b00000000000000000000000000000000) (bvslt (index!22857 lt!251103) (size!17072 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)))))))

(declare-fun res!344853 () Bool)

(assert (=> b!552308 (= res!344853 (= (select (arr!16708 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118))) (index!22857 lt!251103)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318702 () Bool)

(assert (=> b!552308 (=> res!344853 e!318702)))

(declare-fun b!552309 () Bool)

(assert (=> b!552309 (and (bvsge (index!22857 lt!251103) #b00000000000000000000000000000000) (bvslt (index!22857 lt!251103) (size!17072 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)))))))

(assert (=> b!552309 (= e!318702 (= (select (arr!16708 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118))) (index!22857 lt!251103)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552310 () Bool)

(declare-fun e!318701 () SeekEntryResult!5157)

(assert (=> b!552310 (= e!318701 (Intermediate!5157 true lt!251063 #b00000000000000000000000000000000))))

(declare-fun b!552311 () Bool)

(declare-fun e!318700 () SeekEntryResult!5157)

(assert (=> b!552311 (= e!318700 (Intermediate!5157 false lt!251063 #b00000000000000000000000000000000))))

(declare-fun b!552312 () Bool)

(declare-fun e!318704 () Bool)

(declare-fun e!318703 () Bool)

(assert (=> b!552312 (= e!318704 e!318703)))

(declare-fun res!344852 () Bool)

(assert (=> b!552312 (= res!344852 (and ((_ is Intermediate!5157) lt!251103) (not (undefined!5969 lt!251103)) (bvslt (x!51785 lt!251103) #b01111111111111111111111111111110) (bvsge (x!51785 lt!251103) #b00000000000000000000000000000000) (bvsge (x!51785 lt!251103) #b00000000000000000000000000000000)))))

(assert (=> b!552312 (=> (not res!344852) (not e!318703))))

(declare-fun b!552313 () Bool)

(assert (=> b!552313 (= e!318701 e!318700)))

(declare-fun lt!251102 () (_ BitVec 64))

(declare-fun c!64066 () Bool)

(assert (=> b!552313 (= c!64066 (or (= lt!251102 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!251102 lt!251102) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552314 () Bool)

(assert (=> b!552314 (and (bvsge (index!22857 lt!251103) #b00000000000000000000000000000000) (bvslt (index!22857 lt!251103) (size!17072 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)))))))

(declare-fun res!344851 () Bool)

(assert (=> b!552314 (= res!344851 (= (select (arr!16708 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118))) (index!22857 lt!251103)) (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!552314 (=> res!344851 e!318702)))

(assert (=> b!552314 (= e!318703 e!318702)))

(declare-fun b!552315 () Bool)

(assert (=> b!552315 (= e!318704 (bvsge (x!51785 lt!251103) #b01111111111111111111111111111110))))

(declare-fun d!83115 () Bool)

(assert (=> d!83115 e!318704))

(declare-fun c!64064 () Bool)

(assert (=> d!83115 (= c!64064 (and ((_ is Intermediate!5157) lt!251103) (undefined!5969 lt!251103)))))

(assert (=> d!83115 (= lt!251103 e!318701)))

(declare-fun c!64065 () Bool)

(assert (=> d!83115 (= c!64065 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83115 (= lt!251102 (select (arr!16708 (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118))) lt!251063))))

(assert (=> d!83115 (validMask!0 mask!3119)))

(assert (=> d!83115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251063 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)) mask!3119) lt!251103)))

(declare-fun b!552316 () Bool)

(assert (=> b!552316 (= e!318700 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251063 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) (array!34795 (store (arr!16708 a!3118) i!1132 k0!1914) (size!17072 a!3118)) mask!3119))))

(assert (= (and d!83115 c!64065) b!552310))

(assert (= (and d!83115 (not c!64065)) b!552313))

(assert (= (and b!552313 c!64066) b!552311))

(assert (= (and b!552313 (not c!64066)) b!552316))

(assert (= (and d!83115 c!64064) b!552315))

(assert (= (and d!83115 (not c!64064)) b!552312))

(assert (= (and b!552312 res!344852) b!552314))

(assert (= (and b!552314 (not res!344851)) b!552308))

(assert (= (and b!552308 (not res!344853)) b!552309))

(declare-fun m!529293 () Bool)

(assert (=> b!552314 m!529293))

(declare-fun m!529295 () Bool)

(assert (=> d!83115 m!529295))

(assert (=> d!83115 m!529207))

(declare-fun m!529297 () Bool)

(assert (=> b!552316 m!529297))

(assert (=> b!552316 m!529297))

(assert (=> b!552316 m!529185))

(declare-fun m!529301 () Bool)

(assert (=> b!552316 m!529301))

(assert (=> b!552309 m!529293))

(assert (=> b!552308 m!529293))

(assert (=> b!552198 d!83115))

(declare-fun d!83119 () Bool)

(declare-fun lt!251114 () (_ BitVec 32))

(declare-fun lt!251113 () (_ BitVec 32))

(assert (=> d!83119 (= lt!251114 (bvmul (bvxor lt!251113 (bvlshr lt!251113 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83119 (= lt!251113 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83119 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344862 (let ((h!11768 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51788 (bvmul (bvxor h!11768 (bvlshr h!11768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51788 (bvlshr x!51788 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344862 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344862 #b00000000000000000000000000000000))))))

(assert (=> d!83119 (= (toIndex!0 (select (store (arr!16708 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!251114 (bvlshr lt!251114 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552198 d!83119))

(declare-fun d!83123 () Bool)

(declare-fun lt!251116 () (_ BitVec 32))

(declare-fun lt!251115 () (_ BitVec 32))

(assert (=> d!83123 (= lt!251116 (bvmul (bvxor lt!251115 (bvlshr lt!251115 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83123 (= lt!251115 ((_ extract 31 0) (bvand (bvxor (select (arr!16708 a!3118) j!142) (bvlshr (select (arr!16708 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83123 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344862 (let ((h!11768 ((_ extract 31 0) (bvand (bvxor (select (arr!16708 a!3118) j!142) (bvlshr (select (arr!16708 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51788 (bvmul (bvxor h!11768 (bvlshr h!11768 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51788 (bvlshr x!51788 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344862 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344862 #b00000000000000000000000000000000))))))

(assert (=> d!83123 (= (toIndex!0 (select (arr!16708 a!3118) j!142) mask!3119) (bvand (bvxor lt!251116 (bvlshr lt!251116 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552198 d!83123))

(declare-fun d!83125 () Bool)

(declare-fun res!344880 () Bool)

(declare-fun e!318735 () Bool)

(assert (=> d!83125 (=> res!344880 e!318735)))

(assert (=> d!83125 (= res!344880 (bvsge j!142 (size!17072 a!3118)))))

(assert (=> d!83125 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318735)))

(declare-fun b!552353 () Bool)

(declare-fun e!318737 () Bool)

(assert (=> b!552353 (= e!318735 e!318737)))

(declare-fun c!64073 () Bool)

(assert (=> b!552353 (= c!64073 (validKeyInArray!0 (select (arr!16708 a!3118) j!142)))))

(declare-fun b!552354 () Bool)

(declare-fun e!318736 () Bool)

(assert (=> b!552354 (= e!318737 e!318736)))

(declare-fun lt!251133 () (_ BitVec 64))

(assert (=> b!552354 (= lt!251133 (select (arr!16708 a!3118) j!142))))

(declare-fun lt!251134 () Unit!17088)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34794 (_ BitVec 64) (_ BitVec 32)) Unit!17088)

(assert (=> b!552354 (= lt!251134 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251133 j!142))))

(assert (=> b!552354 (arrayContainsKey!0 a!3118 lt!251133 #b00000000000000000000000000000000)))

(declare-fun lt!251135 () Unit!17088)

(assert (=> b!552354 (= lt!251135 lt!251134)))

(declare-fun res!344879 () Bool)

(assert (=> b!552354 (= res!344879 (= (seekEntryOrOpen!0 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) (Found!5157 j!142)))))

(assert (=> b!552354 (=> (not res!344879) (not e!318736))))

(declare-fun b!552355 () Bool)

(declare-fun call!32321 () Bool)

(assert (=> b!552355 (= e!318737 call!32321)))

(declare-fun b!552356 () Bool)

(assert (=> b!552356 (= e!318736 call!32321)))

(declare-fun bm!32318 () Bool)

(assert (=> bm!32318 (= call!32321 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83125 (not res!344880)) b!552353))

(assert (= (and b!552353 c!64073) b!552354))

(assert (= (and b!552353 (not c!64073)) b!552355))

(assert (= (and b!552354 res!344879) b!552356))

(assert (= (or b!552356 b!552355) bm!32318))

(assert (=> b!552353 m!529179))

(assert (=> b!552353 m!529179))

(assert (=> b!552353 m!529211))

(assert (=> b!552354 m!529179))

(declare-fun m!529327 () Bool)

(assert (=> b!552354 m!529327))

(declare-fun m!529329 () Bool)

(assert (=> b!552354 m!529329))

(assert (=> b!552354 m!529179))

(assert (=> b!552354 m!529181))

(declare-fun m!529331 () Bool)

(assert (=> bm!32318 m!529331))

(assert (=> b!552202 d!83125))

(declare-fun d!83139 () Bool)

(assert (=> d!83139 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!251141 () Unit!17088)

(declare-fun choose!38 (array!34794 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17088)

(assert (=> d!83139 (= lt!251141 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83139 (validMask!0 mask!3119)))

(assert (=> d!83139 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!251141)))

(declare-fun bs!17198 () Bool)

(assert (= bs!17198 d!83139))

(assert (=> bs!17198 m!529199))

(declare-fun m!529343 () Bool)

(assert (=> bs!17198 m!529343))

(assert (=> bs!17198 m!529207))

(assert (=> b!552202 d!83139))

(declare-fun d!83145 () Bool)

(declare-fun res!344896 () Bool)

(declare-fun e!318757 () Bool)

(assert (=> d!83145 (=> res!344896 e!318757)))

(assert (=> d!83145 (= res!344896 (= (select (arr!16708 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83145 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!318757)))

(declare-fun b!552380 () Bool)

(declare-fun e!318758 () Bool)

(assert (=> b!552380 (= e!318757 e!318758)))

(declare-fun res!344897 () Bool)

(assert (=> b!552380 (=> (not res!344897) (not e!318758))))

(assert (=> b!552380 (= res!344897 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17072 a!3118)))))

(declare-fun b!552381 () Bool)

(assert (=> b!552381 (= e!318758 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83145 (not res!344896)) b!552380))

(assert (= (and b!552380 res!344897) b!552381))

(assert (=> d!83145 m!529251))

(declare-fun m!529347 () Bool)

(assert (=> b!552381 m!529347))

(assert (=> b!552195 d!83145))

(declare-fun b!552458 () Bool)

(declare-fun e!318803 () SeekEntryResult!5157)

(assert (=> b!552458 (= e!318803 Undefined!5157)))

(declare-fun b!552459 () Bool)

(declare-fun e!318804 () SeekEntryResult!5157)

(assert (=> b!552459 (= e!318803 e!318804)))

(declare-fun lt!251178 () (_ BitVec 64))

(declare-fun lt!251176 () SeekEntryResult!5157)

(assert (=> b!552459 (= lt!251178 (select (arr!16708 a!3118) (index!22857 lt!251176)))))

(declare-fun c!64109 () Bool)

(assert (=> b!552459 (= c!64109 (= lt!251178 (select (arr!16708 a!3118) j!142)))))

(declare-fun d!83151 () Bool)

(declare-fun lt!251177 () SeekEntryResult!5157)

(assert (=> d!83151 (and (or ((_ is Undefined!5157) lt!251177) (not ((_ is Found!5157) lt!251177)) (and (bvsge (index!22856 lt!251177) #b00000000000000000000000000000000) (bvslt (index!22856 lt!251177) (size!17072 a!3118)))) (or ((_ is Undefined!5157) lt!251177) ((_ is Found!5157) lt!251177) (not ((_ is MissingZero!5157) lt!251177)) (and (bvsge (index!22855 lt!251177) #b00000000000000000000000000000000) (bvslt (index!22855 lt!251177) (size!17072 a!3118)))) (or ((_ is Undefined!5157) lt!251177) ((_ is Found!5157) lt!251177) ((_ is MissingZero!5157) lt!251177) (not ((_ is MissingVacant!5157) lt!251177)) (and (bvsge (index!22858 lt!251177) #b00000000000000000000000000000000) (bvslt (index!22858 lt!251177) (size!17072 a!3118)))) (or ((_ is Undefined!5157) lt!251177) (ite ((_ is Found!5157) lt!251177) (= (select (arr!16708 a!3118) (index!22856 lt!251177)) (select (arr!16708 a!3118) j!142)) (ite ((_ is MissingZero!5157) lt!251177) (= (select (arr!16708 a!3118) (index!22855 lt!251177)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5157) lt!251177) (= (select (arr!16708 a!3118) (index!22858 lt!251177)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83151 (= lt!251177 e!318803)))

(declare-fun c!64107 () Bool)

(assert (=> d!83151 (= c!64107 (and ((_ is Intermediate!5157) lt!251176) (undefined!5969 lt!251176)))))

(assert (=> d!83151 (= lt!251176 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16708 a!3118) j!142) mask!3119) (select (arr!16708 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83151 (validMask!0 mask!3119)))

(assert (=> d!83151 (= (seekEntryOrOpen!0 (select (arr!16708 a!3118) j!142) a!3118 mask!3119) lt!251177)))

(declare-fun b!552460 () Bool)

(assert (=> b!552460 (= e!318804 (Found!5157 (index!22857 lt!251176)))))

(declare-fun b!552461 () Bool)

(declare-fun e!318802 () SeekEntryResult!5157)

(assert (=> b!552461 (= e!318802 (MissingZero!5157 (index!22857 lt!251176)))))

(declare-fun b!552462 () Bool)

(declare-fun c!64108 () Bool)

(assert (=> b!552462 (= c!64108 (= lt!251178 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!552462 (= e!318804 e!318802)))

(declare-fun b!552463 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34794 (_ BitVec 32)) SeekEntryResult!5157)

(assert (=> b!552463 (= e!318802 (seekKeyOrZeroReturnVacant!0 (x!51785 lt!251176) (index!22857 lt!251176) (index!22857 lt!251176) (select (arr!16708 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83151 c!64107) b!552458))

(assert (= (and d!83151 (not c!64107)) b!552459))

(assert (= (and b!552459 c!64109) b!552460))

(assert (= (and b!552459 (not c!64109)) b!552462))

(assert (= (and b!552462 c!64108) b!552461))

(assert (= (and b!552462 (not c!64108)) b!552463))

(declare-fun m!529377 () Bool)

(assert (=> b!552459 m!529377))

(declare-fun m!529381 () Bool)

(assert (=> d!83151 m!529381))

(declare-fun m!529383 () Bool)

(assert (=> d!83151 m!529383))

(assert (=> d!83151 m!529179))

(assert (=> d!83151 m!529183))

(declare-fun m!529387 () Bool)

(assert (=> d!83151 m!529387))

(assert (=> d!83151 m!529207))

(assert (=> d!83151 m!529183))

(assert (=> d!83151 m!529179))

(declare-fun m!529391 () Bool)

(assert (=> d!83151 m!529391))

(assert (=> b!552463 m!529179))

(declare-fun m!529393 () Bool)

(assert (=> b!552463 m!529393))

(assert (=> b!552201 d!83151))

(declare-fun b!552469 () Bool)

(declare-fun e!318810 () SeekEntryResult!5157)

(assert (=> b!552469 (= e!318810 Undefined!5157)))

(declare-fun b!552470 () Bool)

(declare-fun e!318813 () SeekEntryResult!5157)

(assert (=> b!552470 (= e!318810 e!318813)))

(declare-fun lt!251181 () (_ BitVec 64))

(declare-fun lt!251179 () SeekEntryResult!5157)

(assert (=> b!552470 (= lt!251181 (select (arr!16708 a!3118) (index!22857 lt!251179)))))

(declare-fun c!64113 () Bool)

(assert (=> b!552470 (= c!64113 (= lt!251181 k0!1914))))

(declare-fun d!83165 () Bool)

(declare-fun lt!251180 () SeekEntryResult!5157)

(assert (=> d!83165 (and (or ((_ is Undefined!5157) lt!251180) (not ((_ is Found!5157) lt!251180)) (and (bvsge (index!22856 lt!251180) #b00000000000000000000000000000000) (bvslt (index!22856 lt!251180) (size!17072 a!3118)))) (or ((_ is Undefined!5157) lt!251180) ((_ is Found!5157) lt!251180) (not ((_ is MissingZero!5157) lt!251180)) (and (bvsge (index!22855 lt!251180) #b00000000000000000000000000000000) (bvslt (index!22855 lt!251180) (size!17072 a!3118)))) (or ((_ is Undefined!5157) lt!251180) ((_ is Found!5157) lt!251180) ((_ is MissingZero!5157) lt!251180) (not ((_ is MissingVacant!5157) lt!251180)) (and (bvsge (index!22858 lt!251180) #b00000000000000000000000000000000) (bvslt (index!22858 lt!251180) (size!17072 a!3118)))) (or ((_ is Undefined!5157) lt!251180) (ite ((_ is Found!5157) lt!251180) (= (select (arr!16708 a!3118) (index!22856 lt!251180)) k0!1914) (ite ((_ is MissingZero!5157) lt!251180) (= (select (arr!16708 a!3118) (index!22855 lt!251180)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5157) lt!251180) (= (select (arr!16708 a!3118) (index!22858 lt!251180)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83165 (= lt!251180 e!318810)))

(declare-fun c!64111 () Bool)

(assert (=> d!83165 (= c!64111 (and ((_ is Intermediate!5157) lt!251179) (undefined!5969 lt!251179)))))

(assert (=> d!83165 (= lt!251179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83165 (validMask!0 mask!3119)))

(assert (=> d!83165 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!251180)))

(declare-fun b!552471 () Bool)

(assert (=> b!552471 (= e!318813 (Found!5157 (index!22857 lt!251179)))))

(declare-fun b!552472 () Bool)

(declare-fun e!318809 () SeekEntryResult!5157)

(assert (=> b!552472 (= e!318809 (MissingZero!5157 (index!22857 lt!251179)))))

(declare-fun b!552473 () Bool)

(declare-fun c!64112 () Bool)

(assert (=> b!552473 (= c!64112 (= lt!251181 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!552473 (= e!318813 e!318809)))

(declare-fun b!552474 () Bool)

(assert (=> b!552474 (= e!318809 (seekKeyOrZeroReturnVacant!0 (x!51785 lt!251179) (index!22857 lt!251179) (index!22857 lt!251179) k0!1914 a!3118 mask!3119))))

(assert (= (and d!83165 c!64111) b!552469))

(assert (= (and d!83165 (not c!64111)) b!552470))

(assert (= (and b!552470 c!64113) b!552471))

(assert (= (and b!552470 (not c!64113)) b!552473))

(assert (= (and b!552473 c!64112) b!552472))

(assert (= (and b!552473 (not c!64112)) b!552474))

(declare-fun m!529401 () Bool)

(assert (=> b!552470 m!529401))

(declare-fun m!529403 () Bool)

(assert (=> d!83165 m!529403))

(declare-fun m!529407 () Bool)

(assert (=> d!83165 m!529407))

(declare-fun m!529409 () Bool)

(assert (=> d!83165 m!529409))

(declare-fun m!529411 () Bool)

(assert (=> d!83165 m!529411))

(assert (=> d!83165 m!529207))

(assert (=> d!83165 m!529409))

(declare-fun m!529413 () Bool)

(assert (=> d!83165 m!529413))

(declare-fun m!529415 () Bool)

(assert (=> b!552474 m!529415))

(assert (=> b!552196 d!83165))

(declare-fun d!83169 () Bool)

(assert (=> d!83169 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50512 d!83169))

(declare-fun d!83172 () Bool)

(assert (=> d!83172 (= (array_inv!12504 a!3118) (bvsge (size!17072 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50512 d!83172))

(declare-fun d!83176 () Bool)

(assert (=> d!83176 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552199 d!83176))

(declare-fun d!83179 () Bool)

(declare-fun res!344923 () Bool)

(declare-fun e!318818 () Bool)

(assert (=> d!83179 (=> res!344923 e!318818)))

(assert (=> d!83179 (= res!344923 (bvsge #b00000000000000000000000000000000 (size!17072 a!3118)))))

(assert (=> d!83179 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318818)))

(declare-fun b!552485 () Bool)

(declare-fun e!318820 () Bool)

(assert (=> b!552485 (= e!318818 e!318820)))

(declare-fun c!64118 () Bool)

(assert (=> b!552485 (= c!64118 (validKeyInArray!0 (select (arr!16708 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552486 () Bool)

(declare-fun e!318819 () Bool)

(assert (=> b!552486 (= e!318820 e!318819)))

(declare-fun lt!251188 () (_ BitVec 64))

(assert (=> b!552486 (= lt!251188 (select (arr!16708 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!251189 () Unit!17088)

(assert (=> b!552486 (= lt!251189 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251188 #b00000000000000000000000000000000))))

(assert (=> b!552486 (arrayContainsKey!0 a!3118 lt!251188 #b00000000000000000000000000000000)))

(declare-fun lt!251190 () Unit!17088)

(assert (=> b!552486 (= lt!251190 lt!251189)))

(declare-fun res!344922 () Bool)

(assert (=> b!552486 (= res!344922 (= (seekEntryOrOpen!0 (select (arr!16708 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5157 #b00000000000000000000000000000000)))))

(assert (=> b!552486 (=> (not res!344922) (not e!318819))))

(declare-fun b!552487 () Bool)

(declare-fun call!32330 () Bool)

(assert (=> b!552487 (= e!318820 call!32330)))

(declare-fun b!552488 () Bool)

(assert (=> b!552488 (= e!318819 call!32330)))

(declare-fun bm!32327 () Bool)

(assert (=> bm!32327 (= call!32330 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83179 (not res!344923)) b!552485))

(assert (= (and b!552485 c!64118) b!552486))

(assert (= (and b!552485 (not c!64118)) b!552487))

(assert (= (and b!552486 res!344922) b!552488))

(assert (= (or b!552488 b!552487) bm!32327))

(assert (=> b!552485 m!529251))

(assert (=> b!552485 m!529251))

(assert (=> b!552485 m!529253))

(assert (=> b!552486 m!529251))

(declare-fun m!529431 () Bool)

(assert (=> b!552486 m!529431))

(declare-fun m!529433 () Bool)

(assert (=> b!552486 m!529433))

(assert (=> b!552486 m!529251))

(declare-fun m!529435 () Bool)

(assert (=> b!552486 m!529435))

(declare-fun m!529437 () Bool)

(assert (=> bm!32327 m!529437))

(assert (=> b!552194 d!83179))

(declare-fun d!83185 () Bool)

(assert (=> d!83185 (= (validKeyInArray!0 (select (arr!16708 a!3118) j!142)) (and (not (= (select (arr!16708 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16708 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552200 d!83185))

(check-sat (not bm!32309) (not d!83139) (not d!83105) (not d!83115) (not b!552485) (not bm!32318) (not b!552486) (not b!552353) (not b!552245) (not b!552307) (not b!552246) (not bm!32327) (not d!83151) (not b!552248) (not b!552354) (not d!83165) (not b!552463) (not b!552381) (not b!552474) (not b!552316))
(check-sat)
