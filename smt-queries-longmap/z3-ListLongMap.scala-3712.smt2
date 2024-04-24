; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51114 () Bool)

(assert start!51114)

(declare-fun b!558183 () Bool)

(declare-fun e!321577 () Bool)

(declare-fun e!321579 () Bool)

(assert (=> b!558183 (= e!321577 e!321579)))

(declare-fun res!349945 () Bool)

(assert (=> b!558183 (=> res!349945 e!321579)))

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5266 0))(
  ( (MissingZero!5266 (index!23291 (_ BitVec 32))) (Found!5266 (index!23292 (_ BitVec 32))) (Intermediate!5266 (undefined!6078 Bool) (index!23293 (_ BitVec 32)) (x!52345 (_ BitVec 32))) (Undefined!5266) (MissingVacant!5266 (index!23294 (_ BitVec 32))) )
))
(declare-fun lt!253645 () SeekEntryResult!5266)

(declare-datatypes ((array!35115 0))(
  ( (array!35116 (arr!16861 (Array (_ BitVec 32) (_ BitVec 64))) (size!17225 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35115)

(get-info :version)

(assert (=> b!558183 (= res!349945 (or (undefined!6078 lt!253645) (not ((_ is Intermediate!5266) lt!253645)) (= (select (arr!16861 a!3118) (index!23293 lt!253645)) (select (arr!16861 a!3118) j!142)) (= (select (arr!16861 a!3118) (index!23293 lt!253645)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558184 () Bool)

(declare-fun res!349944 () Bool)

(declare-fun e!321578 () Bool)

(assert (=> b!558184 (=> (not res!349944) (not e!321578))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558184 (= res!349944 (validKeyInArray!0 k0!1914))))

(declare-fun res!349950 () Bool)

(assert (=> start!51114 (=> (not res!349950) (not e!321578))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51114 (= res!349950 (validMask!0 mask!3119))))

(assert (=> start!51114 e!321578))

(assert (=> start!51114 true))

(declare-fun array_inv!12720 (array!35115) Bool)

(assert (=> start!51114 (array_inv!12720 a!3118)))

(declare-fun b!558185 () Bool)

(declare-fun res!349947 () Bool)

(assert (=> b!558185 (=> (not res!349947) (not e!321578))))

(declare-fun arrayContainsKey!0 (array!35115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558185 (= res!349947 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558186 () Bool)

(declare-fun res!349951 () Bool)

(declare-fun e!321576 () Bool)

(assert (=> b!558186 (=> (not res!349951) (not e!321576))))

(declare-datatypes ((List!10848 0))(
  ( (Nil!10845) (Cons!10844 (h!11841 (_ BitVec 64)) (t!17068 List!10848)) )
))
(declare-fun arrayNoDuplicates!0 (array!35115 (_ BitVec 32) List!10848) Bool)

(assert (=> b!558186 (= res!349951 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10845))))

(declare-fun b!558187 () Bool)

(declare-fun e!321574 () Bool)

(assert (=> b!558187 (= e!321576 e!321574)))

(declare-fun res!349943 () Bool)

(assert (=> b!558187 (=> (not res!349943) (not e!321574))))

(declare-fun lt!253647 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35115 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!558187 (= res!349943 (= lt!253645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253647 (select (store (arr!16861 a!3118) i!1132 k0!1914) j!142) (array!35116 (store (arr!16861 a!3118) i!1132 k0!1914) (size!17225 a!3118)) mask!3119)))))

(declare-fun lt!253646 () (_ BitVec 32))

(assert (=> b!558187 (= lt!253645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253646 (select (arr!16861 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558187 (= lt!253647 (toIndex!0 (select (store (arr!16861 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!558187 (= lt!253646 (toIndex!0 (select (arr!16861 a!3118) j!142) mask!3119))))

(declare-fun b!558188 () Bool)

(declare-fun res!349942 () Bool)

(assert (=> b!558188 (=> (not res!349942) (not e!321576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35115 (_ BitVec 32)) Bool)

(assert (=> b!558188 (= res!349942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558189 () Bool)

(declare-fun res!349946 () Bool)

(assert (=> b!558189 (=> (not res!349946) (not e!321578))))

(assert (=> b!558189 (= res!349946 (validKeyInArray!0 (select (arr!16861 a!3118) j!142)))))

(declare-fun b!558190 () Bool)

(assert (=> b!558190 (= e!321578 e!321576)))

(declare-fun res!349948 () Bool)

(assert (=> b!558190 (=> (not res!349948) (not e!321576))))

(declare-fun lt!253643 () SeekEntryResult!5266)

(assert (=> b!558190 (= res!349948 (or (= lt!253643 (MissingZero!5266 i!1132)) (= lt!253643 (MissingVacant!5266 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35115 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!558190 (= lt!253643 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!558191 () Bool)

(declare-fun lt!253644 () SeekEntryResult!5266)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35115 (_ BitVec 32)) SeekEntryResult!5266)

(assert (=> b!558191 (= e!321579 (= lt!253644 (seekKeyOrZeroReturnVacant!0 (x!52345 lt!253645) (index!23293 lt!253645) (index!23293 lt!253645) (select (arr!16861 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558192 () Bool)

(declare-fun res!349941 () Bool)

(assert (=> b!558192 (=> (not res!349941) (not e!321578))))

(assert (=> b!558192 (= res!349941 (and (= (size!17225 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17225 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17225 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558193 () Bool)

(assert (=> b!558193 (= e!321574 (not (or (undefined!6078 lt!253645) (not ((_ is Intermediate!5266) lt!253645)) (= (select (arr!16861 a!3118) (index!23293 lt!253645)) (select (arr!16861 a!3118) j!142)) (= (select (arr!16861 a!3118) (index!23293 lt!253645)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!558193 e!321577))

(declare-fun res!349949 () Bool)

(assert (=> b!558193 (=> (not res!349949) (not e!321577))))

(assert (=> b!558193 (= res!349949 (= lt!253644 (Found!5266 j!142)))))

(assert (=> b!558193 (= lt!253644 (seekEntryOrOpen!0 (select (arr!16861 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558193 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17377 0))(
  ( (Unit!17378) )
))
(declare-fun lt!253648 () Unit!17377)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35115 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17377)

(assert (=> b!558193 (= lt!253648 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!51114 res!349950) b!558192))

(assert (= (and b!558192 res!349941) b!558189))

(assert (= (and b!558189 res!349946) b!558184))

(assert (= (and b!558184 res!349944) b!558185))

(assert (= (and b!558185 res!349947) b!558190))

(assert (= (and b!558190 res!349948) b!558188))

(assert (= (and b!558188 res!349942) b!558186))

(assert (= (and b!558186 res!349951) b!558187))

(assert (= (and b!558187 res!349943) b!558193))

(assert (= (and b!558193 res!349949) b!558183))

(assert (= (and b!558183 (not res!349945)) b!558191))

(declare-fun m!536207 () Bool)

(assert (=> b!558193 m!536207))

(declare-fun m!536209 () Bool)

(assert (=> b!558193 m!536209))

(declare-fun m!536211 () Bool)

(assert (=> b!558193 m!536211))

(assert (=> b!558193 m!536207))

(declare-fun m!536213 () Bool)

(assert (=> b!558193 m!536213))

(declare-fun m!536215 () Bool)

(assert (=> b!558193 m!536215))

(declare-fun m!536217 () Bool)

(assert (=> b!558185 m!536217))

(declare-fun m!536219 () Bool)

(assert (=> b!558184 m!536219))

(declare-fun m!536221 () Bool)

(assert (=> start!51114 m!536221))

(declare-fun m!536223 () Bool)

(assert (=> start!51114 m!536223))

(assert (=> b!558183 m!536215))

(assert (=> b!558183 m!536207))

(assert (=> b!558191 m!536207))

(assert (=> b!558191 m!536207))

(declare-fun m!536225 () Bool)

(assert (=> b!558191 m!536225))

(declare-fun m!536227 () Bool)

(assert (=> b!558186 m!536227))

(declare-fun m!536229 () Bool)

(assert (=> b!558188 m!536229))

(assert (=> b!558187 m!536207))

(declare-fun m!536231 () Bool)

(assert (=> b!558187 m!536231))

(assert (=> b!558187 m!536207))

(declare-fun m!536233 () Bool)

(assert (=> b!558187 m!536233))

(assert (=> b!558187 m!536233))

(declare-fun m!536235 () Bool)

(assert (=> b!558187 m!536235))

(declare-fun m!536237 () Bool)

(assert (=> b!558187 m!536237))

(assert (=> b!558187 m!536207))

(declare-fun m!536239 () Bool)

(assert (=> b!558187 m!536239))

(assert (=> b!558187 m!536233))

(declare-fun m!536241 () Bool)

(assert (=> b!558187 m!536241))

(declare-fun m!536243 () Bool)

(assert (=> b!558190 m!536243))

(assert (=> b!558189 m!536207))

(assert (=> b!558189 m!536207))

(declare-fun m!536245 () Bool)

(assert (=> b!558189 m!536245))

(check-sat (not start!51114) (not b!558186) (not b!558185) (not b!558188) (not b!558187) (not b!558190) (not b!558189) (not b!558184) (not b!558193) (not b!558191))
(check-sat)
