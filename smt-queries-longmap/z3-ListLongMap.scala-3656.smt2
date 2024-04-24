; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50538 () Bool)

(assert start!50538)

(declare-fun b!552094 () Bool)

(declare-fun res!344586 () Bool)

(declare-fun e!318642 () Bool)

(assert (=> b!552094 (=> (not res!344586) (not e!318642))))

(declare-datatypes ((array!34767 0))(
  ( (array!34768 (arr!16693 (Array (_ BitVec 32) (_ BitVec 64))) (size!17057 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34767)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34767 (_ BitVec 32)) Bool)

(assert (=> b!552094 (= res!344586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!552095 () Bool)

(assert (=> b!552095 (= e!318642 (not true))))

(declare-fun e!318640 () Bool)

(assert (=> b!552095 e!318640))

(declare-fun res!344584 () Bool)

(assert (=> b!552095 (=> (not res!344584) (not e!318640))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!552095 (= res!344584 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17041 0))(
  ( (Unit!17042) )
))
(declare-fun lt!251104 () Unit!17041)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17041)

(assert (=> b!552095 (= lt!251104 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!552096 () Bool)

(declare-fun res!344589 () Bool)

(declare-fun e!318641 () Bool)

(assert (=> b!552096 (=> (not res!344589) (not e!318641))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!552096 (= res!344589 (and (= (size!17057 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17057 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17057 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!552097 () Bool)

(declare-datatypes ((SeekEntryResult!5098 0))(
  ( (MissingZero!5098 (index!22619 (_ BitVec 32))) (Found!5098 (index!22620 (_ BitVec 32))) (Intermediate!5098 (undefined!5910 Bool) (index!22621 (_ BitVec 32)) (x!51705 (_ BitVec 32))) (Undefined!5098) (MissingVacant!5098 (index!22622 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34767 (_ BitVec 32)) SeekEntryResult!5098)

(assert (=> b!552097 (= e!318640 (= (seekEntryOrOpen!0 (select (arr!16693 a!3118) j!142) a!3118 mask!3119) (Found!5098 j!142)))))

(declare-fun b!552098 () Bool)

(declare-fun res!344590 () Bool)

(assert (=> b!552098 (=> (not res!344590) (not e!318641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!552098 (= res!344590 (validKeyInArray!0 (select (arr!16693 a!3118) j!142)))))

(declare-fun b!552099 () Bool)

(declare-fun res!344587 () Bool)

(assert (=> b!552099 (=> (not res!344587) (not e!318642))))

(declare-datatypes ((List!10680 0))(
  ( (Nil!10677) (Cons!10676 (h!11661 (_ BitVec 64)) (t!16900 List!10680)) )
))
(declare-fun arrayNoDuplicates!0 (array!34767 (_ BitVec 32) List!10680) Bool)

(assert (=> b!552099 (= res!344587 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10677))))

(declare-fun res!344593 () Bool)

(assert (=> start!50538 (=> (not res!344593) (not e!318641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50538 (= res!344593 (validMask!0 mask!3119))))

(assert (=> start!50538 e!318641))

(assert (=> start!50538 true))

(declare-fun array_inv!12552 (array!34767) Bool)

(assert (=> start!50538 (array_inv!12552 a!3118)))

(declare-fun b!552100 () Bool)

(assert (=> b!552100 (= e!318641 e!318642)))

(declare-fun res!344591 () Bool)

(assert (=> b!552100 (=> (not res!344591) (not e!318642))))

(declare-fun lt!251103 () SeekEntryResult!5098)

(assert (=> b!552100 (= res!344591 (or (= lt!251103 (MissingZero!5098 i!1132)) (= lt!251103 (MissingVacant!5098 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(assert (=> b!552100 (= lt!251103 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!552101 () Bool)

(declare-fun res!344588 () Bool)

(assert (=> b!552101 (=> (not res!344588) (not e!318641))))

(declare-fun arrayContainsKey!0 (array!34767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!552101 (= res!344588 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!552102 () Bool)

(declare-fun res!344592 () Bool)

(assert (=> b!552102 (=> (not res!344592) (not e!318642))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34767 (_ BitVec 32)) SeekEntryResult!5098)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!552102 (= res!344592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16693 a!3118) j!142) mask!3119) (select (arr!16693 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16693 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16693 a!3118) i!1132 k0!1914) j!142) (array!34768 (store (arr!16693 a!3118) i!1132 k0!1914) (size!17057 a!3118)) mask!3119)))))

(declare-fun b!552103 () Bool)

(declare-fun res!344585 () Bool)

(assert (=> b!552103 (=> (not res!344585) (not e!318641))))

(assert (=> b!552103 (= res!344585 (validKeyInArray!0 k0!1914))))

(assert (= (and start!50538 res!344593) b!552096))

(assert (= (and b!552096 res!344589) b!552098))

(assert (= (and b!552098 res!344590) b!552103))

(assert (= (and b!552103 res!344585) b!552101))

(assert (= (and b!552101 res!344588) b!552100))

(assert (= (and b!552100 res!344591) b!552094))

(assert (= (and b!552094 res!344586) b!552099))

(assert (= (and b!552099 res!344587) b!552102))

(assert (= (and b!552102 res!344592) b!552095))

(assert (= (and b!552095 res!344584) b!552097))

(declare-fun m!529157 () Bool)

(assert (=> b!552098 m!529157))

(assert (=> b!552098 m!529157))

(declare-fun m!529159 () Bool)

(assert (=> b!552098 m!529159))

(declare-fun m!529161 () Bool)

(assert (=> start!50538 m!529161))

(declare-fun m!529163 () Bool)

(assert (=> start!50538 m!529163))

(declare-fun m!529165 () Bool)

(assert (=> b!552095 m!529165))

(declare-fun m!529167 () Bool)

(assert (=> b!552095 m!529167))

(assert (=> b!552097 m!529157))

(assert (=> b!552097 m!529157))

(declare-fun m!529169 () Bool)

(assert (=> b!552097 m!529169))

(declare-fun m!529171 () Bool)

(assert (=> b!552101 m!529171))

(declare-fun m!529173 () Bool)

(assert (=> b!552099 m!529173))

(assert (=> b!552102 m!529157))

(declare-fun m!529175 () Bool)

(assert (=> b!552102 m!529175))

(assert (=> b!552102 m!529157))

(declare-fun m!529177 () Bool)

(assert (=> b!552102 m!529177))

(declare-fun m!529179 () Bool)

(assert (=> b!552102 m!529179))

(assert (=> b!552102 m!529177))

(declare-fun m!529181 () Bool)

(assert (=> b!552102 m!529181))

(assert (=> b!552102 m!529175))

(assert (=> b!552102 m!529157))

(declare-fun m!529183 () Bool)

(assert (=> b!552102 m!529183))

(declare-fun m!529185 () Bool)

(assert (=> b!552102 m!529185))

(assert (=> b!552102 m!529177))

(assert (=> b!552102 m!529179))

(declare-fun m!529187 () Bool)

(assert (=> b!552100 m!529187))

(declare-fun m!529189 () Bool)

(assert (=> b!552094 m!529189))

(declare-fun m!529191 () Bool)

(assert (=> b!552103 m!529191))

(check-sat (not b!552100) (not b!552098) (not b!552099) (not start!50538) (not b!552101) (not b!552097) (not b!552095) (not b!552103) (not b!552102) (not b!552094))
(check-sat)
