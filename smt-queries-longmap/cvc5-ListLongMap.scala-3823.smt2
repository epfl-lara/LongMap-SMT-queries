; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52424 () Bool)

(assert start!52424)

(declare-fun b!572231 () Bool)

(declare-fun e!329148 () Bool)

(declare-fun e!329149 () Bool)

(assert (=> b!572231 (= e!329148 e!329149)))

(declare-fun res!361744 () Bool)

(assert (=> b!572231 (=> (not res!361744) (not e!329149))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5648 0))(
  ( (MissingZero!5648 (index!24819 (_ BitVec 32))) (Found!5648 (index!24820 (_ BitVec 32))) (Intermediate!5648 (undefined!6460 Bool) (index!24821 (_ BitVec 32)) (x!53693 (_ BitVec 32))) (Undefined!5648) (MissingVacant!5648 (index!24822 (_ BitVec 32))) )
))
(declare-fun lt!261100 () SeekEntryResult!5648)

(declare-fun lt!261096 () SeekEntryResult!5648)

(declare-datatypes ((array!35821 0))(
  ( (array!35822 (arr!17199 (Array (_ BitVec 32) (_ BitVec 64))) (size!17563 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35821)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35821 (_ BitVec 32)) SeekEntryResult!5648)

(assert (=> b!572231 (= res!361744 (= lt!261100 (seekKeyOrZeroReturnVacant!0 (x!53693 lt!261096) (index!24821 lt!261096) (index!24821 lt!261096) (select (arr!17199 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!572232 () Bool)

(declare-fun res!361751 () Bool)

(declare-fun e!329151 () Bool)

(assert (=> b!572232 (=> (not res!361751) (not e!329151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35821 (_ BitVec 32)) Bool)

(assert (=> b!572232 (= res!361751 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!572234 () Bool)

(declare-fun res!361748 () Bool)

(declare-fun e!329150 () Bool)

(assert (=> b!572234 (=> (not res!361748) (not e!329150))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!572234 (= res!361748 (validKeyInArray!0 k!1914))))

(declare-fun b!572235 () Bool)

(assert (=> b!572235 (= e!329150 e!329151)))

(declare-fun res!361747 () Bool)

(assert (=> b!572235 (=> (not res!361747) (not e!329151))))

(declare-fun lt!261097 () SeekEntryResult!5648)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!572235 (= res!361747 (or (= lt!261097 (MissingZero!5648 i!1132)) (= lt!261097 (MissingVacant!5648 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35821 (_ BitVec 32)) SeekEntryResult!5648)

(assert (=> b!572235 (= lt!261097 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!572236 () Bool)

(declare-fun res!361739 () Bool)

(assert (=> b!572236 (=> (not res!361739) (not e!329150))))

(declare-fun arrayContainsKey!0 (array!35821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!572236 (= res!361739 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!572237 () Bool)

(declare-fun res!361745 () Bool)

(assert (=> b!572237 (=> (not res!361745) (not e!329150))))

(assert (=> b!572237 (= res!361745 (and (= (size!17563 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17563 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17563 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!572233 () Bool)

(declare-fun e!329153 () Bool)

(assert (=> b!572233 (= e!329153 e!329148)))

(declare-fun res!361742 () Bool)

(assert (=> b!572233 (=> res!361742 e!329148)))

(declare-fun lt!261095 () (_ BitVec 64))

(assert (=> b!572233 (= res!361742 (or (= lt!261095 (select (arr!17199 a!3118) j!142)) (= lt!261095 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!572233 (= lt!261095 (select (arr!17199 a!3118) (index!24821 lt!261096)))))

(declare-fun res!361741 () Bool)

(assert (=> start!52424 (=> (not res!361741) (not e!329150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52424 (= res!361741 (validMask!0 mask!3119))))

(assert (=> start!52424 e!329150))

(assert (=> start!52424 true))

(declare-fun array_inv!12995 (array!35821) Bool)

(assert (=> start!52424 (array_inv!12995 a!3118)))

(declare-fun b!572238 () Bool)

(declare-fun res!361740 () Bool)

(assert (=> b!572238 (=> (not res!361740) (not e!329151))))

(declare-datatypes ((List!11279 0))(
  ( (Nil!11276) (Cons!11275 (h!12302 (_ BitVec 64)) (t!17507 List!11279)) )
))
(declare-fun arrayNoDuplicates!0 (array!35821 (_ BitVec 32) List!11279) Bool)

(assert (=> b!572238 (= res!361740 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11276))))

(declare-fun b!572239 () Bool)

(declare-fun e!329154 () Bool)

(assert (=> b!572239 (= e!329151 e!329154)))

(declare-fun res!361749 () Bool)

(assert (=> b!572239 (=> (not res!361749) (not e!329154))))

(declare-fun lt!261098 () (_ BitVec 32))

(declare-fun lt!261099 () (_ BitVec 64))

(declare-fun lt!261094 () array!35821)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35821 (_ BitVec 32)) SeekEntryResult!5648)

(assert (=> b!572239 (= res!361749 (= lt!261096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261098 lt!261099 lt!261094 mask!3119)))))

(declare-fun lt!261093 () (_ BitVec 32))

(assert (=> b!572239 (= lt!261096 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!261093 (select (arr!17199 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!572239 (= lt!261098 (toIndex!0 lt!261099 mask!3119))))

(assert (=> b!572239 (= lt!261099 (select (store (arr!17199 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!572239 (= lt!261093 (toIndex!0 (select (arr!17199 a!3118) j!142) mask!3119))))

(assert (=> b!572239 (= lt!261094 (array!35822 (store (arr!17199 a!3118) i!1132 k!1914) (size!17563 a!3118)))))

(declare-fun b!572240 () Bool)

(assert (=> b!572240 (= e!329149 (= (seekEntryOrOpen!0 lt!261099 lt!261094 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53693 lt!261096) (index!24821 lt!261096) (index!24821 lt!261096) lt!261099 lt!261094 mask!3119)))))

(declare-fun b!572241 () Bool)

(declare-fun e!329147 () Bool)

(assert (=> b!572241 (= e!329147 e!329153)))

(declare-fun res!361746 () Bool)

(assert (=> b!572241 (=> res!361746 e!329153)))

(assert (=> b!572241 (= res!361746 (or (undefined!6460 lt!261096) (not (is-Intermediate!5648 lt!261096))))))

(declare-fun b!572242 () Bool)

(declare-fun res!361750 () Bool)

(assert (=> b!572242 (=> (not res!361750) (not e!329150))))

(assert (=> b!572242 (= res!361750 (validKeyInArray!0 (select (arr!17199 a!3118) j!142)))))

(declare-fun b!572243 () Bool)

(assert (=> b!572243 (= e!329154 (not true))))

(assert (=> b!572243 e!329147))

(declare-fun res!361743 () Bool)

(assert (=> b!572243 (=> (not res!361743) (not e!329147))))

(assert (=> b!572243 (= res!361743 (= lt!261100 (Found!5648 j!142)))))

(assert (=> b!572243 (= lt!261100 (seekEntryOrOpen!0 (select (arr!17199 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!572243 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17998 0))(
  ( (Unit!17999) )
))
(declare-fun lt!261092 () Unit!17998)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17998)

(assert (=> b!572243 (= lt!261092 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52424 res!361741) b!572237))

(assert (= (and b!572237 res!361745) b!572242))

(assert (= (and b!572242 res!361750) b!572234))

(assert (= (and b!572234 res!361748) b!572236))

(assert (= (and b!572236 res!361739) b!572235))

(assert (= (and b!572235 res!361747) b!572232))

(assert (= (and b!572232 res!361751) b!572238))

(assert (= (and b!572238 res!361740) b!572239))

(assert (= (and b!572239 res!361749) b!572243))

(assert (= (and b!572243 res!361743) b!572241))

(assert (= (and b!572241 (not res!361746)) b!572233))

(assert (= (and b!572233 (not res!361742)) b!572231))

(assert (= (and b!572231 res!361744) b!572240))

(declare-fun m!551181 () Bool)

(assert (=> b!572231 m!551181))

(assert (=> b!572231 m!551181))

(declare-fun m!551183 () Bool)

(assert (=> b!572231 m!551183))

(declare-fun m!551185 () Bool)

(assert (=> b!572240 m!551185))

(declare-fun m!551187 () Bool)

(assert (=> b!572240 m!551187))

(declare-fun m!551189 () Bool)

(assert (=> b!572235 m!551189))

(declare-fun m!551191 () Bool)

(assert (=> b!572232 m!551191))

(assert (=> b!572239 m!551181))

(declare-fun m!551193 () Bool)

(assert (=> b!572239 m!551193))

(assert (=> b!572239 m!551181))

(declare-fun m!551195 () Bool)

(assert (=> b!572239 m!551195))

(declare-fun m!551197 () Bool)

(assert (=> b!572239 m!551197))

(declare-fun m!551199 () Bool)

(assert (=> b!572239 m!551199))

(declare-fun m!551201 () Bool)

(assert (=> b!572239 m!551201))

(assert (=> b!572239 m!551181))

(declare-fun m!551203 () Bool)

(assert (=> b!572239 m!551203))

(declare-fun m!551205 () Bool)

(assert (=> b!572238 m!551205))

(declare-fun m!551207 () Bool)

(assert (=> start!52424 m!551207))

(declare-fun m!551209 () Bool)

(assert (=> start!52424 m!551209))

(declare-fun m!551211 () Bool)

(assert (=> b!572234 m!551211))

(assert (=> b!572243 m!551181))

(assert (=> b!572243 m!551181))

(declare-fun m!551213 () Bool)

(assert (=> b!572243 m!551213))

(declare-fun m!551215 () Bool)

(assert (=> b!572243 m!551215))

(declare-fun m!551217 () Bool)

(assert (=> b!572243 m!551217))

(assert (=> b!572233 m!551181))

(declare-fun m!551219 () Bool)

(assert (=> b!572233 m!551219))

(assert (=> b!572242 m!551181))

(assert (=> b!572242 m!551181))

(declare-fun m!551221 () Bool)

(assert (=> b!572242 m!551221))

(declare-fun m!551223 () Bool)

(assert (=> b!572236 m!551223))

(push 1)

