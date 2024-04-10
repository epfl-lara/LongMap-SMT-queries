; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51082 () Bool)

(assert start!51082)

(declare-fun b!558219 () Bool)

(declare-fun res!350088 () Bool)

(declare-fun e!321581 () Bool)

(assert (=> b!558219 (=> (not res!350088) (not e!321581))))

(declare-datatypes ((array!35136 0))(
  ( (array!35137 (arr!16873 (Array (_ BitVec 32) (_ BitVec 64))) (size!17237 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35136)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558219 (= res!350088 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558220 () Bool)

(declare-fun res!350086 () Bool)

(assert (=> b!558220 (=> (not res!350086) (not e!321581))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558220 (= res!350086 (validKeyInArray!0 (select (arr!16873 a!3118) j!142)))))

(declare-fun b!558222 () Bool)

(declare-fun res!350090 () Bool)

(declare-fun e!321582 () Bool)

(assert (=> b!558222 (=> (not res!350090) (not e!321582))))

(declare-datatypes ((List!10953 0))(
  ( (Nil!10950) (Cons!10949 (h!11943 (_ BitVec 64)) (t!17181 List!10953)) )
))
(declare-fun arrayNoDuplicates!0 (array!35136 (_ BitVec 32) List!10953) Bool)

(assert (=> b!558222 (= res!350090 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10950))))

(declare-fun b!558223 () Bool)

(declare-fun e!321578 () Bool)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558223 (= e!321578 (validKeyInArray!0 (select (store (arr!16873 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!558224 () Bool)

(declare-fun e!321580 () Bool)

(declare-fun e!321576 () Bool)

(assert (=> b!558224 (= e!321580 e!321576)))

(declare-fun res!350091 () Bool)

(assert (=> b!558224 (=> res!350091 e!321576)))

(declare-datatypes ((SeekEntryResult!5322 0))(
  ( (MissingZero!5322 (index!23515 (_ BitVec 32))) (Found!5322 (index!23516 (_ BitVec 32))) (Intermediate!5322 (undefined!6134 Bool) (index!23517 (_ BitVec 32)) (x!52414 (_ BitVec 32))) (Undefined!5322) (MissingVacant!5322 (index!23518 (_ BitVec 32))) )
))
(declare-fun lt!253662 () SeekEntryResult!5322)

(get-info :version)

(assert (=> b!558224 (= res!350091 (or (undefined!6134 lt!253662) (not ((_ is Intermediate!5322) lt!253662)) (= (select (arr!16873 a!3118) (index!23517 lt!253662)) (select (arr!16873 a!3118) j!142)) (= (select (arr!16873 a!3118) (index!23517 lt!253662)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558221 () Bool)

(assert (=> b!558221 (= e!321581 e!321582)))

(declare-fun res!350087 () Bool)

(assert (=> b!558221 (=> (not res!350087) (not e!321582))))

(declare-fun lt!253661 () SeekEntryResult!5322)

(assert (=> b!558221 (= res!350087 (or (= lt!253661 (MissingZero!5322 i!1132)) (= lt!253661 (MissingVacant!5322 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35136 (_ BitVec 32)) SeekEntryResult!5322)

(assert (=> b!558221 (= lt!253661 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!350084 () Bool)

(assert (=> start!51082 (=> (not res!350084) (not e!321581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51082 (= res!350084 (validMask!0 mask!3119))))

(assert (=> start!51082 e!321581))

(assert (=> start!51082 true))

(declare-fun array_inv!12669 (array!35136) Bool)

(assert (=> start!51082 (array_inv!12669 a!3118)))

(declare-fun b!558225 () Bool)

(declare-fun e!321577 () Bool)

(assert (=> b!558225 (= e!321582 e!321577)))

(declare-fun res!350093 () Bool)

(assert (=> b!558225 (=> (not res!350093) (not e!321577))))

(declare-fun lt!253663 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35136 (_ BitVec 32)) SeekEntryResult!5322)

(assert (=> b!558225 (= res!350093 (= lt!253662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253663 (select (store (arr!16873 a!3118) i!1132 k0!1914) j!142) (array!35137 (store (arr!16873 a!3118) i!1132 k0!1914) (size!17237 a!3118)) mask!3119)))))

(declare-fun lt!253660 () (_ BitVec 32))

(assert (=> b!558225 (= lt!253662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253660 (select (arr!16873 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558225 (= lt!253663 (toIndex!0 (select (store (arr!16873 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558225 (= lt!253660 (toIndex!0 (select (arr!16873 a!3118) j!142) mask!3119))))

(declare-fun b!558226 () Bool)

(declare-fun res!350092 () Bool)

(assert (=> b!558226 (=> (not res!350092) (not e!321581))))

(assert (=> b!558226 (= res!350092 (validKeyInArray!0 k0!1914))))

(declare-fun b!558227 () Bool)

(assert (=> b!558227 (= e!321577 (not e!321578))))

(declare-fun res!350089 () Bool)

(assert (=> b!558227 (=> res!350089 e!321578)))

(assert (=> b!558227 (= res!350089 (or (undefined!6134 lt!253662) (not ((_ is Intermediate!5322) lt!253662)) (= (select (arr!16873 a!3118) (index!23517 lt!253662)) (select (arr!16873 a!3118) j!142)) (= (select (arr!16873 a!3118) (index!23517 lt!253662)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!558227 e!321580))

(declare-fun res!350082 () Bool)

(assert (=> b!558227 (=> (not res!350082) (not e!321580))))

(declare-fun lt!253658 () SeekEntryResult!5322)

(assert (=> b!558227 (= res!350082 (= lt!253658 (Found!5322 j!142)))))

(assert (=> b!558227 (= lt!253658 (seekEntryOrOpen!0 (select (arr!16873 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35136 (_ BitVec 32)) Bool)

(assert (=> b!558227 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17418 0))(
  ( (Unit!17419) )
))
(declare-fun lt!253659 () Unit!17418)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17418)

(assert (=> b!558227 (= lt!253659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558228 () Bool)

(declare-fun res!350083 () Bool)

(assert (=> b!558228 (=> (not res!350083) (not e!321581))))

(assert (=> b!558228 (= res!350083 (and (= (size!17237 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17237 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17237 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558229 () Bool)

(declare-fun res!350085 () Bool)

(assert (=> b!558229 (=> (not res!350085) (not e!321582))))

(assert (=> b!558229 (= res!350085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558230 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35136 (_ BitVec 32)) SeekEntryResult!5322)

(assert (=> b!558230 (= e!321576 (= lt!253658 (seekKeyOrZeroReturnVacant!0 (x!52414 lt!253662) (index!23517 lt!253662) (index!23517 lt!253662) (select (arr!16873 a!3118) j!142) a!3118 mask!3119)))))

(assert (= (and start!51082 res!350084) b!558228))

(assert (= (and b!558228 res!350083) b!558220))

(assert (= (and b!558220 res!350086) b!558226))

(assert (= (and b!558226 res!350092) b!558219))

(assert (= (and b!558219 res!350088) b!558221))

(assert (= (and b!558221 res!350087) b!558229))

(assert (= (and b!558229 res!350085) b!558222))

(assert (= (and b!558222 res!350090) b!558225))

(assert (= (and b!558225 res!350093) b!558227))

(assert (= (and b!558227 res!350082) b!558224))

(assert (= (and b!558224 (not res!350091)) b!558230))

(assert (= (and b!558227 (not res!350089)) b!558223))

(declare-fun m!536151 () Bool)

(assert (=> b!558222 m!536151))

(declare-fun m!536153 () Bool)

(assert (=> b!558229 m!536153))

(declare-fun m!536155 () Bool)

(assert (=> b!558221 m!536155))

(declare-fun m!536157 () Bool)

(assert (=> b!558230 m!536157))

(assert (=> b!558230 m!536157))

(declare-fun m!536159 () Bool)

(assert (=> b!558230 m!536159))

(declare-fun m!536161 () Bool)

(assert (=> b!558223 m!536161))

(declare-fun m!536163 () Bool)

(assert (=> b!558223 m!536163))

(assert (=> b!558223 m!536163))

(declare-fun m!536165 () Bool)

(assert (=> b!558223 m!536165))

(declare-fun m!536167 () Bool)

(assert (=> b!558224 m!536167))

(assert (=> b!558224 m!536157))

(assert (=> b!558220 m!536157))

(assert (=> b!558220 m!536157))

(declare-fun m!536169 () Bool)

(assert (=> b!558220 m!536169))

(declare-fun m!536171 () Bool)

(assert (=> b!558226 m!536171))

(declare-fun m!536173 () Bool)

(assert (=> b!558219 m!536173))

(assert (=> b!558227 m!536157))

(declare-fun m!536175 () Bool)

(assert (=> b!558227 m!536175))

(assert (=> b!558227 m!536167))

(declare-fun m!536177 () Bool)

(assert (=> b!558227 m!536177))

(assert (=> b!558227 m!536157))

(declare-fun m!536179 () Bool)

(assert (=> b!558227 m!536179))

(declare-fun m!536181 () Bool)

(assert (=> start!51082 m!536181))

(declare-fun m!536183 () Bool)

(assert (=> start!51082 m!536183))

(assert (=> b!558225 m!536157))

(assert (=> b!558225 m!536163))

(assert (=> b!558225 m!536163))

(declare-fun m!536185 () Bool)

(assert (=> b!558225 m!536185))

(assert (=> b!558225 m!536161))

(assert (=> b!558225 m!536163))

(declare-fun m!536187 () Bool)

(assert (=> b!558225 m!536187))

(assert (=> b!558225 m!536157))

(declare-fun m!536189 () Bool)

(assert (=> b!558225 m!536189))

(assert (=> b!558225 m!536157))

(declare-fun m!536191 () Bool)

(assert (=> b!558225 m!536191))

(check-sat (not b!558223) (not b!558219) (not b!558226) (not b!558230) (not b!558225) (not start!51082) (not b!558222) (not b!558227) (not b!558229) (not b!558220) (not b!558221))
(check-sat)
