; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50578 () Bool)

(assert start!50578)

(declare-fun b!552575 () Bool)

(declare-fun res!344995 () Bool)

(declare-fun e!318863 () Bool)

(assert (=> b!552575 (=> (not res!344995) (not e!318863))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!34803 0))(
  ( (array!34804 (arr!16711 (Array (_ BitVec 32) (_ BitVec 64))) (size!17075 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34803)

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5160 0))(
  ( (MissingZero!5160 (index!22867 (_ BitVec 32))) (Found!5160 (index!22868 (_ BitVec 32))) (Intermediate!5160 (undefined!5972 Bool) (index!22869 (_ BitVec 32)) (x!51802 (_ BitVec 32))) (Undefined!5160) (MissingVacant!5160 (index!22870 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34803 (_ BitVec 32)) SeekEntryResult!5160)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552575 (= res!344995 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16711 a!3118) j!142) mask!3119) (select (arr!16711 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16711 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16711 a!3118) i!1132 k0!1914) j!142) (array!34804 (store (arr!16711 a!3118) i!1132 k0!1914) (size!17075 a!3118)) mask!3119)))))

(declare-fun b!552577 () Bool)

(assert (=> b!552577 (= e!318863 (not true))))

(declare-fun e!318864 () Bool)

(assert (=> b!552577 e!318864))

(declare-fun res!344989 () Bool)

(assert (=> b!552577 (=> (not res!344989) (not e!318864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34803 (_ BitVec 32)) Bool)

(assert (=> b!552577 (= res!344989 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17094 0))(
  ( (Unit!17095) )
))
(declare-fun lt!251217 () Unit!17094)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17094)

(assert (=> b!552577 (= lt!251217 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552578 () Bool)

(declare-fun res!344993 () Bool)

(declare-fun e!318861 () Bool)

(assert (=> b!552578 (=> (not res!344993) (not e!318861))))

(declare-fun arrayContainsKey!0 (array!34803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552578 (= res!344993 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552579 () Bool)

(declare-fun res!344987 () Bool)

(assert (=> b!552579 (=> (not res!344987) (not e!318861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552579 (= res!344987 (validKeyInArray!0 k0!1914))))

(declare-fun b!552580 () Bool)

(declare-fun res!344991 () Bool)

(assert (=> b!552580 (=> (not res!344991) (not e!318861))))

(assert (=> b!552580 (= res!344991 (and (= (size!17075 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17075 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17075 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552581 () Bool)

(declare-fun res!344990 () Bool)

(assert (=> b!552581 (=> (not res!344990) (not e!318861))))

(assert (=> b!552581 (= res!344990 (validKeyInArray!0 (select (arr!16711 a!3118) j!142)))))

(declare-fun b!552582 () Bool)

(declare-fun res!344988 () Bool)

(assert (=> b!552582 (=> (not res!344988) (not e!318863))))

(declare-datatypes ((List!10791 0))(
  ( (Nil!10788) (Cons!10787 (h!11772 (_ BitVec 64)) (t!17019 List!10791)) )
))
(declare-fun arrayNoDuplicates!0 (array!34803 (_ BitVec 32) List!10791) Bool)

(assert (=> b!552582 (= res!344988 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10788))))

(declare-fun res!344992 () Bool)

(assert (=> start!50578 (=> (not res!344992) (not e!318861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50578 (= res!344992 (validMask!0 mask!3119))))

(assert (=> start!50578 e!318861))

(assert (=> start!50578 true))

(declare-fun array_inv!12507 (array!34803) Bool)

(assert (=> start!50578 (array_inv!12507 a!3118)))

(declare-fun b!552576 () Bool)

(assert (=> b!552576 (= e!318861 e!318863)))

(declare-fun res!344996 () Bool)

(assert (=> b!552576 (=> (not res!344996) (not e!318863))))

(declare-fun lt!251218 () SeekEntryResult!5160)

(assert (=> b!552576 (= res!344996 (or (= lt!251218 (MissingZero!5160 i!1132)) (= lt!251218 (MissingVacant!5160 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34803 (_ BitVec 32)) SeekEntryResult!5160)

(assert (=> b!552576 (= lt!251218 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552583 () Bool)

(declare-fun res!344994 () Bool)

(assert (=> b!552583 (=> (not res!344994) (not e!318863))))

(assert (=> b!552583 (= res!344994 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552584 () Bool)

(assert (=> b!552584 (= e!318864 (= (seekEntryOrOpen!0 (select (arr!16711 a!3118) j!142) a!3118 mask!3119) (Found!5160 j!142)))))

(assert (= (and start!50578 res!344992) b!552580))

(assert (= (and b!552580 res!344991) b!552581))

(assert (= (and b!552581 res!344990) b!552579))

(assert (= (and b!552579 res!344987) b!552578))

(assert (= (and b!552578 res!344993) b!552576))

(assert (= (and b!552576 res!344996) b!552583))

(assert (= (and b!552583 res!344994) b!552582))

(assert (= (and b!552582 res!344988) b!552575))

(assert (= (and b!552575 res!344995) b!552577))

(assert (= (and b!552577 res!344989) b!552584))

(declare-fun m!529491 () Bool)

(assert (=> b!552579 m!529491))

(declare-fun m!529493 () Bool)

(assert (=> b!552576 m!529493))

(declare-fun m!529495 () Bool)

(assert (=> b!552575 m!529495))

(declare-fun m!529497 () Bool)

(assert (=> b!552575 m!529497))

(assert (=> b!552575 m!529495))

(declare-fun m!529499 () Bool)

(assert (=> b!552575 m!529499))

(declare-fun m!529501 () Bool)

(assert (=> b!552575 m!529501))

(assert (=> b!552575 m!529499))

(declare-fun m!529503 () Bool)

(assert (=> b!552575 m!529503))

(assert (=> b!552575 m!529497))

(assert (=> b!552575 m!529495))

(declare-fun m!529505 () Bool)

(assert (=> b!552575 m!529505))

(declare-fun m!529507 () Bool)

(assert (=> b!552575 m!529507))

(assert (=> b!552575 m!529499))

(assert (=> b!552575 m!529501))

(declare-fun m!529509 () Bool)

(assert (=> b!552578 m!529509))

(declare-fun m!529511 () Bool)

(assert (=> start!50578 m!529511))

(declare-fun m!529513 () Bool)

(assert (=> start!50578 m!529513))

(assert (=> b!552584 m!529495))

(assert (=> b!552584 m!529495))

(declare-fun m!529515 () Bool)

(assert (=> b!552584 m!529515))

(declare-fun m!529517 () Bool)

(assert (=> b!552577 m!529517))

(declare-fun m!529519 () Bool)

(assert (=> b!552577 m!529519))

(assert (=> b!552581 m!529495))

(assert (=> b!552581 m!529495))

(declare-fun m!529521 () Bool)

(assert (=> b!552581 m!529521))

(declare-fun m!529523 () Bool)

(assert (=> b!552582 m!529523))

(declare-fun m!529525 () Bool)

(assert (=> b!552583 m!529525))

(check-sat (not b!552578) (not b!552579) (not b!552577) (not b!552581) (not b!552575) (not b!552583) (not b!552576) (not b!552582) (not start!50578) (not b!552584))
(check-sat)
