; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52458 () Bool)

(assert start!52458)

(declare-fun b!572197 () Bool)

(declare-fun e!329132 () Bool)

(declare-fun e!329139 () Bool)

(assert (=> b!572197 (= e!329132 e!329139)))

(declare-fun res!361610 () Bool)

(assert (=> b!572197 (=> (not res!361610) (not e!329139))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5593 0))(
  ( (MissingZero!5593 (index!24599 (_ BitVec 32))) (Found!5593 (index!24600 (_ BitVec 32))) (Intermediate!5593 (undefined!6405 Bool) (index!24601 (_ BitVec 32)) (x!53625 (_ BitVec 32))) (Undefined!5593) (MissingVacant!5593 (index!24602 (_ BitVec 32))) )
))
(declare-fun lt!261042 () SeekEntryResult!5593)

(declare-fun lt!261047 () SeekEntryResult!5593)

(declare-datatypes ((array!35802 0))(
  ( (array!35803 (arr!17188 (Array (_ BitVec 32) (_ BitVec 64))) (size!17552 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35802)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35802 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!572197 (= res!361610 (= lt!261042 (seekKeyOrZeroReturnVacant!0 (x!53625 lt!261047) (index!24601 lt!261047) (index!24601 lt!261047) (select (arr!17188 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572198 () Bool)

(declare-fun res!361604 () Bool)

(declare-fun e!329138 () Bool)

(assert (=> b!572198 (=> (not res!361604) (not e!329138))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572198 (= res!361604 (validKeyInArray!0 (select (arr!17188 a!3118) j!142)))))

(declare-fun b!572199 () Bool)

(declare-fun e!329133 () Bool)

(assert (=> b!572199 (= e!329133 (not true))))

(declare-fun e!329135 () Bool)

(assert (=> b!572199 e!329135))

(declare-fun res!361605 () Bool)

(assert (=> b!572199 (=> (not res!361605) (not e!329135))))

(assert (=> b!572199 (= res!361605 (= lt!261042 (Found!5593 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35802 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!572199 (= lt!261042 (seekEntryOrOpen!0 (select (arr!17188 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35802 (_ BitVec 32)) Bool)

(assert (=> b!572199 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17959 0))(
  ( (Unit!17960) )
))
(declare-fun lt!261048 () Unit!17959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17959)

(assert (=> b!572199 (= lt!261048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!572200 () Bool)

(declare-fun res!361612 () Bool)

(declare-fun e!329137 () Bool)

(assert (=> b!572200 (=> (not res!361612) (not e!329137))))

(assert (=> b!572200 (= res!361612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun lt!261049 () (_ BitVec 64))

(declare-fun b!572201 () Bool)

(declare-fun lt!261045 () array!35802)

(assert (=> b!572201 (= e!329139 (= (seekEntryOrOpen!0 lt!261049 lt!261045 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53625 lt!261047) (index!24601 lt!261047) (index!24601 lt!261047) lt!261049 lt!261045 mask!3119)))))

(declare-fun b!572202 () Bool)

(declare-fun res!361607 () Bool)

(assert (=> b!572202 (=> (not res!361607) (not e!329138))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572202 (= res!361607 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun res!361600 () Bool)

(assert (=> start!52458 (=> (not res!361600) (not e!329138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52458 (= res!361600 (validMask!0 mask!3119))))

(assert (=> start!52458 e!329138))

(assert (=> start!52458 true))

(declare-fun array_inv!13047 (array!35802) Bool)

(assert (=> start!52458 (array_inv!13047 a!3118)))

(declare-fun b!572203 () Bool)

(declare-fun res!361609 () Bool)

(assert (=> b!572203 (=> (not res!361609) (not e!329137))))

(declare-datatypes ((List!11175 0))(
  ( (Nil!11172) (Cons!11171 (h!12201 (_ BitVec 64)) (t!17395 List!11175)) )
))
(declare-fun arrayNoDuplicates!0 (array!35802 (_ BitVec 32) List!11175) Bool)

(assert (=> b!572203 (= res!361609 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11172))))

(declare-fun b!572204 () Bool)

(declare-fun e!329136 () Bool)

(assert (=> b!572204 (= e!329135 e!329136)))

(declare-fun res!361611 () Bool)

(assert (=> b!572204 (=> res!361611 e!329136)))

(get-info :version)

(assert (=> b!572204 (= res!361611 (or (undefined!6405 lt!261047) (not ((_ is Intermediate!5593) lt!261047))))))

(declare-fun b!572205 () Bool)

(assert (=> b!572205 (= e!329136 e!329132)))

(declare-fun res!361601 () Bool)

(assert (=> b!572205 (=> res!361601 e!329132)))

(declare-fun lt!261046 () (_ BitVec 64))

(assert (=> b!572205 (= res!361601 (or (= lt!261046 (select (arr!17188 a!3118) j!142)) (= lt!261046 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572205 (= lt!261046 (select (arr!17188 a!3118) (index!24601 lt!261047)))))

(declare-fun b!572206 () Bool)

(declare-fun res!361608 () Bool)

(assert (=> b!572206 (=> (not res!361608) (not e!329138))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572206 (= res!361608 (and (= (size!17552 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17552 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17552 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572207 () Bool)

(declare-fun res!361606 () Bool)

(assert (=> b!572207 (=> (not res!361606) (not e!329138))))

(assert (=> b!572207 (= res!361606 (validKeyInArray!0 k0!1914))))

(declare-fun b!572208 () Bool)

(assert (=> b!572208 (= e!329137 e!329133)))

(declare-fun res!361603 () Bool)

(assert (=> b!572208 (=> (not res!361603) (not e!329133))))

(declare-fun lt!261043 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35802 (_ BitVec 32)) SeekEntryResult!5593)

(assert (=> b!572208 (= res!361603 (= lt!261047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261043 lt!261049 lt!261045 mask!3119)))))

(declare-fun lt!261044 () (_ BitVec 32))

(assert (=> b!572208 (= lt!261047 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261044 (select (arr!17188 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572208 (= lt!261043 (toIndex!0 lt!261049 mask!3119))))

(assert (=> b!572208 (= lt!261049 (select (store (arr!17188 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!572208 (= lt!261044 (toIndex!0 (select (arr!17188 a!3118) j!142) mask!3119))))

(assert (=> b!572208 (= lt!261045 (array!35803 (store (arr!17188 a!3118) i!1132 k0!1914) (size!17552 a!3118)))))

(declare-fun b!572209 () Bool)

(assert (=> b!572209 (= e!329138 e!329137)))

(declare-fun res!361602 () Bool)

(assert (=> b!572209 (=> (not res!361602) (not e!329137))))

(declare-fun lt!261041 () SeekEntryResult!5593)

(assert (=> b!572209 (= res!361602 (or (= lt!261041 (MissingZero!5593 i!1132)) (= lt!261041 (MissingVacant!5593 i!1132))))))

(assert (=> b!572209 (= lt!261041 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!52458 res!361600) b!572206))

(assert (= (and b!572206 res!361608) b!572198))

(assert (= (and b!572198 res!361604) b!572207))

(assert (= (and b!572207 res!361606) b!572202))

(assert (= (and b!572202 res!361607) b!572209))

(assert (= (and b!572209 res!361602) b!572200))

(assert (= (and b!572200 res!361612) b!572203))

(assert (= (and b!572203 res!361609) b!572208))

(assert (= (and b!572208 res!361603) b!572199))

(assert (= (and b!572199 res!361605) b!572204))

(assert (= (and b!572204 (not res!361611)) b!572205))

(assert (= (and b!572205 (not res!361601)) b!572197))

(assert (= (and b!572197 res!361610) b!572201))

(declare-fun m!551255 () Bool)

(assert (=> b!572202 m!551255))

(declare-fun m!551257 () Bool)

(assert (=> b!572199 m!551257))

(assert (=> b!572199 m!551257))

(declare-fun m!551259 () Bool)

(assert (=> b!572199 m!551259))

(declare-fun m!551261 () Bool)

(assert (=> b!572199 m!551261))

(declare-fun m!551263 () Bool)

(assert (=> b!572199 m!551263))

(assert (=> b!572197 m!551257))

(assert (=> b!572197 m!551257))

(declare-fun m!551265 () Bool)

(assert (=> b!572197 m!551265))

(assert (=> b!572205 m!551257))

(declare-fun m!551267 () Bool)

(assert (=> b!572205 m!551267))

(declare-fun m!551269 () Bool)

(assert (=> b!572207 m!551269))

(declare-fun m!551271 () Bool)

(assert (=> b!572203 m!551271))

(assert (=> b!572198 m!551257))

(assert (=> b!572198 m!551257))

(declare-fun m!551273 () Bool)

(assert (=> b!572198 m!551273))

(declare-fun m!551275 () Bool)

(assert (=> b!572209 m!551275))

(declare-fun m!551277 () Bool)

(assert (=> start!52458 m!551277))

(declare-fun m!551279 () Bool)

(assert (=> start!52458 m!551279))

(declare-fun m!551281 () Bool)

(assert (=> b!572200 m!551281))

(assert (=> b!572208 m!551257))

(declare-fun m!551283 () Bool)

(assert (=> b!572208 m!551283))

(assert (=> b!572208 m!551257))

(declare-fun m!551285 () Bool)

(assert (=> b!572208 m!551285))

(declare-fun m!551287 () Bool)

(assert (=> b!572208 m!551287))

(assert (=> b!572208 m!551257))

(declare-fun m!551289 () Bool)

(assert (=> b!572208 m!551289))

(declare-fun m!551291 () Bool)

(assert (=> b!572208 m!551291))

(declare-fun m!551293 () Bool)

(assert (=> b!572208 m!551293))

(declare-fun m!551295 () Bool)

(assert (=> b!572201 m!551295))

(declare-fun m!551297 () Bool)

(assert (=> b!572201 m!551297))

(check-sat (not b!572207) (not b!572198) (not b!572200) (not start!52458) (not b!572199) (not b!572203) (not b!572201) (not b!572202) (not b!572209) (not b!572208) (not b!572197))
(check-sat)
