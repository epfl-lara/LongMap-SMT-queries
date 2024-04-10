; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51628 () Bool)

(assert start!51628)

(declare-fun b!565027 () Bool)

(declare-fun res!356183 () Bool)

(declare-fun e!325327 () Bool)

(assert (=> b!565027 (=> (not res!356183) (not e!325327))))

(declare-datatypes ((array!35493 0))(
  ( (array!35494 (arr!17047 (Array (_ BitVec 32) (_ BitVec 64))) (size!17411 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35493)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!565027 (= res!356183 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!565028 () Bool)

(declare-fun e!325328 () Bool)

(assert (=> b!565028 (= e!325327 e!325328)))

(declare-fun res!356186 () Bool)

(assert (=> b!565028 (=> (not res!356186) (not e!325328))))

(declare-datatypes ((SeekEntryResult!5496 0))(
  ( (MissingZero!5496 (index!24211 (_ BitVec 32))) (Found!5496 (index!24212 (_ BitVec 32))) (Intermediate!5496 (undefined!6308 Bool) (index!24213 (_ BitVec 32)) (x!53079 (_ BitVec 32))) (Undefined!5496) (MissingVacant!5496 (index!24214 (_ BitVec 32))) )
))
(declare-fun lt!257733 () SeekEntryResult!5496)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!565028 (= res!356186 (or (= lt!257733 (MissingZero!5496 i!1132)) (= lt!257733 (MissingVacant!5496 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35493 (_ BitVec 32)) SeekEntryResult!5496)

(assert (=> b!565028 (= lt!257733 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!565029 () Bool)

(declare-fun res!356178 () Bool)

(assert (=> b!565029 (=> (not res!356178) (not e!325328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35493 (_ BitVec 32)) Bool)

(assert (=> b!565029 (= res!356178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!565030 () Bool)

(declare-fun res!356184 () Bool)

(assert (=> b!565030 (=> (not res!356184) (not e!325328))))

(declare-datatypes ((List!11127 0))(
  ( (Nil!11124) (Cons!11123 (h!12126 (_ BitVec 64)) (t!17355 List!11127)) )
))
(declare-fun arrayNoDuplicates!0 (array!35493 (_ BitVec 32) List!11127) Bool)

(assert (=> b!565030 (= res!356184 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11124))))

(declare-fun b!565031 () Bool)

(declare-fun res!356182 () Bool)

(assert (=> b!565031 (=> (not res!356182) (not e!325327))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!565031 (= res!356182 (and (= (size!17411 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17411 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17411 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!565032 () Bool)

(declare-fun res!356180 () Bool)

(assert (=> b!565032 (=> (not res!356180) (not e!325328))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35493 (_ BitVec 32)) SeekEntryResult!5496)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565032 (= res!356180 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) (select (arr!17047 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)) mask!3119)))))

(declare-fun b!565026 () Bool)

(declare-fun res!356181 () Bool)

(assert (=> b!565026 (=> (not res!356181) (not e!325327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!565026 (= res!356181 (validKeyInArray!0 (select (arr!17047 a!3118) j!142)))))

(declare-fun res!356179 () Bool)

(assert (=> start!51628 (=> (not res!356179) (not e!325327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51628 (= res!356179 (validMask!0 mask!3119))))

(assert (=> start!51628 e!325327))

(assert (=> start!51628 true))

(declare-fun array_inv!12843 (array!35493) Bool)

(assert (=> start!51628 (array_inv!12843 a!3118)))

(declare-fun b!565033 () Bool)

(assert (=> b!565033 (= e!325328 (not (= (seekEntryOrOpen!0 (select (arr!17047 a!3118) j!142) a!3118 mask!3119) (Found!5496 j!142))))))

(assert (=> b!565033 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17694 0))(
  ( (Unit!17695) )
))
(declare-fun lt!257734 () Unit!17694)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17694)

(assert (=> b!565033 (= lt!257734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!565034 () Bool)

(declare-fun res!356185 () Bool)

(assert (=> b!565034 (=> (not res!356185) (not e!325327))))

(assert (=> b!565034 (= res!356185 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51628 res!356179) b!565031))

(assert (= (and b!565031 res!356182) b!565026))

(assert (= (and b!565026 res!356181) b!565034))

(assert (= (and b!565034 res!356185) b!565027))

(assert (= (and b!565027 res!356183) b!565028))

(assert (= (and b!565028 res!356186) b!565029))

(assert (= (and b!565029 res!356178) b!565030))

(assert (= (and b!565030 res!356184) b!565032))

(assert (= (and b!565032 res!356180) b!565033))

(declare-fun m!543549 () Bool)

(assert (=> b!565029 m!543549))

(declare-fun m!543551 () Bool)

(assert (=> b!565027 m!543551))

(declare-fun m!543553 () Bool)

(assert (=> b!565028 m!543553))

(declare-fun m!543555 () Bool)

(assert (=> b!565032 m!543555))

(declare-fun m!543557 () Bool)

(assert (=> b!565032 m!543557))

(assert (=> b!565032 m!543555))

(declare-fun m!543559 () Bool)

(assert (=> b!565032 m!543559))

(declare-fun m!543561 () Bool)

(assert (=> b!565032 m!543561))

(assert (=> b!565032 m!543559))

(declare-fun m!543563 () Bool)

(assert (=> b!565032 m!543563))

(assert (=> b!565032 m!543557))

(assert (=> b!565032 m!543555))

(declare-fun m!543565 () Bool)

(assert (=> b!565032 m!543565))

(declare-fun m!543567 () Bool)

(assert (=> b!565032 m!543567))

(assert (=> b!565032 m!543559))

(assert (=> b!565032 m!543561))

(assert (=> b!565026 m!543555))

(assert (=> b!565026 m!543555))

(declare-fun m!543569 () Bool)

(assert (=> b!565026 m!543569))

(declare-fun m!543571 () Bool)

(assert (=> start!51628 m!543571))

(declare-fun m!543573 () Bool)

(assert (=> start!51628 m!543573))

(assert (=> b!565033 m!543555))

(assert (=> b!565033 m!543555))

(declare-fun m!543575 () Bool)

(assert (=> b!565033 m!543575))

(declare-fun m!543577 () Bool)

(assert (=> b!565033 m!543577))

(declare-fun m!543579 () Bool)

(assert (=> b!565033 m!543579))

(declare-fun m!543581 () Bool)

(assert (=> b!565030 m!543581))

(declare-fun m!543583 () Bool)

(assert (=> b!565034 m!543583))

(check-sat (not b!565027) (not b!565033) (not b!565032) (not b!565034) (not start!51628) (not b!565028) (not b!565026) (not b!565030) (not b!565029))
(check-sat)
(get-model)

(declare-fun b!565082 () Bool)

(declare-fun e!325351 () SeekEntryResult!5496)

(declare-fun lt!257753 () SeekEntryResult!5496)

(assert (=> b!565082 (= e!325351 (Found!5496 (index!24213 lt!257753)))))

(declare-fun b!565083 () Bool)

(declare-fun c!64779 () Bool)

(declare-fun lt!257754 () (_ BitVec 64))

(assert (=> b!565083 (= c!64779 (= lt!257754 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!325352 () SeekEntryResult!5496)

(assert (=> b!565083 (= e!325351 e!325352)))

(declare-fun b!565084 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35493 (_ BitVec 32)) SeekEntryResult!5496)

(assert (=> b!565084 (= e!325352 (seekKeyOrZeroReturnVacant!0 (x!53079 lt!257753) (index!24213 lt!257753) (index!24213 lt!257753) k0!1914 a!3118 mask!3119))))

(declare-fun b!565085 () Bool)

(declare-fun e!325353 () SeekEntryResult!5496)

(assert (=> b!565085 (= e!325353 e!325351)))

(assert (=> b!565085 (= lt!257754 (select (arr!17047 a!3118) (index!24213 lt!257753)))))

(declare-fun c!64778 () Bool)

(assert (=> b!565085 (= c!64778 (= lt!257754 k0!1914))))

(declare-fun d!83977 () Bool)

(declare-fun lt!257755 () SeekEntryResult!5496)

(get-info :version)

(assert (=> d!83977 (and (or ((_ is Undefined!5496) lt!257755) (not ((_ is Found!5496) lt!257755)) (and (bvsge (index!24212 lt!257755) #b00000000000000000000000000000000) (bvslt (index!24212 lt!257755) (size!17411 a!3118)))) (or ((_ is Undefined!5496) lt!257755) ((_ is Found!5496) lt!257755) (not ((_ is MissingZero!5496) lt!257755)) (and (bvsge (index!24211 lt!257755) #b00000000000000000000000000000000) (bvslt (index!24211 lt!257755) (size!17411 a!3118)))) (or ((_ is Undefined!5496) lt!257755) ((_ is Found!5496) lt!257755) ((_ is MissingZero!5496) lt!257755) (not ((_ is MissingVacant!5496) lt!257755)) (and (bvsge (index!24214 lt!257755) #b00000000000000000000000000000000) (bvslt (index!24214 lt!257755) (size!17411 a!3118)))) (or ((_ is Undefined!5496) lt!257755) (ite ((_ is Found!5496) lt!257755) (= (select (arr!17047 a!3118) (index!24212 lt!257755)) k0!1914) (ite ((_ is MissingZero!5496) lt!257755) (= (select (arr!17047 a!3118) (index!24211 lt!257755)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5496) lt!257755) (= (select (arr!17047 a!3118) (index!24214 lt!257755)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83977 (= lt!257755 e!325353)))

(declare-fun c!64780 () Bool)

(assert (=> d!83977 (= c!64780 (and ((_ is Intermediate!5496) lt!257753) (undefined!6308 lt!257753)))))

(assert (=> d!83977 (= lt!257753 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83977 (validMask!0 mask!3119)))

(assert (=> d!83977 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!257755)))

(declare-fun b!565086 () Bool)

(assert (=> b!565086 (= e!325353 Undefined!5496)))

(declare-fun b!565087 () Bool)

(assert (=> b!565087 (= e!325352 (MissingZero!5496 (index!24213 lt!257753)))))

(assert (= (and d!83977 c!64780) b!565086))

(assert (= (and d!83977 (not c!64780)) b!565085))

(assert (= (and b!565085 c!64778) b!565082))

(assert (= (and b!565085 (not c!64778)) b!565083))

(assert (= (and b!565083 c!64779) b!565087))

(assert (= (and b!565083 (not c!64779)) b!565084))

(declare-fun m!543621 () Bool)

(assert (=> b!565084 m!543621))

(declare-fun m!543623 () Bool)

(assert (=> b!565085 m!543623))

(declare-fun m!543625 () Bool)

(assert (=> d!83977 m!543625))

(declare-fun m!543627 () Bool)

(assert (=> d!83977 m!543627))

(declare-fun m!543629 () Bool)

(assert (=> d!83977 m!543629))

(assert (=> d!83977 m!543571))

(declare-fun m!543631 () Bool)

(assert (=> d!83977 m!543631))

(assert (=> d!83977 m!543625))

(declare-fun m!543633 () Bool)

(assert (=> d!83977 m!543633))

(assert (=> b!565028 d!83977))

(declare-fun bm!32459 () Bool)

(declare-fun call!32462 () Bool)

(assert (=> bm!32459 (= call!32462 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83983 () Bool)

(declare-fun res!356224 () Bool)

(declare-fun e!325369 () Bool)

(assert (=> d!83983 (=> res!356224 e!325369)))

(assert (=> d!83983 (= res!356224 (bvsge #b00000000000000000000000000000000 (size!17411 a!3118)))))

(assert (=> d!83983 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!325369)))

(declare-fun b!565108 () Bool)

(declare-fun e!325368 () Bool)

(assert (=> b!565108 (= e!325368 call!32462)))

(declare-fun b!565109 () Bool)

(declare-fun e!325367 () Bool)

(assert (=> b!565109 (= e!325367 e!325368)))

(declare-fun lt!257771 () (_ BitVec 64))

(assert (=> b!565109 (= lt!257771 (select (arr!17047 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!257772 () Unit!17694)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35493 (_ BitVec 64) (_ BitVec 32)) Unit!17694)

(assert (=> b!565109 (= lt!257772 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257771 #b00000000000000000000000000000000))))

(assert (=> b!565109 (arrayContainsKey!0 a!3118 lt!257771 #b00000000000000000000000000000000)))

(declare-fun lt!257773 () Unit!17694)

(assert (=> b!565109 (= lt!257773 lt!257772)))

(declare-fun res!356225 () Bool)

(assert (=> b!565109 (= res!356225 (= (seekEntryOrOpen!0 (select (arr!17047 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5496 #b00000000000000000000000000000000)))))

(assert (=> b!565109 (=> (not res!356225) (not e!325368))))

(declare-fun b!565110 () Bool)

(assert (=> b!565110 (= e!325369 e!325367)))

(declare-fun c!64788 () Bool)

(assert (=> b!565110 (= c!64788 (validKeyInArray!0 (select (arr!17047 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565111 () Bool)

(assert (=> b!565111 (= e!325367 call!32462)))

(assert (= (and d!83983 (not res!356224)) b!565110))

(assert (= (and b!565110 c!64788) b!565109))

(assert (= (and b!565110 (not c!64788)) b!565111))

(assert (= (and b!565109 res!356225) b!565108))

(assert (= (or b!565108 b!565111) bm!32459))

(declare-fun m!543647 () Bool)

(assert (=> bm!32459 m!543647))

(declare-fun m!543649 () Bool)

(assert (=> b!565109 m!543649))

(declare-fun m!543651 () Bool)

(assert (=> b!565109 m!543651))

(declare-fun m!543653 () Bool)

(assert (=> b!565109 m!543653))

(assert (=> b!565109 m!543649))

(declare-fun m!543655 () Bool)

(assert (=> b!565109 m!543655))

(assert (=> b!565110 m!543649))

(assert (=> b!565110 m!543649))

(declare-fun m!543657 () Bool)

(assert (=> b!565110 m!543657))

(assert (=> b!565029 d!83983))

(declare-fun d!83989 () Bool)

(assert (=> d!83989 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51628 d!83989))

(declare-fun d!83995 () Bool)

(assert (=> d!83995 (= (array_inv!12843 a!3118) (bvsge (size!17411 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51628 d!83995))

(declare-fun d!83997 () Bool)

(assert (=> d!83997 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565034 d!83997))

(declare-fun b!565177 () Bool)

(declare-fun e!325413 () Bool)

(declare-fun e!325411 () Bool)

(assert (=> b!565177 (= e!325413 e!325411)))

(declare-fun c!64811 () Bool)

(assert (=> b!565177 (= c!64811 (validKeyInArray!0 (select (arr!17047 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565178 () Bool)

(declare-fun e!325410 () Bool)

(declare-fun contains!2862 (List!11127 (_ BitVec 64)) Bool)

(assert (=> b!565178 (= e!325410 (contains!2862 Nil!11124 (select (arr!17047 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83999 () Bool)

(declare-fun res!356248 () Bool)

(declare-fun e!325412 () Bool)

(assert (=> d!83999 (=> res!356248 e!325412)))

(assert (=> d!83999 (= res!356248 (bvsge #b00000000000000000000000000000000 (size!17411 a!3118)))))

(assert (=> d!83999 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11124) e!325412)))

(declare-fun b!565179 () Bool)

(assert (=> b!565179 (= e!325412 e!325413)))

(declare-fun res!356250 () Bool)

(assert (=> b!565179 (=> (not res!356250) (not e!325413))))

(assert (=> b!565179 (= res!356250 (not e!325410))))

(declare-fun res!356249 () Bool)

(assert (=> b!565179 (=> (not res!356249) (not e!325410))))

(assert (=> b!565179 (= res!356249 (validKeyInArray!0 (select (arr!17047 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!565180 () Bool)

(declare-fun call!32468 () Bool)

(assert (=> b!565180 (= e!325411 call!32468)))

(declare-fun b!565181 () Bool)

(assert (=> b!565181 (= e!325411 call!32468)))

(declare-fun bm!32465 () Bool)

(assert (=> bm!32465 (= call!32468 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64811 (Cons!11123 (select (arr!17047 a!3118) #b00000000000000000000000000000000) Nil!11124) Nil!11124)))))

(assert (= (and d!83999 (not res!356248)) b!565179))

(assert (= (and b!565179 res!356249) b!565178))

(assert (= (and b!565179 res!356250) b!565177))

(assert (= (and b!565177 c!64811) b!565181))

(assert (= (and b!565177 (not c!64811)) b!565180))

(assert (= (or b!565181 b!565180) bm!32465))

(assert (=> b!565177 m!543649))

(assert (=> b!565177 m!543649))

(assert (=> b!565177 m!543657))

(assert (=> b!565178 m!543649))

(assert (=> b!565178 m!543649))

(declare-fun m!543697 () Bool)

(assert (=> b!565178 m!543697))

(assert (=> b!565179 m!543649))

(assert (=> b!565179 m!543649))

(assert (=> b!565179 m!543657))

(assert (=> bm!32465 m!543649))

(declare-fun m!543699 () Bool)

(assert (=> bm!32465 m!543699))

(assert (=> b!565030 d!83999))

(declare-fun d!84007 () Bool)

(assert (=> d!84007 (= (validKeyInArray!0 (select (arr!17047 a!3118) j!142)) (and (not (= (select (arr!17047 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17047 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!565026 d!84007))

(declare-fun d!84009 () Bool)

(declare-fun res!356258 () Bool)

(declare-fun e!325423 () Bool)

(assert (=> d!84009 (=> res!356258 e!325423)))

(assert (=> d!84009 (= res!356258 (= (select (arr!17047 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!84009 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!325423)))

(declare-fun b!565195 () Bool)

(declare-fun e!325424 () Bool)

(assert (=> b!565195 (= e!325423 e!325424)))

(declare-fun res!356259 () Bool)

(assert (=> b!565195 (=> (not res!356259) (not e!325424))))

(assert (=> b!565195 (= res!356259 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17411 a!3118)))))

(declare-fun b!565196 () Bool)

(assert (=> b!565196 (= e!325424 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84009 (not res!356258)) b!565195))

(assert (= (and b!565195 res!356259) b!565196))

(assert (=> d!84009 m!543649))

(declare-fun m!543711 () Bool)

(assert (=> b!565196 m!543711))

(assert (=> b!565027 d!84009))

(declare-fun e!325461 () SeekEntryResult!5496)

(declare-fun b!565260 () Bool)

(assert (=> b!565260 (= e!325461 (Intermediate!5496 true (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565261 () Bool)

(declare-fun e!325462 () SeekEntryResult!5496)

(assert (=> b!565261 (= e!325461 e!325462)))

(declare-fun c!64840 () Bool)

(declare-fun lt!257827 () (_ BitVec 64))

(assert (=> b!565261 (= c!64840 (or (= lt!257827 (select (arr!17047 a!3118) j!142)) (= (bvadd lt!257827 lt!257827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565262 () Bool)

(declare-fun lt!257828 () SeekEntryResult!5496)

(assert (=> b!565262 (and (bvsge (index!24213 lt!257828) #b00000000000000000000000000000000) (bvslt (index!24213 lt!257828) (size!17411 a!3118)))))

(declare-fun res!356276 () Bool)

(assert (=> b!565262 (= res!356276 (= (select (arr!17047 a!3118) (index!24213 lt!257828)) (select (arr!17047 a!3118) j!142)))))

(declare-fun e!325460 () Bool)

(assert (=> b!565262 (=> res!356276 e!325460)))

(declare-fun e!325459 () Bool)

(assert (=> b!565262 (= e!325459 e!325460)))

(declare-fun b!565263 () Bool)

(assert (=> b!565263 (and (bvsge (index!24213 lt!257828) #b00000000000000000000000000000000) (bvslt (index!24213 lt!257828) (size!17411 a!3118)))))

(assert (=> b!565263 (= e!325460 (= (select (arr!17047 a!3118) (index!24213 lt!257828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!565264 () Bool)

(declare-fun e!325463 () Bool)

(assert (=> b!565264 (= e!325463 (bvsge (x!53079 lt!257828) #b01111111111111111111111111111110))))

(declare-fun d!84021 () Bool)

(assert (=> d!84021 e!325463))

(declare-fun c!64841 () Bool)

(assert (=> d!84021 (= c!64841 (and ((_ is Intermediate!5496) lt!257828) (undefined!6308 lt!257828)))))

(assert (=> d!84021 (= lt!257828 e!325461)))

(declare-fun c!64839 () Bool)

(assert (=> d!84021 (= c!64839 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84021 (= lt!257827 (select (arr!17047 a!3118) (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119)))))

(assert (=> d!84021 (validMask!0 mask!3119)))

(assert (=> d!84021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) (select (arr!17047 a!3118) j!142) a!3118 mask!3119) lt!257828)))

(declare-fun b!565265 () Bool)

(assert (=> b!565265 (= e!325462 (Intermediate!5496 false (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565266 () Bool)

(assert (=> b!565266 (and (bvsge (index!24213 lt!257828) #b00000000000000000000000000000000) (bvslt (index!24213 lt!257828) (size!17411 a!3118)))))

(declare-fun res!356277 () Bool)

(assert (=> b!565266 (= res!356277 (= (select (arr!17047 a!3118) (index!24213 lt!257828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565266 (=> res!356277 e!325460)))

(declare-fun b!565267 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!565267 (= e!325462 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!17047 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565268 () Bool)

(assert (=> b!565268 (= e!325463 e!325459)))

(declare-fun res!356275 () Bool)

(assert (=> b!565268 (= res!356275 (and ((_ is Intermediate!5496) lt!257828) (not (undefined!6308 lt!257828)) (bvslt (x!53079 lt!257828) #b01111111111111111111111111111110) (bvsge (x!53079 lt!257828) #b00000000000000000000000000000000) (bvsge (x!53079 lt!257828) #b00000000000000000000000000000000)))))

(assert (=> b!565268 (=> (not res!356275) (not e!325459))))

(assert (= (and d!84021 c!64839) b!565260))

(assert (= (and d!84021 (not c!64839)) b!565261))

(assert (= (and b!565261 c!64840) b!565265))

(assert (= (and b!565261 (not c!64840)) b!565267))

(assert (= (and d!84021 c!64841) b!565264))

(assert (= (and d!84021 (not c!64841)) b!565268))

(assert (= (and b!565268 res!356275) b!565262))

(assert (= (and b!565262 (not res!356276)) b!565266))

(assert (= (and b!565266 (not res!356277)) b!565263))

(declare-fun m!543735 () Bool)

(assert (=> b!565266 m!543735))

(assert (=> b!565263 m!543735))

(assert (=> d!84021 m!543557))

(declare-fun m!543737 () Bool)

(assert (=> d!84021 m!543737))

(assert (=> d!84021 m!543571))

(assert (=> b!565267 m!543557))

(declare-fun m!543739 () Bool)

(assert (=> b!565267 m!543739))

(assert (=> b!565267 m!543739))

(assert (=> b!565267 m!543555))

(declare-fun m!543741 () Bool)

(assert (=> b!565267 m!543741))

(assert (=> b!565262 m!543735))

(assert (=> b!565032 d!84021))

(declare-fun d!84027 () Bool)

(declare-fun lt!257842 () (_ BitVec 32))

(declare-fun lt!257841 () (_ BitVec 32))

(assert (=> d!84027 (= lt!257842 (bvmul (bvxor lt!257841 (bvlshr lt!257841 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84027 (= lt!257841 ((_ extract 31 0) (bvand (bvxor (select (arr!17047 a!3118) j!142) (bvlshr (select (arr!17047 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84027 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356279 (let ((h!12130 ((_ extract 31 0) (bvand (bvxor (select (arr!17047 a!3118) j!142) (bvlshr (select (arr!17047 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53086 (bvmul (bvxor h!12130 (bvlshr h!12130 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53086 (bvlshr x!53086 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356279 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356279 #b00000000000000000000000000000000))))))

(assert (=> d!84027 (= (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) (bvand (bvxor lt!257842 (bvlshr lt!257842 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565032 d!84027))

(declare-fun e!325483 () SeekEntryResult!5496)

(declare-fun b!565293 () Bool)

(assert (=> b!565293 (= e!325483 (Intermediate!5496 true (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565294 () Bool)

(declare-fun e!325484 () SeekEntryResult!5496)

(assert (=> b!565294 (= e!325483 e!325484)))

(declare-fun lt!257843 () (_ BitVec 64))

(declare-fun c!64849 () Bool)

(assert (=> b!565294 (= c!64849 (or (= lt!257843 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!257843 lt!257843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!565295 () Bool)

(declare-fun lt!257844 () SeekEntryResult!5496)

(assert (=> b!565295 (and (bvsge (index!24213 lt!257844) #b00000000000000000000000000000000) (bvslt (index!24213 lt!257844) (size!17411 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)))))))

(declare-fun res!356293 () Bool)

(assert (=> b!565295 (= res!356293 (= (select (arr!17047 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118))) (index!24213 lt!257844)) (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun e!325482 () Bool)

(assert (=> b!565295 (=> res!356293 e!325482)))

(declare-fun e!325481 () Bool)

(assert (=> b!565295 (= e!325481 e!325482)))

(declare-fun b!565296 () Bool)

(assert (=> b!565296 (and (bvsge (index!24213 lt!257844) #b00000000000000000000000000000000) (bvslt (index!24213 lt!257844) (size!17411 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)))))))

(assert (=> b!565296 (= e!325482 (= (select (arr!17047 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118))) (index!24213 lt!257844)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!565297 () Bool)

(declare-fun e!325485 () Bool)

(assert (=> b!565297 (= e!325485 (bvsge (x!53079 lt!257844) #b01111111111111111111111111111110))))

(declare-fun d!84031 () Bool)

(assert (=> d!84031 e!325485))

(declare-fun c!64850 () Bool)

(assert (=> d!84031 (= c!64850 (and ((_ is Intermediate!5496) lt!257844) (undefined!6308 lt!257844)))))

(assert (=> d!84031 (= lt!257844 e!325483)))

(declare-fun c!64848 () Bool)

(assert (=> d!84031 (= c!64848 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84031 (= lt!257843 (select (arr!17047 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118))) (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119)))))

(assert (=> d!84031 (validMask!0 mask!3119)))

(assert (=> d!84031 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)) mask!3119) lt!257844)))

(declare-fun b!565298 () Bool)

(assert (=> b!565298 (= e!325484 (Intermediate!5496 false (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!565299 () Bool)

(assert (=> b!565299 (and (bvsge (index!24213 lt!257844) #b00000000000000000000000000000000) (bvslt (index!24213 lt!257844) (size!17411 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)))))))

(declare-fun res!356294 () Bool)

(assert (=> b!565299 (= res!356294 (= (select (arr!17047 (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118))) (index!24213 lt!257844)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!565299 (=> res!356294 e!325482)))

(declare-fun b!565300 () Bool)

(assert (=> b!565300 (= e!325484 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) (array!35494 (store (arr!17047 a!3118) i!1132 k0!1914) (size!17411 a!3118)) mask!3119))))

(declare-fun b!565301 () Bool)

(assert (=> b!565301 (= e!325485 e!325481)))

(declare-fun res!356292 () Bool)

(assert (=> b!565301 (= res!356292 (and ((_ is Intermediate!5496) lt!257844) (not (undefined!6308 lt!257844)) (bvslt (x!53079 lt!257844) #b01111111111111111111111111111110) (bvsge (x!53079 lt!257844) #b00000000000000000000000000000000) (bvsge (x!53079 lt!257844) #b00000000000000000000000000000000)))))

(assert (=> b!565301 (=> (not res!356292) (not e!325481))))

(assert (= (and d!84031 c!64848) b!565293))

(assert (= (and d!84031 (not c!64848)) b!565294))

(assert (= (and b!565294 c!64849) b!565298))

(assert (= (and b!565294 (not c!64849)) b!565300))

(assert (= (and d!84031 c!64850) b!565297))

(assert (= (and d!84031 (not c!64850)) b!565301))

(assert (= (and b!565301 res!356292) b!565295))

(assert (= (and b!565295 (not res!356293)) b!565299))

(assert (= (and b!565299 (not res!356294)) b!565296))

(declare-fun m!543755 () Bool)

(assert (=> b!565299 m!543755))

(assert (=> b!565296 m!543755))

(assert (=> d!84031 m!543561))

(declare-fun m!543757 () Bool)

(assert (=> d!84031 m!543757))

(assert (=> d!84031 m!543571))

(assert (=> b!565300 m!543561))

(declare-fun m!543759 () Bool)

(assert (=> b!565300 m!543759))

(assert (=> b!565300 m!543759))

(assert (=> b!565300 m!543559))

(declare-fun m!543761 () Bool)

(assert (=> b!565300 m!543761))

(assert (=> b!565295 m!543755))

(assert (=> b!565032 d!84031))

(declare-fun d!84039 () Bool)

(declare-fun lt!257851 () (_ BitVec 32))

(declare-fun lt!257850 () (_ BitVec 32))

(assert (=> d!84039 (= lt!257851 (bvmul (bvxor lt!257850 (bvlshr lt!257850 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84039 (= lt!257850 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84039 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!356279 (let ((h!12130 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53086 (bvmul (bvxor h!12130 (bvlshr h!12130 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53086 (bvlshr x!53086 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!356279 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!356279 #b00000000000000000000000000000000))))))

(assert (=> d!84039 (= (toIndex!0 (select (store (arr!17047 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!257851 (bvlshr lt!257851 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!565032 d!84039))

(declare-fun b!565308 () Bool)

(declare-fun e!325491 () SeekEntryResult!5496)

(declare-fun lt!257852 () SeekEntryResult!5496)

(assert (=> b!565308 (= e!325491 (Found!5496 (index!24213 lt!257852)))))

(declare-fun b!565309 () Bool)

(declare-fun c!64853 () Bool)

(declare-fun lt!257853 () (_ BitVec 64))

(assert (=> b!565309 (= c!64853 (= lt!257853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!325492 () SeekEntryResult!5496)

(assert (=> b!565309 (= e!325491 e!325492)))

(declare-fun b!565310 () Bool)

(assert (=> b!565310 (= e!325492 (seekKeyOrZeroReturnVacant!0 (x!53079 lt!257852) (index!24213 lt!257852) (index!24213 lt!257852) (select (arr!17047 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!565311 () Bool)

(declare-fun e!325493 () SeekEntryResult!5496)

(assert (=> b!565311 (= e!325493 e!325491)))

(assert (=> b!565311 (= lt!257853 (select (arr!17047 a!3118) (index!24213 lt!257852)))))

(declare-fun c!64852 () Bool)

(assert (=> b!565311 (= c!64852 (= lt!257853 (select (arr!17047 a!3118) j!142)))))

(declare-fun d!84042 () Bool)

(declare-fun lt!257854 () SeekEntryResult!5496)

(assert (=> d!84042 (and (or ((_ is Undefined!5496) lt!257854) (not ((_ is Found!5496) lt!257854)) (and (bvsge (index!24212 lt!257854) #b00000000000000000000000000000000) (bvslt (index!24212 lt!257854) (size!17411 a!3118)))) (or ((_ is Undefined!5496) lt!257854) ((_ is Found!5496) lt!257854) (not ((_ is MissingZero!5496) lt!257854)) (and (bvsge (index!24211 lt!257854) #b00000000000000000000000000000000) (bvslt (index!24211 lt!257854) (size!17411 a!3118)))) (or ((_ is Undefined!5496) lt!257854) ((_ is Found!5496) lt!257854) ((_ is MissingZero!5496) lt!257854) (not ((_ is MissingVacant!5496) lt!257854)) (and (bvsge (index!24214 lt!257854) #b00000000000000000000000000000000) (bvslt (index!24214 lt!257854) (size!17411 a!3118)))) (or ((_ is Undefined!5496) lt!257854) (ite ((_ is Found!5496) lt!257854) (= (select (arr!17047 a!3118) (index!24212 lt!257854)) (select (arr!17047 a!3118) j!142)) (ite ((_ is MissingZero!5496) lt!257854) (= (select (arr!17047 a!3118) (index!24211 lt!257854)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5496) lt!257854) (= (select (arr!17047 a!3118) (index!24214 lt!257854)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84042 (= lt!257854 e!325493)))

(declare-fun c!64854 () Bool)

(assert (=> d!84042 (= c!64854 (and ((_ is Intermediate!5496) lt!257852) (undefined!6308 lt!257852)))))

(assert (=> d!84042 (= lt!257852 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17047 a!3118) j!142) mask!3119) (select (arr!17047 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84042 (validMask!0 mask!3119)))

(assert (=> d!84042 (= (seekEntryOrOpen!0 (select (arr!17047 a!3118) j!142) a!3118 mask!3119) lt!257854)))

(declare-fun b!565312 () Bool)

(assert (=> b!565312 (= e!325493 Undefined!5496)))

(declare-fun b!565313 () Bool)

(assert (=> b!565313 (= e!325492 (MissingZero!5496 (index!24213 lt!257852)))))

(assert (= (and d!84042 c!64854) b!565312))

(assert (= (and d!84042 (not c!64854)) b!565311))

(assert (= (and b!565311 c!64852) b!565308))

(assert (= (and b!565311 (not c!64852)) b!565309))

(assert (= (and b!565309 c!64853) b!565313))

(assert (= (and b!565309 (not c!64853)) b!565310))

(assert (=> b!565310 m!543555))

(declare-fun m!543775 () Bool)

(assert (=> b!565310 m!543775))

(declare-fun m!543777 () Bool)

(assert (=> b!565311 m!543777))

(assert (=> d!84042 m!543557))

(assert (=> d!84042 m!543555))

(assert (=> d!84042 m!543565))

(declare-fun m!543779 () Bool)

(assert (=> d!84042 m!543779))

(assert (=> d!84042 m!543571))

(declare-fun m!543781 () Bool)

(assert (=> d!84042 m!543781))

(assert (=> d!84042 m!543555))

(assert (=> d!84042 m!543557))

(declare-fun m!543783 () Bool)

(assert (=> d!84042 m!543783))

(assert (=> b!565033 d!84042))

(declare-fun call!32473 () Bool)

(declare-fun bm!32470 () Bool)

(assert (=> bm!32470 (= call!32473 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!84045 () Bool)

(declare-fun res!356301 () Bool)

(declare-fun e!325498 () Bool)

(assert (=> d!84045 (=> res!356301 e!325498)))

(assert (=> d!84045 (= res!356301 (bvsge j!142 (size!17411 a!3118)))))

(assert (=> d!84045 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!325498)))

(declare-fun b!565316 () Bool)

(declare-fun e!325497 () Bool)

(assert (=> b!565316 (= e!325497 call!32473)))

(declare-fun b!565317 () Bool)

(declare-fun e!325496 () Bool)

(assert (=> b!565317 (= e!325496 e!325497)))

(declare-fun lt!257855 () (_ BitVec 64))

(assert (=> b!565317 (= lt!257855 (select (arr!17047 a!3118) j!142))))

(declare-fun lt!257856 () Unit!17694)

(assert (=> b!565317 (= lt!257856 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!257855 j!142))))

(assert (=> b!565317 (arrayContainsKey!0 a!3118 lt!257855 #b00000000000000000000000000000000)))

(declare-fun lt!257857 () Unit!17694)

(assert (=> b!565317 (= lt!257857 lt!257856)))

(declare-fun res!356302 () Bool)

(assert (=> b!565317 (= res!356302 (= (seekEntryOrOpen!0 (select (arr!17047 a!3118) j!142) a!3118 mask!3119) (Found!5496 j!142)))))

(assert (=> b!565317 (=> (not res!356302) (not e!325497))))

(declare-fun b!565318 () Bool)

(assert (=> b!565318 (= e!325498 e!325496)))

(declare-fun c!64855 () Bool)

(assert (=> b!565318 (= c!64855 (validKeyInArray!0 (select (arr!17047 a!3118) j!142)))))

(declare-fun b!565319 () Bool)

(assert (=> b!565319 (= e!325496 call!32473)))

(assert (= (and d!84045 (not res!356301)) b!565318))

(assert (= (and b!565318 c!64855) b!565317))

(assert (= (and b!565318 (not c!64855)) b!565319))

(assert (= (and b!565317 res!356302) b!565316))

(assert (= (or b!565316 b!565319) bm!32470))

(declare-fun m!543787 () Bool)

(assert (=> bm!32470 m!543787))

(assert (=> b!565317 m!543555))

(declare-fun m!543789 () Bool)

(assert (=> b!565317 m!543789))

(declare-fun m!543791 () Bool)

(assert (=> b!565317 m!543791))

(assert (=> b!565317 m!543555))

(assert (=> b!565317 m!543575))

(assert (=> b!565318 m!543555))

(assert (=> b!565318 m!543555))

(assert (=> b!565318 m!543569))

(assert (=> b!565033 d!84045))

(declare-fun d!84051 () Bool)

(assert (=> d!84051 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!257860 () Unit!17694)

(declare-fun choose!38 (array!35493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17694)

(assert (=> d!84051 (= lt!257860 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84051 (validMask!0 mask!3119)))

(assert (=> d!84051 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!257860)))

(declare-fun bs!17558 () Bool)

(assert (= bs!17558 d!84051))

(assert (=> bs!17558 m!543577))

(declare-fun m!543795 () Bool)

(assert (=> bs!17558 m!543795))

(assert (=> bs!17558 m!543571))

(assert (=> b!565033 d!84051))

(check-sat (not d!84042) (not bm!32459) (not b!565267) (not b!565178) (not bm!32465) (not b!565110) (not d!84021) (not b!565317) (not b!565109) (not d!83977) (not b!565179) (not b!565177) (not b!565300) (not b!565318) (not b!565310) (not bm!32470) (not d!84051) (not b!565084) (not b!565196) (not d!84031))
(check-sat)
