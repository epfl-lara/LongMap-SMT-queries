; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50422 () Bool)

(assert start!50422)

(declare-fun b!551453 () Bool)

(declare-fun res!344234 () Bool)

(declare-fun e!318264 () Bool)

(assert (=> b!551453 (=> (not res!344234) (not e!318264))))

(declare-datatypes ((array!34761 0))(
  ( (array!34762 (arr!16693 (Array (_ BitVec 32) (_ BitVec 64))) (size!17057 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34761)

(declare-datatypes ((List!10773 0))(
  ( (Nil!10770) (Cons!10769 (h!11748 (_ BitVec 64)) (t!17001 List!10773)) )
))
(declare-fun arrayNoDuplicates!0 (array!34761 (_ BitVec 32) List!10773) Bool)

(assert (=> b!551453 (= res!344234 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10770))))

(declare-fun b!551454 () Bool)

(declare-fun res!344235 () Bool)

(declare-fun e!318266 () Bool)

(assert (=> b!551454 (=> (not res!344235) (not e!318266))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551454 (= res!344235 (validKeyInArray!0 k0!1914))))

(declare-fun b!551455 () Bool)

(assert (=> b!551455 (= e!318266 e!318264)))

(declare-fun res!344237 () Bool)

(assert (=> b!551455 (=> (not res!344237) (not e!318264))))

(declare-datatypes ((SeekEntryResult!5142 0))(
  ( (MissingZero!5142 (index!22795 (_ BitVec 32))) (Found!5142 (index!22796 (_ BitVec 32))) (Intermediate!5142 (undefined!5954 Bool) (index!22797 (_ BitVec 32)) (x!51724 (_ BitVec 32))) (Undefined!5142) (MissingVacant!5142 (index!22798 (_ BitVec 32))) )
))
(declare-fun lt!250834 () SeekEntryResult!5142)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551455 (= res!344237 (or (= lt!250834 (MissingZero!5142 i!1132)) (= lt!250834 (MissingVacant!5142 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34761 (_ BitVec 32)) SeekEntryResult!5142)

(assert (=> b!551455 (= lt!250834 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun e!318267 () Bool)

(declare-fun b!551456 () Bool)

(assert (=> b!551456 (= e!318267 (= (seekEntryOrOpen!0 (select (arr!16693 a!3118) j!142) a!3118 mask!3119) (Found!5142 j!142)))))

(declare-fun b!551457 () Bool)

(declare-fun res!344236 () Bool)

(assert (=> b!551457 (=> (not res!344236) (not e!318266))))

(assert (=> b!551457 (= res!344236 (validKeyInArray!0 (select (arr!16693 a!3118) j!142)))))

(declare-fun b!551458 () Bool)

(declare-fun res!344233 () Bool)

(assert (=> b!551458 (=> (not res!344233) (not e!318266))))

(assert (=> b!551458 (= res!344233 (and (= (size!17057 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17057 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17057 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551459 () Bool)

(declare-fun res!344240 () Bool)

(assert (=> b!551459 (=> (not res!344240) (not e!318264))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34761 (_ BitVec 32)) SeekEntryResult!5142)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551459 (= res!344240 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16693 a!3118) j!142) mask!3119) (select (arr!16693 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16693 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16693 a!3118) i!1132 k0!1914) j!142) (array!34762 (store (arr!16693 a!3118) i!1132 k0!1914) (size!17057 a!3118)) mask!3119)))))

(declare-fun res!344239 () Bool)

(assert (=> start!50422 (=> (not res!344239) (not e!318266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50422 (= res!344239 (validMask!0 mask!3119))))

(assert (=> start!50422 e!318266))

(assert (=> start!50422 true))

(declare-fun array_inv!12489 (array!34761) Bool)

(assert (=> start!50422 (array_inv!12489 a!3118)))

(declare-fun b!551460 () Bool)

(declare-fun res!344231 () Bool)

(assert (=> b!551460 (=> (not res!344231) (not e!318266))))

(declare-fun arrayContainsKey!0 (array!34761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551460 (= res!344231 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551461 () Bool)

(declare-fun res!344238 () Bool)

(assert (=> b!551461 (=> (not res!344238) (not e!318264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34761 (_ BitVec 32)) Bool)

(assert (=> b!551461 (= res!344238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551462 () Bool)

(assert (=> b!551462 (= e!318264 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(assert (=> b!551462 e!318267))

(declare-fun res!344232 () Bool)

(assert (=> b!551462 (=> (not res!344232) (not e!318267))))

(assert (=> b!551462 (= res!344232 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17058 0))(
  ( (Unit!17059) )
))
(declare-fun lt!250833 () Unit!17058)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17058)

(assert (=> b!551462 (= lt!250833 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!50422 res!344239) b!551458))

(assert (= (and b!551458 res!344233) b!551457))

(assert (= (and b!551457 res!344236) b!551454))

(assert (= (and b!551454 res!344235) b!551460))

(assert (= (and b!551460 res!344231) b!551455))

(assert (= (and b!551455 res!344237) b!551461))

(assert (= (and b!551461 res!344238) b!551453))

(assert (= (and b!551453 res!344234) b!551459))

(assert (= (and b!551459 res!344240) b!551462))

(assert (= (and b!551462 res!344232) b!551456))

(declare-fun m!528441 () Bool)

(assert (=> b!551457 m!528441))

(assert (=> b!551457 m!528441))

(declare-fun m!528443 () Bool)

(assert (=> b!551457 m!528443))

(assert (=> b!551456 m!528441))

(assert (=> b!551456 m!528441))

(declare-fun m!528445 () Bool)

(assert (=> b!551456 m!528445))

(declare-fun m!528447 () Bool)

(assert (=> b!551454 m!528447))

(declare-fun m!528449 () Bool)

(assert (=> start!50422 m!528449))

(declare-fun m!528451 () Bool)

(assert (=> start!50422 m!528451))

(declare-fun m!528453 () Bool)

(assert (=> b!551460 m!528453))

(declare-fun m!528455 () Bool)

(assert (=> b!551462 m!528455))

(declare-fun m!528457 () Bool)

(assert (=> b!551462 m!528457))

(declare-fun m!528459 () Bool)

(assert (=> b!551455 m!528459))

(assert (=> b!551459 m!528441))

(declare-fun m!528461 () Bool)

(assert (=> b!551459 m!528461))

(assert (=> b!551459 m!528441))

(declare-fun m!528463 () Bool)

(assert (=> b!551459 m!528463))

(declare-fun m!528465 () Bool)

(assert (=> b!551459 m!528465))

(assert (=> b!551459 m!528463))

(declare-fun m!528467 () Bool)

(assert (=> b!551459 m!528467))

(assert (=> b!551459 m!528461))

(assert (=> b!551459 m!528441))

(declare-fun m!528469 () Bool)

(assert (=> b!551459 m!528469))

(declare-fun m!528471 () Bool)

(assert (=> b!551459 m!528471))

(assert (=> b!551459 m!528463))

(assert (=> b!551459 m!528465))

(declare-fun m!528473 () Bool)

(assert (=> b!551453 m!528473))

(declare-fun m!528475 () Bool)

(assert (=> b!551461 m!528475))

(check-sat (not b!551454) (not b!551456) (not b!551453) (not b!551457) (not b!551460) (not b!551459) (not start!50422) (not b!551462) (not b!551461) (not b!551455))
(check-sat)
