; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51178 () Bool)

(assert start!51178)

(declare-fun b!559068 () Bool)

(declare-fun e!322073 () Bool)

(declare-fun e!322069 () Bool)

(assert (=> b!559068 (= e!322073 e!322069)))

(declare-fun res!350694 () Bool)

(assert (=> b!559068 (=> res!350694 e!322069)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!254080 () (_ BitVec 64))

(declare-datatypes ((array!35169 0))(
  ( (array!35170 (arr!16888 (Array (_ BitVec 32) (_ BitVec 64))) (size!17252 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35169)

(assert (=> b!559068 (= res!350694 (or (= lt!254080 (select (arr!16888 a!3118) j!142)) (= lt!254080 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!5337 0))(
  ( (MissingZero!5337 (index!23575 (_ BitVec 32))) (Found!5337 (index!23576 (_ BitVec 32))) (Intermediate!5337 (undefined!6149 Bool) (index!23577 (_ BitVec 32)) (x!52478 (_ BitVec 32))) (Undefined!5337) (MissingVacant!5337 (index!23578 (_ BitVec 32))) )
))
(declare-fun lt!254084 () SeekEntryResult!5337)

(assert (=> b!559068 (= lt!254080 (select (arr!16888 a!3118) (index!23577 lt!254084)))))

(declare-fun b!559069 () Bool)

(declare-fun res!350698 () Bool)

(declare-fun e!322074 () Bool)

(assert (=> b!559069 (=> (not res!350698) (not e!322074))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!559069 (= res!350698 (validKeyInArray!0 k0!1914))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!254085 () SeekEntryResult!5337)

(declare-fun b!559070 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35169 (_ BitVec 32)) SeekEntryResult!5337)

(assert (=> b!559070 (= e!322069 (= lt!254085 (seekKeyOrZeroReturnVacant!0 (x!52478 lt!254084) (index!23577 lt!254084) (index!23577 lt!254084) (select (arr!16888 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!559071 () Bool)

(declare-fun e!322070 () Bool)

(assert (=> b!559071 (= e!322070 e!322073)))

(declare-fun res!350696 () Bool)

(assert (=> b!559071 (=> res!350696 e!322073)))

(get-info :version)

(assert (=> b!559071 (= res!350696 (or (undefined!6149 lt!254084) (not ((_ is Intermediate!5337) lt!254084))))))

(declare-fun b!559072 () Bool)

(declare-fun res!350705 () Bool)

(assert (=> b!559072 (=> (not res!350705) (not e!322074))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!559072 (= res!350705 (and (= (size!17252 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17252 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17252 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!559074 () Bool)

(declare-fun e!322071 () Bool)

(assert (=> b!559074 (= e!322074 e!322071)))

(declare-fun res!350695 () Bool)

(assert (=> b!559074 (=> (not res!350695) (not e!322071))))

(declare-fun lt!254083 () SeekEntryResult!5337)

(assert (=> b!559074 (= res!350695 (or (= lt!254083 (MissingZero!5337 i!1132)) (= lt!254083 (MissingVacant!5337 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35169 (_ BitVec 32)) SeekEntryResult!5337)

(assert (=> b!559074 (= lt!254083 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!559075 () Bool)

(declare-fun res!350704 () Bool)

(assert (=> b!559075 (=> (not res!350704) (not e!322074))))

(declare-fun arrayContainsKey!0 (array!35169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!559075 (= res!350704 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun e!322068 () Bool)

(declare-fun b!559076 () Bool)

(assert (=> b!559076 (= e!322068 (not (or (undefined!6149 lt!254084) (not ((_ is Intermediate!5337) lt!254084)) (let ((bdg!16952 (select (arr!16888 a!3118) (index!23577 lt!254084)))) (or (= bdg!16952 (select (arr!16888 a!3118) j!142)) (= bdg!16952 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (bvslt (index!23577 lt!254084) #b00000000000000000000000000000000) (bvsge (index!23577 lt!254084) (bvadd #b00000000000000000000000000000001 mask!3119)) (and (bvsle (x!52478 lt!254084) #b01111111111111111111111111111110) (bvsge (x!52478 lt!254084) #b00000000000000000000000000000000)))))))))

(assert (=> b!559076 e!322070))

(declare-fun res!350700 () Bool)

(assert (=> b!559076 (=> (not res!350700) (not e!322070))))

(assert (=> b!559076 (= res!350700 (= lt!254085 (Found!5337 j!142)))))

(assert (=> b!559076 (= lt!254085 (seekEntryOrOpen!0 (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35169 (_ BitVec 32)) Bool)

(assert (=> b!559076 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17448 0))(
  ( (Unit!17449) )
))
(declare-fun lt!254086 () Unit!17448)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17448)

(assert (=> b!559076 (= lt!254086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!559077 () Bool)

(declare-fun res!350701 () Bool)

(assert (=> b!559077 (=> (not res!350701) (not e!322071))))

(assert (=> b!559077 (= res!350701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!559078 () Bool)

(assert (=> b!559078 (= e!322071 e!322068)))

(declare-fun res!350697 () Bool)

(assert (=> b!559078 (=> (not res!350697) (not e!322068))))

(declare-fun lt!254082 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35169 (_ BitVec 32)) SeekEntryResult!5337)

(assert (=> b!559078 (= res!350697 (= lt!254084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254082 (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)) mask!3119)))))

(declare-fun lt!254081 () (_ BitVec 32))

(assert (=> b!559078 (= lt!254084 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254081 (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559078 (= lt!254082 (toIndex!0 (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!559078 (= lt!254081 (toIndex!0 (select (arr!16888 a!3118) j!142) mask!3119))))

(declare-fun b!559079 () Bool)

(declare-fun res!350703 () Bool)

(assert (=> b!559079 (=> (not res!350703) (not e!322071))))

(declare-datatypes ((List!10968 0))(
  ( (Nil!10965) (Cons!10964 (h!11961 (_ BitVec 64)) (t!17196 List!10968)) )
))
(declare-fun arrayNoDuplicates!0 (array!35169 (_ BitVec 32) List!10968) Bool)

(assert (=> b!559079 (= res!350703 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10965))))

(declare-fun b!559073 () Bool)

(declare-fun res!350699 () Bool)

(assert (=> b!559073 (=> (not res!350699) (not e!322074))))

(assert (=> b!559073 (= res!350699 (validKeyInArray!0 (select (arr!16888 a!3118) j!142)))))

(declare-fun res!350702 () Bool)

(assert (=> start!51178 (=> (not res!350702) (not e!322074))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51178 (= res!350702 (validMask!0 mask!3119))))

(assert (=> start!51178 e!322074))

(assert (=> start!51178 true))

(declare-fun array_inv!12684 (array!35169) Bool)

(assert (=> start!51178 (array_inv!12684 a!3118)))

(assert (= (and start!51178 res!350702) b!559072))

(assert (= (and b!559072 res!350705) b!559073))

(assert (= (and b!559073 res!350699) b!559069))

(assert (= (and b!559069 res!350698) b!559075))

(assert (= (and b!559075 res!350704) b!559074))

(assert (= (and b!559074 res!350695) b!559077))

(assert (= (and b!559077 res!350701) b!559079))

(assert (= (and b!559079 res!350703) b!559078))

(assert (= (and b!559078 res!350697) b!559076))

(assert (= (and b!559076 res!350700) b!559071))

(assert (= (and b!559071 (not res!350696)) b!559068))

(assert (= (and b!559068 (not res!350694)) b!559070))

(declare-fun m!536983 () Bool)

(assert (=> b!559073 m!536983))

(assert (=> b!559073 m!536983))

(declare-fun m!536985 () Bool)

(assert (=> b!559073 m!536985))

(declare-fun m!536987 () Bool)

(assert (=> start!51178 m!536987))

(declare-fun m!536989 () Bool)

(assert (=> start!51178 m!536989))

(declare-fun m!536991 () Bool)

(assert (=> b!559079 m!536991))

(declare-fun m!536993 () Bool)

(assert (=> b!559077 m!536993))

(declare-fun m!536995 () Bool)

(assert (=> b!559078 m!536995))

(declare-fun m!536997 () Bool)

(assert (=> b!559078 m!536997))

(assert (=> b!559078 m!536983))

(declare-fun m!536999 () Bool)

(assert (=> b!559078 m!536999))

(assert (=> b!559078 m!536983))

(assert (=> b!559078 m!536995))

(assert (=> b!559078 m!536983))

(declare-fun m!537001 () Bool)

(assert (=> b!559078 m!537001))

(declare-fun m!537003 () Bool)

(assert (=> b!559078 m!537003))

(assert (=> b!559078 m!536995))

(declare-fun m!537005 () Bool)

(assert (=> b!559078 m!537005))

(declare-fun m!537007 () Bool)

(assert (=> b!559075 m!537007))

(declare-fun m!537009 () Bool)

(assert (=> b!559074 m!537009))

(assert (=> b!559076 m!536983))

(declare-fun m!537011 () Bool)

(assert (=> b!559076 m!537011))

(assert (=> b!559076 m!536983))

(declare-fun m!537013 () Bool)

(assert (=> b!559076 m!537013))

(declare-fun m!537015 () Bool)

(assert (=> b!559076 m!537015))

(declare-fun m!537017 () Bool)

(assert (=> b!559076 m!537017))

(assert (=> b!559070 m!536983))

(assert (=> b!559070 m!536983))

(declare-fun m!537019 () Bool)

(assert (=> b!559070 m!537019))

(assert (=> b!559068 m!536983))

(assert (=> b!559068 m!537015))

(declare-fun m!537021 () Bool)

(assert (=> b!559069 m!537021))

(check-sat (not b!559076) (not b!559078) (not b!559079) (not start!51178) (not b!559073) (not b!559075) (not b!559074) (not b!559070) (not b!559069) (not b!559077))
(check-sat)
(get-model)

(declare-fun bm!32414 () Bool)

(declare-fun call!32417 () Bool)

(assert (=> bm!32414 (= call!32417 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559124 () Bool)

(declare-fun e!322104 () Bool)

(declare-fun e!322103 () Bool)

(assert (=> b!559124 (= e!322104 e!322103)))

(declare-fun lt!254115 () (_ BitVec 64))

(assert (=> b!559124 (= lt!254115 (select (arr!16888 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254114 () Unit!17448)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35169 (_ BitVec 64) (_ BitVec 32)) Unit!17448)

(assert (=> b!559124 (= lt!254114 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254115 #b00000000000000000000000000000000))))

(assert (=> b!559124 (arrayContainsKey!0 a!3118 lt!254115 #b00000000000000000000000000000000)))

(declare-fun lt!254116 () Unit!17448)

(assert (=> b!559124 (= lt!254116 lt!254114)))

(declare-fun res!350747 () Bool)

(assert (=> b!559124 (= res!350747 (= (seekEntryOrOpen!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5337 #b00000000000000000000000000000000)))))

(assert (=> b!559124 (=> (not res!350747) (not e!322103))))

(declare-fun b!559125 () Bool)

(declare-fun e!322102 () Bool)

(assert (=> b!559125 (= e!322102 e!322104)))

(declare-fun c!64532 () Bool)

(assert (=> b!559125 (= c!64532 (validKeyInArray!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559126 () Bool)

(assert (=> b!559126 (= e!322103 call!32417)))

(declare-fun b!559127 () Bool)

(assert (=> b!559127 (= e!322104 call!32417)))

(declare-fun d!83679 () Bool)

(declare-fun res!350746 () Bool)

(assert (=> d!83679 (=> res!350746 e!322102)))

(assert (=> d!83679 (= res!350746 (bvsge #b00000000000000000000000000000000 (size!17252 a!3118)))))

(assert (=> d!83679 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322102)))

(assert (= (and d!83679 (not res!350746)) b!559125))

(assert (= (and b!559125 c!64532) b!559124))

(assert (= (and b!559125 (not c!64532)) b!559127))

(assert (= (and b!559124 res!350747) b!559126))

(assert (= (or b!559126 b!559127) bm!32414))

(declare-fun m!537063 () Bool)

(assert (=> bm!32414 m!537063))

(declare-fun m!537065 () Bool)

(assert (=> b!559124 m!537065))

(declare-fun m!537067 () Bool)

(assert (=> b!559124 m!537067))

(declare-fun m!537069 () Bool)

(assert (=> b!559124 m!537069))

(assert (=> b!559124 m!537065))

(declare-fun m!537071 () Bool)

(assert (=> b!559124 m!537071))

(assert (=> b!559125 m!537065))

(assert (=> b!559125 m!537065))

(declare-fun m!537073 () Bool)

(assert (=> b!559125 m!537073))

(assert (=> b!559077 d!83679))

(declare-fun b!559146 () Bool)

(declare-fun e!322119 () SeekEntryResult!5337)

(assert (=> b!559146 (= e!322119 (Intermediate!5337 true lt!254082 #b00000000000000000000000000000000))))

(declare-fun e!322115 () SeekEntryResult!5337)

(declare-fun b!559147 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!559147 (= e!322115 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254082 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)) mask!3119))))

(declare-fun b!559148 () Bool)

(declare-fun e!322118 () Bool)

(declare-fun e!322116 () Bool)

(assert (=> b!559148 (= e!322118 e!322116)))

(declare-fun res!350754 () Bool)

(declare-fun lt!254121 () SeekEntryResult!5337)

(assert (=> b!559148 (= res!350754 (and ((_ is Intermediate!5337) lt!254121) (not (undefined!6149 lt!254121)) (bvslt (x!52478 lt!254121) #b01111111111111111111111111111110) (bvsge (x!52478 lt!254121) #b00000000000000000000000000000000) (bvsge (x!52478 lt!254121) #b00000000000000000000000000000000)))))

(assert (=> b!559148 (=> (not res!350754) (not e!322116))))

(declare-fun b!559149 () Bool)

(assert (=> b!559149 (and (bvsge (index!23577 lt!254121) #b00000000000000000000000000000000) (bvslt (index!23577 lt!254121) (size!17252 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)))))))

(declare-fun e!322117 () Bool)

(assert (=> b!559149 (= e!322117 (= (select (arr!16888 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) (index!23577 lt!254121)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559150 () Bool)

(assert (=> b!559150 (= e!322118 (bvsge (x!52478 lt!254121) #b01111111111111111111111111111110))))

(declare-fun b!559151 () Bool)

(assert (=> b!559151 (and (bvsge (index!23577 lt!254121) #b00000000000000000000000000000000) (bvslt (index!23577 lt!254121) (size!17252 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)))))))

(declare-fun res!350755 () Bool)

(assert (=> b!559151 (= res!350755 (= (select (arr!16888 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) (index!23577 lt!254121)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559151 (=> res!350755 e!322117)))

(declare-fun b!559152 () Bool)

(assert (=> b!559152 (= e!322119 e!322115)))

(declare-fun c!64541 () Bool)

(declare-fun lt!254122 () (_ BitVec 64))

(assert (=> b!559152 (= c!64541 (or (= lt!254122 (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142)) (= (bvadd lt!254122 lt!254122) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83681 () Bool)

(assert (=> d!83681 e!322118))

(declare-fun c!64540 () Bool)

(assert (=> d!83681 (= c!64540 (and ((_ is Intermediate!5337) lt!254121) (undefined!6149 lt!254121)))))

(assert (=> d!83681 (= lt!254121 e!322119)))

(declare-fun c!64539 () Bool)

(assert (=> d!83681 (= c!64539 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83681 (= lt!254122 (select (arr!16888 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) lt!254082))))

(assert (=> d!83681 (validMask!0 mask!3119)))

(assert (=> d!83681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254082 (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)) mask!3119) lt!254121)))

(declare-fun b!559153 () Bool)

(assert (=> b!559153 (= e!322115 (Intermediate!5337 false lt!254082 #b00000000000000000000000000000000))))

(declare-fun b!559154 () Bool)

(assert (=> b!559154 (and (bvsge (index!23577 lt!254121) #b00000000000000000000000000000000) (bvslt (index!23577 lt!254121) (size!17252 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118)))))))

(declare-fun res!350756 () Bool)

(assert (=> b!559154 (= res!350756 (= (select (arr!16888 (array!35170 (store (arr!16888 a!3118) i!1132 k0!1914) (size!17252 a!3118))) (index!23577 lt!254121)) (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142)))))

(assert (=> b!559154 (=> res!350756 e!322117)))

(assert (=> b!559154 (= e!322116 e!322117)))

(assert (= (and d!83681 c!64539) b!559146))

(assert (= (and d!83681 (not c!64539)) b!559152))

(assert (= (and b!559152 c!64541) b!559153))

(assert (= (and b!559152 (not c!64541)) b!559147))

(assert (= (and d!83681 c!64540) b!559150))

(assert (= (and d!83681 (not c!64540)) b!559148))

(assert (= (and b!559148 res!350754) b!559154))

(assert (= (and b!559154 (not res!350756)) b!559151))

(assert (= (and b!559151 (not res!350755)) b!559149))

(declare-fun m!537075 () Bool)

(assert (=> b!559151 m!537075))

(declare-fun m!537077 () Bool)

(assert (=> d!83681 m!537077))

(assert (=> d!83681 m!536987))

(assert (=> b!559149 m!537075))

(declare-fun m!537079 () Bool)

(assert (=> b!559147 m!537079))

(assert (=> b!559147 m!537079))

(assert (=> b!559147 m!536995))

(declare-fun m!537081 () Bool)

(assert (=> b!559147 m!537081))

(assert (=> b!559154 m!537075))

(assert (=> b!559078 d!83681))

(declare-fun b!559155 () Bool)

(declare-fun e!322124 () SeekEntryResult!5337)

(assert (=> b!559155 (= e!322124 (Intermediate!5337 true lt!254081 #b00000000000000000000000000000000))))

(declare-fun e!322120 () SeekEntryResult!5337)

(declare-fun b!559156 () Bool)

(assert (=> b!559156 (= e!322120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!254081 #b00000000000000000000000000000000 mask!3119) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559157 () Bool)

(declare-fun e!322123 () Bool)

(declare-fun e!322121 () Bool)

(assert (=> b!559157 (= e!322123 e!322121)))

(declare-fun res!350757 () Bool)

(declare-fun lt!254123 () SeekEntryResult!5337)

(assert (=> b!559157 (= res!350757 (and ((_ is Intermediate!5337) lt!254123) (not (undefined!6149 lt!254123)) (bvslt (x!52478 lt!254123) #b01111111111111111111111111111110) (bvsge (x!52478 lt!254123) #b00000000000000000000000000000000) (bvsge (x!52478 lt!254123) #b00000000000000000000000000000000)))))

(assert (=> b!559157 (=> (not res!350757) (not e!322121))))

(declare-fun b!559158 () Bool)

(assert (=> b!559158 (and (bvsge (index!23577 lt!254123) #b00000000000000000000000000000000) (bvslt (index!23577 lt!254123) (size!17252 a!3118)))))

(declare-fun e!322122 () Bool)

(assert (=> b!559158 (= e!322122 (= (select (arr!16888 a!3118) (index!23577 lt!254123)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!559159 () Bool)

(assert (=> b!559159 (= e!322123 (bvsge (x!52478 lt!254123) #b01111111111111111111111111111110))))

(declare-fun b!559160 () Bool)

(assert (=> b!559160 (and (bvsge (index!23577 lt!254123) #b00000000000000000000000000000000) (bvslt (index!23577 lt!254123) (size!17252 a!3118)))))

(declare-fun res!350758 () Bool)

(assert (=> b!559160 (= res!350758 (= (select (arr!16888 a!3118) (index!23577 lt!254123)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559160 (=> res!350758 e!322122)))

(declare-fun b!559161 () Bool)

(assert (=> b!559161 (= e!322124 e!322120)))

(declare-fun lt!254124 () (_ BitVec 64))

(declare-fun c!64544 () Bool)

(assert (=> b!559161 (= c!64544 (or (= lt!254124 (select (arr!16888 a!3118) j!142)) (= (bvadd lt!254124 lt!254124) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83683 () Bool)

(assert (=> d!83683 e!322123))

(declare-fun c!64543 () Bool)

(assert (=> d!83683 (= c!64543 (and ((_ is Intermediate!5337) lt!254123) (undefined!6149 lt!254123)))))

(assert (=> d!83683 (= lt!254123 e!322124)))

(declare-fun c!64542 () Bool)

(assert (=> d!83683 (= c!64542 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83683 (= lt!254124 (select (arr!16888 a!3118) lt!254081))))

(assert (=> d!83683 (validMask!0 mask!3119)))

(assert (=> d!83683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!254081 (select (arr!16888 a!3118) j!142) a!3118 mask!3119) lt!254123)))

(declare-fun b!559162 () Bool)

(assert (=> b!559162 (= e!322120 (Intermediate!5337 false lt!254081 #b00000000000000000000000000000000))))

(declare-fun b!559163 () Bool)

(assert (=> b!559163 (and (bvsge (index!23577 lt!254123) #b00000000000000000000000000000000) (bvslt (index!23577 lt!254123) (size!17252 a!3118)))))

(declare-fun res!350759 () Bool)

(assert (=> b!559163 (= res!350759 (= (select (arr!16888 a!3118) (index!23577 lt!254123)) (select (arr!16888 a!3118) j!142)))))

(assert (=> b!559163 (=> res!350759 e!322122)))

(assert (=> b!559163 (= e!322121 e!322122)))

(assert (= (and d!83683 c!64542) b!559155))

(assert (= (and d!83683 (not c!64542)) b!559161))

(assert (= (and b!559161 c!64544) b!559162))

(assert (= (and b!559161 (not c!64544)) b!559156))

(assert (= (and d!83683 c!64543) b!559159))

(assert (= (and d!83683 (not c!64543)) b!559157))

(assert (= (and b!559157 res!350757) b!559163))

(assert (= (and b!559163 (not res!350759)) b!559160))

(assert (= (and b!559160 (not res!350758)) b!559158))

(declare-fun m!537083 () Bool)

(assert (=> b!559160 m!537083))

(declare-fun m!537085 () Bool)

(assert (=> d!83683 m!537085))

(assert (=> d!83683 m!536987))

(assert (=> b!559158 m!537083))

(declare-fun m!537087 () Bool)

(assert (=> b!559156 m!537087))

(assert (=> b!559156 m!537087))

(assert (=> b!559156 m!536983))

(declare-fun m!537089 () Bool)

(assert (=> b!559156 m!537089))

(assert (=> b!559163 m!537083))

(assert (=> b!559078 d!83683))

(declare-fun d!83685 () Bool)

(declare-fun lt!254130 () (_ BitVec 32))

(declare-fun lt!254129 () (_ BitVec 32))

(assert (=> d!83685 (= lt!254130 (bvmul (bvxor lt!254129 (bvlshr lt!254129 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83685 (= lt!254129 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83685 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350760 (let ((h!11963 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) (bvlshr (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52481 (bvmul (bvxor h!11963 (bvlshr h!11963 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52481 (bvlshr x!52481 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350760 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350760 #b00000000000000000000000000000000))))))

(assert (=> d!83685 (= (toIndex!0 (select (store (arr!16888 a!3118) i!1132 k0!1914) j!142) mask!3119) (bvand (bvxor lt!254130 (bvlshr lt!254130 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559078 d!83685))

(declare-fun d!83687 () Bool)

(declare-fun lt!254132 () (_ BitVec 32))

(declare-fun lt!254131 () (_ BitVec 32))

(assert (=> d!83687 (= lt!254132 (bvmul (bvxor lt!254131 (bvlshr lt!254131 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83687 (= lt!254131 ((_ extract 31 0) (bvand (bvxor (select (arr!16888 a!3118) j!142) (bvlshr (select (arr!16888 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83687 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350760 (let ((h!11963 ((_ extract 31 0) (bvand (bvxor (select (arr!16888 a!3118) j!142) (bvlshr (select (arr!16888 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52481 (bvmul (bvxor h!11963 (bvlshr h!11963 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52481 (bvlshr x!52481 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350760 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350760 #b00000000000000000000000000000000))))))

(assert (=> d!83687 (= (toIndex!0 (select (arr!16888 a!3118) j!142) mask!3119) (bvand (bvxor lt!254132 (bvlshr lt!254132 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!559078 d!83687))

(declare-fun b!559176 () Bool)

(declare-fun e!322132 () SeekEntryResult!5337)

(declare-fun lt!254139 () SeekEntryResult!5337)

(assert (=> b!559176 (= e!322132 (MissingZero!5337 (index!23577 lt!254139)))))

(declare-fun b!559177 () Bool)

(assert (=> b!559177 (= e!322132 (seekKeyOrZeroReturnVacant!0 (x!52478 lt!254139) (index!23577 lt!254139) (index!23577 lt!254139) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83689 () Bool)

(declare-fun lt!254140 () SeekEntryResult!5337)

(assert (=> d!83689 (and (or ((_ is Undefined!5337) lt!254140) (not ((_ is Found!5337) lt!254140)) (and (bvsge (index!23576 lt!254140) #b00000000000000000000000000000000) (bvslt (index!23576 lt!254140) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254140) ((_ is Found!5337) lt!254140) (not ((_ is MissingZero!5337) lt!254140)) (and (bvsge (index!23575 lt!254140) #b00000000000000000000000000000000) (bvslt (index!23575 lt!254140) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254140) ((_ is Found!5337) lt!254140) ((_ is MissingZero!5337) lt!254140) (not ((_ is MissingVacant!5337) lt!254140)) (and (bvsge (index!23578 lt!254140) #b00000000000000000000000000000000) (bvslt (index!23578 lt!254140) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254140) (ite ((_ is Found!5337) lt!254140) (= (select (arr!16888 a!3118) (index!23576 lt!254140)) (select (arr!16888 a!3118) j!142)) (ite ((_ is MissingZero!5337) lt!254140) (= (select (arr!16888 a!3118) (index!23575 lt!254140)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5337) lt!254140) (= (select (arr!16888 a!3118) (index!23578 lt!254140)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322131 () SeekEntryResult!5337)

(assert (=> d!83689 (= lt!254140 e!322131)))

(declare-fun c!64552 () Bool)

(assert (=> d!83689 (= c!64552 (and ((_ is Intermediate!5337) lt!254139) (undefined!6149 lt!254139)))))

(assert (=> d!83689 (= lt!254139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16888 a!3118) j!142) mask!3119) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83689 (validMask!0 mask!3119)))

(assert (=> d!83689 (= (seekEntryOrOpen!0 (select (arr!16888 a!3118) j!142) a!3118 mask!3119) lt!254140)))

(declare-fun b!559178 () Bool)

(assert (=> b!559178 (= e!322131 Undefined!5337)))

(declare-fun b!559179 () Bool)

(declare-fun c!64553 () Bool)

(declare-fun lt!254141 () (_ BitVec 64))

(assert (=> b!559179 (= c!64553 (= lt!254141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322133 () SeekEntryResult!5337)

(assert (=> b!559179 (= e!322133 e!322132)))

(declare-fun b!559180 () Bool)

(assert (=> b!559180 (= e!322133 (Found!5337 (index!23577 lt!254139)))))

(declare-fun b!559181 () Bool)

(assert (=> b!559181 (= e!322131 e!322133)))

(assert (=> b!559181 (= lt!254141 (select (arr!16888 a!3118) (index!23577 lt!254139)))))

(declare-fun c!64551 () Bool)

(assert (=> b!559181 (= c!64551 (= lt!254141 (select (arr!16888 a!3118) j!142)))))

(assert (= (and d!83689 c!64552) b!559178))

(assert (= (and d!83689 (not c!64552)) b!559181))

(assert (= (and b!559181 c!64551) b!559180))

(assert (= (and b!559181 (not c!64551)) b!559179))

(assert (= (and b!559179 c!64553) b!559176))

(assert (= (and b!559179 (not c!64553)) b!559177))

(assert (=> b!559177 m!536983))

(declare-fun m!537091 () Bool)

(assert (=> b!559177 m!537091))

(declare-fun m!537093 () Bool)

(assert (=> d!83689 m!537093))

(assert (=> d!83689 m!536987))

(assert (=> d!83689 m!536999))

(assert (=> d!83689 m!536983))

(declare-fun m!537095 () Bool)

(assert (=> d!83689 m!537095))

(assert (=> d!83689 m!536983))

(assert (=> d!83689 m!536999))

(declare-fun m!537097 () Bool)

(assert (=> d!83689 m!537097))

(declare-fun m!537099 () Bool)

(assert (=> d!83689 m!537099))

(declare-fun m!537101 () Bool)

(assert (=> b!559181 m!537101))

(assert (=> b!559076 d!83689))

(declare-fun call!32418 () Bool)

(declare-fun bm!32415 () Bool)

(assert (=> bm!32415 (= call!32418 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!559182 () Bool)

(declare-fun e!322136 () Bool)

(declare-fun e!322135 () Bool)

(assert (=> b!559182 (= e!322136 e!322135)))

(declare-fun lt!254143 () (_ BitVec 64))

(assert (=> b!559182 (= lt!254143 (select (arr!16888 a!3118) j!142))))

(declare-fun lt!254142 () Unit!17448)

(assert (=> b!559182 (= lt!254142 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254143 j!142))))

(assert (=> b!559182 (arrayContainsKey!0 a!3118 lt!254143 #b00000000000000000000000000000000)))

(declare-fun lt!254144 () Unit!17448)

(assert (=> b!559182 (= lt!254144 lt!254142)))

(declare-fun res!350762 () Bool)

(assert (=> b!559182 (= res!350762 (= (seekEntryOrOpen!0 (select (arr!16888 a!3118) j!142) a!3118 mask!3119) (Found!5337 j!142)))))

(assert (=> b!559182 (=> (not res!350762) (not e!322135))))

(declare-fun b!559183 () Bool)

(declare-fun e!322134 () Bool)

(assert (=> b!559183 (= e!322134 e!322136)))

(declare-fun c!64554 () Bool)

(assert (=> b!559183 (= c!64554 (validKeyInArray!0 (select (arr!16888 a!3118) j!142)))))

(declare-fun b!559184 () Bool)

(assert (=> b!559184 (= e!322135 call!32418)))

(declare-fun b!559185 () Bool)

(assert (=> b!559185 (= e!322136 call!32418)))

(declare-fun d!83693 () Bool)

(declare-fun res!350761 () Bool)

(assert (=> d!83693 (=> res!350761 e!322134)))

(assert (=> d!83693 (= res!350761 (bvsge j!142 (size!17252 a!3118)))))

(assert (=> d!83693 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!322134)))

(assert (= (and d!83693 (not res!350761)) b!559183))

(assert (= (and b!559183 c!64554) b!559182))

(assert (= (and b!559183 (not c!64554)) b!559185))

(assert (= (and b!559182 res!350762) b!559184))

(assert (= (or b!559184 b!559185) bm!32415))

(declare-fun m!537103 () Bool)

(assert (=> bm!32415 m!537103))

(assert (=> b!559182 m!536983))

(declare-fun m!537105 () Bool)

(assert (=> b!559182 m!537105))

(declare-fun m!537107 () Bool)

(assert (=> b!559182 m!537107))

(assert (=> b!559182 m!536983))

(assert (=> b!559182 m!537013))

(assert (=> b!559183 m!536983))

(assert (=> b!559183 m!536983))

(assert (=> b!559183 m!536985))

(assert (=> b!559076 d!83693))

(declare-fun d!83695 () Bool)

(assert (=> d!83695 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!254153 () Unit!17448)

(declare-fun choose!38 (array!35169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17448)

(assert (=> d!83695 (= lt!254153 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83695 (validMask!0 mask!3119)))

(assert (=> d!83695 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!254153)))

(declare-fun bs!17392 () Bool)

(assert (= bs!17392 d!83695))

(assert (=> bs!17392 m!537011))

(declare-fun m!537109 () Bool)

(assert (=> bs!17392 m!537109))

(assert (=> bs!17392 m!536987))

(assert (=> b!559076 d!83695))

(declare-fun d!83697 () Bool)

(assert (=> d!83697 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559069 d!83697))

(declare-fun d!83701 () Bool)

(declare-fun res!350767 () Bool)

(declare-fun e!322150 () Bool)

(assert (=> d!83701 (=> res!350767 e!322150)))

(assert (=> d!83701 (= res!350767 (= (select (arr!16888 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!83701 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!322150)))

(declare-fun b!559208 () Bool)

(declare-fun e!322151 () Bool)

(assert (=> b!559208 (= e!322150 e!322151)))

(declare-fun res!350768 () Bool)

(assert (=> b!559208 (=> (not res!350768) (not e!322151))))

(assert (=> b!559208 (= res!350768 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17252 a!3118)))))

(declare-fun b!559209 () Bool)

(assert (=> b!559209 (= e!322151 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83701 (not res!350767)) b!559208))

(assert (= (and b!559208 res!350768) b!559209))

(assert (=> d!83701 m!537065))

(declare-fun m!537125 () Bool)

(assert (=> b!559209 m!537125))

(assert (=> b!559075 d!83701))

(declare-fun d!83707 () Bool)

(assert (=> d!83707 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51178 d!83707))

(declare-fun d!83713 () Bool)

(assert (=> d!83713 (= (array_inv!12684 a!3118) (bvsge (size!17252 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51178 d!83713))

(declare-fun b!559270 () Bool)

(declare-fun e!322187 () SeekEntryResult!5337)

(assert (=> b!559270 (= e!322187 (MissingVacant!5337 (index!23577 lt!254084)))))

(declare-fun b!559271 () Bool)

(declare-fun e!322188 () SeekEntryResult!5337)

(assert (=> b!559271 (= e!322188 (Found!5337 (index!23577 lt!254084)))))

(declare-fun d!83715 () Bool)

(declare-fun lt!254178 () SeekEntryResult!5337)

(assert (=> d!83715 (and (or ((_ is Undefined!5337) lt!254178) (not ((_ is Found!5337) lt!254178)) (and (bvsge (index!23576 lt!254178) #b00000000000000000000000000000000) (bvslt (index!23576 lt!254178) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254178) ((_ is Found!5337) lt!254178) (not ((_ is MissingVacant!5337) lt!254178)) (not (= (index!23578 lt!254178) (index!23577 lt!254084))) (and (bvsge (index!23578 lt!254178) #b00000000000000000000000000000000) (bvslt (index!23578 lt!254178) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254178) (ite ((_ is Found!5337) lt!254178) (= (select (arr!16888 a!3118) (index!23576 lt!254178)) (select (arr!16888 a!3118) j!142)) (and ((_ is MissingVacant!5337) lt!254178) (= (index!23578 lt!254178) (index!23577 lt!254084)) (= (select (arr!16888 a!3118) (index!23578 lt!254178)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!322189 () SeekEntryResult!5337)

(assert (=> d!83715 (= lt!254178 e!322189)))

(declare-fun c!64586 () Bool)

(assert (=> d!83715 (= c!64586 (bvsge (x!52478 lt!254084) #b01111111111111111111111111111110))))

(declare-fun lt!254179 () (_ BitVec 64))

(assert (=> d!83715 (= lt!254179 (select (arr!16888 a!3118) (index!23577 lt!254084)))))

(assert (=> d!83715 (validMask!0 mask!3119)))

(assert (=> d!83715 (= (seekKeyOrZeroReturnVacant!0 (x!52478 lt!254084) (index!23577 lt!254084) (index!23577 lt!254084) (select (arr!16888 a!3118) j!142) a!3118 mask!3119) lt!254178)))

(declare-fun b!559272 () Bool)

(assert (=> b!559272 (= e!322187 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52478 lt!254084) #b00000000000000000000000000000001) (nextIndex!0 (index!23577 lt!254084) (x!52478 lt!254084) mask!3119) (index!23577 lt!254084) (select (arr!16888 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!559273 () Bool)

(assert (=> b!559273 (= e!322189 e!322188)))

(declare-fun c!64587 () Bool)

(assert (=> b!559273 (= c!64587 (= lt!254179 (select (arr!16888 a!3118) j!142)))))

(declare-fun b!559274 () Bool)

(assert (=> b!559274 (= e!322189 Undefined!5337)))

(declare-fun b!559275 () Bool)

(declare-fun c!64585 () Bool)

(assert (=> b!559275 (= c!64585 (= lt!254179 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!559275 (= e!322188 e!322187)))

(assert (= (and d!83715 c!64586) b!559274))

(assert (= (and d!83715 (not c!64586)) b!559273))

(assert (= (and b!559273 c!64587) b!559271))

(assert (= (and b!559273 (not c!64587)) b!559275))

(assert (= (and b!559275 c!64585) b!559270))

(assert (= (and b!559275 (not c!64585)) b!559272))

(declare-fun m!537155 () Bool)

(assert (=> d!83715 m!537155))

(declare-fun m!537157 () Bool)

(assert (=> d!83715 m!537157))

(assert (=> d!83715 m!537015))

(assert (=> d!83715 m!536987))

(declare-fun m!537159 () Bool)

(assert (=> b!559272 m!537159))

(assert (=> b!559272 m!537159))

(assert (=> b!559272 m!536983))

(declare-fun m!537161 () Bool)

(assert (=> b!559272 m!537161))

(assert (=> b!559070 d!83715))

(declare-fun d!83725 () Bool)

(assert (=> d!83725 (= (validKeyInArray!0 (select (arr!16888 a!3118) j!142)) (and (not (= (select (arr!16888 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16888 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!559073 d!83725))

(declare-fun b!559304 () Bool)

(declare-fun e!322213 () Bool)

(declare-fun contains!2857 (List!10968 (_ BitVec 64)) Bool)

(assert (=> b!559304 (= e!322213 (contains!2857 Nil!10965 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32423 () Bool)

(declare-fun call!32426 () Bool)

(declare-fun c!64596 () Bool)

(assert (=> bm!32423 (= call!32426 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64596 (Cons!10964 (select (arr!16888 a!3118) #b00000000000000000000000000000000) Nil!10965) Nil!10965)))))

(declare-fun b!559305 () Bool)

(declare-fun e!322210 () Bool)

(declare-fun e!322211 () Bool)

(assert (=> b!559305 (= e!322210 e!322211)))

(declare-fun res!350800 () Bool)

(assert (=> b!559305 (=> (not res!350800) (not e!322211))))

(assert (=> b!559305 (= res!350800 (not e!322213))))

(declare-fun res!350802 () Bool)

(assert (=> b!559305 (=> (not res!350802) (not e!322213))))

(assert (=> b!559305 (= res!350802 (validKeyInArray!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!559306 () Bool)

(declare-fun e!322212 () Bool)

(assert (=> b!559306 (= e!322212 call!32426)))

(declare-fun b!559307 () Bool)

(assert (=> b!559307 (= e!322211 e!322212)))

(assert (=> b!559307 (= c!64596 (validKeyInArray!0 (select (arr!16888 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83727 () Bool)

(declare-fun res!350801 () Bool)

(assert (=> d!83727 (=> res!350801 e!322210)))

(assert (=> d!83727 (= res!350801 (bvsge #b00000000000000000000000000000000 (size!17252 a!3118)))))

(assert (=> d!83727 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10965) e!322210)))

(declare-fun b!559308 () Bool)

(assert (=> b!559308 (= e!322212 call!32426)))

(assert (= (and d!83727 (not res!350801)) b!559305))

(assert (= (and b!559305 res!350802) b!559304))

(assert (= (and b!559305 res!350800) b!559307))

(assert (= (and b!559307 c!64596) b!559308))

(assert (= (and b!559307 (not c!64596)) b!559306))

(assert (= (or b!559308 b!559306) bm!32423))

(assert (=> b!559304 m!537065))

(assert (=> b!559304 m!537065))

(declare-fun m!537163 () Bool)

(assert (=> b!559304 m!537163))

(assert (=> bm!32423 m!537065))

(declare-fun m!537165 () Bool)

(assert (=> bm!32423 m!537165))

(assert (=> b!559305 m!537065))

(assert (=> b!559305 m!537065))

(assert (=> b!559305 m!537073))

(assert (=> b!559307 m!537065))

(assert (=> b!559307 m!537065))

(assert (=> b!559307 m!537073))

(assert (=> b!559079 d!83727))

(declare-fun b!559313 () Bool)

(declare-fun e!322217 () SeekEntryResult!5337)

(declare-fun lt!254192 () SeekEntryResult!5337)

(assert (=> b!559313 (= e!322217 (MissingZero!5337 (index!23577 lt!254192)))))

(declare-fun b!559314 () Bool)

(assert (=> b!559314 (= e!322217 (seekKeyOrZeroReturnVacant!0 (x!52478 lt!254192) (index!23577 lt!254192) (index!23577 lt!254192) k0!1914 a!3118 mask!3119))))

(declare-fun d!83735 () Bool)

(declare-fun lt!254193 () SeekEntryResult!5337)

(assert (=> d!83735 (and (or ((_ is Undefined!5337) lt!254193) (not ((_ is Found!5337) lt!254193)) (and (bvsge (index!23576 lt!254193) #b00000000000000000000000000000000) (bvslt (index!23576 lt!254193) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254193) ((_ is Found!5337) lt!254193) (not ((_ is MissingZero!5337) lt!254193)) (and (bvsge (index!23575 lt!254193) #b00000000000000000000000000000000) (bvslt (index!23575 lt!254193) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254193) ((_ is Found!5337) lt!254193) ((_ is MissingZero!5337) lt!254193) (not ((_ is MissingVacant!5337) lt!254193)) (and (bvsge (index!23578 lt!254193) #b00000000000000000000000000000000) (bvslt (index!23578 lt!254193) (size!17252 a!3118)))) (or ((_ is Undefined!5337) lt!254193) (ite ((_ is Found!5337) lt!254193) (= (select (arr!16888 a!3118) (index!23576 lt!254193)) k0!1914) (ite ((_ is MissingZero!5337) lt!254193) (= (select (arr!16888 a!3118) (index!23575 lt!254193)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5337) lt!254193) (= (select (arr!16888 a!3118) (index!23578 lt!254193)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!322216 () SeekEntryResult!5337)

(assert (=> d!83735 (= lt!254193 e!322216)))

(declare-fun c!64600 () Bool)

(assert (=> d!83735 (= c!64600 (and ((_ is Intermediate!5337) lt!254192) (undefined!6149 lt!254192)))))

(assert (=> d!83735 (= lt!254192 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!83735 (validMask!0 mask!3119)))

(assert (=> d!83735 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!254193)))

(declare-fun b!559315 () Bool)

(assert (=> b!559315 (= e!322216 Undefined!5337)))

(declare-fun b!559316 () Bool)

(declare-fun c!64601 () Bool)

(declare-fun lt!254194 () (_ BitVec 64))

(assert (=> b!559316 (= c!64601 (= lt!254194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322218 () SeekEntryResult!5337)

(assert (=> b!559316 (= e!322218 e!322217)))

(declare-fun b!559317 () Bool)

(assert (=> b!559317 (= e!322218 (Found!5337 (index!23577 lt!254192)))))

(declare-fun b!559318 () Bool)

(assert (=> b!559318 (= e!322216 e!322218)))

(assert (=> b!559318 (= lt!254194 (select (arr!16888 a!3118) (index!23577 lt!254192)))))

(declare-fun c!64599 () Bool)

(assert (=> b!559318 (= c!64599 (= lt!254194 k0!1914))))

(assert (= (and d!83735 c!64600) b!559315))

(assert (= (and d!83735 (not c!64600)) b!559318))

(assert (= (and b!559318 c!64599) b!559317))

(assert (= (and b!559318 (not c!64599)) b!559316))

(assert (= (and b!559316 c!64601) b!559313))

(assert (= (and b!559316 (not c!64601)) b!559314))

(declare-fun m!537167 () Bool)

(assert (=> b!559314 m!537167))

(declare-fun m!537169 () Bool)

(assert (=> d!83735 m!537169))

(assert (=> d!83735 m!536987))

(declare-fun m!537171 () Bool)

(assert (=> d!83735 m!537171))

(declare-fun m!537173 () Bool)

(assert (=> d!83735 m!537173))

(assert (=> d!83735 m!537171))

(declare-fun m!537175 () Bool)

(assert (=> d!83735 m!537175))

(declare-fun m!537177 () Bool)

(assert (=> d!83735 m!537177))

(declare-fun m!537179 () Bool)

(assert (=> b!559318 m!537179))

(assert (=> b!559074 d!83735))

(check-sat (not b!559272) (not d!83735) (not b!559177) (not b!559156) (not d!83715) (not b!559314) (not bm!32414) (not bm!32423) (not b!559182) (not b!559307) (not b!559124) (not d!83683) (not bm!32415) (not b!559304) (not d!83689) (not b!559125) (not b!559209) (not b!559305) (not d!83681) (not b!559147) (not d!83695) (not b!559183))
(check-sat)
