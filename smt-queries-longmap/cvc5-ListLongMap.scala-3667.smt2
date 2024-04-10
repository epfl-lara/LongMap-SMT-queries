; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50618 () Bool)

(assert start!50618)

(declare-fun b!553184 () Bool)

(declare-fun res!345604 () Bool)

(declare-fun e!319133 () Bool)

(assert (=> b!553184 (=> (not res!345604) (not e!319133))))

(declare-datatypes ((array!34843 0))(
  ( (array!34844 (arr!16731 (Array (_ BitVec 32) (_ BitVec 64))) (size!17095 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34843)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34843 (_ BitVec 32)) Bool)

(assert (=> b!553184 (= res!345604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553185 () Bool)

(declare-fun e!319130 () Bool)

(declare-datatypes ((SeekEntryResult!5180 0))(
  ( (MissingZero!5180 (index!22947 (_ BitVec 32))) (Found!5180 (index!22948 (_ BitVec 32))) (Intermediate!5180 (undefined!5992 Bool) (index!22949 (_ BitVec 32)) (x!51878 (_ BitVec 32))) (Undefined!5180) (MissingVacant!5180 (index!22950 (_ BitVec 32))) )
))
(declare-fun lt!251392 () SeekEntryResult!5180)

(assert (=> b!553185 (= e!319130 (not (or (not (is-Intermediate!5180 lt!251392)) (not (undefined!5992 lt!251392)) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(declare-fun e!319131 () Bool)

(assert (=> b!553185 e!319131))

(declare-fun res!345605 () Bool)

(assert (=> b!553185 (=> (not res!345605) (not e!319131))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!553185 (= res!345605 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17134 0))(
  ( (Unit!17135) )
))
(declare-fun lt!251389 () Unit!17134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17134)

(assert (=> b!553185 (= lt!251389 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!345602 () Bool)

(declare-fun e!319132 () Bool)

(assert (=> start!50618 (=> (not res!345602) (not e!319132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50618 (= res!345602 (validMask!0 mask!3119))))

(assert (=> start!50618 e!319132))

(assert (=> start!50618 true))

(declare-fun array_inv!12527 (array!34843) Bool)

(assert (=> start!50618 (array_inv!12527 a!3118)))

(declare-fun b!553186 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34843 (_ BitVec 32)) SeekEntryResult!5180)

(assert (=> b!553186 (= e!319131 (= (seekEntryOrOpen!0 (select (arr!16731 a!3118) j!142) a!3118 mask!3119) (Found!5180 j!142)))))

(declare-fun b!553187 () Bool)

(declare-fun res!345597 () Bool)

(assert (=> b!553187 (=> (not res!345597) (not e!319132))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553187 (= res!345597 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553188 () Bool)

(declare-fun res!345603 () Bool)

(assert (=> b!553188 (=> (not res!345603) (not e!319132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553188 (= res!345603 (validKeyInArray!0 k!1914))))

(declare-fun b!553189 () Bool)

(declare-fun res!345601 () Bool)

(assert (=> b!553189 (=> (not res!345601) (not e!319132))))

(assert (=> b!553189 (= res!345601 (validKeyInArray!0 (select (arr!16731 a!3118) j!142)))))

(declare-fun b!553190 () Bool)

(assert (=> b!553190 (= e!319132 e!319133)))

(declare-fun res!345596 () Bool)

(assert (=> b!553190 (=> (not res!345596) (not e!319133))))

(declare-fun lt!251388 () SeekEntryResult!5180)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553190 (= res!345596 (or (= lt!251388 (MissingZero!5180 i!1132)) (= lt!251388 (MissingVacant!5180 i!1132))))))

(assert (=> b!553190 (= lt!251388 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!553191 () Bool)

(declare-fun res!345600 () Bool)

(assert (=> b!553191 (=> (not res!345600) (not e!319133))))

(declare-datatypes ((List!10811 0))(
  ( (Nil!10808) (Cons!10807 (h!11792 (_ BitVec 64)) (t!17039 List!10811)) )
))
(declare-fun arrayNoDuplicates!0 (array!34843 (_ BitVec 32) List!10811) Bool)

(assert (=> b!553191 (= res!345600 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10808))))

(declare-fun b!553192 () Bool)

(declare-fun res!345599 () Bool)

(assert (=> b!553192 (=> (not res!345599) (not e!319132))))

(assert (=> b!553192 (= res!345599 (and (= (size!17095 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17095 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17095 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553193 () Bool)

(assert (=> b!553193 (= e!319133 e!319130)))

(declare-fun res!345598 () Bool)

(assert (=> b!553193 (=> (not res!345598) (not e!319130))))

(declare-fun lt!251391 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34843 (_ BitVec 32)) SeekEntryResult!5180)

(assert (=> b!553193 (= res!345598 (= lt!251392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251391 (select (store (arr!16731 a!3118) i!1132 k!1914) j!142) (array!34844 (store (arr!16731 a!3118) i!1132 k!1914) (size!17095 a!3118)) mask!3119)))))

(declare-fun lt!251390 () (_ BitVec 32))

(assert (=> b!553193 (= lt!251392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251390 (select (arr!16731 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553193 (= lt!251391 (toIndex!0 (select (store (arr!16731 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!553193 (= lt!251390 (toIndex!0 (select (arr!16731 a!3118) j!142) mask!3119))))

(assert (= (and start!50618 res!345602) b!553192))

(assert (= (and b!553192 res!345599) b!553189))

(assert (= (and b!553189 res!345601) b!553188))

(assert (= (and b!553188 res!345603) b!553187))

(assert (= (and b!553187 res!345597) b!553190))

(assert (= (and b!553190 res!345596) b!553184))

(assert (= (and b!553184 res!345604) b!553191))

(assert (= (and b!553191 res!345600) b!553193))

(assert (= (and b!553193 res!345598) b!553185))

(assert (= (and b!553185 res!345605) b!553186))

(declare-fun m!530217 () Bool)

(assert (=> b!553184 m!530217))

(declare-fun m!530219 () Bool)

(assert (=> start!50618 m!530219))

(declare-fun m!530221 () Bool)

(assert (=> start!50618 m!530221))

(declare-fun m!530223 () Bool)

(assert (=> b!553191 m!530223))

(declare-fun m!530225 () Bool)

(assert (=> b!553193 m!530225))

(declare-fun m!530227 () Bool)

(assert (=> b!553193 m!530227))

(assert (=> b!553193 m!530225))

(declare-fun m!530229 () Bool)

(assert (=> b!553193 m!530229))

(assert (=> b!553193 m!530225))

(declare-fun m!530231 () Bool)

(assert (=> b!553193 m!530231))

(declare-fun m!530233 () Bool)

(assert (=> b!553193 m!530233))

(assert (=> b!553193 m!530231))

(declare-fun m!530235 () Bool)

(assert (=> b!553193 m!530235))

(assert (=> b!553193 m!530231))

(declare-fun m!530237 () Bool)

(assert (=> b!553193 m!530237))

(assert (=> b!553189 m!530225))

(assert (=> b!553189 m!530225))

(declare-fun m!530239 () Bool)

(assert (=> b!553189 m!530239))

(declare-fun m!530241 () Bool)

(assert (=> b!553190 m!530241))

(declare-fun m!530243 () Bool)

(assert (=> b!553185 m!530243))

(declare-fun m!530245 () Bool)

(assert (=> b!553185 m!530245))

(declare-fun m!530247 () Bool)

(assert (=> b!553187 m!530247))

(assert (=> b!553186 m!530225))

(assert (=> b!553186 m!530225))

(declare-fun m!530249 () Bool)

(assert (=> b!553186 m!530249))

(declare-fun m!530251 () Bool)

(assert (=> b!553188 m!530251))

(push 1)

