; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50500 () Bool)

(assert start!50500)

(declare-fun b!552014 () Bool)

(declare-fun res!344610 () Bool)

(declare-fun e!318560 () Bool)

(assert (=> b!552014 (=> (not res!344610) (not e!318560))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34782 0))(
  ( (array!34783 (arr!16702 (Array (_ BitVec 32) (_ BitVec 64))) (size!17066 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34782)

(assert (=> b!552014 (= res!344610 (and (= (size!17066 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17066 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17066 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552015 () Bool)

(declare-fun res!344618 () Bool)

(declare-fun e!318561 () Bool)

(assert (=> b!552015 (=> (not res!344618) (not e!318561))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5151 0))(
  ( (MissingZero!5151 (index!22831 (_ BitVec 32))) (Found!5151 (index!22832 (_ BitVec 32))) (Intermediate!5151 (undefined!5963 Bool) (index!22833 (_ BitVec 32)) (x!51763 (_ BitVec 32))) (Undefined!5151) (MissingVacant!5151 (index!22834 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34782 (_ BitVec 32)) SeekEntryResult!5151)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552015 (= res!344618 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16702 a!3118) j!142) mask!3119) (select (arr!16702 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16702 a!3118) i!1132 k0!1914) j!142) (array!34783 (store (arr!16702 a!3118) i!1132 k0!1914) (size!17066 a!3118)) mask!3119)))))

(declare-fun b!552016 () Bool)

(declare-fun res!344613 () Bool)

(assert (=> b!552016 (=> (not res!344613) (not e!318560))))

(declare-fun arrayContainsKey!0 (array!34782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552016 (= res!344613 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552017 () Bool)

(declare-fun res!344617 () Bool)

(assert (=> b!552017 (=> (not res!344617) (not e!318561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34782 (_ BitVec 32)) Bool)

(assert (=> b!552017 (= res!344617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552018 () Bool)

(declare-fun res!344609 () Bool)

(assert (=> b!552018 (=> (not res!344609) (not e!318561))))

(declare-datatypes ((List!10782 0))(
  ( (Nil!10779) (Cons!10778 (h!11760 (_ BitVec 64)) (t!17010 List!10782)) )
))
(declare-fun arrayNoDuplicates!0 (array!34782 (_ BitVec 32) List!10782) Bool)

(assert (=> b!552018 (= res!344609 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10779))))

(declare-fun b!552019 () Bool)

(assert (=> b!552019 (= e!318561 (not (bvsge mask!3119 #b00000000000000000000000000000000)))))

(declare-fun e!318559 () Bool)

(assert (=> b!552019 e!318559))

(declare-fun res!344616 () Bool)

(assert (=> b!552019 (=> (not res!344616) (not e!318559))))

(assert (=> b!552019 (= res!344616 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17076 0))(
  ( (Unit!17077) )
))
(declare-fun lt!251017 () Unit!17076)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34782 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17076)

(assert (=> b!552019 (= lt!251017 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552020 () Bool)

(declare-fun res!344611 () Bool)

(assert (=> b!552020 (=> (not res!344611) (not e!318560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552020 (= res!344611 (validKeyInArray!0 k0!1914))))

(declare-fun b!552021 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34782 (_ BitVec 32)) SeekEntryResult!5151)

(assert (=> b!552021 (= e!318559 (= (seekEntryOrOpen!0 (select (arr!16702 a!3118) j!142) a!3118 mask!3119) (Found!5151 j!142)))))

(declare-fun res!344615 () Bool)

(assert (=> start!50500 (=> (not res!344615) (not e!318560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50500 (= res!344615 (validMask!0 mask!3119))))

(assert (=> start!50500 e!318560))

(assert (=> start!50500 true))

(declare-fun array_inv!12498 (array!34782) Bool)

(assert (=> start!50500 (array_inv!12498 a!3118)))

(declare-fun b!552022 () Bool)

(declare-fun res!344612 () Bool)

(assert (=> b!552022 (=> (not res!344612) (not e!318560))))

(assert (=> b!552022 (= res!344612 (validKeyInArray!0 (select (arr!16702 a!3118) j!142)))))

(declare-fun b!552023 () Bool)

(assert (=> b!552023 (= e!318560 e!318561)))

(declare-fun res!344614 () Bool)

(assert (=> b!552023 (=> (not res!344614) (not e!318561))))

(declare-fun lt!251016 () SeekEntryResult!5151)

(assert (=> b!552023 (= res!344614 (or (= lt!251016 (MissingZero!5151 i!1132)) (= lt!251016 (MissingVacant!5151 i!1132))))))

(assert (=> b!552023 (= lt!251016 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(assert (= (and start!50500 res!344615) b!552014))

(assert (= (and b!552014 res!344610) b!552022))

(assert (= (and b!552022 res!344612) b!552020))

(assert (= (and b!552020 res!344611) b!552016))

(assert (= (and b!552016 res!344613) b!552023))

(assert (= (and b!552023 res!344614) b!552017))

(assert (= (and b!552017 res!344617) b!552018))

(assert (= (and b!552018 res!344609) b!552015))

(assert (= (and b!552015 res!344618) b!552019))

(assert (= (and b!552019 res!344616) b!552021))

(declare-fun m!528963 () Bool)

(assert (=> b!552015 m!528963))

(declare-fun m!528965 () Bool)

(assert (=> b!552015 m!528965))

(assert (=> b!552015 m!528963))

(declare-fun m!528967 () Bool)

(assert (=> b!552015 m!528967))

(declare-fun m!528969 () Bool)

(assert (=> b!552015 m!528969))

(assert (=> b!552015 m!528967))

(declare-fun m!528971 () Bool)

(assert (=> b!552015 m!528971))

(assert (=> b!552015 m!528965))

(assert (=> b!552015 m!528963))

(declare-fun m!528973 () Bool)

(assert (=> b!552015 m!528973))

(declare-fun m!528975 () Bool)

(assert (=> b!552015 m!528975))

(assert (=> b!552015 m!528967))

(assert (=> b!552015 m!528969))

(declare-fun m!528977 () Bool)

(assert (=> b!552019 m!528977))

(declare-fun m!528979 () Bool)

(assert (=> b!552019 m!528979))

(assert (=> b!552022 m!528963))

(assert (=> b!552022 m!528963))

(declare-fun m!528981 () Bool)

(assert (=> b!552022 m!528981))

(declare-fun m!528983 () Bool)

(assert (=> start!50500 m!528983))

(declare-fun m!528985 () Bool)

(assert (=> start!50500 m!528985))

(declare-fun m!528987 () Bool)

(assert (=> b!552023 m!528987))

(declare-fun m!528989 () Bool)

(assert (=> b!552017 m!528989))

(assert (=> b!552021 m!528963))

(assert (=> b!552021 m!528963))

(declare-fun m!528991 () Bool)

(assert (=> b!552021 m!528991))

(declare-fun m!528993 () Bool)

(assert (=> b!552018 m!528993))

(declare-fun m!528995 () Bool)

(assert (=> b!552020 m!528995))

(declare-fun m!528997 () Bool)

(assert (=> b!552016 m!528997))

(check-sat (not b!552016) (not b!552023) (not b!552017) (not b!552018) (not b!552020) (not b!552021) (not b!552019) (not b!552022) (not b!552015) (not start!50500))
(check-sat)
