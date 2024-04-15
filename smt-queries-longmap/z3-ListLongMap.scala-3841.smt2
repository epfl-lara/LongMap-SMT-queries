; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52784 () Bool)

(assert start!52784)

(declare-fun b!575530 () Bool)

(declare-fun res!364097 () Bool)

(declare-fun e!331135 () Bool)

(assert (=> b!575530 (=> (not res!364097) (not e!331135))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35938 0))(
  ( (array!35939 (arr!17252 (Array (_ BitVec 32) (_ BitVec 64))) (size!17617 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35938)

(assert (=> b!575530 (= res!364097 (and (= (size!17617 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17617 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17617 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!575531 () Bool)

(declare-fun res!364089 () Bool)

(declare-fun e!331137 () Bool)

(assert (=> b!575531 (=> (not res!364089) (not e!331137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35938 (_ BitVec 32)) Bool)

(assert (=> b!575531 (= res!364089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575532 () Bool)

(declare-fun res!364096 () Bool)

(assert (=> b!575532 (=> (not res!364096) (not e!331135))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575532 (= res!364096 (validKeyInArray!0 (select (arr!17252 a!3118) j!142)))))

(declare-fun res!364090 () Bool)

(assert (=> start!52784 (=> (not res!364090) (not e!331135))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52784 (= res!364090 (validMask!0 mask!3119))))

(assert (=> start!52784 e!331135))

(assert (=> start!52784 true))

(declare-fun array_inv!13135 (array!35938) Bool)

(assert (=> start!52784 (array_inv!13135 a!3118)))

(declare-fun b!575533 () Bool)

(declare-fun res!364095 () Bool)

(assert (=> b!575533 (=> (not res!364095) (not e!331135))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35938 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575533 (= res!364095 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575534 () Bool)

(declare-fun res!364094 () Bool)

(assert (=> b!575534 (=> (not res!364094) (not e!331135))))

(assert (=> b!575534 (= res!364094 (validKeyInArray!0 k0!1914))))

(declare-fun b!575535 () Bool)

(declare-fun e!331133 () Bool)

(assert (=> b!575535 (= e!331137 e!331133)))

(declare-fun res!364091 () Bool)

(assert (=> b!575535 (=> (not res!364091) (not e!331133))))

(declare-datatypes ((SeekEntryResult!5698 0))(
  ( (MissingZero!5698 (index!25019 (_ BitVec 32))) (Found!5698 (index!25020 (_ BitVec 32))) (Intermediate!5698 (undefined!6510 Bool) (index!25021 (_ BitVec 32)) (x!53918 (_ BitVec 32))) (Undefined!5698) (MissingVacant!5698 (index!25022 (_ BitVec 32))) )
))
(declare-fun lt!263205 () SeekEntryResult!5698)

(declare-fun lt!263201 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35938 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!575535 (= res!364091 (= lt!263205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263201 (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118)) mask!3119)))))

(declare-fun lt!263204 () (_ BitVec 32))

(assert (=> b!575535 (= lt!263205 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263204 (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575535 (= lt!263201 (toIndex!0 (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!575535 (= lt!263204 (toIndex!0 (select (arr!17252 a!3118) j!142) mask!3119))))

(declare-fun b!575536 () Bool)

(declare-fun e!331134 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35938 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!575536 (= e!331134 (= (seekEntryOrOpen!0 (select (arr!17252 a!3118) j!142) a!3118 mask!3119) (Found!5698 j!142)))))

(declare-fun b!575537 () Bool)

(declare-fun res!364092 () Bool)

(assert (=> b!575537 (=> (not res!364092) (not e!331137))))

(declare-datatypes ((List!11371 0))(
  ( (Nil!11368) (Cons!11367 (h!12406 (_ BitVec 64)) (t!17590 List!11371)) )
))
(declare-fun arrayNoDuplicates!0 (array!35938 (_ BitVec 32) List!11371) Bool)

(assert (=> b!575537 (= res!364092 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11368))))

(declare-fun b!575538 () Bool)

(declare-fun lt!263202 () Bool)

(assert (=> b!575538 (= e!331133 (not (or (and (not lt!263202) (undefined!6510 lt!263205)) (and (not lt!263202) (not (undefined!6510 lt!263205))))))))

(get-info :version)

(assert (=> b!575538 (= lt!263202 (not ((_ is Intermediate!5698) lt!263205)))))

(assert (=> b!575538 e!331134))

(declare-fun res!364088 () Bool)

(assert (=> b!575538 (=> (not res!364088) (not e!331134))))

(assert (=> b!575538 (= res!364088 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18084 0))(
  ( (Unit!18085) )
))
(declare-fun lt!263206 () Unit!18084)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18084)

(assert (=> b!575538 (= lt!263206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!575539 () Bool)

(assert (=> b!575539 (= e!331135 e!331137)))

(declare-fun res!364093 () Bool)

(assert (=> b!575539 (=> (not res!364093) (not e!331137))))

(declare-fun lt!263203 () SeekEntryResult!5698)

(assert (=> b!575539 (= res!364093 (or (= lt!263203 (MissingZero!5698 i!1132)) (= lt!263203 (MissingVacant!5698 i!1132))))))

(assert (=> b!575539 (= lt!263203 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52784 res!364090) b!575530))

(assert (= (and b!575530 res!364097) b!575532))

(assert (= (and b!575532 res!364096) b!575534))

(assert (= (and b!575534 res!364094) b!575533))

(assert (= (and b!575533 res!364095) b!575539))

(assert (= (and b!575539 res!364093) b!575531))

(assert (= (and b!575531 res!364089) b!575537))

(assert (= (and b!575537 res!364092) b!575535))

(assert (= (and b!575535 res!364091) b!575538))

(assert (= (and b!575538 res!364088) b!575536))

(declare-fun m!554009 () Bool)

(assert (=> b!575538 m!554009))

(declare-fun m!554011 () Bool)

(assert (=> b!575538 m!554011))

(declare-fun m!554013 () Bool)

(assert (=> b!575534 m!554013))

(declare-fun m!554015 () Bool)

(assert (=> b!575537 m!554015))

(declare-fun m!554017 () Bool)

(assert (=> b!575532 m!554017))

(assert (=> b!575532 m!554017))

(declare-fun m!554019 () Bool)

(assert (=> b!575532 m!554019))

(assert (=> b!575535 m!554017))

(declare-fun m!554021 () Bool)

(assert (=> b!575535 m!554021))

(assert (=> b!575535 m!554017))

(declare-fun m!554023 () Bool)

(assert (=> b!575535 m!554023))

(assert (=> b!575535 m!554023))

(declare-fun m!554025 () Bool)

(assert (=> b!575535 m!554025))

(assert (=> b!575535 m!554017))

(declare-fun m!554027 () Bool)

(assert (=> b!575535 m!554027))

(declare-fun m!554029 () Bool)

(assert (=> b!575535 m!554029))

(assert (=> b!575535 m!554023))

(declare-fun m!554031 () Bool)

(assert (=> b!575535 m!554031))

(declare-fun m!554033 () Bool)

(assert (=> b!575531 m!554033))

(declare-fun m!554035 () Bool)

(assert (=> b!575533 m!554035))

(declare-fun m!554037 () Bool)

(assert (=> start!52784 m!554037))

(declare-fun m!554039 () Bool)

(assert (=> start!52784 m!554039))

(assert (=> b!575536 m!554017))

(assert (=> b!575536 m!554017))

(declare-fun m!554041 () Bool)

(assert (=> b!575536 m!554041))

(declare-fun m!554043 () Bool)

(assert (=> b!575539 m!554043))

(check-sat (not b!575538) (not b!575532) (not b!575534) (not start!52784) (not b!575531) (not b!575535) (not b!575536) (not b!575533) (not b!575539) (not b!575537))
(check-sat)
(get-model)

(declare-fun b!575608 () Bool)

(declare-fun e!331176 () Bool)

(declare-fun e!331174 () Bool)

(assert (=> b!575608 (= e!331176 e!331174)))

(declare-fun c!66087 () Bool)

(assert (=> b!575608 (= c!66087 (validKeyInArray!0 (select (arr!17252 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32683 () Bool)

(declare-fun call!32686 () Bool)

(assert (=> bm!32683 (= call!32686 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85095 () Bool)

(declare-fun res!364162 () Bool)

(assert (=> d!85095 (=> res!364162 e!331176)))

(assert (=> d!85095 (= res!364162 (bvsge #b00000000000000000000000000000000 (size!17617 a!3118)))))

(assert (=> d!85095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331176)))

(declare-fun b!575609 () Bool)

(declare-fun e!331175 () Bool)

(assert (=> b!575609 (= e!331175 call!32686)))

(declare-fun b!575610 () Bool)

(assert (=> b!575610 (= e!331174 e!331175)))

(declare-fun lt!263251 () (_ BitVec 64))

(assert (=> b!575610 (= lt!263251 (select (arr!17252 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263249 () Unit!18084)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35938 (_ BitVec 64) (_ BitVec 32)) Unit!18084)

(assert (=> b!575610 (= lt!263249 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263251 #b00000000000000000000000000000000))))

(assert (=> b!575610 (arrayContainsKey!0 a!3118 lt!263251 #b00000000000000000000000000000000)))

(declare-fun lt!263250 () Unit!18084)

(assert (=> b!575610 (= lt!263250 lt!263249)))

(declare-fun res!364163 () Bool)

(assert (=> b!575610 (= res!364163 (= (seekEntryOrOpen!0 (select (arr!17252 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5698 #b00000000000000000000000000000000)))))

(assert (=> b!575610 (=> (not res!364163) (not e!331175))))

(declare-fun b!575611 () Bool)

(assert (=> b!575611 (= e!331174 call!32686)))

(assert (= (and d!85095 (not res!364162)) b!575608))

(assert (= (and b!575608 c!66087) b!575610))

(assert (= (and b!575608 (not c!66087)) b!575611))

(assert (= (and b!575610 res!364163) b!575609))

(assert (= (or b!575609 b!575611) bm!32683))

(declare-fun m!554117 () Bool)

(assert (=> b!575608 m!554117))

(assert (=> b!575608 m!554117))

(declare-fun m!554119 () Bool)

(assert (=> b!575608 m!554119))

(declare-fun m!554121 () Bool)

(assert (=> bm!32683 m!554121))

(assert (=> b!575610 m!554117))

(declare-fun m!554123 () Bool)

(assert (=> b!575610 m!554123))

(declare-fun m!554125 () Bool)

(assert (=> b!575610 m!554125))

(assert (=> b!575610 m!554117))

(declare-fun m!554127 () Bool)

(assert (=> b!575610 m!554127))

(assert (=> b!575531 d!85095))

(declare-fun b!575657 () Bool)

(declare-fun e!331208 () SeekEntryResult!5698)

(declare-fun e!331207 () SeekEntryResult!5698)

(assert (=> b!575657 (= e!331208 e!331207)))

(declare-fun lt!263266 () (_ BitVec 64))

(declare-fun lt!263265 () SeekEntryResult!5698)

(assert (=> b!575657 (= lt!263266 (select (arr!17252 a!3118) (index!25021 lt!263265)))))

(declare-fun c!66103 () Bool)

(assert (=> b!575657 (= c!66103 (= lt!263266 (select (arr!17252 a!3118) j!142)))))

(declare-fun b!575658 () Bool)

(assert (=> b!575658 (= e!331207 (Found!5698 (index!25021 lt!263265)))))

(declare-fun b!575659 () Bool)

(declare-fun e!331209 () SeekEntryResult!5698)

(assert (=> b!575659 (= e!331209 (MissingZero!5698 (index!25021 lt!263265)))))

(declare-fun b!575660 () Bool)

(declare-fun c!66105 () Bool)

(assert (=> b!575660 (= c!66105 (= lt!263266 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575660 (= e!331207 e!331209)))

(declare-fun b!575661 () Bool)

(assert (=> b!575661 (= e!331208 Undefined!5698)))

(declare-fun d!85097 () Bool)

(declare-fun lt!263264 () SeekEntryResult!5698)

(assert (=> d!85097 (and (or ((_ is Undefined!5698) lt!263264) (not ((_ is Found!5698) lt!263264)) (and (bvsge (index!25020 lt!263264) #b00000000000000000000000000000000) (bvslt (index!25020 lt!263264) (size!17617 a!3118)))) (or ((_ is Undefined!5698) lt!263264) ((_ is Found!5698) lt!263264) (not ((_ is MissingZero!5698) lt!263264)) (and (bvsge (index!25019 lt!263264) #b00000000000000000000000000000000) (bvslt (index!25019 lt!263264) (size!17617 a!3118)))) (or ((_ is Undefined!5698) lt!263264) ((_ is Found!5698) lt!263264) ((_ is MissingZero!5698) lt!263264) (not ((_ is MissingVacant!5698) lt!263264)) (and (bvsge (index!25022 lt!263264) #b00000000000000000000000000000000) (bvslt (index!25022 lt!263264) (size!17617 a!3118)))) (or ((_ is Undefined!5698) lt!263264) (ite ((_ is Found!5698) lt!263264) (= (select (arr!17252 a!3118) (index!25020 lt!263264)) (select (arr!17252 a!3118) j!142)) (ite ((_ is MissingZero!5698) lt!263264) (= (select (arr!17252 a!3118) (index!25019 lt!263264)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5698) lt!263264) (= (select (arr!17252 a!3118) (index!25022 lt!263264)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85097 (= lt!263264 e!331208)))

(declare-fun c!66104 () Bool)

(assert (=> d!85097 (= c!66104 (and ((_ is Intermediate!5698) lt!263265) (undefined!6510 lt!263265)))))

(assert (=> d!85097 (= lt!263265 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17252 a!3118) j!142) mask!3119) (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85097 (validMask!0 mask!3119)))

(assert (=> d!85097 (= (seekEntryOrOpen!0 (select (arr!17252 a!3118) j!142) a!3118 mask!3119) lt!263264)))

(declare-fun b!575662 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35938 (_ BitVec 32)) SeekEntryResult!5698)

(assert (=> b!575662 (= e!331209 (seekKeyOrZeroReturnVacant!0 (x!53918 lt!263265) (index!25021 lt!263265) (index!25021 lt!263265) (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85097 c!66104) b!575661))

(assert (= (and d!85097 (not c!66104)) b!575657))

(assert (= (and b!575657 c!66103) b!575658))

(assert (= (and b!575657 (not c!66103)) b!575660))

(assert (= (and b!575660 c!66105) b!575659))

(assert (= (and b!575660 (not c!66105)) b!575662))

(declare-fun m!554139 () Bool)

(assert (=> b!575657 m!554139))

(declare-fun m!554141 () Bool)

(assert (=> d!85097 m!554141))

(declare-fun m!554143 () Bool)

(assert (=> d!85097 m!554143))

(declare-fun m!554145 () Bool)

(assert (=> d!85097 m!554145))

(assert (=> d!85097 m!554037))

(assert (=> d!85097 m!554021))

(assert (=> d!85097 m!554017))

(declare-fun m!554147 () Bool)

(assert (=> d!85097 m!554147))

(assert (=> d!85097 m!554017))

(assert (=> d!85097 m!554021))

(assert (=> b!575662 m!554017))

(declare-fun m!554149 () Bool)

(assert (=> b!575662 m!554149))

(assert (=> b!575536 d!85097))

(declare-fun b!575695 () Bool)

(declare-fun e!331233 () Bool)

(declare-fun e!331234 () Bool)

(assert (=> b!575695 (= e!331233 e!331234)))

(declare-fun c!66116 () Bool)

(assert (=> b!575695 (= c!66116 (validKeyInArray!0 (select (arr!17252 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85107 () Bool)

(declare-fun res!364191 () Bool)

(declare-fun e!331235 () Bool)

(assert (=> d!85107 (=> res!364191 e!331235)))

(assert (=> d!85107 (= res!364191 (bvsge #b00000000000000000000000000000000 (size!17617 a!3118)))))

(assert (=> d!85107 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11368) e!331235)))

(declare-fun b!575696 () Bool)

(declare-fun e!331232 () Bool)

(declare-fun contains!2875 (List!11371 (_ BitVec 64)) Bool)

(assert (=> b!575696 (= e!331232 (contains!2875 Nil!11368 (select (arr!17252 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32691 () Bool)

(declare-fun call!32694 () Bool)

(assert (=> bm!32691 (= call!32694 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66116 (Cons!11367 (select (arr!17252 a!3118) #b00000000000000000000000000000000) Nil!11368) Nil!11368)))))

(declare-fun b!575697 () Bool)

(assert (=> b!575697 (= e!331234 call!32694)))

(declare-fun b!575698 () Bool)

(assert (=> b!575698 (= e!331234 call!32694)))

(declare-fun b!575699 () Bool)

(assert (=> b!575699 (= e!331235 e!331233)))

(declare-fun res!364192 () Bool)

(assert (=> b!575699 (=> (not res!364192) (not e!331233))))

(assert (=> b!575699 (= res!364192 (not e!331232))))

(declare-fun res!364193 () Bool)

(assert (=> b!575699 (=> (not res!364193) (not e!331232))))

(assert (=> b!575699 (= res!364193 (validKeyInArray!0 (select (arr!17252 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85107 (not res!364191)) b!575699))

(assert (= (and b!575699 res!364193) b!575696))

(assert (= (and b!575699 res!364192) b!575695))

(assert (= (and b!575695 c!66116) b!575698))

(assert (= (and b!575695 (not c!66116)) b!575697))

(assert (= (or b!575698 b!575697) bm!32691))

(assert (=> b!575695 m!554117))

(assert (=> b!575695 m!554117))

(assert (=> b!575695 m!554119))

(assert (=> b!575696 m!554117))

(assert (=> b!575696 m!554117))

(declare-fun m!554177 () Bool)

(assert (=> b!575696 m!554177))

(assert (=> bm!32691 m!554117))

(declare-fun m!554179 () Bool)

(assert (=> bm!32691 m!554179))

(assert (=> b!575699 m!554117))

(assert (=> b!575699 m!554117))

(assert (=> b!575699 m!554119))

(assert (=> b!575537 d!85107))

(declare-fun d!85113 () Bool)

(assert (=> d!85113 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52784 d!85113))

(declare-fun d!85119 () Bool)

(assert (=> d!85119 (= (array_inv!13135 a!3118) (bvsge (size!17617 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52784 d!85119))

(declare-fun d!85121 () Bool)

(assert (=> d!85121 (= (validKeyInArray!0 (select (arr!17252 a!3118) j!142)) (and (not (= (select (arr!17252 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17252 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!575532 d!85121))

(declare-fun d!85123 () Bool)

(declare-fun res!364207 () Bool)

(declare-fun e!331253 () Bool)

(assert (=> d!85123 (=> res!364207 e!331253)))

(assert (=> d!85123 (= res!364207 (= (select (arr!17252 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85123 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!331253)))

(declare-fun b!575721 () Bool)

(declare-fun e!331254 () Bool)

(assert (=> b!575721 (= e!331253 e!331254)))

(declare-fun res!364208 () Bool)

(assert (=> b!575721 (=> (not res!364208) (not e!331254))))

(assert (=> b!575721 (= res!364208 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17617 a!3118)))))

(declare-fun b!575722 () Bool)

(assert (=> b!575722 (= e!331254 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85123 (not res!364207)) b!575721))

(assert (= (and b!575721 res!364208) b!575722))

(assert (=> d!85123 m!554117))

(declare-fun m!554197 () Bool)

(assert (=> b!575722 m!554197))

(assert (=> b!575533 d!85123))

(declare-fun b!575723 () Bool)

(declare-fun e!331257 () Bool)

(declare-fun e!331255 () Bool)

(assert (=> b!575723 (= e!331257 e!331255)))

(declare-fun c!66121 () Bool)

(assert (=> b!575723 (= c!66121 (validKeyInArray!0 (select (arr!17252 a!3118) j!142)))))

(declare-fun call!32699 () Bool)

(declare-fun bm!32696 () Bool)

(assert (=> bm!32696 (= call!32699 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!85133 () Bool)

(declare-fun res!364209 () Bool)

(assert (=> d!85133 (=> res!364209 e!331257)))

(assert (=> d!85133 (= res!364209 (bvsge j!142 (size!17617 a!3118)))))

(assert (=> d!85133 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331257)))

(declare-fun b!575724 () Bool)

(declare-fun e!331256 () Bool)

(assert (=> b!575724 (= e!331256 call!32699)))

(declare-fun b!575725 () Bool)

(assert (=> b!575725 (= e!331255 e!331256)))

(declare-fun lt!263287 () (_ BitVec 64))

(assert (=> b!575725 (= lt!263287 (select (arr!17252 a!3118) j!142))))

(declare-fun lt!263285 () Unit!18084)

(assert (=> b!575725 (= lt!263285 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263287 j!142))))

(assert (=> b!575725 (arrayContainsKey!0 a!3118 lt!263287 #b00000000000000000000000000000000)))

(declare-fun lt!263286 () Unit!18084)

(assert (=> b!575725 (= lt!263286 lt!263285)))

(declare-fun res!364210 () Bool)

(assert (=> b!575725 (= res!364210 (= (seekEntryOrOpen!0 (select (arr!17252 a!3118) j!142) a!3118 mask!3119) (Found!5698 j!142)))))

(assert (=> b!575725 (=> (not res!364210) (not e!331256))))

(declare-fun b!575726 () Bool)

(assert (=> b!575726 (= e!331255 call!32699)))

(assert (= (and d!85133 (not res!364209)) b!575723))

(assert (= (and b!575723 c!66121) b!575725))

(assert (= (and b!575723 (not c!66121)) b!575726))

(assert (= (and b!575725 res!364210) b!575724))

(assert (= (or b!575724 b!575726) bm!32696))

(assert (=> b!575723 m!554017))

(assert (=> b!575723 m!554017))

(assert (=> b!575723 m!554019))

(declare-fun m!554199 () Bool)

(assert (=> bm!32696 m!554199))

(assert (=> b!575725 m!554017))

(declare-fun m!554201 () Bool)

(assert (=> b!575725 m!554201))

(declare-fun m!554203 () Bool)

(assert (=> b!575725 m!554203))

(assert (=> b!575725 m!554017))

(assert (=> b!575725 m!554041))

(assert (=> b!575538 d!85133))

(declare-fun d!85135 () Bool)

(assert (=> d!85135 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263290 () Unit!18084)

(declare-fun choose!38 (array!35938 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18084)

(assert (=> d!85135 (= lt!263290 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85135 (validMask!0 mask!3119)))

(assert (=> d!85135 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263290)))

(declare-fun bs!17771 () Bool)

(assert (= bs!17771 d!85135))

(assert (=> bs!17771 m!554009))

(declare-fun m!554207 () Bool)

(assert (=> bs!17771 m!554207))

(assert (=> bs!17771 m!554037))

(assert (=> b!575538 d!85135))

(declare-fun b!575733 () Bool)

(declare-fun e!331265 () SeekEntryResult!5698)

(declare-fun e!331264 () SeekEntryResult!5698)

(assert (=> b!575733 (= e!331265 e!331264)))

(declare-fun lt!263293 () (_ BitVec 64))

(declare-fun lt!263292 () SeekEntryResult!5698)

(assert (=> b!575733 (= lt!263293 (select (arr!17252 a!3118) (index!25021 lt!263292)))))

(declare-fun c!66122 () Bool)

(assert (=> b!575733 (= c!66122 (= lt!263293 k0!1914))))

(declare-fun b!575734 () Bool)

(assert (=> b!575734 (= e!331264 (Found!5698 (index!25021 lt!263292)))))

(declare-fun b!575735 () Bool)

(declare-fun e!331266 () SeekEntryResult!5698)

(assert (=> b!575735 (= e!331266 (MissingZero!5698 (index!25021 lt!263292)))))

(declare-fun b!575736 () Bool)

(declare-fun c!66124 () Bool)

(assert (=> b!575736 (= c!66124 (= lt!263293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575736 (= e!331264 e!331266)))

(declare-fun b!575737 () Bool)

(assert (=> b!575737 (= e!331265 Undefined!5698)))

(declare-fun d!85141 () Bool)

(declare-fun lt!263291 () SeekEntryResult!5698)

(assert (=> d!85141 (and (or ((_ is Undefined!5698) lt!263291) (not ((_ is Found!5698) lt!263291)) (and (bvsge (index!25020 lt!263291) #b00000000000000000000000000000000) (bvslt (index!25020 lt!263291) (size!17617 a!3118)))) (or ((_ is Undefined!5698) lt!263291) ((_ is Found!5698) lt!263291) (not ((_ is MissingZero!5698) lt!263291)) (and (bvsge (index!25019 lt!263291) #b00000000000000000000000000000000) (bvslt (index!25019 lt!263291) (size!17617 a!3118)))) (or ((_ is Undefined!5698) lt!263291) ((_ is Found!5698) lt!263291) ((_ is MissingZero!5698) lt!263291) (not ((_ is MissingVacant!5698) lt!263291)) (and (bvsge (index!25022 lt!263291) #b00000000000000000000000000000000) (bvslt (index!25022 lt!263291) (size!17617 a!3118)))) (or ((_ is Undefined!5698) lt!263291) (ite ((_ is Found!5698) lt!263291) (= (select (arr!17252 a!3118) (index!25020 lt!263291)) k0!1914) (ite ((_ is MissingZero!5698) lt!263291) (= (select (arr!17252 a!3118) (index!25019 lt!263291)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5698) lt!263291) (= (select (arr!17252 a!3118) (index!25022 lt!263291)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85141 (= lt!263291 e!331265)))

(declare-fun c!66123 () Bool)

(assert (=> d!85141 (= c!66123 (and ((_ is Intermediate!5698) lt!263292) (undefined!6510 lt!263292)))))

(assert (=> d!85141 (= lt!263292 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85141 (validMask!0 mask!3119)))

(assert (=> d!85141 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!263291)))

(declare-fun b!575738 () Bool)

(assert (=> b!575738 (= e!331266 (seekKeyOrZeroReturnVacant!0 (x!53918 lt!263292) (index!25021 lt!263292) (index!25021 lt!263292) k0!1914 a!3118 mask!3119))))

(assert (= (and d!85141 c!66123) b!575737))

(assert (= (and d!85141 (not c!66123)) b!575733))

(assert (= (and b!575733 c!66122) b!575734))

(assert (= (and b!575733 (not c!66122)) b!575736))

(assert (= (and b!575736 c!66124) b!575735))

(assert (= (and b!575736 (not c!66124)) b!575738))

(declare-fun m!554209 () Bool)

(assert (=> b!575733 m!554209))

(declare-fun m!554211 () Bool)

(assert (=> d!85141 m!554211))

(declare-fun m!554213 () Bool)

(assert (=> d!85141 m!554213))

(declare-fun m!554215 () Bool)

(assert (=> d!85141 m!554215))

(assert (=> d!85141 m!554037))

(declare-fun m!554217 () Bool)

(assert (=> d!85141 m!554217))

(declare-fun m!554219 () Bool)

(assert (=> d!85141 m!554219))

(assert (=> d!85141 m!554217))

(declare-fun m!554221 () Bool)

(assert (=> b!575738 m!554221))

(assert (=> b!575539 d!85141))

(declare-fun d!85143 () Bool)

(assert (=> d!85143 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!575534 d!85143))

(declare-fun b!575773 () Bool)

(declare-fun lt!263310 () SeekEntryResult!5698)

(assert (=> b!575773 (and (bvsge (index!25021 lt!263310) #b00000000000000000000000000000000) (bvslt (index!25021 lt!263310) (size!17617 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118)))))))

(declare-fun e!331292 () Bool)

(assert (=> b!575773 (= e!331292 (= (select (arr!17252 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118))) (index!25021 lt!263310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!575774 () Bool)

(declare-fun e!331293 () SeekEntryResult!5698)

(assert (=> b!575774 (= e!331293 (Intermediate!5698 true lt!263201 #b00000000000000000000000000000000))))

(declare-fun b!575775 () Bool)

(assert (=> b!575775 (and (bvsge (index!25021 lt!263310) #b00000000000000000000000000000000) (bvslt (index!25021 lt!263310) (size!17617 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118)))))))

(declare-fun res!364232 () Bool)

(assert (=> b!575775 (= res!364232 (= (select (arr!17252 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118))) (index!25021 lt!263310)) (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!575775 (=> res!364232 e!331292)))

(declare-fun e!331290 () Bool)

(assert (=> b!575775 (= e!331290 e!331292)))

(declare-fun b!575776 () Bool)

(declare-fun e!331291 () SeekEntryResult!5698)

(assert (=> b!575776 (= e!331293 e!331291)))

(declare-fun c!66137 () Bool)

(declare-fun lt!263311 () (_ BitVec 64))

(assert (=> b!575776 (= c!66137 (or (= lt!263311 (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!263311 lt!263311) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!85145 () Bool)

(declare-fun e!331289 () Bool)

(assert (=> d!85145 e!331289))

(declare-fun c!66136 () Bool)

(assert (=> d!85145 (= c!66136 (and ((_ is Intermediate!5698) lt!263310) (undefined!6510 lt!263310)))))

(assert (=> d!85145 (= lt!263310 e!331293)))

(declare-fun c!66135 () Bool)

(assert (=> d!85145 (= c!66135 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85145 (= lt!263311 (select (arr!17252 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118))) lt!263201))))

(assert (=> d!85145 (validMask!0 mask!3119)))

(assert (=> d!85145 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263201 (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118)) mask!3119) lt!263310)))

(declare-fun b!575777 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575777 (= e!331291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263201 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118)) mask!3119))))

(declare-fun b!575778 () Bool)

(assert (=> b!575778 (= e!331291 (Intermediate!5698 false lt!263201 #b00000000000000000000000000000000))))

(declare-fun b!575779 () Bool)

(assert (=> b!575779 (and (bvsge (index!25021 lt!263310) #b00000000000000000000000000000000) (bvslt (index!25021 lt!263310) (size!17617 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118)))))))

(declare-fun res!364233 () Bool)

(assert (=> b!575779 (= res!364233 (= (select (arr!17252 (array!35939 (store (arr!17252 a!3118) i!1132 k0!1914) (size!17617 a!3118))) (index!25021 lt!263310)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575779 (=> res!364233 e!331292)))

(declare-fun b!575780 () Bool)

(assert (=> b!575780 (= e!331289 e!331290)))

(declare-fun res!364231 () Bool)

(assert (=> b!575780 (= res!364231 (and ((_ is Intermediate!5698) lt!263310) (not (undefined!6510 lt!263310)) (bvslt (x!53918 lt!263310) #b01111111111111111111111111111110) (bvsge (x!53918 lt!263310) #b00000000000000000000000000000000) (bvsge (x!53918 lt!263310) #b00000000000000000000000000000000)))))

(assert (=> b!575780 (=> (not res!364231) (not e!331290))))

(declare-fun b!575781 () Bool)

(assert (=> b!575781 (= e!331289 (bvsge (x!53918 lt!263310) #b01111111111111111111111111111110))))

(assert (= (and d!85145 c!66135) b!575774))

(assert (= (and d!85145 (not c!66135)) b!575776))

(assert (= (and b!575776 c!66137) b!575778))

(assert (= (and b!575776 (not c!66137)) b!575777))

(assert (= (and d!85145 c!66136) b!575781))

(assert (= (and d!85145 (not c!66136)) b!575780))

(assert (= (and b!575780 res!364231) b!575775))

(assert (= (and b!575775 (not res!364232)) b!575779))

(assert (= (and b!575779 (not res!364233)) b!575773))

(declare-fun m!554239 () Bool)

(assert (=> b!575779 m!554239))

(assert (=> b!575773 m!554239))

(declare-fun m!554241 () Bool)

(assert (=> d!85145 m!554241))

(assert (=> d!85145 m!554037))

(assert (=> b!575775 m!554239))

(declare-fun m!554243 () Bool)

(assert (=> b!575777 m!554243))

(assert (=> b!575777 m!554243))

(assert (=> b!575777 m!554023))

(declare-fun m!554245 () Bool)

(assert (=> b!575777 m!554245))

(assert (=> b!575535 d!85145))

(declare-fun b!575790 () Bool)

(declare-fun lt!263316 () SeekEntryResult!5698)

(assert (=> b!575790 (and (bvsge (index!25021 lt!263316) #b00000000000000000000000000000000) (bvslt (index!25021 lt!263316) (size!17617 a!3118)))))

(declare-fun e!331301 () Bool)

(assert (=> b!575790 (= e!331301 (= (select (arr!17252 a!3118) (index!25021 lt!263316)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!575791 () Bool)

(declare-fun e!331302 () SeekEntryResult!5698)

(assert (=> b!575791 (= e!331302 (Intermediate!5698 true lt!263204 #b00000000000000000000000000000000))))

(declare-fun b!575792 () Bool)

(assert (=> b!575792 (and (bvsge (index!25021 lt!263316) #b00000000000000000000000000000000) (bvslt (index!25021 lt!263316) (size!17617 a!3118)))))

(declare-fun res!364235 () Bool)

(assert (=> b!575792 (= res!364235 (= (select (arr!17252 a!3118) (index!25021 lt!263316)) (select (arr!17252 a!3118) j!142)))))

(assert (=> b!575792 (=> res!364235 e!331301)))

(declare-fun e!331299 () Bool)

(assert (=> b!575792 (= e!331299 e!331301)))

(declare-fun b!575793 () Bool)

(declare-fun e!331300 () SeekEntryResult!5698)

(assert (=> b!575793 (= e!331302 e!331300)))

(declare-fun lt!263317 () (_ BitVec 64))

(declare-fun c!66144 () Bool)

(assert (=> b!575793 (= c!66144 (or (= lt!263317 (select (arr!17252 a!3118) j!142)) (= (bvadd lt!263317 lt!263317) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!85155 () Bool)

(declare-fun e!331298 () Bool)

(assert (=> d!85155 e!331298))

(declare-fun c!66143 () Bool)

(assert (=> d!85155 (= c!66143 (and ((_ is Intermediate!5698) lt!263316) (undefined!6510 lt!263316)))))

(assert (=> d!85155 (= lt!263316 e!331302)))

(declare-fun c!66142 () Bool)

(assert (=> d!85155 (= c!66142 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85155 (= lt!263317 (select (arr!17252 a!3118) lt!263204))))

(assert (=> d!85155 (validMask!0 mask!3119)))

(assert (=> d!85155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263204 (select (arr!17252 a!3118) j!142) a!3118 mask!3119) lt!263316)))

(declare-fun b!575794 () Bool)

(assert (=> b!575794 (= e!331300 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263204 #b00000000000000000000000000000000 mask!3119) (select (arr!17252 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575795 () Bool)

(assert (=> b!575795 (= e!331300 (Intermediate!5698 false lt!263204 #b00000000000000000000000000000000))))

(declare-fun b!575796 () Bool)

(assert (=> b!575796 (and (bvsge (index!25021 lt!263316) #b00000000000000000000000000000000) (bvslt (index!25021 lt!263316) (size!17617 a!3118)))))

(declare-fun res!364236 () Bool)

(assert (=> b!575796 (= res!364236 (= (select (arr!17252 a!3118) (index!25021 lt!263316)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!575796 (=> res!364236 e!331301)))

(declare-fun b!575797 () Bool)

(assert (=> b!575797 (= e!331298 e!331299)))

(declare-fun res!364234 () Bool)

(assert (=> b!575797 (= res!364234 (and ((_ is Intermediate!5698) lt!263316) (not (undefined!6510 lt!263316)) (bvslt (x!53918 lt!263316) #b01111111111111111111111111111110) (bvsge (x!53918 lt!263316) #b00000000000000000000000000000000) (bvsge (x!53918 lt!263316) #b00000000000000000000000000000000)))))

(assert (=> b!575797 (=> (not res!364234) (not e!331299))))

(declare-fun b!575798 () Bool)

(assert (=> b!575798 (= e!331298 (bvsge (x!53918 lt!263316) #b01111111111111111111111111111110))))

(assert (= (and d!85155 c!66142) b!575791))

(assert (= (and d!85155 (not c!66142)) b!575793))

(assert (= (and b!575793 c!66144) b!575795))

(assert (= (and b!575793 (not c!66144)) b!575794))

(assert (= (and d!85155 c!66143) b!575798))

(assert (= (and d!85155 (not c!66143)) b!575797))

(assert (= (and b!575797 res!364234) b!575792))

(assert (= (and b!575792 (not res!364235)) b!575796))

(assert (= (and b!575796 (not res!364236)) b!575790))

(declare-fun m!554247 () Bool)

(assert (=> b!575796 m!554247))

(assert (=> b!575790 m!554247))

(declare-fun m!554249 () Bool)

(assert (=> d!85155 m!554249))

(assert (=> d!85155 m!554037))

(assert (=> b!575792 m!554247))

(declare-fun m!554251 () Bool)

(assert (=> b!575794 m!554251))

(assert (=> b!575794 m!554251))

(assert (=> b!575794 m!554017))

(declare-fun m!554253 () Bool)

(assert (=> b!575794 m!554253))

(assert (=> b!575535 d!85155))

(declare-fun d!85157 () Bool)

(declare-fun lt!263331 () (_ BitVec 32))

(declare-fun lt!263330 () (_ BitVec 32))

(assert (=> d!85157 (= lt!263331 (bvmul (bvxor lt!263330 (bvlshr lt!263330 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85157 (= lt!263330 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85157 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364243 (let ((h!12409 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53923 (bvmul (bvxor h!12409 (bvlshr h!12409 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53923 (bvlshr x!53923 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364243 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364243 #b00000000000000000000000000000000))))))

(assert (=> d!85157 (= (toIndex!0 (select (store (arr!17252 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!263331 (bvlshr lt!263331 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!575535 d!85157))

(declare-fun d!85161 () Bool)

(declare-fun lt!263333 () (_ BitVec 32))

(declare-fun lt!263332 () (_ BitVec 32))

(assert (=> d!85161 (= lt!263333 (bvmul (bvxor lt!263332 (bvlshr lt!263332 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85161 (= lt!263332 ((_ extract 31 0) (bvand (bvxor (select (arr!17252 a!3118) j!142) (bvlshr (select (arr!17252 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85161 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364243 (let ((h!12409 ((_ extract 31 0) (bvand (bvxor (select (arr!17252 a!3118) j!142) (bvlshr (select (arr!17252 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53923 (bvmul (bvxor h!12409 (bvlshr h!12409 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53923 (bvlshr x!53923 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364243 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364243 #b00000000000000000000000000000000))))))

(assert (=> d!85161 (= (toIndex!0 (select (arr!17252 a!3118) j!142) mask!3119) (bvand (bvxor lt!263333 (bvlshr lt!263333 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!575535 d!85161))

(check-sat (not bm!32683) (not bm!32691) (not b!575610) (not b!575722) (not b!575695) (not d!85135) (not bm!32696) (not b!575662) (not b!575738) (not b!575794) (not b!575608) (not b!575723) (not b!575777) (not b!575699) (not b!575696) (not d!85155) (not d!85145) (not b!575725) (not d!85097) (not d!85141))
(check-sat)
