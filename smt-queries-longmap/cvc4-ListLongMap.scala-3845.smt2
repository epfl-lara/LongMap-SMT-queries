; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52884 () Bool)

(assert start!52884)

(declare-fun res!364745 () Bool)

(declare-fun e!331671 () Bool)

(assert (=> start!52884 (=> (not res!364745) (not e!331671))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52884 (= res!364745 (validMask!0 mask!3119))))

(assert (=> start!52884 e!331671))

(assert (=> start!52884 true))

(declare-datatypes ((array!35972 0))(
  ( (array!35973 (arr!17267 (Array (_ BitVec 32) (_ BitVec 64))) (size!17631 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35972)

(declare-fun array_inv!13063 (array!35972) Bool)

(assert (=> start!52884 (array_inv!13063 a!3118)))

(declare-fun b!576512 () Bool)

(declare-fun res!364753 () Bool)

(declare-fun e!331668 () Bool)

(assert (=> b!576512 (=> (not res!364753) (not e!331668))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5716 0))(
  ( (MissingZero!5716 (index!25091 (_ BitVec 32))) (Found!5716 (index!25092 (_ BitVec 32))) (Intermediate!5716 (undefined!6528 Bool) (index!25093 (_ BitVec 32)) (x!53979 (_ BitVec 32))) (Undefined!5716) (MissingVacant!5716 (index!25094 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35972 (_ BitVec 32)) SeekEntryResult!5716)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576512 (= res!364753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17267 a!3118) j!142) mask!3119) (select (arr!17267 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17267 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17267 a!3118) i!1132 k!1914) j!142) (array!35973 (store (arr!17267 a!3118) i!1132 k!1914) (size!17631 a!3118)) mask!3119)))))

(declare-fun b!576513 () Bool)

(assert (=> b!576513 (= e!331668 (not true))))

(declare-fun e!331670 () Bool)

(assert (=> b!576513 e!331670))

(declare-fun res!364748 () Bool)

(assert (=> b!576513 (=> (not res!364748) (not e!331670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35972 (_ BitVec 32)) Bool)

(assert (=> b!576513 (= res!364748 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18134 0))(
  ( (Unit!18135) )
))
(declare-fun lt!263676 () Unit!18134)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35972 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18134)

(assert (=> b!576513 (= lt!263676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!576514 () Bool)

(declare-fun res!364746 () Bool)

(assert (=> b!576514 (=> (not res!364746) (not e!331671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576514 (= res!364746 (validKeyInArray!0 k!1914))))

(declare-fun b!576515 () Bool)

(declare-fun res!364750 () Bool)

(assert (=> b!576515 (=> (not res!364750) (not e!331671))))

(declare-fun arrayContainsKey!0 (array!35972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576515 (= res!364750 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576516 () Bool)

(assert (=> b!576516 (= e!331671 e!331668)))

(declare-fun res!364754 () Bool)

(assert (=> b!576516 (=> (not res!364754) (not e!331668))))

(declare-fun lt!263677 () SeekEntryResult!5716)

(assert (=> b!576516 (= res!364754 (or (= lt!263677 (MissingZero!5716 i!1132)) (= lt!263677 (MissingVacant!5716 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35972 (_ BitVec 32)) SeekEntryResult!5716)

(assert (=> b!576516 (= lt!263677 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576517 () Bool)

(declare-fun res!364751 () Bool)

(assert (=> b!576517 (=> (not res!364751) (not e!331671))))

(assert (=> b!576517 (= res!364751 (and (= (size!17631 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17631 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17631 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576518 () Bool)

(assert (=> b!576518 (= e!331670 (= (seekEntryOrOpen!0 (select (arr!17267 a!3118) j!142) a!3118 mask!3119) (Found!5716 j!142)))))

(declare-fun b!576519 () Bool)

(declare-fun res!364747 () Bool)

(assert (=> b!576519 (=> (not res!364747) (not e!331668))))

(assert (=> b!576519 (= res!364747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576520 () Bool)

(declare-fun res!364749 () Bool)

(assert (=> b!576520 (=> (not res!364749) (not e!331671))))

(assert (=> b!576520 (= res!364749 (validKeyInArray!0 (select (arr!17267 a!3118) j!142)))))

(declare-fun b!576521 () Bool)

(declare-fun res!364752 () Bool)

(assert (=> b!576521 (=> (not res!364752) (not e!331668))))

(declare-datatypes ((List!11347 0))(
  ( (Nil!11344) (Cons!11343 (h!12385 (_ BitVec 64)) (t!17575 List!11347)) )
))
(declare-fun arrayNoDuplicates!0 (array!35972 (_ BitVec 32) List!11347) Bool)

(assert (=> b!576521 (= res!364752 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11344))))

(assert (= (and start!52884 res!364745) b!576517))

(assert (= (and b!576517 res!364751) b!576520))

(assert (= (and b!576520 res!364749) b!576514))

(assert (= (and b!576514 res!364746) b!576515))

(assert (= (and b!576515 res!364750) b!576516))

(assert (= (and b!576516 res!364754) b!576519))

(assert (= (and b!576519 res!364747) b!576521))

(assert (= (and b!576521 res!364752) b!576512))

(assert (= (and b!576512 res!364753) b!576513))

(assert (= (and b!576513 res!364748) b!576518))

(declare-fun m!555489 () Bool)

(assert (=> b!576513 m!555489))

(declare-fun m!555491 () Bool)

(assert (=> b!576513 m!555491))

(declare-fun m!555493 () Bool)

(assert (=> b!576520 m!555493))

(assert (=> b!576520 m!555493))

(declare-fun m!555495 () Bool)

(assert (=> b!576520 m!555495))

(declare-fun m!555497 () Bool)

(assert (=> b!576514 m!555497))

(assert (=> b!576518 m!555493))

(assert (=> b!576518 m!555493))

(declare-fun m!555499 () Bool)

(assert (=> b!576518 m!555499))

(assert (=> b!576512 m!555493))

(declare-fun m!555501 () Bool)

(assert (=> b!576512 m!555501))

(assert (=> b!576512 m!555493))

(declare-fun m!555503 () Bool)

(assert (=> b!576512 m!555503))

(declare-fun m!555505 () Bool)

(assert (=> b!576512 m!555505))

(assert (=> b!576512 m!555503))

(declare-fun m!555507 () Bool)

(assert (=> b!576512 m!555507))

(assert (=> b!576512 m!555501))

(assert (=> b!576512 m!555493))

(declare-fun m!555509 () Bool)

(assert (=> b!576512 m!555509))

(declare-fun m!555511 () Bool)

(assert (=> b!576512 m!555511))

(assert (=> b!576512 m!555503))

(assert (=> b!576512 m!555505))

(declare-fun m!555513 () Bool)

(assert (=> b!576515 m!555513))

(declare-fun m!555515 () Bool)

(assert (=> b!576516 m!555515))

(declare-fun m!555517 () Bool)

(assert (=> b!576519 m!555517))

(declare-fun m!555519 () Bool)

(assert (=> b!576521 m!555519))

(declare-fun m!555521 () Bool)

(assert (=> start!52884 m!555521))

(declare-fun m!555523 () Bool)

(assert (=> start!52884 m!555523))

(push 1)

