; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51180 () Bool)

(assert start!51180)

(declare-datatypes ((SeekEntryResult!5338 0))(
  ( (MissingZero!5338 (index!23579 (_ BitVec 32))) (Found!5338 (index!23580 (_ BitVec 32))) (Intermediate!5338 (undefined!6150 Bool) (index!23581 (_ BitVec 32)) (x!52479 (_ BitVec 32))) (Undefined!5338) (MissingVacant!5338 (index!23582 (_ BitVec 32))) )
))
(declare-fun lt!254105 () SeekEntryResult!5338)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!322092 () Bool)

(declare-fun lt!254106 () SeekEntryResult!5338)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!559104 () Bool)

(declare-datatypes ((array!35171 0))(
  ( (array!35172 (arr!16889 (Array (_ BitVec 32) (_ BitVec 64))) (size!17253 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35171)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35171 (_ BitVec 32)) SeekEntryResult!5338)

(assert (=> b!559104 (= e!322092 (= lt!254105 (seekKeyOrZeroReturnVacant!0 (x!52479 lt!254106) (index!23581 lt!254106) (index!23581 lt!254106) (select (arr!16889 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559105 () Bool)

(declare-fun res!350731 () Bool)

(declare-fun e!322090 () Bool)

(assert (=> b!559105 (=> (not res!350731) (not e!322090))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559105 (= res!350731 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!559106 () Bool)

(declare-fun e!322091 () Bool)

(assert (=> b!559106 (= e!322091 e!322092)))

(declare-fun res!350741 () Bool)

(assert (=> b!559106 (=> res!350741 e!322092)))

(declare-fun lt!254101 () (_ BitVec 64))

(assert (=> b!559106 (= res!350741 (or (= lt!254101 (select (arr!16889 a!3118) j!142)) (= lt!254101 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!559106 (= lt!254101 (select (arr!16889 a!3118) (index!23581 lt!254106)))))

(declare-fun b!559107 () Bool)

(declare-fun res!350740 () Bool)

(assert (=> b!559107 (=> (not res!350740) (not e!322090))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559107 (= res!350740 (and (= (size!17253 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17253 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17253 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!350737 () Bool)

(assert (=> start!51180 (=> (not res!350737) (not e!322090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51180 (= res!350737 (validMask!0 mask!3119))))

(assert (=> start!51180 e!322090))

(assert (=> start!51180 true))

(declare-fun array_inv!12685 (array!35171) Bool)

(assert (=> start!51180 (array_inv!12685 a!3118)))

(declare-fun b!559108 () Bool)

(declare-fun res!350733 () Bool)

(declare-fun e!322089 () Bool)

(assert (=> b!559108 (=> (not res!350733) (not e!322089))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35171 (_ BitVec 32)) Bool)

(assert (=> b!559108 (= res!350733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559109 () Bool)

(assert (=> b!559109 (= e!322090 e!322089)))

(declare-fun res!350736 () Bool)

(assert (=> b!559109 (=> (not res!350736) (not e!322089))))

(declare-fun lt!254107 () SeekEntryResult!5338)

(assert (=> b!559109 (= res!350736 (or (= lt!254107 (MissingZero!5338 i!1132)) (= lt!254107 (MissingVacant!5338 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35171 (_ BitVec 32)) SeekEntryResult!5338)

(assert (=> b!559109 (= lt!254107 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!559110 () Bool)

(declare-fun res!350730 () Bool)

(assert (=> b!559110 (=> (not res!350730) (not e!322090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559110 (= res!350730 (validKeyInArray!0 k!1914))))

(declare-fun b!559111 () Bool)

(declare-fun e!322093 () Bool)

(assert (=> b!559111 (= e!322093 e!322091)))

(declare-fun res!350734 () Bool)

(assert (=> b!559111 (=> res!350734 e!322091)))

(assert (=> b!559111 (= res!350734 (or (undefined!6150 lt!254106) (not (is-Intermediate!5338 lt!254106))))))

(declare-fun b!559112 () Bool)

(declare-fun e!322095 () Bool)

(assert (=> b!559112 (= e!322089 e!322095)))

(declare-fun res!350738 () Bool)

(assert (=> b!559112 (=> (not res!350738) (not e!322095))))

(declare-fun lt!254104 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35171 (_ BitVec 32)) SeekEntryResult!5338)

(assert (=> b!559112 (= res!350738 (= lt!254106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254104 (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118)) mask!3119)))))

(declare-fun lt!254102 () (_ BitVec 32))

(assert (=> b!559112 (= lt!254106 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254102 (select (arr!16889 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559112 (= lt!254104 (toIndex!0 (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!559112 (= lt!254102 (toIndex!0 (select (arr!16889 a!3118) j!142) mask!3119))))

(declare-fun b!559113 () Bool)

(declare-fun res!350735 () Bool)

(assert (=> b!559113 (=> (not res!350735) (not e!322090))))

(assert (=> b!559113 (= res!350735 (validKeyInArray!0 (select (arr!16889 a!3118) j!142)))))

(declare-fun b!559114 () Bool)

(assert (=> b!559114 (= e!322095 (not (or (undefined!6150 lt!254106) (not (is-Intermediate!5338 lt!254106)) (let ((bdg!16952 (select (arr!16889 a!3118) (index!23581 lt!254106)))) (or (= bdg!16952 (select (arr!16889 a!3118) j!142)) (= bdg!16952 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23581 lt!254106) #b00000000000000000000000000000000) (bvsge (index!23581 lt!254106) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52479 lt!254106) #b01111111111111111111111111111110) (bvsge (x!52479 lt!254106) #b00000000000000000000000000000000)))))))))

(assert (=> b!559114 e!322093))

(declare-fun res!350732 () Bool)

(assert (=> b!559114 (=> (not res!350732) (not e!322093))))

(assert (=> b!559114 (= res!350732 (= lt!254105 (Found!5338 j!142)))))

(assert (=> b!559114 (= lt!254105 (seekEntryOrOpen!0 (select (arr!16889 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!559114 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17450 0))(
  ( (Unit!17451) )
))
(declare-fun lt!254103 () Unit!17450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17450)

(assert (=> b!559114 (= lt!254103 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559115 () Bool)

(declare-fun res!350739 () Bool)

(assert (=> b!559115 (=> (not res!350739) (not e!322089))))

(declare-datatypes ((List!10969 0))(
  ( (Nil!10966) (Cons!10965 (h!11962 (_ BitVec 64)) (t!17197 List!10969)) )
))
(declare-fun arrayNoDuplicates!0 (array!35171 (_ BitVec 32) List!10969) Bool)

(assert (=> b!559115 (= res!350739 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10966))))

(assert (= (and start!51180 res!350737) b!559107))

(assert (= (and b!559107 res!350740) b!559113))

(assert (= (and b!559113 res!350735) b!559110))

(assert (= (and b!559110 res!350730) b!559105))

(assert (= (and b!559105 res!350731) b!559109))

(assert (= (and b!559109 res!350736) b!559108))

(assert (= (and b!559108 res!350733) b!559115))

(assert (= (and b!559115 res!350739) b!559112))

(assert (= (and b!559112 res!350738) b!559114))

(assert (= (and b!559114 res!350732) b!559111))

(assert (= (and b!559111 (not res!350734)) b!559106))

(assert (= (and b!559106 (not res!350741)) b!559104))

(declare-fun m!537023 () Bool)

(assert (=> start!51180 m!537023))

(declare-fun m!537025 () Bool)

(assert (=> start!51180 m!537025))

(declare-fun m!537027 () Bool)

(assert (=> b!559106 m!537027))

(declare-fun m!537029 () Bool)

(assert (=> b!559106 m!537029))

(declare-fun m!537031 () Bool)

(assert (=> b!559115 m!537031))

(assert (=> b!559104 m!537027))

(assert (=> b!559104 m!537027))

(declare-fun m!537033 () Bool)

(assert (=> b!559104 m!537033))

(declare-fun m!537035 () Bool)

(assert (=> b!559109 m!537035))

(declare-fun m!537037 () Bool)

(assert (=> b!559110 m!537037))

(declare-fun m!537039 () Bool)

(assert (=> b!559108 m!537039))

(assert (=> b!559112 m!537027))

(declare-fun m!537041 () Bool)

(assert (=> b!559112 m!537041))

(assert (=> b!559112 m!537027))

(declare-fun m!537043 () Bool)

(assert (=> b!559112 m!537043))

(declare-fun m!537045 () Bool)

(assert (=> b!559112 m!537045))

(assert (=> b!559112 m!537043))

(declare-fun m!537047 () Bool)

(assert (=> b!559112 m!537047))

(assert (=> b!559112 m!537027))

(declare-fun m!537049 () Bool)

(assert (=> b!559112 m!537049))

(assert (=> b!559112 m!537043))

(declare-fun m!537051 () Bool)

(assert (=> b!559112 m!537051))

(assert (=> b!559113 m!537027))

(assert (=> b!559113 m!537027))

(declare-fun m!537053 () Bool)

(assert (=> b!559113 m!537053))

(assert (=> b!559114 m!537029))

(assert (=> b!559114 m!537027))

(declare-fun m!537055 () Bool)

(assert (=> b!559114 m!537055))

(declare-fun m!537057 () Bool)

(assert (=> b!559114 m!537057))

(assert (=> b!559114 m!537027))

(declare-fun m!537059 () Bool)

(assert (=> b!559114 m!537059))

(declare-fun m!537061 () Bool)

(assert (=> b!559105 m!537061))

(push 1)

(assert (not b!559109))

(assert (not b!559108))

(assert (not b!559105))

(assert (not b!559114))

(assert (not b!559110))

(assert (not b!559113))

(assert (not start!51180))

(assert (not b!559115))

(assert (not b!559104))

(assert (not b!559112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83699 () Bool)

(assert (=> d!83699 (= (validKeyInArray!0 (select (arr!16889 a!3118) j!142)) (and (not (= (select (arr!16889 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16889 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559113 d!83699))

(declare-fun b!559218 () Bool)

(declare-fun e!322159 () Bool)

(declare-fun call!32421 () Bool)

(assert (=> b!559218 (= e!322159 call!32421)))

(declare-fun d!83703 () Bool)

(declare-fun res!350774 () Bool)

(declare-fun e!322158 () Bool)

(assert (=> d!83703 (=> res!350774 e!322158)))

(assert (=> d!83703 (= res!350774 (bvsge #b00000000000000000000000000000000 (size!17253 a!3118)))))

(assert (=> d!83703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322158)))

(declare-fun b!559219 () Bool)

(declare-fun e!322160 () Bool)

(assert (=> b!559219 (= e!322158 e!322160)))

(declare-fun c!64566 () Bool)

(assert (=> b!559219 (= c!64566 (validKeyInArray!0 (select (arr!16889 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32418 () Bool)

(assert (=> bm!32418 (= call!32421 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559220 () Bool)

(assert (=> b!559220 (= e!322160 e!322159)))

(declare-fun lt!254163 () (_ BitVec 64))

(assert (=> b!559220 (= lt!254163 (select (arr!16889 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254165 () Unit!17450)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35171 (_ BitVec 64) (_ BitVec 32)) Unit!17450)

(assert (=> b!559220 (= lt!254165 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254163 #b00000000000000000000000000000000))))

(assert (=> b!559220 (arrayContainsKey!0 a!3118 lt!254163 #b00000000000000000000000000000000)))

(declare-fun lt!254164 () Unit!17450)

(assert (=> b!559220 (= lt!254164 lt!254165)))

(declare-fun res!350773 () Bool)

(assert (=> b!559220 (= res!350773 (= (seekEntryOrOpen!0 (select (arr!16889 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5338 #b00000000000000000000000000000000)))))

(assert (=> b!559220 (=> (not res!350773) (not e!322159))))

(declare-fun b!559221 () Bool)

(assert (=> b!559221 (= e!322160 call!32421)))

(assert (= (and d!83703 (not res!350774)) b!559219))

(assert (= (and b!559219 c!64566) b!559220))

(assert (= (and b!559219 (not c!64566)) b!559221))

(assert (= (and b!559220 res!350773) b!559218))

(assert (= (or b!559218 b!559221) bm!32418))

(declare-fun m!537127 () Bool)

(assert (=> b!559219 m!537127))

(assert (=> b!559219 m!537127))

(declare-fun m!537129 () Bool)

(assert (=> b!559219 m!537129))

(declare-fun m!537131 () Bool)

(assert (=> bm!32418 m!537131))

(assert (=> b!559220 m!537127))

(declare-fun m!537133 () Bool)

(assert (=> b!559220 m!537133))

(declare-fun m!537135 () Bool)

(assert (=> b!559220 m!537135))

(assert (=> b!559220 m!537127))

(declare-fun m!537137 () Bool)

(assert (=> b!559220 m!537137))

(assert (=> b!559108 d!83703))

(declare-fun d!83711 () Bool)

(assert (=> d!83711 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51180 d!83711))

(declare-fun d!83717 () Bool)

(assert (=> d!83717 (= (array_inv!12685 a!3118) (bvsge (size!17253 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51180 d!83717))

(declare-fun d!83719 () Bool)

(declare-fun e!322228 () Bool)

(assert (=> d!83719 e!322228))

(declare-fun c!64604 () Bool)

(declare-fun lt!254196 () SeekEntryResult!5338)

(assert (=> d!83719 (= c!64604 (and (is-Intermediate!5338 lt!254196) (undefined!6150 lt!254196)))))

(declare-fun e!322229 () SeekEntryResult!5338)

(assert (=> d!83719 (= lt!254196 e!322229)))

(declare-fun c!64605 () Bool)

(assert (=> d!83719 (= c!64605 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254195 () (_ BitVec 64))

(assert (=> d!83719 (= lt!254195 (select (arr!16889 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118))) lt!254104))))

(assert (=> d!83719 (validMask!0 mask!3119)))

(assert (=> d!83719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254104 (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118)) mask!3119) lt!254196)))

(declare-fun b!559330 () Bool)

(declare-fun e!322227 () SeekEntryResult!5338)

(assert (=> b!559330 (= e!322229 e!322227)))

(declare-fun c!64603 () Bool)

(assert (=> b!559330 (= c!64603 (or (= lt!254195 (select (store (arr!16889 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!254195 lt!254195) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559331 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559331 (= e!322227 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254104 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118)) mask!3119))))

(declare-fun b!559332 () Bool)

(assert (=> b!559332 (= e!322229 (Intermediate!5338 true lt!254104 #b00000000000000000000000000000000))))

(declare-fun b!559333 () Bool)

(declare-fun e!322230 () Bool)

(assert (=> b!559333 (= e!322228 e!322230)))

(declare-fun res!350814 () Bool)

(assert (=> b!559333 (= res!350814 (and (is-Intermediate!5338 lt!254196) (not (undefined!6150 lt!254196)) (bvslt (x!52479 lt!254196) #b01111111111111111111111111111110) (bvsge (x!52479 lt!254196) #b00000000000000000000000000000000) (bvsge (x!52479 lt!254196) #b00000000000000000000000000000000)))))

(assert (=> b!559333 (=> (not res!350814) (not e!322230))))

(declare-fun b!559334 () Bool)

(assert (=> b!559334 (= e!322227 (Intermediate!5338 false lt!254104 #b00000000000000000000000000000000))))

(declare-fun b!559335 () Bool)

(assert (=> b!559335 (= e!322228 (bvsge (x!52479 lt!254196) #b01111111111111111111111111111110))))

(declare-fun b!559336 () Bool)

(assert (=> b!559336 (and (bvsge (index!23581 lt!254196) #b00000000000000000000000000000000) (bvslt (index!23581 lt!254196) (size!17253 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118)))))))

(declare-fun res!350813 () Bool)

(assert (=> b!559336 (= res!350813 (= (select (arr!16889 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118))) (index!23581 lt!254196)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322231 () Bool)

(assert (=> b!559336 (=> res!350813 e!322231)))

(declare-fun b!559337 () Bool)

(assert (=> b!559337 (and (bvsge (index!23581 lt!254196) #b00000000000000000000000000000000) (bvslt (index!23581 lt!254196) (size!17253 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118)))))))

(declare-fun res!350812 () Bool)

(assert (=> b!559337 (= res!350812 (= (select (arr!16889 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118))) (index!23581 lt!254196)) (select (store (arr!16889 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!559337 (=> res!350812 e!322231)))

(assert (=> b!559337 (= e!322230 e!322231)))

(declare-fun b!559338 () Bool)

(assert (=> b!559338 (and (bvsge (index!23581 lt!254196) #b00000000000000000000000000000000) (bvslt (index!23581 lt!254196) (size!17253 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118)))))))

(assert (=> b!559338 (= e!322231 (= (select (arr!16889 (array!35172 (store (arr!16889 a!3118) i!1132 k!1914) (size!17253 a!3118))) (index!23581 lt!254196)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83719 c!64605) b!559332))

(assert (= (and d!83719 (not c!64605)) b!559330))

(assert (= (and b!559330 c!64603) b!559334))

(assert (= (and b!559330 (not c!64603)) b!559331))

(assert (= (and d!83719 c!64604) b!559335))

(assert (= (and d!83719 (not c!64604)) b!559333))

(assert (= (and b!559333 res!350814) b!559337))

(assert (= (and b!559337 (not res!350812)) b!559336))

(assert (= (and b!559336 (not res!350813)) b!559338))

(declare-fun m!537189 () Bool)

(assert (=> b!559338 m!537189))

(declare-fun m!537191 () Bool)

(assert (=> b!559331 m!537191))

(assert (=> b!559331 m!537191))

(assert (=> b!559331 m!537043))

(declare-fun m!537193 () Bool)

(assert (=> b!559331 m!537193))

(assert (=> b!559337 m!537189))

(declare-fun m!537195 () Bool)

(assert (=> d!83719 m!537195))

(assert (=> d!83719 m!537023))

(assert (=> b!559336 m!537189))

(assert (=> b!559112 d!83719))

(declare-fun d!83739 () Bool)

(declare-fun e!322233 () Bool)

(assert (=> d!83739 e!322233))

(declare-fun c!64607 () Bool)

(declare-fun lt!254198 () SeekEntryResult!5338)

(assert (=> d!83739 (= c!64607 (and (is-Intermediate!5338 lt!254198) (undefined!6150 lt!254198)))))

(declare-fun e!322234 () SeekEntryResult!5338)

(assert (=> d!83739 (= lt!254198 e!322234)))

(declare-fun c!64608 () Bool)

(assert (=> d!83739 (= c!64608 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254197 () (_ BitVec 64))

(assert (=> d!83739 (= lt!254197 (select (arr!16889 a!3118) lt!254102))))

(assert (=> d!83739 (validMask!0 mask!3119)))

(assert (=> d!83739 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254102 (select (arr!16889 a!3118) j!142) a!3118 mask!3119) lt!254198)))

(declare-fun b!559339 () Bool)

(declare-fun e!322232 () SeekEntryResult!5338)

(assert (=> b!559339 (= e!322234 e!322232)))

(declare-fun c!64606 () Bool)

(assert (=> b!559339 (= c!64606 (or (= lt!254197 (select (arr!16889 a!3118) j!142)) (= (bvadd lt!254197 lt!254197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!559340 () Bool)

(assert (=> b!559340 (= e!322232 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254102 #b00000000000000000000000000000000 mask!3119) (select (arr!16889 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559341 () Bool)

(assert (=> b!559341 (= e!322234 (Intermediate!5338 true lt!254102 #b00000000000000000000000000000000))))

(declare-fun b!559342 () Bool)

(declare-fun e!322235 () Bool)

(assert (=> b!559342 (= e!322233 e!322235)))

(declare-fun res!350817 () Bool)

(assert (=> b!559342 (= res!350817 (and (is-Intermediate!5338 lt!254198) (not (undefined!6150 lt!254198)) (bvslt (x!52479 lt!254198) #b01111111111111111111111111111110) (bvsge (x!52479 lt!254198) #b00000000000000000000000000000000) (bvsge (x!52479 lt!254198) #b00000000000000000000000000000000)))))

(assert (=> b!559342 (=> (not res!350817) (not e!322235))))

(declare-fun b!559343 () Bool)

(assert (=> b!559343 (= e!322232 (Intermediate!5338 false lt!254102 #b00000000000000000000000000000000))))

(declare-fun b!559344 () Bool)

(assert (=> b!559344 (= e!322233 (bvsge (x!52479 lt!254198) #b01111111111111111111111111111110))))

(declare-fun b!559345 () Bool)

(assert (=> b!559345 (and (bvsge (index!23581 lt!254198) #b00000000000000000000000000000000) (bvslt (index!23581 lt!254198) (size!17253 a!3118)))))

(declare-fun res!350816 () Bool)

(assert (=> b!559345 (= res!350816 (= (select (arr!16889 a!3118) (index!23581 lt!254198)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322236 () Bool)

(assert (=> b!559345 (=> res!350816 e!322236)))

(declare-fun b!559346 () Bool)

(assert (=> b!559346 (and (bvsge (index!23581 lt!254198) #b00000000000000000000000000000000) (bvslt (index!23581 lt!254198) (size!17253 a!3118)))))

(declare-fun res!350815 () Bool)

(assert (=> b!559346 (= res!350815 (= (select (arr!16889 a!3118) (index!23581 lt!254198)) (select (arr!16889 a!3118) j!142)))))

(assert (=> b!559346 (=> res!350815 e!322236)))

(assert (=> b!559346 (= e!322235 e!322236)))

(declare-fun b!559347 () Bool)

(assert (=> b!559347 (and (bvsge (index!23581 lt!254198) #b00000000000000000000000000000000) (bvslt (index!23581 lt!254198) (size!17253 a!3118)))))

(assert (=> b!559347 (= e!322236 (= (select (arr!16889 a!3118) (index!23581 lt!254198)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83739 c!64608) b!559341))

(assert (= (and d!83739 (not c!64608)) b!559339))

(assert (= (and b!559339 c!64606) b!559343))

(assert (= (and b!559339 (not c!64606)) b!559340))

(assert (= (and d!83739 c!64607) b!559344))

(assert (= (and d!83739 (not c!64607)) b!559342))

(assert (= (and b!559342 res!350817) b!559346))

(assert (= (and b!559346 (not res!350815)) b!559345))

(assert (= (and b!559345 (not res!350816)) b!559347))

(declare-fun m!537197 () Bool)

(assert (=> b!559347 m!537197))

(declare-fun m!537199 () Bool)

(assert (=> b!559340 m!537199))

(assert (=> b!559340 m!537199))

(assert (=> b!559340 m!537027))

(declare-fun m!537201 () Bool)

(assert (=> b!559340 m!537201))

(assert (=> b!559346 m!537197))

(declare-fun m!537203 () Bool)

(assert (=> d!83739 m!537203))

(assert (=> d!83739 m!537023))

(assert (=> b!559345 m!537197))

(assert (=> b!559112 d!83739))

(declare-fun d!83741 () Bool)

(declare-fun lt!254204 () (_ BitVec 32))

(declare-fun lt!254203 () (_ BitVec 32))

(assert (=> d!83741 (= lt!254204 (bvmul (bvxor lt!254203 (bvlshr lt!254203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83741 (= lt!254203 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83741 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350818 (let ((h!11965 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52486 (bvmul (bvxor h!11965 (bvlshr h!11965 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52486 (bvlshr x!52486 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350818 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350818 #b00000000000000000000000000000000))))))

(assert (=> d!83741 (= (toIndex!0 (select (store (arr!16889 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!254204 (bvlshr lt!254204 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559112 d!83741))

(declare-fun d!83743 () Bool)

(declare-fun lt!254206 () (_ BitVec 32))

(declare-fun lt!254205 () (_ BitVec 32))

(assert (=> d!83743 (= lt!254206 (bvmul (bvxor lt!254205 (bvlshr lt!254205 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

