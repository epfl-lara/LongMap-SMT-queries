; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51078 () Bool)

(assert start!51078)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun e!321536 () Bool)

(declare-fun b!558148 () Bool)

(declare-datatypes ((array!35132 0))(
  ( (array!35133 (arr!16871 (Array (_ BitVec 32) (_ BitVec 64))) (size!17235 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35132)

(declare-datatypes ((SeekEntryResult!5320 0))(
  ( (MissingZero!5320 (index!23507 (_ BitVec 32))) (Found!5320 (index!23508 (_ BitVec 32))) (Intermediate!5320 (undefined!6132 Bool) (index!23509 (_ BitVec 32)) (x!52404 (_ BitVec 32))) (Undefined!5320) (MissingVacant!5320 (index!23510 (_ BitVec 32))) )
))
(declare-fun lt!253622 () SeekEntryResult!5320)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253627 () SeekEntryResult!5320)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35132 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!558148 (= e!321536 (= lt!253622 (seekKeyOrZeroReturnVacant!0 (x!52404 lt!253627) (index!23509 lt!253627) (index!23509 lt!253627) (select (arr!16871 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!350017 () Bool)

(declare-fun e!321537 () Bool)

(assert (=> start!51078 (=> (not res!350017) (not e!321537))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51078 (= res!350017 (validMask!0 mask!3119))))

(assert (=> start!51078 e!321537))

(assert (=> start!51078 true))

(declare-fun array_inv!12667 (array!35132) Bool)

(assert (=> start!51078 (array_inv!12667 a!3118)))

(declare-fun b!558149 () Bool)

(declare-fun res!350011 () Bool)

(assert (=> b!558149 (=> (not res!350011) (not e!321537))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558149 (= res!350011 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558150 () Bool)

(declare-fun e!321535 () Bool)

(assert (=> b!558150 (= e!321535 e!321536)))

(declare-fun res!350013 () Bool)

(assert (=> b!558150 (=> res!350013 e!321536)))

(assert (=> b!558150 (= res!350013 (or (undefined!6132 lt!253627) (not (is-Intermediate!5320 lt!253627)) (= (select (arr!16871 a!3118) (index!23509 lt!253627)) (select (arr!16871 a!3118) j!142)) (= (select (arr!16871 a!3118) (index!23509 lt!253627)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558151 () Bool)

(declare-fun e!321539 () Bool)

(assert (=> b!558151 (= e!321537 e!321539)))

(declare-fun res!350021 () Bool)

(assert (=> b!558151 (=> (not res!350021) (not e!321539))))

(declare-fun lt!253625 () SeekEntryResult!5320)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558151 (= res!350021 (or (= lt!253625 (MissingZero!5320 i!1132)) (= lt!253625 (MissingVacant!5320 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35132 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!558151 (= lt!253625 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558152 () Bool)

(declare-fun res!350012 () Bool)

(assert (=> b!558152 (=> (not res!350012) (not e!321539))))

(declare-datatypes ((List!10951 0))(
  ( (Nil!10948) (Cons!10947 (h!11941 (_ BitVec 64)) (t!17179 List!10951)) )
))
(declare-fun arrayNoDuplicates!0 (array!35132 (_ BitVec 32) List!10951) Bool)

(assert (=> b!558152 (= res!350012 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10948))))

(declare-fun b!558153 () Bool)

(declare-fun res!350019 () Bool)

(assert (=> b!558153 (=> (not res!350019) (not e!321537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558153 (= res!350019 (validKeyInArray!0 (select (arr!16871 a!3118) j!142)))))

(declare-fun b!558154 () Bool)

(declare-fun res!350014 () Bool)

(assert (=> b!558154 (=> (not res!350014) (not e!321537))))

(assert (=> b!558154 (= res!350014 (and (= (size!17235 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17235 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17235 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558155 () Bool)

(declare-fun res!350016 () Bool)

(assert (=> b!558155 (=> (not res!350016) (not e!321537))))

(assert (=> b!558155 (= res!350016 (validKeyInArray!0 k!1914))))

(declare-fun b!558156 () Bool)

(declare-fun e!321540 () Bool)

(assert (=> b!558156 (= e!321540 (not true))))

(assert (=> b!558156 e!321535))

(declare-fun res!350020 () Bool)

(assert (=> b!558156 (=> (not res!350020) (not e!321535))))

(assert (=> b!558156 (= res!350020 (= lt!253622 (Found!5320 j!142)))))

(assert (=> b!558156 (= lt!253622 (seekEntryOrOpen!0 (select (arr!16871 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35132 (_ BitVec 32)) Bool)

(assert (=> b!558156 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17414 0))(
  ( (Unit!17415) )
))
(declare-fun lt!253623 () Unit!17414)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35132 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17414)

(assert (=> b!558156 (= lt!253623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558157 () Bool)

(assert (=> b!558157 (= e!321539 e!321540)))

(declare-fun res!350015 () Bool)

(assert (=> b!558157 (=> (not res!350015) (not e!321540))))

(declare-fun lt!253626 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35132 (_ BitVec 32)) SeekEntryResult!5320)

(assert (=> b!558157 (= res!350015 (= lt!253627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253626 (select (store (arr!16871 a!3118) i!1132 k!1914) j!142) (array!35133 (store (arr!16871 a!3118) i!1132 k!1914) (size!17235 a!3118)) mask!3119)))))

(declare-fun lt!253624 () (_ BitVec 32))

(assert (=> b!558157 (= lt!253627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253624 (select (arr!16871 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558157 (= lt!253626 (toIndex!0 (select (store (arr!16871 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558157 (= lt!253624 (toIndex!0 (select (arr!16871 a!3118) j!142) mask!3119))))

(declare-fun b!558158 () Bool)

(declare-fun res!350018 () Bool)

(assert (=> b!558158 (=> (not res!350018) (not e!321539))))

(assert (=> b!558158 (= res!350018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!51078 res!350017) b!558154))

(assert (= (and b!558154 res!350014) b!558153))

(assert (= (and b!558153 res!350019) b!558155))

(assert (= (and b!558155 res!350016) b!558149))

(assert (= (and b!558149 res!350011) b!558151))

(assert (= (and b!558151 res!350021) b!558158))

(assert (= (and b!558158 res!350018) b!558152))

(assert (= (and b!558152 res!350012) b!558157))

(assert (= (and b!558157 res!350015) b!558156))

(assert (= (and b!558156 res!350020) b!558150))

(assert (= (and b!558150 (not res!350013)) b!558148))

(declare-fun m!536069 () Bool)

(assert (=> b!558156 m!536069))

(assert (=> b!558156 m!536069))

(declare-fun m!536071 () Bool)

(assert (=> b!558156 m!536071))

(declare-fun m!536073 () Bool)

(assert (=> b!558156 m!536073))

(declare-fun m!536075 () Bool)

(assert (=> b!558156 m!536075))

(declare-fun m!536077 () Bool)

(assert (=> b!558149 m!536077))

(declare-fun m!536079 () Bool)

(assert (=> start!51078 m!536079))

(declare-fun m!536081 () Bool)

(assert (=> start!51078 m!536081))

(declare-fun m!536083 () Bool)

(assert (=> b!558155 m!536083))

(assert (=> b!558153 m!536069))

(assert (=> b!558153 m!536069))

(declare-fun m!536085 () Bool)

(assert (=> b!558153 m!536085))

(declare-fun m!536087 () Bool)

(assert (=> b!558158 m!536087))

(assert (=> b!558157 m!536069))

(declare-fun m!536089 () Bool)

(assert (=> b!558157 m!536089))

(assert (=> b!558157 m!536069))

(declare-fun m!536091 () Bool)

(assert (=> b!558157 m!536091))

(assert (=> b!558157 m!536069))

(declare-fun m!536093 () Bool)

(assert (=> b!558157 m!536093))

(declare-fun m!536095 () Bool)

(assert (=> b!558157 m!536095))

(assert (=> b!558157 m!536091))

(declare-fun m!536097 () Bool)

(assert (=> b!558157 m!536097))

(assert (=> b!558157 m!536091))

(declare-fun m!536099 () Bool)

(assert (=> b!558157 m!536099))

(assert (=> b!558148 m!536069))

(assert (=> b!558148 m!536069))

(declare-fun m!536101 () Bool)

(assert (=> b!558148 m!536101))

(declare-fun m!536103 () Bool)

(assert (=> b!558150 m!536103))

(assert (=> b!558150 m!536069))

(declare-fun m!536105 () Bool)

(assert (=> b!558152 m!536105))

(declare-fun m!536107 () Bool)

(assert (=> b!558151 m!536107))

(push 1)

