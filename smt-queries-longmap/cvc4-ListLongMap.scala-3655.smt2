; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50430 () Bool)

(assert start!50430)

(declare-fun b!551573 () Bool)

(declare-fun res!344353 () Bool)

(declare-fun e!318315 () Bool)

(assert (=> b!551573 (=> (not res!344353) (not e!318315))))

(declare-datatypes ((array!34769 0))(
  ( (array!34770 (arr!16697 (Array (_ BitVec 32) (_ BitVec 64))) (size!17061 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34769)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34769 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551573 (= res!344353 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!344352 () Bool)

(assert (=> start!50430 (=> (not res!344352) (not e!318315))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50430 (= res!344352 (validMask!0 mask!3119))))

(assert (=> start!50430 e!318315))

(assert (=> start!50430 true))

(declare-fun array_inv!12493 (array!34769) Bool)

(assert (=> start!50430 (array_inv!12493 a!3118)))

(declare-fun b!551574 () Bool)

(declare-fun e!318314 () Bool)

(assert (=> b!551574 (= e!318315 e!318314)))

(declare-fun res!344354 () Bool)

(assert (=> b!551574 (=> (not res!344354) (not e!318314))))

(declare-datatypes ((SeekEntryResult!5146 0))(
  ( (MissingZero!5146 (index!22811 (_ BitVec 32))) (Found!5146 (index!22812 (_ BitVec 32))) (Intermediate!5146 (undefined!5958 Bool) (index!22813 (_ BitVec 32)) (x!51736 (_ BitVec 32))) (Undefined!5146) (MissingVacant!5146 (index!22814 (_ BitVec 32))) )
))
(declare-fun lt!250857 () SeekEntryResult!5146)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551574 (= res!344354 (or (= lt!250857 (MissingZero!5146 i!1132)) (= lt!250857 (MissingVacant!5146 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34769 (_ BitVec 32)) SeekEntryResult!5146)

(assert (=> b!551574 (= lt!250857 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551575 () Bool)

(declare-fun res!344359 () Bool)

(assert (=> b!551575 (=> (not res!344359) (not e!318314))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34769 (_ BitVec 32)) SeekEntryResult!5146)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551575 (= res!344359 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119) (select (arr!16697 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16697 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16697 a!3118) i!1132 k!1914) j!142) (array!34770 (store (arr!16697 a!3118) i!1132 k!1914) (size!17061 a!3118)) mask!3119)))))

(declare-fun b!551576 () Bool)

(declare-fun res!344357 () Bool)

(assert (=> b!551576 (=> (not res!344357) (not e!318314))))

(declare-datatypes ((List!10777 0))(
  ( (Nil!10774) (Cons!10773 (h!11752 (_ BitVec 64)) (t!17005 List!10777)) )
))
(declare-fun arrayNoDuplicates!0 (array!34769 (_ BitVec 32) List!10777) Bool)

(assert (=> b!551576 (= res!344357 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10774))))

(declare-fun b!551577 () Bool)

(declare-fun res!344351 () Bool)

(assert (=> b!551577 (=> (not res!344351) (not e!318315))))

(assert (=> b!551577 (= res!344351 (and (= (size!17061 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17061 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17061 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551578 () Bool)

(assert (=> b!551578 (= e!318314 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(declare-fun e!318313 () Bool)

(assert (=> b!551578 e!318313))

(declare-fun res!344356 () Bool)

(assert (=> b!551578 (=> (not res!344356) (not e!318313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34769 (_ BitVec 32)) Bool)

(assert (=> b!551578 (= res!344356 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17066 0))(
  ( (Unit!17067) )
))
(declare-fun lt!250858 () Unit!17066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17066)

(assert (=> b!551578 (= lt!250858 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551579 () Bool)

(declare-fun res!344358 () Bool)

(assert (=> b!551579 (=> (not res!344358) (not e!318315))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551579 (= res!344358 (validKeyInArray!0 k!1914))))

(declare-fun b!551580 () Bool)

(assert (=> b!551580 (= e!318313 (= (seekEntryOrOpen!0 (select (arr!16697 a!3118) j!142) a!3118 mask!3119) (Found!5146 j!142)))))

(declare-fun b!551581 () Bool)

(declare-fun res!344360 () Bool)

(assert (=> b!551581 (=> (not res!344360) (not e!318315))))

(assert (=> b!551581 (= res!344360 (validKeyInArray!0 (select (arr!16697 a!3118) j!142)))))

(declare-fun b!551582 () Bool)

(declare-fun res!344355 () Bool)

(assert (=> b!551582 (=> (not res!344355) (not e!318314))))

(assert (=> b!551582 (= res!344355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!50430 res!344352) b!551577))

(assert (= (and b!551577 res!344351) b!551581))

(assert (= (and b!551581 res!344360) b!551579))

(assert (= (and b!551579 res!344358) b!551573))

(assert (= (and b!551573 res!344353) b!551574))

(assert (= (and b!551574 res!344354) b!551582))

(assert (= (and b!551582 res!344355) b!551576))

(assert (= (and b!551576 res!344357) b!551575))

(assert (= (and b!551575 res!344359) b!551578))

(assert (= (and b!551578 res!344356) b!551580))

(declare-fun m!528585 () Bool)

(assert (=> start!50430 m!528585))

(declare-fun m!528587 () Bool)

(assert (=> start!50430 m!528587))

(declare-fun m!528589 () Bool)

(assert (=> b!551578 m!528589))

(declare-fun m!528591 () Bool)

(assert (=> b!551578 m!528591))

(declare-fun m!528593 () Bool)

(assert (=> b!551579 m!528593))

(declare-fun m!528595 () Bool)

(assert (=> b!551581 m!528595))

(assert (=> b!551581 m!528595))

(declare-fun m!528597 () Bool)

(assert (=> b!551581 m!528597))

(declare-fun m!528599 () Bool)

(assert (=> b!551582 m!528599))

(assert (=> b!551580 m!528595))

(assert (=> b!551580 m!528595))

(declare-fun m!528601 () Bool)

(assert (=> b!551580 m!528601))

(assert (=> b!551575 m!528595))

(declare-fun m!528603 () Bool)

(assert (=> b!551575 m!528603))

(assert (=> b!551575 m!528595))

(declare-fun m!528605 () Bool)

(assert (=> b!551575 m!528605))

(declare-fun m!528607 () Bool)

(assert (=> b!551575 m!528607))

(assert (=> b!551575 m!528605))

(declare-fun m!528609 () Bool)

(assert (=> b!551575 m!528609))

(assert (=> b!551575 m!528603))

(assert (=> b!551575 m!528595))

(declare-fun m!528611 () Bool)

(assert (=> b!551575 m!528611))

(declare-fun m!528613 () Bool)

(assert (=> b!551575 m!528613))

(assert (=> b!551575 m!528605))

(assert (=> b!551575 m!528607))

(declare-fun m!528615 () Bool)

(assert (=> b!551573 m!528615))

(declare-fun m!528617 () Bool)

(assert (=> b!551574 m!528617))

(declare-fun m!528619 () Bool)

(assert (=> b!551576 m!528619))

(push 1)

(assert (not b!551580))

(assert (not b!551573))

(assert (not b!551574))

(assert (not start!50430))

(assert (not b!551582))

(assert (not b!551575))

(assert (not b!551578))

(assert (not b!551581))

(assert (not b!551576))

(assert (not b!551579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83011 () Bool)

(assert (=> d!83011 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551579 d!83011))

(declare-fun d!83013 () Bool)

(assert (=> d!83013 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50430 d!83013))

(declare-fun d!83023 () Bool)

(assert (=> d!83023 (= (array_inv!12493 a!3118) (bvsge (size!17061 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50430 d!83023))

(declare-fun d!83025 () Bool)

(declare-fun res!344384 () Bool)

(declare-fun e!318355 () Bool)

(assert (=> d!83025 (=> res!344384 e!318355)))

(assert (=> d!83025 (= res!344384 (= (select (arr!16697 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83025 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!318355)))

(declare-fun b!551647 () Bool)

(declare-fun e!318356 () Bool)

(assert (=> b!551647 (= e!318355 e!318356)))

(declare-fun res!344385 () Bool)

(assert (=> b!551647 (=> (not res!344385) (not e!318356))))

(assert (=> b!551647 (= res!344385 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17061 a!3118)))))

(declare-fun b!551648 () Bool)

(assert (=> b!551648 (= e!318356 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83025 (not res!344384)) b!551647))

(assert (= (and b!551647 res!344385) b!551648))

(declare-fun m!528649 () Bool)

(assert (=> d!83025 m!528649))

(declare-fun m!528651 () Bool)

(assert (=> b!551648 m!528651))

(assert (=> b!551573 d!83025))

(declare-fun call!32298 () Bool)

(declare-fun bm!32295 () Bool)

(assert (=> bm!32295 (= call!32298 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83027 () Bool)

(declare-fun res!344407 () Bool)

(declare-fun e!318396 () Bool)

(assert (=> d!83027 (=> res!344407 e!318396)))

(assert (=> d!83027 (= res!344407 (bvsge j!142 (size!17061 a!3118)))))

(assert (=> d!83027 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318396)))

(declare-fun b!551706 () Bool)

(declare-fun e!318398 () Bool)

(assert (=> b!551706 (= e!318398 call!32298)))

(declare-fun b!551707 () Bool)

(declare-fun e!318397 () Bool)

(assert (=> b!551707 (= e!318397 call!32298)))

(declare-fun b!551708 () Bool)

(assert (=> b!551708 (= e!318396 e!318398)))

(declare-fun c!63984 () Bool)

(assert (=> b!551708 (= c!63984 (validKeyInArray!0 (select (arr!16697 a!3118) j!142)))))

(declare-fun b!551709 () Bool)

(assert (=> b!551709 (= e!318398 e!318397)))

(declare-fun lt!250912 () (_ BitVec 64))

(assert (=> b!551709 (= lt!250912 (select (arr!16697 a!3118) j!142))))

(declare-fun lt!250913 () Unit!17066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34769 (_ BitVec 64) (_ BitVec 32)) Unit!17066)

(assert (=> b!551709 (= lt!250913 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250912 j!142))))

(assert (=> b!551709 (arrayContainsKey!0 a!3118 lt!250912 #b00000000000000000000000000000000)))

(declare-fun lt!250911 () Unit!17066)

(assert (=> b!551709 (= lt!250911 lt!250913)))

(declare-fun res!344408 () Bool)

(assert (=> b!551709 (= res!344408 (= (seekEntryOrOpen!0 (select (arr!16697 a!3118) j!142) a!3118 mask!3119) (Found!5146 j!142)))))

(assert (=> b!551709 (=> (not res!344408) (not e!318397))))

(assert (= (and d!83027 (not res!344407)) b!551708))

(assert (= (and b!551708 c!63984) b!551709))

(assert (= (and b!551708 (not c!63984)) b!551706))

(assert (= (and b!551709 res!344408) b!551707))

(assert (= (or b!551707 b!551706) bm!32295))

(declare-fun m!528693 () Bool)

(assert (=> bm!32295 m!528693))

(assert (=> b!551708 m!528595))

(assert (=> b!551708 m!528595))

(assert (=> b!551708 m!528597))

(assert (=> b!551709 m!528595))

(declare-fun m!528695 () Bool)

(assert (=> b!551709 m!528695))

(declare-fun m!528697 () Bool)

(assert (=> b!551709 m!528697))

(assert (=> b!551709 m!528595))

(assert (=> b!551709 m!528601))

(assert (=> b!551578 d!83027))

(declare-fun d!83039 () Bool)

(assert (=> d!83039 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250919 () Unit!17066)

(declare-fun choose!38 (array!34769 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17066)

(assert (=> d!83039 (= lt!250919 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83039 (validMask!0 mask!3119)))

(assert (=> d!83039 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250919)))

(declare-fun bs!17183 () Bool)

(assert (= bs!17183 d!83039))

(assert (=> bs!17183 m!528589))

(declare-fun m!528701 () Bool)

(assert (=> bs!17183 m!528701))

(assert (=> bs!17183 m!528585))

(assert (=> b!551578 d!83039))

(declare-fun bm!32296 () Bool)

(declare-fun call!32299 () Bool)

(assert (=> bm!32296 (= call!32299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83043 () Bool)

(declare-fun res!344409 () Bool)

(declare-fun e!318399 () Bool)

(assert (=> d!83043 (=> res!344409 e!318399)))

(assert (=> d!83043 (= res!344409 (bvsge #b00000000000000000000000000000000 (size!17061 a!3118)))))

(assert (=> d!83043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318399)))

(declare-fun b!551710 () Bool)

(declare-fun e!318401 () Bool)

(assert (=> b!551710 (= e!318401 call!32299)))

(declare-fun b!551711 () Bool)

(declare-fun e!318400 () Bool)

(assert (=> b!551711 (= e!318400 call!32299)))

(declare-fun b!551712 () Bool)

(assert (=> b!551712 (= e!318399 e!318401)))

(declare-fun c!63985 () Bool)

(assert (=> b!551712 (= c!63985 (validKeyInArray!0 (select (arr!16697 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551713 () Bool)

(assert (=> b!551713 (= e!318401 e!318400)))

(declare-fun lt!250921 () (_ BitVec 64))

(assert (=> b!551713 (= lt!250921 (select (arr!16697 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250922 () Unit!17066)

(assert (=> b!551713 (= lt!250922 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250921 #b00000000000000000000000000000000))))

(assert (=> b!551713 (arrayContainsKey!0 a!3118 lt!250921 #b00000000000000000000000000000000)))

(declare-fun lt!250920 () Unit!17066)

(assert (=> b!551713 (= lt!250920 lt!250922)))

(declare-fun res!344410 () Bool)

(assert (=> b!551713 (= res!344410 (= (seekEntryOrOpen!0 (select (arr!16697 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5146 #b00000000000000000000000000000000)))))

(assert (=> b!551713 (=> (not res!344410) (not e!318400))))

(assert (= (and d!83043 (not res!344409)) b!551712))

(assert (= (and b!551712 c!63985) b!551713))

(assert (= (and b!551712 (not c!63985)) b!551710))

(assert (= (and b!551713 res!344410) b!551711))

(assert (= (or b!551711 b!551710) bm!32296))

(declare-fun m!528703 () Bool)

(assert (=> bm!32296 m!528703))

(assert (=> b!551712 m!528649))

(assert (=> b!551712 m!528649))

(declare-fun m!528705 () Bool)

(assert (=> b!551712 m!528705))

(assert (=> b!551713 m!528649))

(declare-fun m!528707 () Bool)

(assert (=> b!551713 m!528707))

(declare-fun m!528709 () Bool)

(assert (=> b!551713 m!528709))

(assert (=> b!551713 m!528649))

(declare-fun m!528711 () Bool)

(assert (=> b!551713 m!528711))

(assert (=> b!551582 d!83043))

(declare-fun b!551753 () Bool)

(declare-fun e!318431 () Bool)

(declare-fun e!318434 () Bool)

(assert (=> b!551753 (= e!318431 e!318434)))

(declare-fun res!344430 () Bool)

(assert (=> b!551753 (=> (not res!344430) (not e!318434))))

(declare-fun e!318433 () Bool)

(assert (=> b!551753 (= res!344430 (not e!318433))))

(declare-fun res!344431 () Bool)

(assert (=> b!551753 (=> (not res!344431) (not e!318433))))

(assert (=> b!551753 (= res!344431 (validKeyInArray!0 (select (arr!16697 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32304 () Bool)

(declare-fun call!32307 () Bool)

(declare-fun c!63996 () Bool)

(assert (=> bm!32304 (= call!32307 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63996 (Cons!10773 (select (arr!16697 a!3118) #b00000000000000000000000000000000) Nil!10774) Nil!10774)))))

(declare-fun b!551754 () Bool)

(declare-fun contains!2841 (List!10777 (_ BitVec 64)) Bool)

(assert (=> b!551754 (= e!318433 (contains!2841 Nil!10774 (select (arr!16697 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551755 () Bool)

(declare-fun e!318432 () Bool)

(assert (=> b!551755 (= e!318432 call!32307)))

(declare-fun b!551756 () Bool)

(assert (=> b!551756 (= e!318432 call!32307)))

(declare-fun b!551757 () Bool)

(assert (=> b!551757 (= e!318434 e!318432)))

(assert (=> b!551757 (= c!63996 (validKeyInArray!0 (select (arr!16697 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83045 () Bool)

(declare-fun res!344432 () Bool)

(assert (=> d!83045 (=> res!344432 e!318431)))

(assert (=> d!83045 (= res!344432 (bvsge #b00000000000000000000000000000000 (size!17061 a!3118)))))

(assert (=> d!83045 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10774) e!318431)))

(assert (= (and d!83045 (not res!344432)) b!551753))

(assert (= (and b!551753 res!344431) b!551754))

(assert (= (and b!551753 res!344430) b!551757))

(assert (= (and b!551757 c!63996) b!551756))

(assert (= (and b!551757 (not c!63996)) b!551755))

(assert (= (or b!551756 b!551755) bm!32304))

(assert (=> b!551753 m!528649))

(assert (=> b!551753 m!528649))

(assert (=> b!551753 m!528705))

(assert (=> bm!32304 m!528649))

(declare-fun m!528731 () Bool)

(assert (=> bm!32304 m!528731))

(assert (=> b!551754 m!528649))

(assert (=> b!551754 m!528649))

(declare-fun m!528733 () Bool)

(assert (=> b!551754 m!528733))

(assert (=> b!551757 m!528649))

(assert (=> b!551757 m!528649))

(assert (=> b!551757 m!528705))

(assert (=> b!551576 d!83045))

(declare-fun d!83059 () Bool)

(assert (=> d!83059 (= (validKeyInArray!0 (select (arr!16697 a!3118) j!142)) (and (not (= (select (arr!16697 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16697 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551581 d!83059))

(declare-fun b!551811 () Bool)

(declare-fun lt!250952 () SeekEntryResult!5146)

(assert (=> b!551811 (and (bvsge (index!22813 lt!250952) #b00000000000000000000000000000000) (bvslt (index!22813 lt!250952) (size!17061 a!3118)))))

(declare-fun res!344454 () Bool)

(assert (=> b!551811 (= res!344454 (= (select (arr!16697 a!3118) (index!22813 lt!250952)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318470 () Bool)

(assert (=> b!551811 (=> res!344454 e!318470)))

(declare-fun b!551812 () Bool)

(assert (=> b!551812 (and (bvsge (index!22813 lt!250952) #b00000000000000000000000000000000) (bvslt (index!22813 lt!250952) (size!17061 a!3118)))))

(assert (=> b!551812 (= e!318470 (= (select (arr!16697 a!3118) (index!22813 lt!250952)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318466 () SeekEntryResult!5146)

(declare-fun b!551813 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551813 (= e!318466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16697 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!551814 () Bool)

(assert (=> b!551814 (= e!318466 (Intermediate!5146 false (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun e!318468 () SeekEntryResult!5146)

(declare-fun b!551815 () Bool)

(assert (=> b!551815 (= e!318468 (Intermediate!5146 true (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551816 () Bool)

(declare-fun e!318467 () Bool)

(declare-fun e!318469 () Bool)

(assert (=> b!551816 (= e!318467 e!318469)))

(declare-fun res!344453 () Bool)

(assert (=> b!551816 (= res!344453 (and (is-Intermediate!5146 lt!250952) (not (undefined!5958 lt!250952)) (bvslt (x!51736 lt!250952) #b01111111111111111111111111111110) (bvsge (x!51736 lt!250952) #b00000000000000000000000000000000) (bvsge (x!51736 lt!250952) #b00000000000000000000000000000000)))))

(assert (=> b!551816 (=> (not res!344453) (not e!318469))))

(declare-fun d!83061 () Bool)

(assert (=> d!83061 e!318467))

(declare-fun c!64016 () Bool)

(assert (=> d!83061 (= c!64016 (and (is-Intermediate!5146 lt!250952) (undefined!5958 lt!250952)))))

(assert (=> d!83061 (= lt!250952 e!318468)))

(declare-fun c!64014 () Bool)

(assert (=> d!83061 (= c!64014 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!250951 () (_ BitVec 64))

(assert (=> d!83061 (= lt!250951 (select (arr!16697 a!3118) (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119)))))

(assert (=> d!83061 (validMask!0 mask!3119)))

(assert (=> d!83061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16697 a!3118) j!142) mask!3119) (select (arr!16697 a!3118) j!142) a!3118 mask!3119) lt!250952)))

(declare-fun b!551817 () Bool)

(assert (=> b!551817 (and (bvsge (index!22813 lt!250952) #b00000000000000000000000000000000) (bvslt (index!22813 lt!250952) (size!17061 a!3118)))))

(declare-fun res!344452 () Bool)

(assert (=> b!551817 (= res!344452 (= (select (arr!16697 a!3118) (index!22813 lt!250952)) (select (arr!16697 a!3118) j!142)))))

(assert (=> b!551817 (=> res!344452 e!318470)))

(assert (=> b!551817 (= e!318469 e!318470)))

(declare-fun b!551818 () Bool)

(assert (=> b!551818 (= e!318468 e!318466)))

(declare-fun c!64015 () Bool)

(assert (=> b!551818 (= c!64015 (or (= lt!250951 (select (arr!16697 a!3118) j!142)) (= (bvadd lt!250951 lt!250951) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551819 () Bool)

(assert (=> b!551819 (= e!318467 (bvsge (x!51736 lt!250952) #b01111111111111111111111111111110))))

(assert (= (and d!83061 c!64014) b!551815))

(assert (= (and d!83061 (not c!64014)) b!551818))

(assert (= (and b!551818 c!64015) b!551814))

(assert (= (and b!551818 (not c!64015)) b!551813))

