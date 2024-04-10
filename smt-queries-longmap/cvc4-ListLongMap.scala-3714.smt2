; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51084 () Bool)

(assert start!51084)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!321597 () Bool)

(declare-fun b!558255 () Bool)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!35138 0))(
  ( (array!35139 (arr!16874 (Array (_ BitVec 32) (_ BitVec 64))) (size!17238 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35138)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558255 (= e!321597 (validKeyInArray!0 (select (store (arr!16874 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!321599 () Bool)

(declare-fun b!558256 () Bool)

(declare-datatypes ((SeekEntryResult!5323 0))(
  ( (MissingZero!5323 (index!23519 (_ BitVec 32))) (Found!5323 (index!23520 (_ BitVec 32))) (Intermediate!5323 (undefined!6135 Bool) (index!23521 (_ BitVec 32)) (x!52415 (_ BitVec 32))) (Undefined!5323) (MissingVacant!5323 (index!23522 (_ BitVec 32))) )
))
(declare-fun lt!253680 () SeekEntryResult!5323)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun lt!253679 () SeekEntryResult!5323)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35138 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!558256 (= e!321599 (= lt!253680 (seekKeyOrZeroReturnVacant!0 (x!52415 lt!253679) (index!23521 lt!253679) (index!23521 lt!253679) (select (arr!16874 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558257 () Bool)

(declare-fun res!350127 () Bool)

(declare-fun e!321600 () Bool)

(assert (=> b!558257 (=> (not res!350127) (not e!321600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35138 (_ BitVec 32)) Bool)

(assert (=> b!558257 (= res!350127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558258 () Bool)

(declare-fun e!321598 () Bool)

(assert (=> b!558258 (= e!321598 e!321599)))

(declare-fun res!350119 () Bool)

(assert (=> b!558258 (=> res!350119 e!321599)))

(assert (=> b!558258 (= res!350119 (or (undefined!6135 lt!253679) (not (is-Intermediate!5323 lt!253679)) (= (select (arr!16874 a!3118) (index!23521 lt!253679)) (select (arr!16874 a!3118) j!142)) (= (select (arr!16874 a!3118) (index!23521 lt!253679)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558259 () Bool)

(declare-fun res!350118 () Bool)

(declare-fun e!321603 () Bool)

(assert (=> b!558259 (=> (not res!350118) (not e!321603))))

(assert (=> b!558259 (= res!350118 (and (= (size!17238 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17238 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17238 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558260 () Bool)

(declare-fun e!321602 () Bool)

(assert (=> b!558260 (= e!321600 e!321602)))

(declare-fun res!350124 () Bool)

(assert (=> b!558260 (=> (not res!350124) (not e!321602))))

(declare-fun lt!253681 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35138 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!558260 (= res!350124 (= lt!253679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253681 (select (store (arr!16874 a!3118) i!1132 k!1914) j!142) (array!35139 (store (arr!16874 a!3118) i!1132 k!1914) (size!17238 a!3118)) mask!3119)))))

(declare-fun lt!253677 () (_ BitVec 32))

(assert (=> b!558260 (= lt!253679 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253677 (select (arr!16874 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558260 (= lt!253681 (toIndex!0 (select (store (arr!16874 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558260 (= lt!253677 (toIndex!0 (select (arr!16874 a!3118) j!142) mask!3119))))

(declare-fun b!558261 () Bool)

(declare-fun res!350125 () Bool)

(assert (=> b!558261 (=> (not res!350125) (not e!321603))))

(declare-fun arrayContainsKey!0 (array!35138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558261 (= res!350125 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558262 () Bool)

(assert (=> b!558262 (= e!321603 e!321600)))

(declare-fun res!350128 () Bool)

(assert (=> b!558262 (=> (not res!350128) (not e!321600))))

(declare-fun lt!253678 () SeekEntryResult!5323)

(assert (=> b!558262 (= res!350128 (or (= lt!253678 (MissingZero!5323 i!1132)) (= lt!253678 (MissingVacant!5323 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35138 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!558262 (= lt!253678 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558263 () Bool)

(declare-fun res!350122 () Bool)

(assert (=> b!558263 (=> (not res!350122) (not e!321603))))

(assert (=> b!558263 (= res!350122 (validKeyInArray!0 (select (arr!16874 a!3118) j!142)))))

(declare-fun b!558264 () Bool)

(assert (=> b!558264 (= e!321602 (not e!321597))))

(declare-fun res!350120 () Bool)

(assert (=> b!558264 (=> res!350120 e!321597)))

(assert (=> b!558264 (= res!350120 (or (undefined!6135 lt!253679) (not (is-Intermediate!5323 lt!253679)) (= (select (arr!16874 a!3118) (index!23521 lt!253679)) (select (arr!16874 a!3118) j!142)) (= (select (arr!16874 a!3118) (index!23521 lt!253679)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!558264 e!321598))

(declare-fun res!350126 () Bool)

(assert (=> b!558264 (=> (not res!350126) (not e!321598))))

(assert (=> b!558264 (= res!350126 (= lt!253680 (Found!5323 j!142)))))

(assert (=> b!558264 (= lt!253680 (seekEntryOrOpen!0 (select (arr!16874 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558264 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17420 0))(
  ( (Unit!17421) )
))
(declare-fun lt!253676 () Unit!17420)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17420)

(assert (=> b!558264 (= lt!253676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558265 () Bool)

(declare-fun res!350129 () Bool)

(assert (=> b!558265 (=> (not res!350129) (not e!321603))))

(assert (=> b!558265 (= res!350129 (validKeyInArray!0 k!1914))))

(declare-fun res!350121 () Bool)

(assert (=> start!51084 (=> (not res!350121) (not e!321603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51084 (= res!350121 (validMask!0 mask!3119))))

(assert (=> start!51084 e!321603))

(assert (=> start!51084 true))

(declare-fun array_inv!12670 (array!35138) Bool)

(assert (=> start!51084 (array_inv!12670 a!3118)))

(declare-fun b!558266 () Bool)

(declare-fun res!350123 () Bool)

(assert (=> b!558266 (=> (not res!350123) (not e!321600))))

(declare-datatypes ((List!10954 0))(
  ( (Nil!10951) (Cons!10950 (h!11944 (_ BitVec 64)) (t!17182 List!10954)) )
))
(declare-fun arrayNoDuplicates!0 (array!35138 (_ BitVec 32) List!10954) Bool)

(assert (=> b!558266 (= res!350123 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10951))))

(assert (= (and start!51084 res!350121) b!558259))

(assert (= (and b!558259 res!350118) b!558263))

(assert (= (and b!558263 res!350122) b!558265))

(assert (= (and b!558265 res!350129) b!558261))

(assert (= (and b!558261 res!350125) b!558262))

(assert (= (and b!558262 res!350128) b!558257))

(assert (= (and b!558257 res!350127) b!558266))

(assert (= (and b!558266 res!350123) b!558260))

(assert (= (and b!558260 res!350124) b!558264))

(assert (= (and b!558264 res!350126) b!558258))

(assert (= (and b!558258 (not res!350119)) b!558256))

(assert (= (and b!558264 (not res!350120)) b!558255))

(declare-fun m!536193 () Bool)

(assert (=> b!558264 m!536193))

(declare-fun m!536195 () Bool)

(assert (=> b!558264 m!536195))

(declare-fun m!536197 () Bool)

(assert (=> b!558264 m!536197))

(declare-fun m!536199 () Bool)

(assert (=> b!558264 m!536199))

(assert (=> b!558264 m!536197))

(declare-fun m!536201 () Bool)

(assert (=> b!558264 m!536201))

(declare-fun m!536203 () Bool)

(assert (=> b!558265 m!536203))

(assert (=> b!558258 m!536201))

(assert (=> b!558258 m!536197))

(declare-fun m!536205 () Bool)

(assert (=> b!558266 m!536205))

(assert (=> b!558256 m!536197))

(assert (=> b!558256 m!536197))

(declare-fun m!536207 () Bool)

(assert (=> b!558256 m!536207))

(declare-fun m!536209 () Bool)

(assert (=> b!558257 m!536209))

(declare-fun m!536211 () Bool)

(assert (=> b!558262 m!536211))

(assert (=> b!558260 m!536197))

(declare-fun m!536213 () Bool)

(assert (=> b!558260 m!536213))

(assert (=> b!558260 m!536197))

(declare-fun m!536215 () Bool)

(assert (=> b!558260 m!536215))

(assert (=> b!558260 m!536197))

(declare-fun m!536217 () Bool)

(assert (=> b!558260 m!536217))

(declare-fun m!536219 () Bool)

(assert (=> b!558260 m!536219))

(assert (=> b!558260 m!536217))

(declare-fun m!536221 () Bool)

(assert (=> b!558260 m!536221))

(assert (=> b!558260 m!536217))

(declare-fun m!536223 () Bool)

(assert (=> b!558260 m!536223))

(assert (=> b!558255 m!536219))

(assert (=> b!558255 m!536217))

(assert (=> b!558255 m!536217))

(declare-fun m!536225 () Bool)

(assert (=> b!558255 m!536225))

(declare-fun m!536227 () Bool)

(assert (=> start!51084 m!536227))

(declare-fun m!536229 () Bool)

(assert (=> start!51084 m!536229))

(declare-fun m!536231 () Bool)

(assert (=> b!558261 m!536231))

(assert (=> b!558263 m!536197))

(assert (=> b!558263 m!536197))

(declare-fun m!536233 () Bool)

(assert (=> b!558263 m!536233))

(push 1)

