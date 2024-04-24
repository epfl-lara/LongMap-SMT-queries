; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51654 () Bool)

(assert start!51654)

(declare-fun b!564965 () Bool)

(declare-fun res!356019 () Bool)

(declare-fun e!325367 () Bool)

(assert (=> b!564965 (=> (not res!356019) (not e!325367))))

(declare-datatypes ((array!35466 0))(
  ( (array!35467 (arr!17032 (Array (_ BitVec 32) (_ BitVec 64))) (size!17396 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35466)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564965 (= res!356019 (validKeyInArray!0 (select (arr!17032 a!3118) j!142)))))

(declare-fun b!564966 () Bool)

(declare-fun res!356020 () Bool)

(declare-fun e!325368 () Bool)

(assert (=> b!564966 (=> (not res!356020) (not e!325368))))

(declare-datatypes ((List!11019 0))(
  ( (Nil!11016) (Cons!11015 (h!12021 (_ BitVec 64)) (t!17239 List!11019)) )
))
(declare-fun arrayNoDuplicates!0 (array!35466 (_ BitVec 32) List!11019) Bool)

(assert (=> b!564966 (= res!356020 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11016))))

(declare-fun b!564967 () Bool)

(declare-fun res!356018 () Bool)

(assert (=> b!564967 (=> (not res!356018) (not e!325368))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35466 (_ BitVec 32)) Bool)

(assert (=> b!564967 (= res!356018 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564968 () Bool)

(declare-fun res!356012 () Bool)

(assert (=> b!564968 (=> (not res!356012) (not e!325367))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564968 (= res!356012 (and (= (size!17396 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17396 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17396 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!356015 () Bool)

(assert (=> start!51654 (=> (not res!356015) (not e!325367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51654 (= res!356015 (validMask!0 mask!3119))))

(assert (=> start!51654 e!325367))

(assert (=> start!51654 true))

(declare-fun array_inv!12891 (array!35466) Bool)

(assert (=> start!51654 (array_inv!12891 a!3118)))

(declare-fun b!564969 () Bool)

(declare-fun res!356017 () Bool)

(assert (=> b!564969 (=> (not res!356017) (not e!325367))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!564969 (= res!356017 (validKeyInArray!0 k0!1914))))

(declare-fun b!564970 () Bool)

(assert (=> b!564970 (= e!325368 (and (bvsle #b00000000000000000000000000000000 (size!17396 a!3118)) (bvsgt j!142 (size!17396 a!3118))))))

(declare-fun b!564971 () Bool)

(declare-fun res!356013 () Bool)

(assert (=> b!564971 (=> (not res!356013) (not e!325368))))

(declare-datatypes ((SeekEntryResult!5437 0))(
  ( (MissingZero!5437 (index!23975 (_ BitVec 32))) (Found!5437 (index!23976 (_ BitVec 32))) (Intermediate!5437 (undefined!6249 Bool) (index!23977 (_ BitVec 32)) (x!52999 (_ BitVec 32))) (Undefined!5437) (MissingVacant!5437 (index!23978 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35466 (_ BitVec 32)) SeekEntryResult!5437)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564971 (= res!356013 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17032 a!3118) j!142) mask!3119) (select (arr!17032 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17032 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17032 a!3118) i!1132 k0!1914) j!142) (array!35467 (store (arr!17032 a!3118) i!1132 k0!1914) (size!17396 a!3118)) mask!3119)))))

(declare-fun b!564972 () Bool)

(declare-fun res!356014 () Bool)

(assert (=> b!564972 (=> (not res!356014) (not e!325367))))

(declare-fun arrayContainsKey!0 (array!35466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564972 (= res!356014 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564973 () Bool)

(assert (=> b!564973 (= e!325367 e!325368)))

(declare-fun res!356016 () Bool)

(assert (=> b!564973 (=> (not res!356016) (not e!325368))))

(declare-fun lt!257764 () SeekEntryResult!5437)

(assert (=> b!564973 (= res!356016 (or (= lt!257764 (MissingZero!5437 i!1132)) (= lt!257764 (MissingVacant!5437 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35466 (_ BitVec 32)) SeekEntryResult!5437)

(assert (=> b!564973 (= lt!257764 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!51654 res!356015) b!564968))

(assert (= (and b!564968 res!356012) b!564965))

(assert (= (and b!564965 res!356019) b!564969))

(assert (= (and b!564969 res!356017) b!564972))

(assert (= (and b!564972 res!356014) b!564973))

(assert (= (and b!564973 res!356016) b!564967))

(assert (= (and b!564967 res!356018) b!564966))

(assert (= (and b!564966 res!356020) b!564971))

(assert (= (and b!564971 res!356013) b!564970))

(declare-fun m!543569 () Bool)

(assert (=> b!564967 m!543569))

(declare-fun m!543571 () Bool)

(assert (=> b!564966 m!543571))

(declare-fun m!543573 () Bool)

(assert (=> b!564972 m!543573))

(declare-fun m!543575 () Bool)

(assert (=> start!51654 m!543575))

(declare-fun m!543577 () Bool)

(assert (=> start!51654 m!543577))

(declare-fun m!543579 () Bool)

(assert (=> b!564973 m!543579))

(declare-fun m!543581 () Bool)

(assert (=> b!564969 m!543581))

(declare-fun m!543583 () Bool)

(assert (=> b!564971 m!543583))

(declare-fun m!543585 () Bool)

(assert (=> b!564971 m!543585))

(assert (=> b!564971 m!543583))

(declare-fun m!543587 () Bool)

(assert (=> b!564971 m!543587))

(declare-fun m!543589 () Bool)

(assert (=> b!564971 m!543589))

(assert (=> b!564971 m!543587))

(declare-fun m!543591 () Bool)

(assert (=> b!564971 m!543591))

(assert (=> b!564971 m!543585))

(assert (=> b!564971 m!543583))

(declare-fun m!543593 () Bool)

(assert (=> b!564971 m!543593))

(declare-fun m!543595 () Bool)

(assert (=> b!564971 m!543595))

(assert (=> b!564971 m!543587))

(assert (=> b!564971 m!543589))

(assert (=> b!564965 m!543583))

(assert (=> b!564965 m!543583))

(declare-fun m!543597 () Bool)

(assert (=> b!564965 m!543597))

(check-sat (not b!564972) (not b!564971) (not b!564973) (not b!564966) (not b!564967) (not b!564969) (not b!564965) (not start!51654))
(check-sat)
