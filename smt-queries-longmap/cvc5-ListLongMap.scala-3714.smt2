; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51080 () Bool)

(assert start!51080)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!558183 () Bool)

(declare-fun e!321560 () Bool)

(declare-datatypes ((SeekEntryResult!5321 0))(
  ( (MissingZero!5321 (index!23511 (_ BitVec 32))) (Found!5321 (index!23512 (_ BitVec 32))) (Intermediate!5321 (undefined!6133 Bool) (index!23513 (_ BitVec 32)) (x!52413 (_ BitVec 32))) (Undefined!5321) (MissingVacant!5321 (index!23514 (_ BitVec 32))) )
))
(declare-fun lt!253642 () SeekEntryResult!5321)

(declare-datatypes ((array!35134 0))(
  ( (array!35135 (arr!16872 (Array (_ BitVec 32) (_ BitVec 64))) (size!17236 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35134)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253645 () SeekEntryResult!5321)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35134 (_ BitVec 32)) SeekEntryResult!5321)

(assert (=> b!558183 (= e!321560 (= lt!253642 (seekKeyOrZeroReturnVacant!0 (x!52413 lt!253645) (index!23513 lt!253645) (index!23513 lt!253645) (select (arr!16872 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558184 () Bool)

(declare-fun res!350057 () Bool)

(declare-fun e!321555 () Bool)

(assert (=> b!558184 (=> (not res!350057) (not e!321555))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558184 (= res!350057 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558185 () Bool)

(declare-fun e!321559 () Bool)

(declare-fun e!321557 () Bool)

(assert (=> b!558185 (= e!321559 e!321557)))

(declare-fun res!350054 () Bool)

(assert (=> b!558185 (=> (not res!350054) (not e!321557))))

(declare-fun lt!253643 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35134 (_ BitVec 32)) SeekEntryResult!5321)

(assert (=> b!558185 (= res!350054 (= lt!253645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253643 (select (store (arr!16872 a!3118) i!1132 k!1914) j!142) (array!35135 (store (arr!16872 a!3118) i!1132 k!1914) (size!17236 a!3118)) mask!3119)))))

(declare-fun lt!253640 () (_ BitVec 32))

(assert (=> b!558185 (= lt!253645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253640 (select (arr!16872 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558185 (= lt!253643 (toIndex!0 (select (store (arr!16872 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558185 (= lt!253640 (toIndex!0 (select (arr!16872 a!3118) j!142) mask!3119))))

(declare-fun b!558186 () Bool)

(declare-fun e!321558 () Bool)

(assert (=> b!558186 (= e!321557 (not e!321558))))

(declare-fun res!350050 () Bool)

(assert (=> b!558186 (=> res!350050 e!321558)))

(assert (=> b!558186 (= res!350050 (or (undefined!6133 lt!253645) (not (is-Intermediate!5321 lt!253645)) (= (select (arr!16872 a!3118) (index!23513 lt!253645)) (select (arr!16872 a!3118) j!142)) (= (select (arr!16872 a!3118) (index!23513 lt!253645)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!321556 () Bool)

(assert (=> b!558186 e!321556))

(declare-fun res!350056 () Bool)

(assert (=> b!558186 (=> (not res!350056) (not e!321556))))

(assert (=> b!558186 (= res!350056 (= lt!253642 (Found!5321 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35134 (_ BitVec 32)) SeekEntryResult!5321)

(assert (=> b!558186 (= lt!253642 (seekEntryOrOpen!0 (select (arr!16872 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35134 (_ BitVec 32)) Bool)

(assert (=> b!558186 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17416 0))(
  ( (Unit!17417) )
))
(declare-fun lt!253644 () Unit!17416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35134 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17416)

(assert (=> b!558186 (= lt!253644 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558187 () Bool)

(declare-fun res!350046 () Bool)

(assert (=> b!558187 (=> (not res!350046) (not e!321559))))

(declare-datatypes ((List!10952 0))(
  ( (Nil!10949) (Cons!10948 (h!11942 (_ BitVec 64)) (t!17180 List!10952)) )
))
(declare-fun arrayNoDuplicates!0 (array!35134 (_ BitVec 32) List!10952) Bool)

(assert (=> b!558187 (= res!350046 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10949))))

(declare-fun res!350051 () Bool)

(assert (=> start!51080 (=> (not res!350051) (not e!321555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51080 (= res!350051 (validMask!0 mask!3119))))

(assert (=> start!51080 e!321555))

(assert (=> start!51080 true))

(declare-fun array_inv!12668 (array!35134) Bool)

(assert (=> start!51080 (array_inv!12668 a!3118)))

(declare-fun b!558188 () Bool)

(declare-fun res!350049 () Bool)

(assert (=> b!558188 (=> (not res!350049) (not e!321555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558188 (= res!350049 (validKeyInArray!0 k!1914))))

(declare-fun b!558189 () Bool)

(assert (=> b!558189 (= e!321558 (validKeyInArray!0 (select (store (arr!16872 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!558190 () Bool)

(declare-fun res!350055 () Bool)

(assert (=> b!558190 (=> (not res!350055) (not e!321559))))

(assert (=> b!558190 (= res!350055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558191 () Bool)

(declare-fun res!350052 () Bool)

(assert (=> b!558191 (=> (not res!350052) (not e!321555))))

(assert (=> b!558191 (= res!350052 (and (= (size!17236 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17236 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17236 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558192 () Bool)

(assert (=> b!558192 (= e!321556 e!321560)))

(declare-fun res!350048 () Bool)

(assert (=> b!558192 (=> res!350048 e!321560)))

(assert (=> b!558192 (= res!350048 (or (undefined!6133 lt!253645) (not (is-Intermediate!5321 lt!253645)) (= (select (arr!16872 a!3118) (index!23513 lt!253645)) (select (arr!16872 a!3118) j!142)) (= (select (arr!16872 a!3118) (index!23513 lt!253645)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558193 () Bool)

(assert (=> b!558193 (= e!321555 e!321559)))

(declare-fun res!350047 () Bool)

(assert (=> b!558193 (=> (not res!350047) (not e!321559))))

(declare-fun lt!253641 () SeekEntryResult!5321)

(assert (=> b!558193 (= res!350047 (or (= lt!253641 (MissingZero!5321 i!1132)) (= lt!253641 (MissingVacant!5321 i!1132))))))

(assert (=> b!558193 (= lt!253641 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558194 () Bool)

(declare-fun res!350053 () Bool)

(assert (=> b!558194 (=> (not res!350053) (not e!321555))))

(assert (=> b!558194 (= res!350053 (validKeyInArray!0 (select (arr!16872 a!3118) j!142)))))

(assert (= (and start!51080 res!350051) b!558191))

(assert (= (and b!558191 res!350052) b!558194))

(assert (= (and b!558194 res!350053) b!558188))

(assert (= (and b!558188 res!350049) b!558184))

(assert (= (and b!558184 res!350057) b!558193))

(assert (= (and b!558193 res!350047) b!558190))

(assert (= (and b!558190 res!350055) b!558187))

(assert (= (and b!558187 res!350046) b!558185))

(assert (= (and b!558185 res!350054) b!558186))

(assert (= (and b!558186 res!350056) b!558192))

(assert (= (and b!558192 (not res!350048)) b!558183))

(assert (= (and b!558186 (not res!350050)) b!558189))

(declare-fun m!536109 () Bool)

(assert (=> b!558192 m!536109))

(declare-fun m!536111 () Bool)

(assert (=> b!558192 m!536111))

(declare-fun m!536113 () Bool)

(assert (=> b!558184 m!536113))

(declare-fun m!536115 () Bool)

(assert (=> b!558193 m!536115))

(declare-fun m!536117 () Bool)

(assert (=> b!558188 m!536117))

(declare-fun m!536119 () Bool)

(assert (=> start!51080 m!536119))

(declare-fun m!536121 () Bool)

(assert (=> start!51080 m!536121))

(declare-fun m!536123 () Bool)

(assert (=> b!558187 m!536123))

(declare-fun m!536125 () Bool)

(assert (=> b!558190 m!536125))

(assert (=> b!558186 m!536111))

(declare-fun m!536127 () Bool)

(assert (=> b!558186 m!536127))

(assert (=> b!558186 m!536109))

(declare-fun m!536129 () Bool)

(assert (=> b!558186 m!536129))

(assert (=> b!558186 m!536111))

(declare-fun m!536131 () Bool)

(assert (=> b!558186 m!536131))

(assert (=> b!558185 m!536111))

(declare-fun m!536133 () Bool)

(assert (=> b!558185 m!536133))

(declare-fun m!536135 () Bool)

(assert (=> b!558185 m!536135))

(declare-fun m!536137 () Bool)

(assert (=> b!558185 m!536137))

(assert (=> b!558185 m!536135))

(declare-fun m!536139 () Bool)

(assert (=> b!558185 m!536139))

(assert (=> b!558185 m!536135))

(declare-fun m!536141 () Bool)

(assert (=> b!558185 m!536141))

(assert (=> b!558185 m!536111))

(declare-fun m!536143 () Bool)

(assert (=> b!558185 m!536143))

(assert (=> b!558185 m!536111))

(assert (=> b!558183 m!536111))

(assert (=> b!558183 m!536111))

(declare-fun m!536145 () Bool)

(assert (=> b!558183 m!536145))

(assert (=> b!558189 m!536137))

(assert (=> b!558189 m!536135))

(assert (=> b!558189 m!536135))

(declare-fun m!536147 () Bool)

(assert (=> b!558189 m!536147))

(assert (=> b!558194 m!536111))

(assert (=> b!558194 m!536111))

(declare-fun m!536149 () Bool)

(assert (=> b!558194 m!536149))

(push 1)

