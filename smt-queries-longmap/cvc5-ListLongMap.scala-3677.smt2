; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50678 () Bool)

(assert start!50678)

(declare-fun b!554095 () Bool)

(declare-fun res!346512 () Bool)

(declare-fun e!319541 () Bool)

(assert (=> b!554095 (=> (not res!346512) (not e!319541))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554095 (= res!346512 (validKeyInArray!0 k!1914))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!554096 () Bool)

(declare-fun e!319540 () Bool)

(declare-datatypes ((array!34903 0))(
  ( (array!34904 (arr!16761 (Array (_ BitVec 32) (_ BitVec 64))) (size!17125 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34903)

(declare-datatypes ((SeekEntryResult!5210 0))(
  ( (MissingZero!5210 (index!23067 (_ BitVec 32))) (Found!5210 (index!23068 (_ BitVec 32))) (Intermediate!5210 (undefined!6022 Bool) (index!23069 (_ BitVec 32)) (x!51988 (_ BitVec 32))) (Undefined!5210) (MissingVacant!5210 (index!23070 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34903 (_ BitVec 32)) SeekEntryResult!5210)

(assert (=> b!554096 (= e!319540 (= (seekEntryOrOpen!0 (select (arr!16761 a!3118) j!142) a!3118 mask!3119) (Found!5210 j!142)))))

(declare-fun b!554097 () Bool)

(declare-fun res!346510 () Bool)

(declare-fun e!319538 () Bool)

(assert (=> b!554097 (=> (not res!346510) (not e!319538))))

(declare-datatypes ((List!10841 0))(
  ( (Nil!10838) (Cons!10837 (h!11822 (_ BitVec 64)) (t!17069 List!10841)) )
))
(declare-fun arrayNoDuplicates!0 (array!34903 (_ BitVec 32) List!10841) Bool)

(assert (=> b!554097 (= res!346510 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10838))))

(declare-fun b!554098 () Bool)

(declare-fun res!346516 () Bool)

(assert (=> b!554098 (=> (not res!346516) (not e!319538))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34903 (_ BitVec 32)) Bool)

(assert (=> b!554098 (= res!346516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554099 () Bool)

(declare-fun res!346508 () Bool)

(assert (=> b!554099 (=> (not res!346508) (not e!319541))))

(declare-fun arrayContainsKey!0 (array!34903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554099 (= res!346508 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!554100 () Bool)

(declare-fun e!319539 () Bool)

(assert (=> b!554100 (= e!319538 e!319539)))

(declare-fun res!346511 () Bool)

(assert (=> b!554100 (=> (not res!346511) (not e!319539))))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun lt!251679 () (_ BitVec 32))

(declare-fun lt!251678 () SeekEntryResult!5210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34903 (_ BitVec 32)) SeekEntryResult!5210)

(assert (=> b!554100 (= res!346511 (= lt!251678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251679 (select (store (arr!16761 a!3118) i!1132 k!1914) j!142) (array!34904 (store (arr!16761 a!3118) i!1132 k!1914) (size!17125 a!3118)) mask!3119)))))

(declare-fun lt!251677 () (_ BitVec 32))

(assert (=> b!554100 (= lt!251678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!251677 (select (arr!16761 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554100 (= lt!251679 (toIndex!0 (select (store (arr!16761 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554100 (= lt!251677 (toIndex!0 (select (arr!16761 a!3118) j!142) mask!3119))))

(declare-fun b!554102 () Bool)

(declare-fun e!319537 () Bool)

(assert (=> b!554102 (= e!319539 (not e!319537))))

(declare-fun res!346517 () Bool)

(assert (=> b!554102 (=> res!346517 e!319537)))

(assert (=> b!554102 (= res!346517 (or (not (is-Intermediate!5210 lt!251678)) (undefined!6022 lt!251678) (not (= (select (arr!16761 a!3118) (index!23069 lt!251678)) (select (arr!16761 a!3118) j!142))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!554102 e!319540))

(declare-fun res!346513 () Bool)

(assert (=> b!554102 (=> (not res!346513) (not e!319540))))

(assert (=> b!554102 (= res!346513 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17194 0))(
  ( (Unit!17195) )
))
(declare-fun lt!251676 () Unit!17194)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17194)

(assert (=> b!554102 (= lt!251676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554103 () Bool)

(declare-fun res!346515 () Bool)

(assert (=> b!554103 (=> (not res!346515) (not e!319541))))

(assert (=> b!554103 (= res!346515 (validKeyInArray!0 (select (arr!16761 a!3118) j!142)))))

(declare-fun b!554104 () Bool)

(assert (=> b!554104 (= e!319537 (validKeyInArray!0 (select (store (arr!16761 a!3118) i!1132 k!1914) j!142)))))

(declare-fun b!554105 () Bool)

(assert (=> b!554105 (= e!319541 e!319538)))

(declare-fun res!346507 () Bool)

(assert (=> b!554105 (=> (not res!346507) (not e!319538))))

(declare-fun lt!251680 () SeekEntryResult!5210)

(assert (=> b!554105 (= res!346507 (or (= lt!251680 (MissingZero!5210 i!1132)) (= lt!251680 (MissingVacant!5210 i!1132))))))

(assert (=> b!554105 (= lt!251680 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun res!346509 () Bool)

(assert (=> start!50678 (=> (not res!346509) (not e!319541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50678 (= res!346509 (validMask!0 mask!3119))))

(assert (=> start!50678 e!319541))

(assert (=> start!50678 true))

(declare-fun array_inv!12557 (array!34903) Bool)

(assert (=> start!50678 (array_inv!12557 a!3118)))

(declare-fun b!554101 () Bool)

(declare-fun res!346514 () Bool)

(assert (=> b!554101 (=> (not res!346514) (not e!319541))))

(assert (=> b!554101 (= res!346514 (and (= (size!17125 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17125 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17125 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!50678 res!346509) b!554101))

(assert (= (and b!554101 res!346514) b!554103))

(assert (= (and b!554103 res!346515) b!554095))

(assert (= (and b!554095 res!346512) b!554099))

(assert (= (and b!554099 res!346508) b!554105))

(assert (= (and b!554105 res!346507) b!554098))

(assert (= (and b!554098 res!346516) b!554097))

(assert (= (and b!554097 res!346510) b!554100))

(assert (= (and b!554100 res!346511) b!554102))

(assert (= (and b!554102 res!346513) b!554096))

(assert (= (and b!554102 (not res!346517)) b!554104))

(declare-fun m!531315 () Bool)

(assert (=> b!554097 m!531315))

(declare-fun m!531317 () Bool)

(assert (=> b!554096 m!531317))

(assert (=> b!554096 m!531317))

(declare-fun m!531319 () Bool)

(assert (=> b!554096 m!531319))

(declare-fun m!531321 () Bool)

(assert (=> b!554098 m!531321))

(declare-fun m!531323 () Bool)

(assert (=> b!554105 m!531323))

(declare-fun m!531325 () Bool)

(assert (=> b!554102 m!531325))

(assert (=> b!554102 m!531317))

(declare-fun m!531327 () Bool)

(assert (=> b!554102 m!531327))

(declare-fun m!531329 () Bool)

(assert (=> b!554102 m!531329))

(assert (=> b!554100 m!531317))

(declare-fun m!531331 () Bool)

(assert (=> b!554100 m!531331))

(assert (=> b!554100 m!531317))

(declare-fun m!531333 () Bool)

(assert (=> b!554100 m!531333))

(declare-fun m!531335 () Bool)

(assert (=> b!554100 m!531335))

(assert (=> b!554100 m!531317))

(declare-fun m!531337 () Bool)

(assert (=> b!554100 m!531337))

(assert (=> b!554100 m!531333))

(declare-fun m!531339 () Bool)

(assert (=> b!554100 m!531339))

(assert (=> b!554100 m!531333))

(declare-fun m!531341 () Bool)

(assert (=> b!554100 m!531341))

(assert (=> b!554103 m!531317))

(assert (=> b!554103 m!531317))

(declare-fun m!531343 () Bool)

(assert (=> b!554103 m!531343))

(declare-fun m!531345 () Bool)

(assert (=> start!50678 m!531345))

(declare-fun m!531347 () Bool)

(assert (=> start!50678 m!531347))

(declare-fun m!531349 () Bool)

(assert (=> b!554095 m!531349))

(assert (=> b!554104 m!531339))

(assert (=> b!554104 m!531333))

(assert (=> b!554104 m!531333))

(declare-fun m!531351 () Bool)

(assert (=> b!554104 m!531351))

(declare-fun m!531353 () Bool)

(assert (=> b!554099 m!531353))

(push 1)

