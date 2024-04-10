; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50510 () Bool)

(assert start!50510)

(declare-fun b!552165 () Bool)

(declare-fun e!318622 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!251050 () (_ BitVec 32))

(assert (=> b!552165 (= e!318622 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge lt!251050 #b00000000000000000000000000000000) (bvslt lt!251050 (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!318624 () Bool)

(assert (=> b!552165 e!318624))

(declare-fun res!344761 () Bool)

(assert (=> b!552165 (=> (not res!344761) (not e!318624))))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((array!34792 0))(
  ( (array!34793 (arr!16707 (Array (_ BitVec 32) (_ BitVec 64))) (size!17071 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34792)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34792 (_ BitVec 32)) Bool)

(assert (=> b!552165 (= res!344761 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17086 0))(
  ( (Unit!17087) )
))
(declare-fun lt!251053 () Unit!17086)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17086)

(assert (=> b!552165 (= lt!251053 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552166 () Bool)

(declare-fun res!344762 () Bool)

(declare-fun e!318623 () Bool)

(assert (=> b!552166 (=> (not res!344762) (not e!318623))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552166 (= res!344762 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552167 () Bool)

(declare-fun res!344768 () Bool)

(assert (=> b!552167 (=> (not res!344768) (not e!318623))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552167 (= res!344768 (validKeyInArray!0 k!1914))))

(declare-fun b!552168 () Bool)

(declare-fun e!318620 () Bool)

(assert (=> b!552168 (= e!318623 e!318620)))

(declare-fun res!344763 () Bool)

(assert (=> b!552168 (=> (not res!344763) (not e!318620))))

(declare-datatypes ((SeekEntryResult!5156 0))(
  ( (MissingZero!5156 (index!22851 (_ BitVec 32))) (Found!5156 (index!22852 (_ BitVec 32))) (Intermediate!5156 (undefined!5968 Bool) (index!22853 (_ BitVec 32)) (x!51784 (_ BitVec 32))) (Undefined!5156) (MissingVacant!5156 (index!22854 (_ BitVec 32))) )
))
(declare-fun lt!251052 () SeekEntryResult!5156)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552168 (= res!344763 (or (= lt!251052 (MissingZero!5156 i!1132)) (= lt!251052 (MissingVacant!5156 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34792 (_ BitVec 32)) SeekEntryResult!5156)

(assert (=> b!552168 (= lt!251052 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!552169 () Bool)

(declare-fun res!344759 () Bool)

(assert (=> b!552169 (=> (not res!344759) (not e!318623))))

(assert (=> b!552169 (= res!344759 (and (= (size!17071 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17071 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17071 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552170 () Bool)

(declare-fun res!344766 () Bool)

(assert (=> b!552170 (=> (not res!344766) (not e!318620))))

(declare-datatypes ((List!10787 0))(
  ( (Nil!10784) (Cons!10783 (h!11765 (_ BitVec 64)) (t!17015 List!10787)) )
))
(declare-fun arrayNoDuplicates!0 (array!34792 (_ BitVec 32) List!10787) Bool)

(assert (=> b!552170 (= res!344766 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10784))))

(declare-fun b!552171 () Bool)

(declare-fun res!344767 () Bool)

(assert (=> b!552171 (=> (not res!344767) (not e!318623))))

(assert (=> b!552171 (= res!344767 (validKeyInArray!0 (select (arr!16707 a!3118) j!142)))))

(declare-fun b!552164 () Bool)

(assert (=> b!552164 (= e!318620 e!318622)))

(declare-fun res!344765 () Bool)

(assert (=> b!552164 (=> (not res!344765) (not e!318622))))

(declare-fun lt!251051 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34792 (_ BitVec 32)) SeekEntryResult!5156)

(assert (=> b!552164 (= res!344765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251051 (select (arr!16707 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251050 (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118)) mask!3119)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552164 (= lt!251050 (toIndex!0 (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!552164 (= lt!251051 (toIndex!0 (select (arr!16707 a!3118) j!142) mask!3119))))

(declare-fun res!344760 () Bool)

(assert (=> start!50510 (=> (not res!344760) (not e!318623))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50510 (= res!344760 (validMask!0 mask!3119))))

(assert (=> start!50510 e!318623))

(assert (=> start!50510 true))

(declare-fun array_inv!12503 (array!34792) Bool)

(assert (=> start!50510 (array_inv!12503 a!3118)))

(declare-fun b!552172 () Bool)

(declare-fun res!344764 () Bool)

(assert (=> b!552172 (=> (not res!344764) (not e!318620))))

(assert (=> b!552172 (= res!344764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552173 () Bool)

(assert (=> b!552173 (= e!318624 (= (seekEntryOrOpen!0 (select (arr!16707 a!3118) j!142) a!3118 mask!3119) (Found!5156 j!142)))))

(assert (= (and start!50510 res!344760) b!552169))

(assert (= (and b!552169 res!344759) b!552171))

(assert (= (and b!552171 res!344767) b!552167))

(assert (= (and b!552167 res!344768) b!552166))

(assert (= (and b!552166 res!344762) b!552168))

(assert (= (and b!552168 res!344763) b!552172))

(assert (= (and b!552172 res!344764) b!552170))

(assert (= (and b!552170 res!344766) b!552164))

(assert (= (and b!552164 res!344765) b!552165))

(assert (= (and b!552165 res!344761) b!552173))

(declare-fun m!529143 () Bool)

(assert (=> b!552168 m!529143))

(declare-fun m!529145 () Bool)

(assert (=> b!552166 m!529145))

(declare-fun m!529147 () Bool)

(assert (=> b!552173 m!529147))

(assert (=> b!552173 m!529147))

(declare-fun m!529149 () Bool)

(assert (=> b!552173 m!529149))

(declare-fun m!529151 () Bool)

(assert (=> b!552170 m!529151))

(declare-fun m!529153 () Bool)

(assert (=> b!552165 m!529153))

(declare-fun m!529155 () Bool)

(assert (=> b!552165 m!529155))

(assert (=> b!552171 m!529147))

(assert (=> b!552171 m!529147))

(declare-fun m!529157 () Bool)

(assert (=> b!552171 m!529157))

(declare-fun m!529159 () Bool)

(assert (=> b!552172 m!529159))

(declare-fun m!529161 () Bool)

(assert (=> b!552167 m!529161))

(declare-fun m!529163 () Bool)

(assert (=> start!50510 m!529163))

(declare-fun m!529165 () Bool)

(assert (=> start!50510 m!529165))

(assert (=> b!552164 m!529147))

(declare-fun m!529167 () Bool)

(assert (=> b!552164 m!529167))

(assert (=> b!552164 m!529147))

(declare-fun m!529169 () Bool)

(assert (=> b!552164 m!529169))

(assert (=> b!552164 m!529147))

(declare-fun m!529171 () Bool)

(assert (=> b!552164 m!529171))

(declare-fun m!529173 () Bool)

(assert (=> b!552164 m!529173))

(assert (=> b!552164 m!529171))

(declare-fun m!529175 () Bool)

(assert (=> b!552164 m!529175))

(assert (=> b!552164 m!529171))

(declare-fun m!529177 () Bool)

(assert (=> b!552164 m!529177))

(push 1)

(assert (not b!552165))

(assert (not b!552170))

(assert (not start!50510))

(assert (not b!552164))

(assert (not b!552167))

(assert (not b!552172))

(assert (not b!552166))

(assert (not b!552168))

(assert (not b!552171))

(assert (not b!552173))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!552287 () Bool)

(declare-fun c!64056 () Bool)

(declare-fun lt!251096 () (_ BitVec 64))

(assert (=> b!552287 (= c!64056 (= lt!251096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318691 () SeekEntryResult!5156)

(declare-fun e!318690 () SeekEntryResult!5156)

(assert (=> b!552287 (= e!318691 e!318690)))

(declare-fun b!552289 () Bool)

(declare-fun lt!251094 () SeekEntryResult!5156)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34792 (_ BitVec 32)) SeekEntryResult!5156)

(assert (=> b!552289 (= e!318690 (seekKeyOrZeroReturnVacant!0 (x!51784 lt!251094) (index!22853 lt!251094) (index!22853 lt!251094) (select (arr!16707 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!552290 () Bool)

(declare-fun e!318689 () SeekEntryResult!5156)

(assert (=> b!552290 (= e!318689 Undefined!5156)))

(declare-fun b!552291 () Bool)

(assert (=> b!552291 (= e!318691 (Found!5156 (index!22853 lt!251094)))))

(declare-fun b!552292 () Bool)

(assert (=> b!552292 (= e!318690 (MissingZero!5156 (index!22853 lt!251094)))))

(declare-fun b!552288 () Bool)

(assert (=> b!552288 (= e!318689 e!318691)))

(assert (=> b!552288 (= lt!251096 (select (arr!16707 a!3118) (index!22853 lt!251094)))))

(declare-fun c!64055 () Bool)

(assert (=> b!552288 (= c!64055 (= lt!251096 (select (arr!16707 a!3118) j!142)))))

(declare-fun d!83107 () Bool)

(declare-fun lt!251095 () SeekEntryResult!5156)

(assert (=> d!83107 (and (or (is-Undefined!5156 lt!251095) (not (is-Found!5156 lt!251095)) (and (bvsge (index!22852 lt!251095) #b00000000000000000000000000000000) (bvslt (index!22852 lt!251095) (size!17071 a!3118)))) (or (is-Undefined!5156 lt!251095) (is-Found!5156 lt!251095) (not (is-MissingZero!5156 lt!251095)) (and (bvsge (index!22851 lt!251095) #b00000000000000000000000000000000) (bvslt (index!22851 lt!251095) (size!17071 a!3118)))) (or (is-Undefined!5156 lt!251095) (is-Found!5156 lt!251095) (is-MissingZero!5156 lt!251095) (not (is-MissingVacant!5156 lt!251095)) (and (bvsge (index!22854 lt!251095) #b00000000000000000000000000000000) (bvslt (index!22854 lt!251095) (size!17071 a!3118)))) (or (is-Undefined!5156 lt!251095) (ite (is-Found!5156 lt!251095) (= (select (arr!16707 a!3118) (index!22852 lt!251095)) (select (arr!16707 a!3118) j!142)) (ite (is-MissingZero!5156 lt!251095) (= (select (arr!16707 a!3118) (index!22851 lt!251095)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5156 lt!251095) (= (select (arr!16707 a!3118) (index!22854 lt!251095)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83107 (= lt!251095 e!318689)))

(declare-fun c!64057 () Bool)

(assert (=> d!83107 (= c!64057 (and (is-Intermediate!5156 lt!251094) (undefined!5968 lt!251094)))))

(assert (=> d!83107 (= lt!251094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16707 a!3118) j!142) mask!3119) (select (arr!16707 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83107 (validMask!0 mask!3119)))

(assert (=> d!83107 (= (seekEntryOrOpen!0 (select (arr!16707 a!3118) j!142) a!3118 mask!3119) lt!251095)))

(assert (= (and d!83107 c!64057) b!552290))

(assert (= (and d!83107 (not c!64057)) b!552288))

(assert (= (and b!552288 c!64055) b!552291))

(assert (= (and b!552288 (not c!64055)) b!552287))

(assert (= (and b!552287 c!64056) b!552292))

(assert (= (and b!552287 (not c!64056)) b!552289))

(assert (=> b!552289 m!529147))

(declare-fun m!529259 () Bool)

(assert (=> b!552289 m!529259))

(declare-fun m!529261 () Bool)

(assert (=> b!552288 m!529261))

(assert (=> d!83107 m!529167))

(assert (=> d!83107 m!529147))

(declare-fun m!529263 () Bool)

(assert (=> d!83107 m!529263))

(declare-fun m!529265 () Bool)

(assert (=> d!83107 m!529265))

(assert (=> d!83107 m!529163))

(declare-fun m!529267 () Bool)

(assert (=> d!83107 m!529267))

(declare-fun m!529269 () Bool)

(assert (=> d!83107 m!529269))

(assert (=> d!83107 m!529147))

(assert (=> d!83107 m!529167))

(assert (=> b!552173 d!83107))

(declare-fun b!552293 () Bool)

(declare-fun c!64060 () Bool)

(declare-fun lt!251100 () (_ BitVec 64))

(assert (=> b!552293 (= c!64060 (= lt!251100 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318699 () SeekEntryResult!5156)

(declare-fun e!318697 () SeekEntryResult!5156)

(assert (=> b!552293 (= e!318699 e!318697)))

(declare-fun lt!251097 () SeekEntryResult!5156)

(declare-fun b!552295 () Bool)

(assert (=> b!552295 (= e!318697 (seekKeyOrZeroReturnVacant!0 (x!51784 lt!251097) (index!22853 lt!251097) (index!22853 lt!251097) k!1914 a!3118 mask!3119))))

(declare-fun b!552296 () Bool)

(declare-fun e!318694 () SeekEntryResult!5156)

(assert (=> b!552296 (= e!318694 Undefined!5156)))

(declare-fun b!552297 () Bool)

(assert (=> b!552297 (= e!318699 (Found!5156 (index!22853 lt!251097)))))

(declare-fun b!552298 () Bool)

(assert (=> b!552298 (= e!318697 (MissingZero!5156 (index!22853 lt!251097)))))

(declare-fun b!552294 () Bool)

(assert (=> b!552294 (= e!318694 e!318699)))

(assert (=> b!552294 (= lt!251100 (select (arr!16707 a!3118) (index!22853 lt!251097)))))

(declare-fun c!64059 () Bool)

(assert (=> b!552294 (= c!64059 (= lt!251100 k!1914))))

(declare-fun d!83111 () Bool)

(declare-fun lt!251098 () SeekEntryResult!5156)

(assert (=> d!83111 (and (or (is-Undefined!5156 lt!251098) (not (is-Found!5156 lt!251098)) (and (bvsge (index!22852 lt!251098) #b00000000000000000000000000000000) (bvslt (index!22852 lt!251098) (size!17071 a!3118)))) (or (is-Undefined!5156 lt!251098) (is-Found!5156 lt!251098) (not (is-MissingZero!5156 lt!251098)) (and (bvsge (index!22851 lt!251098) #b00000000000000000000000000000000) (bvslt (index!22851 lt!251098) (size!17071 a!3118)))) (or (is-Undefined!5156 lt!251098) (is-Found!5156 lt!251098) (is-MissingZero!5156 lt!251098) (not (is-MissingVacant!5156 lt!251098)) (and (bvsge (index!22854 lt!251098) #b00000000000000000000000000000000) (bvslt (index!22854 lt!251098) (size!17071 a!3118)))) (or (is-Undefined!5156 lt!251098) (ite (is-Found!5156 lt!251098) (= (select (arr!16707 a!3118) (index!22852 lt!251098)) k!1914) (ite (is-MissingZero!5156 lt!251098) (= (select (arr!16707 a!3118) (index!22851 lt!251098)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5156 lt!251098) (= (select (arr!16707 a!3118) (index!22854 lt!251098)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83111 (= lt!251098 e!318694)))

(declare-fun c!64061 () Bool)

(assert (=> d!83111 (= c!64061 (and (is-Intermediate!5156 lt!251097) (undefined!5968 lt!251097)))))

(assert (=> d!83111 (= lt!251097 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83111 (validMask!0 mask!3119)))

(assert (=> d!83111 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!251098)))

(assert (= (and d!83111 c!64061) b!552296))

(assert (= (and d!83111 (not c!64061)) b!552294))

(assert (= (and b!552294 c!64059) b!552297))

(assert (= (and b!552294 (not c!64059)) b!552293))

(assert (= (and b!552293 c!64060) b!552298))

(assert (= (and b!552293 (not c!64060)) b!552295))

(declare-fun m!529271 () Bool)

(assert (=> b!552295 m!529271))

(declare-fun m!529273 () Bool)

(assert (=> b!552294 m!529273))

(declare-fun m!529275 () Bool)

(assert (=> d!83111 m!529275))

(declare-fun m!529277 () Bool)

(assert (=> d!83111 m!529277))

(declare-fun m!529279 () Bool)

(assert (=> d!83111 m!529279))

(assert (=> d!83111 m!529163))

(declare-fun m!529281 () Bool)

(assert (=> d!83111 m!529281))

(declare-fun m!529283 () Bool)

(assert (=> d!83111 m!529283))

(assert (=> d!83111 m!529275))

(assert (=> b!552168 d!83111))

(declare-fun d!83113 () Bool)

(declare-fun res!344860 () Bool)

(declare-fun e!318712 () Bool)

(assert (=> d!83113 (=> res!344860 e!318712)))

(assert (=> d!83113 (= res!344860 (= (select (arr!16707 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83113 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!318712)))

(declare-fun b!552325 () Bool)

(declare-fun e!318713 () Bool)

(assert (=> b!552325 (= e!318712 e!318713)))

(declare-fun res!344861 () Bool)

(assert (=> b!552325 (=> (not res!344861) (not e!318713))))

(assert (=> b!552325 (= res!344861 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17071 a!3118)))))

(declare-fun b!552326 () Bool)

(assert (=> b!552326 (= e!318713 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83113 (not res!344860)) b!552325))

(assert (= (and b!552325 res!344861) b!552326))

(declare-fun m!529299 () Bool)

(assert (=> d!83113 m!529299))

(declare-fun m!529303 () Bool)

(assert (=> b!552326 m!529303))

(assert (=> b!552166 d!83113))

(declare-fun d!83117 () Bool)

(assert (=> d!83117 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50510 d!83117))

(declare-fun d!83127 () Bool)

(assert (=> d!83127 (= (array_inv!12503 a!3118) (bvsge (size!17071 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50510 d!83127))

(declare-fun b!552347 () Bool)

(declare-fun e!318731 () Bool)

(declare-fun call!32320 () Bool)

(assert (=> b!552347 (= e!318731 call!32320)))

(declare-fun d!83129 () Bool)

(declare-fun res!344876 () Bool)

(declare-fun e!318730 () Bool)

(assert (=> d!83129 (=> res!344876 e!318730)))

(assert (=> d!83129 (= res!344876 (bvsge #b00000000000000000000000000000000 (size!17071 a!3118)))))

(assert (=> d!83129 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318730)))

(declare-fun b!552348 () Bool)

(declare-fun e!318732 () Bool)

(assert (=> b!552348 (= e!318732 e!318731)))

(declare-fun lt!251131 () (_ BitVec 64))

(assert (=> b!552348 (= lt!251131 (select (arr!16707 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!251130 () Unit!17086)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34792 (_ BitVec 64) (_ BitVec 32)) Unit!17086)

(assert (=> b!552348 (= lt!251130 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251131 #b00000000000000000000000000000000))))

(assert (=> b!552348 (arrayContainsKey!0 a!3118 lt!251131 #b00000000000000000000000000000000)))

(declare-fun lt!251132 () Unit!17086)

(assert (=> b!552348 (= lt!251132 lt!251130)))

(declare-fun res!344875 () Bool)

(assert (=> b!552348 (= res!344875 (= (seekEntryOrOpen!0 (select (arr!16707 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5156 #b00000000000000000000000000000000)))))

(assert (=> b!552348 (=> (not res!344875) (not e!318731))))

(declare-fun bm!32317 () Bool)

(assert (=> bm!32317 (= call!32320 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552349 () Bool)

(assert (=> b!552349 (= e!318732 call!32320)))

(declare-fun b!552350 () Bool)

(assert (=> b!552350 (= e!318730 e!318732)))

(declare-fun c!64072 () Bool)

(assert (=> b!552350 (= c!64072 (validKeyInArray!0 (select (arr!16707 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83129 (not res!344876)) b!552350))

(assert (= (and b!552350 c!64072) b!552348))

(assert (= (and b!552350 (not c!64072)) b!552349))

(assert (= (and b!552348 res!344875) b!552347))

(assert (= (or b!552347 b!552349) bm!32317))

(assert (=> b!552348 m!529299))

(declare-fun m!529313 () Bool)

(assert (=> b!552348 m!529313))

(declare-fun m!529315 () Bool)

(assert (=> b!552348 m!529315))

(assert (=> b!552348 m!529299))

(declare-fun m!529317 () Bool)

(assert (=> b!552348 m!529317))

(declare-fun m!529319 () Bool)

(assert (=> bm!32317 m!529319))

(assert (=> b!552350 m!529299))

(assert (=> b!552350 m!529299))

(declare-fun m!529321 () Bool)

(assert (=> b!552350 m!529321))

(assert (=> b!552172 d!83129))

(declare-fun d!83133 () Bool)

(assert (=> d!83133 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552167 d!83133))

(declare-fun b!552367 () Bool)

(declare-fun e!318748 () Bool)

(declare-fun call!32324 () Bool)

(assert (=> b!552367 (= e!318748 call!32324)))

(declare-fun b!552368 () Bool)

(assert (=> b!552368 (= e!318748 call!32324)))

(declare-fun bm!32321 () Bool)

(declare-fun c!64076 () Bool)

(assert (=> bm!32321 (= call!32324 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64076 (Cons!10783 (select (arr!16707 a!3118) #b00000000000000000000000000000000) Nil!10784) Nil!10784)))))

(declare-fun b!552369 () Bool)

(declare-fun e!318746 () Bool)

(declare-fun e!318747 () Bool)

(assert (=> b!552369 (= e!318746 e!318747)))

(declare-fun res!344889 () Bool)

(assert (=> b!552369 (=> (not res!344889) (not e!318747))))

(declare-fun e!318749 () Bool)

(assert (=> b!552369 (= res!344889 (not e!318749))))

(declare-fun res!344888 () Bool)

(assert (=> b!552369 (=> (not res!344888) (not e!318749))))

(assert (=> b!552369 (= res!344888 (validKeyInArray!0 (select (arr!16707 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83135 () Bool)

(declare-fun res!344887 () Bool)

(assert (=> d!83135 (=> res!344887 e!318746)))

(assert (=> d!83135 (= res!344887 (bvsge #b00000000000000000000000000000000 (size!17071 a!3118)))))

(assert (=> d!83135 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10784) e!318746)))

(declare-fun b!552370 () Bool)

(assert (=> b!552370 (= e!318747 e!318748)))

(assert (=> b!552370 (= c!64076 (validKeyInArray!0 (select (arr!16707 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!552371 () Bool)

(declare-fun contains!2843 (List!10787 (_ BitVec 64)) Bool)

(assert (=> b!552371 (= e!318749 (contains!2843 Nil!10784 (select (arr!16707 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83135 (not res!344887)) b!552369))

(assert (= (and b!552369 res!344888) b!552371))

(assert (= (and b!552369 res!344889) b!552370))

(assert (= (and b!552370 c!64076) b!552367))

(assert (= (and b!552370 (not c!64076)) b!552368))

(assert (= (or b!552367 b!552368) bm!32321))

(assert (=> bm!32321 m!529299))

(declare-fun m!529333 () Bool)

(assert (=> bm!32321 m!529333))

(assert (=> b!552369 m!529299))

(assert (=> b!552369 m!529299))

(assert (=> b!552369 m!529321))

(assert (=> b!552370 m!529299))

(assert (=> b!552370 m!529299))

(assert (=> b!552370 m!529321))

(assert (=> b!552371 m!529299))

(assert (=> b!552371 m!529299))

(declare-fun m!529335 () Bool)

(assert (=> b!552371 m!529335))

(assert (=> b!552170 d!83135))

(declare-fun b!552372 () Bool)

(declare-fun e!318751 () Bool)

(declare-fun call!32325 () Bool)

(assert (=> b!552372 (= e!318751 call!32325)))

(declare-fun d!83141 () Bool)

(declare-fun res!344891 () Bool)

(declare-fun e!318750 () Bool)

(assert (=> d!83141 (=> res!344891 e!318750)))

(assert (=> d!83141 (= res!344891 (bvsge j!142 (size!17071 a!3118)))))

(assert (=> d!83141 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318750)))

(declare-fun b!552373 () Bool)

(declare-fun e!318752 () Bool)

(assert (=> b!552373 (= e!318752 e!318751)))

(declare-fun lt!251139 () (_ BitVec 64))

(assert (=> b!552373 (= lt!251139 (select (arr!16707 a!3118) j!142))))

(declare-fun lt!251138 () Unit!17086)

(assert (=> b!552373 (= lt!251138 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!251139 j!142))))

(assert (=> b!552373 (arrayContainsKey!0 a!3118 lt!251139 #b00000000000000000000000000000000)))

(declare-fun lt!251140 () Unit!17086)

(assert (=> b!552373 (= lt!251140 lt!251138)))

(declare-fun res!344890 () Bool)

(assert (=> b!552373 (= res!344890 (= (seekEntryOrOpen!0 (select (arr!16707 a!3118) j!142) a!3118 mask!3119) (Found!5156 j!142)))))

(assert (=> b!552373 (=> (not res!344890) (not e!318751))))

(declare-fun bm!32322 () Bool)

(assert (=> bm!32322 (= call!32325 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!552374 () Bool)

(assert (=> b!552374 (= e!318752 call!32325)))

(declare-fun b!552375 () Bool)

(assert (=> b!552375 (= e!318750 e!318752)))

(declare-fun c!64077 () Bool)

(assert (=> b!552375 (= c!64077 (validKeyInArray!0 (select (arr!16707 a!3118) j!142)))))

(assert (= (and d!83141 (not res!344891)) b!552375))

(assert (= (and b!552375 c!64077) b!552373))

(assert (= (and b!552375 (not c!64077)) b!552374))

(assert (= (and b!552373 res!344890) b!552372))

(assert (= (or b!552372 b!552374) bm!32322))

(assert (=> b!552373 m!529147))

(declare-fun m!529337 () Bool)

(assert (=> b!552373 m!529337))

(declare-fun m!529339 () Bool)

(assert (=> b!552373 m!529339))

(assert (=> b!552373 m!529147))

(assert (=> b!552373 m!529149))

(declare-fun m!529341 () Bool)

(assert (=> bm!32322 m!529341))

(assert (=> b!552375 m!529147))

(assert (=> b!552375 m!529147))

(assert (=> b!552375 m!529157))

(assert (=> b!552165 d!83141))

(declare-fun d!83143 () Bool)

(assert (=> d!83143 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!251144 () Unit!17086)

(declare-fun choose!38 (array!34792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17086)

(assert (=> d!83143 (= lt!251144 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83143 (validMask!0 mask!3119)))

(assert (=> d!83143 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!251144)))

(declare-fun bs!17199 () Bool)

(assert (= bs!17199 d!83143))

(assert (=> bs!17199 m!529153))

(declare-fun m!529345 () Bool)

(assert (=> bs!17199 m!529345))

(assert (=> bs!17199 m!529163))

(assert (=> b!552165 d!83143))

(declare-fun d!83147 () Bool)

(assert (=> d!83147 (= (validKeyInArray!0 (select (arr!16707 a!3118) j!142)) (and (not (= (select (arr!16707 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16707 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!552171 d!83147))

(declare-fun b!552418 () Bool)

(declare-fun e!318778 () SeekEntryResult!5156)

(declare-fun e!318781 () SeekEntryResult!5156)

(assert (=> b!552418 (= e!318778 e!318781)))

(declare-fun c!64093 () Bool)

(declare-fun lt!251158 () (_ BitVec 64))

(assert (=> b!552418 (= c!64093 (or (= lt!251158 (select (arr!16707 a!3118) j!142)) (= (bvadd lt!251158 lt!251158) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552419 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552419 (= e!318781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251051 #b00000000000000000000000000000000 mask!3119) (select (arr!16707 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83149 () Bool)

(declare-fun e!318779 () Bool)

(assert (=> d!83149 e!318779))

(declare-fun c!64094 () Bool)

(declare-fun lt!251159 () SeekEntryResult!5156)

(assert (=> d!83149 (= c!64094 (and (is-Intermediate!5156 lt!251159) (undefined!5968 lt!251159)))))

(assert (=> d!83149 (= lt!251159 e!318778)))

(declare-fun c!64095 () Bool)

(assert (=> d!83149 (= c!64095 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83149 (= lt!251158 (select (arr!16707 a!3118) lt!251051))))

(assert (=> d!83149 (validMask!0 mask!3119)))

(assert (=> d!83149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251051 (select (arr!16707 a!3118) j!142) a!3118 mask!3119) lt!251159)))

(declare-fun b!552420 () Bool)

(assert (=> b!552420 (and (bvsge (index!22853 lt!251159) #b00000000000000000000000000000000) (bvslt (index!22853 lt!251159) (size!17071 a!3118)))))

(declare-fun res!344906 () Bool)

(assert (=> b!552420 (= res!344906 (= (select (arr!16707 a!3118) (index!22853 lt!251159)) (select (arr!16707 a!3118) j!142)))))

(declare-fun e!318780 () Bool)

(assert (=> b!552420 (=> res!344906 e!318780)))

(declare-fun e!318782 () Bool)

(assert (=> b!552420 (= e!318782 e!318780)))

(declare-fun b!552421 () Bool)

(assert (=> b!552421 (= e!318781 (Intermediate!5156 false lt!251051 #b00000000000000000000000000000000))))

(declare-fun b!552422 () Bool)

(assert (=> b!552422 (= e!318779 (bvsge (x!51784 lt!251159) #b01111111111111111111111111111110))))

(declare-fun b!552423 () Bool)

(assert (=> b!552423 (and (bvsge (index!22853 lt!251159) #b00000000000000000000000000000000) (bvslt (index!22853 lt!251159) (size!17071 a!3118)))))

(assert (=> b!552423 (= e!318780 (= (select (arr!16707 a!3118) (index!22853 lt!251159)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552424 () Bool)

(assert (=> b!552424 (and (bvsge (index!22853 lt!251159) #b00000000000000000000000000000000) (bvslt (index!22853 lt!251159) (size!17071 a!3118)))))

(declare-fun res!344904 () Bool)

(assert (=> b!552424 (= res!344904 (= (select (arr!16707 a!3118) (index!22853 lt!251159)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!552424 (=> res!344904 e!318780)))

(declare-fun b!552425 () Bool)

(assert (=> b!552425 (= e!318778 (Intermediate!5156 true lt!251051 #b00000000000000000000000000000000))))

(declare-fun b!552426 () Bool)

(assert (=> b!552426 (= e!318779 e!318782)))

(declare-fun res!344905 () Bool)

(assert (=> b!552426 (= res!344905 (and (is-Intermediate!5156 lt!251159) (not (undefined!5968 lt!251159)) (bvslt (x!51784 lt!251159) #b01111111111111111111111111111110) (bvsge (x!51784 lt!251159) #b00000000000000000000000000000000) (bvsge (x!51784 lt!251159) #b00000000000000000000000000000000)))))

(assert (=> b!552426 (=> (not res!344905) (not e!318782))))

(assert (= (and d!83149 c!64095) b!552425))

(assert (= (and d!83149 (not c!64095)) b!552418))

(assert (= (and b!552418 c!64093) b!552421))

(assert (= (and b!552418 (not c!64093)) b!552419))

(assert (= (and d!83149 c!64094) b!552422))

(assert (= (and d!83149 (not c!64094)) b!552426))

(assert (= (and b!552426 res!344905) b!552420))

(assert (= (and b!552420 (not res!344906)) b!552424))

(assert (= (and b!552424 (not res!344904)) b!552423))

(declare-fun m!529349 () Bool)

(assert (=> b!552423 m!529349))

(assert (=> b!552424 m!529349))

(declare-fun m!529351 () Bool)

(assert (=> d!83149 m!529351))

(assert (=> d!83149 m!529163))

(assert (=> b!552420 m!529349))

(declare-fun m!529353 () Bool)

(assert (=> b!552419 m!529353))

(assert (=> b!552419 m!529353))

(assert (=> b!552419 m!529147))

(declare-fun m!529355 () Bool)

(assert (=> b!552419 m!529355))

(assert (=> b!552164 d!83149))

(declare-fun b!552427 () Bool)

(declare-fun e!318783 () SeekEntryResult!5156)

(declare-fun e!318786 () SeekEntryResult!5156)

(assert (=> b!552427 (= e!318783 e!318786)))

(declare-fun lt!251160 () (_ BitVec 64))

(declare-fun c!64096 () Bool)

(assert (=> b!552427 (= c!64096 (or (= lt!251160 (select (store (arr!16707 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!251160 lt!251160) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!552428 () Bool)

(assert (=> b!552428 (= e!318786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!251050 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118)) mask!3119))))

(declare-fun d!83153 () Bool)

(declare-fun e!318784 () Bool)

(assert (=> d!83153 e!318784))

(declare-fun c!64097 () Bool)

(declare-fun lt!251161 () SeekEntryResult!5156)

(assert (=> d!83153 (= c!64097 (and (is-Intermediate!5156 lt!251161) (undefined!5968 lt!251161)))))

(assert (=> d!83153 (= lt!251161 e!318783)))

(declare-fun c!64098 () Bool)

(assert (=> d!83153 (= c!64098 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83153 (= lt!251160 (select (arr!16707 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118))) lt!251050))))

(assert (=> d!83153 (validMask!0 mask!3119)))

(assert (=> d!83153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251050 (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118)) mask!3119) lt!251161)))

(declare-fun b!552429 () Bool)

(assert (=> b!552429 (and (bvsge (index!22853 lt!251161) #b00000000000000000000000000000000) (bvslt (index!22853 lt!251161) (size!17071 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118)))))))

(declare-fun res!344909 () Bool)

(assert (=> b!552429 (= res!344909 (= (select (arr!16707 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118))) (index!22853 lt!251161)) (select (store (arr!16707 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!318785 () Bool)

(assert (=> b!552429 (=> res!344909 e!318785)))

(declare-fun e!318787 () Bool)

(assert (=> b!552429 (= e!318787 e!318785)))

(declare-fun b!552430 () Bool)

(assert (=> b!552430 (= e!318786 (Intermediate!5156 false lt!251050 #b00000000000000000000000000000000))))

(declare-fun b!552431 () Bool)

(assert (=> b!552431 (= e!318784 (bvsge (x!51784 lt!251161) #b01111111111111111111111111111110))))

(declare-fun b!552432 () Bool)

(assert (=> b!552432 (and (bvsge (index!22853 lt!251161) #b00000000000000000000000000000000) (bvslt (index!22853 lt!251161) (size!17071 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118)))))))

(assert (=> b!552432 (= e!318785 (= (select (arr!16707 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118))) (index!22853 lt!251161)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!552433 () Bool)

(assert (=> b!552433 (and (bvsge (index!22853 lt!251161) #b00000000000000000000000000000000) (bvslt (index!22853 lt!251161) (size!17071 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118)))))))

(declare-fun res!344907 () Bool)

(assert (=> b!552433 (= res!344907 (= (select (arr!16707 (array!34793 (store (arr!16707 a!3118) i!1132 k!1914) (size!17071 a!3118))) (index!22853 lt!251161)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!552433 (=> res!344907 e!318785)))

(declare-fun b!552434 () Bool)

(assert (=> b!552434 (= e!318783 (Intermediate!5156 true lt!251050 #b00000000000000000000000000000000))))

(declare-fun b!552435 () Bool)

(assert (=> b!552435 (= e!318784 e!318787)))

(declare-fun res!344908 () Bool)

(assert (=> b!552435 (= res!344908 (and (is-Intermediate!5156 lt!251161) (not (undefined!5968 lt!251161)) (bvslt (x!51784 lt!251161) #b01111111111111111111111111111110) (bvsge (x!51784 lt!251161) #b00000000000000000000000000000000) (bvsge (x!51784 lt!251161) #b00000000000000000000000000000000)))))

(assert (=> b!552435 (=> (not res!344908) (not e!318787))))

(assert (= (and d!83153 c!64098) b!552434))

(assert (= (and d!83153 (not c!64098)) b!552427))

(assert (= (and b!552427 c!64096) b!552430))

(assert (= (and b!552427 (not c!64096)) b!552428))

(assert (= (and d!83153 c!64097) b!552431))

(assert (= (and d!83153 (not c!64097)) b!552435))

(assert (= (and b!552435 res!344908) b!552429))

(assert (= (and b!552429 (not res!344909)) b!552433))

(assert (= (and b!552433 (not res!344907)) b!552432))

(declare-fun m!529369 () Bool)

(assert (=> b!552432 m!529369))

(assert (=> b!552433 m!529369))

(declare-fun m!529371 () Bool)

(assert (=> d!83153 m!529371))

(assert (=> d!83153 m!529163))

(assert (=> b!552429 m!529369))

(declare-fun m!529373 () Bool)

(assert (=> b!552428 m!529373))

(assert (=> b!552428 m!529373))

(assert (=> b!552428 m!529171))

(declare-fun m!529375 () Bool)

(assert (=> b!552428 m!529375))

(assert (=> b!552164 d!83153))

(declare-fun d!83157 () Bool)

(declare-fun lt!251173 () (_ BitVec 32))

(declare-fun lt!251172 () (_ BitVec 32))

(assert (=> d!83157 (= lt!251173 (bvmul (bvxor lt!251172 (bvlshr lt!251172 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83157 (= lt!251172 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83157 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344910 (let ((h!11769 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51790 (bvmul (bvxor h!11769 (bvlshr h!11769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51790 (bvlshr x!51790 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344910 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344910 #b00000000000000000000000000000000))))))

(assert (=> d!83157 (= (toIndex!0 (select (store (arr!16707 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!251173 (bvlshr lt!251173 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552164 d!83157))

(declare-fun d!83161 () Bool)

(declare-fun lt!251175 () (_ BitVec 32))

(declare-fun lt!251174 () (_ BitVec 32))

(assert (=> d!83161 (= lt!251175 (bvmul (bvxor lt!251174 (bvlshr lt!251174 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83161 (= lt!251174 ((_ extract 31 0) (bvand (bvxor (select (arr!16707 a!3118) j!142) (bvlshr (select (arr!16707 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83161 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344910 (let ((h!11769 ((_ extract 31 0) (bvand (bvxor (select (arr!16707 a!3118) j!142) (bvlshr (select (arr!16707 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51790 (bvmul (bvxor h!11769 (bvlshr h!11769 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51790 (bvlshr x!51790 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344910 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344910 #b00000000000000000000000000000000))))))

(assert (=> d!83161 (= (toIndex!0 (select (arr!16707 a!3118) j!142) mask!3119) (bvand (bvxor lt!251175 (bvlshr lt!251175 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!552164 d!83161))

(push 1)

(assert (not bm!32322))

(assert (not b!552373))

(assert (not b!552370))

(assert (not b!552350))

(assert (not d!83149))

(assert (not b!552369))

(assert (not bm!32317))

(assert (not b!552348))

(assert (not d!83143))

(assert (not b!552295))

(assert (not d!83107))

(assert (not b!552428))

(assert (not b!552326))

(assert (not bm!32321))

(assert (not d!83111))

(assert (not b!552371))

(assert (not b!552289))

(assert (not b!552419))

(assert (not b!552375))

(assert (not d!83153))

(check-sat)

(pop 1)

(push 1)

(check-sat)

