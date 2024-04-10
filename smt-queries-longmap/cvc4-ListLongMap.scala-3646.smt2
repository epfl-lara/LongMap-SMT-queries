; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50256 () Bool)

(assert start!50256)

(declare-fun res!343325 () Bool)

(declare-fun e!317610 () Bool)

(assert (=> start!50256 (=> (not res!343325) (not e!317610))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50256 (= res!343325 (validMask!0 mask!3119))))

(assert (=> start!50256 e!317610))

(assert (=> start!50256 true))

(declare-datatypes ((array!34709 0))(
  ( (array!34710 (arr!16670 (Array (_ BitVec 32) (_ BitVec 64))) (size!17034 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34709)

(declare-fun array_inv!12466 (array!34709) Bool)

(assert (=> start!50256 (array_inv!12466 a!3118)))

(declare-fun b!550181 () Bool)

(declare-fun e!317607 () Bool)

(assert (=> b!550181 (= e!317607 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!317608 () Bool)

(assert (=> b!550181 e!317608))

(declare-fun res!343330 () Bool)

(assert (=> b!550181 (=> (not res!343330) (not e!317608))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34709 (_ BitVec 32)) Bool)

(assert (=> b!550181 (= res!343330 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17012 0))(
  ( (Unit!17013) )
))
(declare-fun lt!250429 () Unit!17012)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34709 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17012)

(assert (=> b!550181 (= lt!250429 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!550182 () Bool)

(declare-fun res!343326 () Bool)

(assert (=> b!550182 (=> (not res!343326) (not e!317607))))

(declare-datatypes ((List!10750 0))(
  ( (Nil!10747) (Cons!10746 (h!11719 (_ BitVec 64)) (t!16978 List!10750)) )
))
(declare-fun arrayNoDuplicates!0 (array!34709 (_ BitVec 32) List!10750) Bool)

(assert (=> b!550182 (= res!343326 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10747))))

(declare-fun b!550183 () Bool)

(assert (=> b!550183 (= e!317610 e!317607)))

(declare-fun res!343331 () Bool)

(assert (=> b!550183 (=> (not res!343331) (not e!317607))))

(declare-datatypes ((SeekEntryResult!5119 0))(
  ( (MissingZero!5119 (index!22703 (_ BitVec 32))) (Found!5119 (index!22704 (_ BitVec 32))) (Intermediate!5119 (undefined!5931 Bool) (index!22705 (_ BitVec 32)) (x!51625 (_ BitVec 32))) (Undefined!5119) (MissingVacant!5119 (index!22706 (_ BitVec 32))) )
))
(declare-fun lt!250428 () SeekEntryResult!5119)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!550183 (= res!343331 (or (= lt!250428 (MissingZero!5119 i!1132)) (= lt!250428 (MissingVacant!5119 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34709 (_ BitVec 32)) SeekEntryResult!5119)

(assert (=> b!550183 (= lt!250428 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!550184 () Bool)

(declare-fun res!343334 () Bool)

(assert (=> b!550184 (=> (not res!343334) (not e!317610))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!550184 (= res!343334 (validKeyInArray!0 (select (arr!16670 a!3118) j!142)))))

(declare-fun b!550185 () Bool)

(declare-fun res!343333 () Bool)

(assert (=> b!550185 (=> (not res!343333) (not e!317607))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34709 (_ BitVec 32)) SeekEntryResult!5119)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!550185 (= res!343333 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16670 a!3118) j!142) mask!3119) (select (arr!16670 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16670 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16670 a!3118) i!1132 k!1914) j!142) (array!34710 (store (arr!16670 a!3118) i!1132 k!1914) (size!17034 a!3118)) mask!3119)))))

(declare-fun b!550186 () Bool)

(declare-fun res!343332 () Bool)

(assert (=> b!550186 (=> (not res!343332) (not e!317610))))

(assert (=> b!550186 (= res!343332 (validKeyInArray!0 k!1914))))

(declare-fun b!550187 () Bool)

(declare-fun res!343327 () Bool)

(assert (=> b!550187 (=> (not res!343327) (not e!317607))))

(assert (=> b!550187 (= res!343327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!550188 () Bool)

(declare-fun res!343329 () Bool)

(assert (=> b!550188 (=> (not res!343329) (not e!317610))))

(declare-fun arrayContainsKey!0 (array!34709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!550188 (= res!343329 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!550189 () Bool)

(declare-fun res!343328 () Bool)

(assert (=> b!550189 (=> (not res!343328) (not e!317610))))

(assert (=> b!550189 (= res!343328 (and (= (size!17034 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17034 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17034 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!550190 () Bool)

(assert (=> b!550190 (= e!317608 (= (seekEntryOrOpen!0 (select (arr!16670 a!3118) j!142) a!3118 mask!3119) (Found!5119 j!142)))))

(assert (= (and start!50256 res!343325) b!550189))

(assert (= (and b!550189 res!343328) b!550184))

(assert (= (and b!550184 res!343334) b!550186))

(assert (= (and b!550186 res!343332) b!550188))

(assert (= (and b!550188 res!343329) b!550183))

(assert (= (and b!550183 res!343331) b!550187))

(assert (= (and b!550187 res!343327) b!550182))

(assert (= (and b!550182 res!343326) b!550185))

(assert (= (and b!550185 res!343333) b!550181))

(assert (= (and b!550181 res!343330) b!550190))

(declare-fun m!527211 () Bool)

(assert (=> b!550184 m!527211))

(assert (=> b!550184 m!527211))

(declare-fun m!527213 () Bool)

(assert (=> b!550184 m!527213))

(declare-fun m!527215 () Bool)

(assert (=> start!50256 m!527215))

(declare-fun m!527217 () Bool)

(assert (=> start!50256 m!527217))

(assert (=> b!550185 m!527211))

(declare-fun m!527219 () Bool)

(assert (=> b!550185 m!527219))

(assert (=> b!550185 m!527211))

(declare-fun m!527221 () Bool)

(assert (=> b!550185 m!527221))

(declare-fun m!527223 () Bool)

(assert (=> b!550185 m!527223))

(assert (=> b!550185 m!527221))

(declare-fun m!527225 () Bool)

(assert (=> b!550185 m!527225))

(assert (=> b!550185 m!527219))

(assert (=> b!550185 m!527211))

(declare-fun m!527227 () Bool)

(assert (=> b!550185 m!527227))

(declare-fun m!527229 () Bool)

(assert (=> b!550185 m!527229))

(assert (=> b!550185 m!527221))

(assert (=> b!550185 m!527223))

(declare-fun m!527231 () Bool)

(assert (=> b!550187 m!527231))

(declare-fun m!527233 () Bool)

(assert (=> b!550182 m!527233))

(assert (=> b!550190 m!527211))

(assert (=> b!550190 m!527211))

(declare-fun m!527235 () Bool)

(assert (=> b!550190 m!527235))

(declare-fun m!527237 () Bool)

(assert (=> b!550186 m!527237))

(declare-fun m!527239 () Bool)

(assert (=> b!550181 m!527239))

(declare-fun m!527241 () Bool)

(assert (=> b!550181 m!527241))

(declare-fun m!527243 () Bool)

(assert (=> b!550188 m!527243))

(declare-fun m!527245 () Bool)

(assert (=> b!550183 m!527245))

(push 1)

(assert (not b!550186))

(assert (not b!550183))

